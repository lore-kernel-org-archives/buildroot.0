From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Nov 2017 15:58:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/libplist: security bump to version
 2.0.0
Message-ID: <20171105145852.2494-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://github.com/libimobiledevice/libplist/blob/master/NEWS

This version bump fixes
  * CVE-2017-6440
  * CVE-2017-6439
  * CVE-2017-6438
  * CVE-2017-6437
  * CVE-2017-6436
  * CVE-2017-6435
  * CVE-2017-5836
  * CVE-2017-5835
  * CVE-2017-5834
  * CVE-2017-5545
  * CVE-2017-5209
... and several others that didn't receive any CVE (yet).

The dependency to libxml2 was removed.
Autoreconf is not needed anymore, the upstream tarball includes a
configure script.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplist/Config.in     | 1 -
 package/libplist/libplist.hash | 2 +-
 package/libplist/libplist.mk   | 7 ++-----
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/libplist/Config.in b/package/libplist/Config.in
index 5f96746ea9..4a9575f545 100644
--- a/package/libplist/Config.in
+++ b/package/libplist/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBPLIST
 	bool "libplist"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_LIBXML2
 	help
 	  libplist is a client for manipulating Apple Property List
 	  (.plist) files
diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 06d1b16426..63c2515062 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0effdedcb3de128c4930d8c03a3854c74c426c16728b8ab5f0a5b6bdc0b644be  libplist-1.12.tar.bz2
+sha256 3a7e9694c2d9a85174ba1fa92417cfabaea7f6d19631e544948dc7e17e82f602  libplist-2.0.0.tar.bz2
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 0d3e417d47..50ddbaf607 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 1.12
+LIBPLIST_VERSION = 2.0.0
 LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
 LIBPLIST_SITE = http://www.libimobiledevice.org/downloads
-LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
+LIBPLIST_DEPENDENCIES = host-pkgconf
 LIBPLIST_INSTALL_STAGING = YES
 LIBPLIST_LICENSE = LGPL-2.1+
 LIBPLIST_LICENSE_FILES = COPYING
 
-# Straight out of the git tree:
-LIBPLIST_AUTORECONF = YES
-
 # Disable building Python bindings, because it requires host-cython, which
 # is not packaged in Buildroot at all.
 LIBPLIST_CONF_OPTS = --without-cython
-- 
2.11.0
