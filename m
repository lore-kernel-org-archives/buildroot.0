From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jul 2014 22:31:20 +0200
Subject: [Buildroot] [git commit] trivial: fix typo 'informations'
Message-ID: <20140724203151.D104D9D2BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60714bb2ed7060b859a49abea8471950b9878bf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In English, unlike in French, almost all usages of the word 'information'
are uncountable, meaning that 'informations' is invalid.
This patch fixes this typo throughout the tree, except in CHANGES and
docs/news.html (historic text).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/minnowboard/readme.txt |    2 +-
 package/pkg-autotools.mk     |    2 +-
 package/pkg-cmake.mk         |    2 +-
 package/pkg-generic.mk       |    4 ++--
 package/pkg-luarocks.mk      |    2 +-
 package/pkg-python.mk        |    2 +-
 support/scripts/xorg-release |    4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/board/minnowboard/readme.txt b/board/minnowboard/readme.txt
index b62b677..62ffa92 100644
--- a/board/minnowboard/readme.txt
+++ b/board/minnowboard/readme.txt
@@ -36,5 +36,5 @@ Prepare the SD card for the Minnow Board
 
  4. Enjoy
 
-Additional informations about this board can be found at
+Additional information about this board can be found at
 http://www.minnowboard.org/.
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index db3736c..bcc648d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -9,7 +9,7 @@
 # infrastructure
 #
 # In terms of implementation, this autotools infrastructure requires
-# the .mk file to only specify metadata informations about the
+# the .mk file to only specify metadata information about the
 # package: name, version, download URL, etc.
 #
 # We still allow the package .mk file to override what the different
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index adffbec..30198a9 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -9,7 +9,7 @@
 # infrastructure
 #
 # In terms of implementation, this CMake infrastructure requires
-# the .mk file to only specify metadata informations about the
+# the .mk file to only specify metadata information about the
 # package: name, version, download URL, etc.
 #
 # We still allow the package .mk file to override what the different
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 03cbf96..fb4b849 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -13,7 +13,7 @@
 # In terms of implementation, this generic infrastructure requires the
 # .mk file to specify:
 #
-#   1. Metadata informations about the package: name, version,
+#   1. Metadata information about the package: name, version,
 #      download URL, etc.
 #
 #   2. Description of the commands to be executed to configure, build
@@ -304,7 +304,7 @@ define inner-generic-package
 # already defined. For some variables (version, source, site and
 # subdir), if they are undefined, we try to see if a variable without
 # the HOST_ prefix is defined. If so, we use such a variable, so that
-# these informations have only to be specified once, for both the
+# this information has only to be specified once, for both the
 # target and host packages of a given .mk file.
 
 $(2)_TYPE                       =  $(4)
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index d9373e1..be0d4cc 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -12,7 +12,7 @@
 # infrastructure
 #
 # In terms of implementation, this LuaRocks infrastructure requires
-# the .mk file to only specify metadata informations about the
+# the .mk file to only specify metadata information about the
 # package: name, version, etc.
 #
 ################################################################################
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index d37a03f..d49e5c2 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -9,7 +9,7 @@
 # infrastructure
 #
 # In terms of implementation, this Python infrastructure requires the
-# .mk file to only specify metadata informations about the package:
+# .mk file to only specify metadata information about the package:
 # name, version, download URL, etc.
 #
 # We still allow the package .mk file to override what the different
diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
index a4f090d..66fc100 100755
--- a/support/scripts/xorg-release
+++ b/support/scripts/xorg-release
@@ -101,7 +101,7 @@ def buildroot_get_version(dirname):
             return m.group(2)
     return None
 
-# Augment the informations of the X.org list of packages (given as
+# Augment the information of the X.org list of packages (given as
 # argument) by details about their packaging in Buildroot. Those
 # details are found by looking at the contents of package/x11r7/.
 def get_buildroot_pkgs(packages):
@@ -114,7 +114,7 @@ def get_buildroot_pkgs(packages):
         version = buildroot_get_version(d)
         if packages.has_key(pkgname):
             # There is a X.org package of the same name, so we just
-            # add informations to the existing dict entry.
+            # add information to the existing dict entry.
             packages[pkgname]['br-version'] = version
             packages[pkgname]['br-name'] = d
         else:
