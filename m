From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2021 13:43:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgphoto2: bump version to 2.5.26
Message-ID: <20210207124304.1400992-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed md5 hash, reformatted remaining hashes.
Added optional support for libcurl available since version 2.5.24.

Release notes: https://github.com/gphoto/libgphoto2/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgphoto2/libgphoto2.hash | 9 ++++-----
 package/libgphoto2/libgphoto2.mk   | 9 ++++++++-
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index 0d965da0f1..e405735c8b 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,7 +1,6 @@
-# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.23/
-md5 bf052ce815e607dc781c5b0f3c5ca5c0 libgphoto2-2.5.23.tar.bz2
-sha1 01f91d2b5d2aef7e80ab846fea4d5eb5cc67ed79 libgphoto2-2.5.23.tar.bz2
+# https://sourceforge.net/projects/gphoto/files/libgphoto/2.5.26/
+sha1  38373ef7f76e90492ffca309094487fb1474f3fe  libgphoto2-2.5.26.tar.bz2
 
 # Locally calculated hash
-sha256 d8af23364aa40fd8607f7e073df74e7ace05582f4ba13f1724d12d3c97e8852d libgphoto2-2.5.23.tar.bz2
-sha256 ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee COPYING
+sha256  7740fea3cbb78489071cdfec06c07fab528e69e27ac82734eae6a73eaeeabcd4  libgphoto2-2.5.26.tar.bz2
+sha256  ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 63e6a8775f..1d42ba862f 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.23
+LIBGPHOTO2_VERSION = 2.5.26
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.bz2
 # Project is maintained on github but github tarball doesn't have
 # configure, so use tarballs from SourceForge
@@ -27,6 +27,13 @@ ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 LIBGPHOTO2_DEPENDENCIES += libusb-compat
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBGPHOTO2_DEPENDENCIES += libcurl
+LIBGPHOTO2_CONF_OPTS += --with-libcurl=auto
+else
+LIBGPHOTO2_CONF_OPTS += --with-libcurl=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
 LIBGPHOTO2_DEPENDENCIES += libexif
 LIBGPHOTO2_CONF_OPTS += --with-libexif=auto
-- 
2.29.2
