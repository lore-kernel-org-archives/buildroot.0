From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 15:28:18 +0200
Subject: [Buildroot] [git commit] package/shapelib: upgrade to 1.5.0
Message-ID: <20190801132735.EDD177FE71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0773590e49ba95d6b9db596cef5e186177c6cdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove PROJ.4 dependency, as upstream decided to
drop it.

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shapelib/Config.in     | 1 -
 package/shapelib/shapelib.hash | 2 +-
 package/shapelib/shapelib.mk   | 3 +--
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/shapelib/Config.in b/package/shapelib/Config.in
index 553d3483af..7c7b9c76c7 100644
--- a/package/shapelib/Config.in
+++ b/package/shapelib/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_SHAPELIB
 	bool "shapelib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_PROJ
 	help
 	  The Shapefile C Library provides the ability to write simple
 	  C programs for reading, writing and updating (to a limited
diff --git a/package/shapelib/shapelib.hash b/package/shapelib/shapelib.hash
index 6abddb2a7a..d1f6fa9777 100644
--- a/package/shapelib/shapelib.hash
+++ b/package/shapelib/shapelib.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 a4c94817365761a3a4c21bb3ca1c680a6bdfd3edd61df9fdd291d3e7645923b3  shapelib-1.4.1.tar.gz
+sha256 1fc0a480982caef9e7b9423070b47750ba34cd0ba82668f2e638fab1d07adae1  shapelib-1.5.0.tar.gz
 sha256 7eb803a70990017a1c4e38a8342d7413c5dfeec3ed1ac407e15ae2c274e560ff  COPYING
 sha256 a638278f7f1cb7d0cdc73b47a6c87261b882e356a8e79922e90d44d7ef1dd2c7  web/license.html
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index b76c3bb2d2..bedd15dc35 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-SHAPELIB_VERSION = 1.4.1
+SHAPELIB_VERSION = 1.5.0
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
 SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = web/license.html COPYING
 SHAPELIB_INSTALL_STAGING = YES
-SHAPELIB_DEPENDENCIES = proj
 
 $(eval $(autotools-package))
