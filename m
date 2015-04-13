From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2015 07:47:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
	mesa3d-headers}: bump version to 10.5.3
Message-ID: <1428904039-23326-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream tarball now contains more pre-generated files, therefore we can remove
dependencies to host-python and host-gettext, quote from
http://lists.freedesktop.org/archives/mesa-announce/2015-April/000150.html:
"xmlpool: don't forget to ship the MOS
configure.ac: error out if python/mako is not found when required"

Fixes python3-related build error
http://autobuild.buildroot.net/results/7a5/7a5e53861bce6854265867e6e8525aabffb1d473/
http://autobuild.buildroot.net/results/ce4/ce45f986c3943b8ced3b15a0ebd1dc03fc7b7dcc/
http://autobuild.buildroot.net/results/1ce/1ce2509c8abb7483397c7d0f21c299095e94a254/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |    2 +-
 package/mesa3d/mesa3d.hash               |    4 ++--
 package/mesa3d/mesa3d.mk                 |    4 +---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0708a0f..6e98904 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 10.5.1
+MESA3D_HEADERS_VERSION = 10.5.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_HEADERS_VERSION)
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f562469..f06de89 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-March/000146.html
-sha256	ffc51943d15c6812ee7611d053d8980a683fbd6a4986cff567b12cc66637d679	mesa-10.5.1.tar.xz
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-April/000150.html
+sha256	8701ee1be4f5c03238f5e63c1a9bd4cc03a2f6c0155ed42a1ae7d58f18912ba2	mesa-10.5.3.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7473110..d999424 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.5.1
+MESA3D_VERSION = 10.5.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -18,8 +18,6 @@ MESA3D_PROVIDES =
 
 MESA3D_DEPENDENCIES = \
 	expat \
-	host-gettext \
-	host-python-mako \
 	libdrm
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
1.7.10.4
