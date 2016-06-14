From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:13 +0200
Subject: [Buildroot] [PATCH 05/12] reproducibility/busybox: disable build
	timestamps
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-5-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/busybox/busybox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 08d8e64..a3d526c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -36,6 +36,12 @@ BUSYBOX_MAKE_ENV = \
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
2.8.2
