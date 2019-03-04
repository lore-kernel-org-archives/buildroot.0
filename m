From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 21:35:03 +0100
Subject: [Buildroot] [git commit] package/cutelyst: bump to version 2.7.0
Message-ID: <20190304203403.70207814A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d059acad12271e279006a045bc4ff13c393933c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c110e48cecde6f543da18388322907b05b25e7d2 disabled openssl support
on QT 5.6, this has the side-effect of breaking the build of cutelyst
because cutelyst does not manage build with QT_NO_SSL, see:
https://github.com/cutelyst/cutelyst/issues/159

This bump fixes the issue by bumping cutelyst to version 2.7.0 and by
removing the uneeded select on BR2_PACKAGE_OPENSSL

Fixes:
 - http://autobuild.buildroot.org/results/4299221429713ace25fc234abeb81697bc410647

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cutelyst/Config.in     | 1 -
 package/cutelyst/cutelyst.hash | 2 +-
 package/cutelyst/cutelyst.mk   | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
index 3e28cff95d..8eff938d51 100644
--- a/package/cutelyst/Config.in
+++ b/package/cutelyst/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_CUTELYST
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  A C++ Web Framework built on top of Qt, using
diff --git a/package/cutelyst/cutelyst.hash b/package/cutelyst/cutelyst.hash
index edc83f3886..87506ab90c 100644
--- a/package/cutelyst/cutelyst.hash
+++ b/package/cutelyst/cutelyst.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  d088e6dbbb9a1ef03b4481d44746a2b086724842f5ee85abe8095e2eb6fe0da4    cutelyst-2.5.2.tar.gz
+sha256  f87c2f04b148a50f5df13aa5d75b45bf20e56be2e2cd6e17c2aef5231db4b467    cutelyst-2.7.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551    COPYING
diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 8e117e3286..42a317e765 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTELYST_VERSION = 2.5.2
+CUTELYST_VERSION = 2.7.0
 CUTELYST_SITE = https://github.com/cutelyst/cutelyst/archive/v$(CUTELYST_VERSION)
 CUTELYST_INSTALL_STAGING = YES
 CUTELYST_SUPPORTS_IN_SOURCE_BUILD = NO
