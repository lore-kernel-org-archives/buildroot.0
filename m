From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 23:49:23 +0100
Subject: [Buildroot] [git commit] package/inih: bump version to 53
Message-ID: <20210308222722.BD74988C8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59b822c2fd3d49b32d7d43449db75a7655ae115f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream, fixed upper-case package name.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../inih/0001-meson-optionally-depend-on-c.patch   | 34 ----------------------
 package/inih/inih.hash                             |  2 +-
 package/inih/inih.mk                               |  4 +--
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/inih/0001-meson-optionally-depend-on-c.patch b/package/inih/0001-meson-optionally-depend-on-c.patch
deleted file mode 100644
index a039dde1db..0000000000
--- a/package/inih/0001-meson-optionally-depend-on-c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e192e4762749cfe3bc350e0353aa82b1a849256d Mon Sep 17 00:00:00 2001
-From: bkuhls <bkuhls@users.noreply.github.com>
-Date: Sun, 10 Jan 2021 21:56:56 +0100
-Subject: [PATCH] meson: optionally depend on c++ (#124)
-
-This fix is needed to allow building with toolchains which lack c++.
-
-Downloaded from upstream commit:
-https://github.com/benhoyt/inih/commit/e192e4762749cfe3bc350e0353aa82b1a849256d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 4602326..5393af4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project('inih',
--    ['c','cpp'],
-+    ['c'],
-     default_options : ['default_library=static'],
-     license : 'BSD-3-Clause',
- )
-@@ -83,6 +83,7 @@ inih_dep = declare_dependency(
- 
- #### INIReader ####
- if get_option('with_INIReader')
-+    add_languages('cpp')
-     inc_INIReader = include_directories('cpp')
- 
-     lib_INIReader = library('INIReader',
diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 2560a91fed..21234e156d 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  439cff9ce9a8afc52d08772ac3e93b3cecd79c7707f871fb4534fb3a48201880  inih-52.tar.gz
+sha256  01b0366fdfdf6363efc070c2f856f1afa33e7a6546548bada5456ad94a516241  inih-53.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index ccc549b01e..dec9465121 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -1,10 +1,10 @@
 ################################################################################
 #
-# INIH
+# inih
 #
 ################################################################################
 
-INIH_VERSION = 52
+INIH_VERSION = 53
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
