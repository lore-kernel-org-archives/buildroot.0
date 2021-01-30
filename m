From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 16:48:14 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/logrotate: use official tarball
Message-ID: <20210130154814.2386086-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Drop LOGROTATE_AUTORECONF

 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index b3628da7de..2af46d60b7 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  66232111a2b02cce3c2436c141b7a2af78fa758aac326ab2b79f9a5b0d749142  logrotate-3.18.0.tar.gz
+sha256  841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5  logrotate-3.18.0.tar.xz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index b765fff4ee..ee2ab75095 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -5,13 +5,12 @@
 ################################################################################
 
 LOGROTATE_VERSION = 3.18.0
-LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
+LOGROTATE_SOURCE = logrotate-3.18.0.tar.xz
+LOGROTATE_SITE = https://github.com/logrotate/logrotate/releases/download/$(LOGROTATE_VERSION)
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
 LOGROTATE_CPE_ID_VALID = YES
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
-# tarball does not have a generated configure script
-LOGROTATE_AUTORECONF = YES
 LOGROTATE_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs popt`"
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.29.2
