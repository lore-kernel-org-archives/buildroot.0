From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 20:35:23 +0100
Subject: [Buildroot] [PATCH 3/3] package/x11r7/libxcb: bump version to 1.14
In-Reply-To: <20200309193523.185144-1-bernd.kuhls@t-online.de>
References: <20200309193523.185144-1-bernd.kuhls@t-online.de>
Message-ID: <20200309193523.185144-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow upstream switch to xz tarball:
https://gitlab.freedesktop.org/xorg/lib/libxcb/-/commit/78c492deaa7ae3aad0b0eeb4b126bb291cc637a7

Removed dependency to libpthread-stubs, not needed anymore due to
upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libxcb/-/commit/8f7e4c4e9fc6ee6b5b5498a7d8af79150be0d26a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/libxcb/Config.in   | 1 -
 package/x11r7/libxcb/libxcb.hash | 7 +++----
 package/x11r7/libxcb/libxcb.mk   | 8 ++++----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
index 7439741f0a..e15dde3bb1 100644
--- a/package/x11r7/libxcb/Config.in
+++ b/package/x11r7/libxcb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBXCB
 	bool "libxcb"
-	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	select BR2_PACKAGE_XCB_PROTO
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index 9158b6bb24..1861ef8a6b 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,6 +1,5 @@
-# From https://lists.x.org/archives/xorg/2018-September/059469.html
-md5 f33cdfc67346f7217a9326c0d8679975  libxcb-1.13.1.tar.bz2
-sha1 2ab17a1bb2a44e0a9cb0b26bcf899689ba1bbb3b  libxcb-1.13.1.tar.bz2
-sha256 a89fb7af7a11f43d2ce84a844a4b38df688c092bf4b67683aef179cdf2a647c4  libxcb-1.13.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-February/003039.html
+sha256 a55ed6db98d43469801262d81dc2572ed124edc3db31059d4e9916eb9f844c34  libxcb-1.14.tar.xz
+sha512 b90a23204b0d2c29d8b115577edb01df0465e02d6a8876550fecd62375d24a5d5f872ddd5946772ddba077cadce75b12c7a6d218469dc30b5b92bc82188e8bc6  libxcb-1.14.tar.xz
 # Locally computed
 sha256 c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index fdc65cefc0..fb691c2422 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.13.1
-LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
+LIBXCB_VERSION = 1.14
+LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.xz
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
 LIBXCB_LICENSE_FILES = COPYING
@@ -13,10 +13,10 @@ LIBXCB_LICENSE_FILES = COPYING
 LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_DEPENDENCIES = \
-	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
+	host-libxslt xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
 HOST_LIBXCB_DEPENDENCIES = \
-	host-libxslt host-libpthread-stubs host-xcb-proto host-xlib_libXdmcp \
+	host-libxslt host-xcb-proto host-xlib_libXdmcp \
 	host-xlib_libXau host-python host-pkgconf
 
 LIBXCB_CONF_OPTS = --with-doxygen=no
-- 
2.25.0
