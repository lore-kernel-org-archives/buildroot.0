From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 22:56:53 +0100
Subject: [Buildroot] [git commit] busybox: disable build timestamps for
	reproducible builds
Message-ID: <20161201222139.394AE7FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8254d32fd839ebd0a96863579832678eb6e0038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox includes some information about the build environment in its
binary. For BR2_REPRODUCIBLE, remove that information.

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fc23a90..f4a241d 100644
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
