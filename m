From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 12:09:35 +0100
Subject: [Buildroot] [git commit] infra: remove redundant $(call) on pkgdir,
	pkgname, pkgparentdir
Message-ID: <20140205123039.7BBA59C7D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3880a6ab3ca3890e79a7a429a58903217f36770d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When calling make 'functions', the $(call) keyword is only needed if the
function takes arguments. For pkgdir, pkgname and pkgparentdir this is not
the case, so we can remove the call to make things more readable.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    4 ++--
 package/pkg-cmake.mk     |    4 ++--
 package/pkg-generic.mk   |    4 ++--
 package/pkg-luarocks.mk  |    2 +-
 package/pkg-python.mk    |    4 ++--
 package/pkg-utils.mk     |    4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index a66ecd4..0ddfc6b 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -275,5 +275,5 @@ endef
 # autotools-package -- the target generator macro for autotools packages
 ################################################################################
 
-autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+autotools-package = $(call inner-autotools-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 13be557..36283f0 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -150,8 +150,8 @@ endef
 # cmake-package -- the target generator macro for CMake packages
 ################################################################################
 
-cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+cmake-package = $(call inner-cmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b99c2a..eea530f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -617,8 +617,8 @@ endef # inner-generic-package
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+generic-package = $(call inner-generic-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+host-generic-package = $(call inner-generic-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
 
 # :mode=makefile:
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index e82818a..fdd26c7 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -78,5 +78,5 @@ endef
 # luarocks-package -- the target generator macro for LuaRocks packages
 ################################################################################
 
-luarocks-package = $(call inner-luarocks-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+luarocks-package = $(call inner-luarocks-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
 # host-luarocks-package not supported
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 79e6bcf..9cfd820 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -220,5 +220,5 @@ endef
 # python-package -- the target generator macro for Python packages
 ################################################################################
 
-python-package = $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-python-package = $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+python-package = $(call inner-python-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+host-python-package = $(call inner-python-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 851575c..51dd738 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -59,8 +59,8 @@ endef
 # pkgdir macro is carefully written to handle the case of the Linux
 # package, for which the package directory is an empty string.
 pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
-pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
-pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))
+pkgname      = $(lastword $(subst /, ,$(pkgdir)))
+pkgparentdir = $(patsubst %$(pkgname)/,%,$(pkgdir))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
