From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:42 +0200
Subject: [Buildroot] [PATCH 08/50] package/busybox: invert dependency with
 traceroute
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <3aec9369c7717ac223d180934e6c21fce2c5ef7c.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk       | 1 +
 package/traceroute/traceroute.mk | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 16f69cc902..88feec7326 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_TRACEROUTE),traceroute) \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index d01c62d5ea..192197498d 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -10,11 +10,6 @@ TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/tracero
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
 TRACEROUTE_LICENSE_FILES = COPYING COPYING.LIB
 
-# Prefer full-featured traceroute over busybox's version
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-TRACEROUTE_DEPENDENCIES += busybox
-endif
-
 define TRACEROUTE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
-- 
2.14.1
