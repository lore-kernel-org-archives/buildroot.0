From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:40 +0100
Subject: [Buildroot] [PATCH 10/16] xlib_libpciaccess: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-10-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libpciaccess/Config.in          |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
index 2300822..00c0412 100644
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/x11r7/xlib_libpciaccess/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "libpciaccess"
 	depends on BR2_LARGEFILE
 	help
-	  libpciaccess 0.10.9
+	  libpciaccess 0.11.0
 	  X.Org libpciaccess
 
 comment "libpciaccess requires a toolchain with LARGEFILE support"
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 73a9642..9bb1576 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBPCIACCESS_VERSION = 0.10.9
+XLIB_LIBPCIACCESS_VERSION = 0.11.0
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBPCIACCESS_AUTORECONF = NO
+XLIB_LIBPCIACCESS_LIBTOOL_PATCH = NO
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
-XLIB_LIBPCIACCESS_DEPENDENCIES =
 XLIB_LIBPCIACCESS_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libpciaccess))
-- 
1.7.0
