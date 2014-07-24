From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:33 +0200
Subject: [Buildroot] [PATCH 6 of 7] busybox: only add kconfig targets if
	uclibc is enabled
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <01c5523b5777c0dc5a3b.1406224173@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In analogy of linux.mk, only enable the kconfig targets (menuconfig,
update-config, ...) when the busybox package is actually enabled.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff -r a850aa264c3d -r 01c5523b5777 package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Tue Jul 22 20:43:10 2014 +0200
+++ b/package/busybox/busybox.mk	Wed Jul 23 20:13:38 2014 +0200
@@ -224,8 +224,12 @@
 
 $(eval $(generic-package))
 
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPT = $(BUSYBOX_MAKE_OPTS)
 
 $(eval $(kconfig-package))
+
+endif
