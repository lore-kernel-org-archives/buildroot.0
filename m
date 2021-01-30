From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 22:14:57 +0100
Subject: [Buildroot] [git commit] package/logrotate: use official tarball
Message-ID: <20210130205927.9D8E985F37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11fc8ce9f32047a9e8e12b8468163004c973a92d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
