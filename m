From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jul 2014 21:58:07 +0200
Subject: [Buildroot] [PATCH 6 of 6 v2] busybox: only add kconfig targets if
 uclibc is enabled
In-Reply-To: <patchbomb.1406750281@localhost>
References: <patchbomb.1406750281@localhost>
Message-ID: <469e4493e128111baaf2.1406750287@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In analogy of linux.mk, only enable its targets, in particular the kconfig
targets (menuconfig, update-config, ...) when the busybox package is
actually enabled.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff -r f995a8adfa24 -r 469e4493e128 package/busybox/busybox.mk
--- a/package/busybox/busybox.mk	Tue Jul 22 20:43:10 2014 +0200
+++ b/package/busybox/busybox.mk	Wed Jul 23 20:13:38 2014 +0200
@@ -226,4 +226,6 @@
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 $(eval $(kconfig-package))
+endif
