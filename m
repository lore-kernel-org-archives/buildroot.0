From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:02 +0200
Subject: [Buildroot] [PATCH 06/34] reproducibility/busybox: disable build
	timestamps
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-6-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/busybox/busybox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7f6dbd6..bee7489 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -32,6 +32,12 @@ BUSYBOX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	CFLAGS="$(BUSYBOX_CFLAGS)" \
 	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
+
+ifeq ($(BR2_REPRODUCIBLE),y)
+BUSYBOX_MAKE_ENV += \
+	KCONFIG_NOTIMESTAMP=1
+endif
+
 BUSYBOX_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
-- 
2.7.4
