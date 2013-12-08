From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Dec 2013 19:41:54 +0100
Subject: [Buildroot] [git commit] manual: remove package clean commands
Message-ID: <20131208184341.425639BF4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=436dc00d7a3eda45e5eb49bbd0b7a308347d4bcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-autotools.txt |    3 ---
 docs/manual/adding-packages-cmake.txt     |    3 ---
 docs/manual/adding-packages-directory.txt |    2 +-
 docs/manual/adding-packages-generic.txt   |    3 ---
 docs/manual/package-make-target.txt       |    3 ---
 5 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 27991b2..d0c92ff 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -145,9 +145,6 @@ cases, typical packages will therefore only use a few of them.
   value is correct for most autotools packages, but it is still possible
   to override it if needed.
 
-* +LIBFOO_CLEAN_OPT+ contains the make options used to
-  clean the package. By default, the value is +clean+.
-
 With the autotools infrastructure, all the steps required to build
 and install the packages are already defined, and they generally work
 well for most autotools-based packages. However, when required, it is
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 4373423..29f2b8f 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -126,9 +126,6 @@ typical packages will therefore only use a few of them.
   for most CMake packages, but it is still possible to override it if
   needed.
 
-* +LIBFOO_CLEAN_OPT+ contains the make options used to clean the
-  package. By default, the value is +clean+.
-
 With the CMake infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
 for most CMake-based packages. However, when required, it is still
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 700ec4f..36b7093 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -269,7 +269,7 @@ different way, using different infrastructures:
   These are based on an infrastructure similar to the one used for
   autotools-based packages, but require a little more work from the
   developer. They specify what should be done for the configuration,
-  compilation, installation and cleanup of the package. This
+  compilation and installation of the package. This
   infrastructure must be used for all packages that do not use the
   autotools as their build system. In the future, other specialized
   infrastructures might be written for other build systems.  We cover
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7ff0a61..14971b5 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -413,9 +413,6 @@ different steps of the build process.
   should be installed, since they might be needed to compile other
   packages.
 
-* +LIBFOO_CLEAN_CMDS+, lists the actions to perform to clean up
-  the build directory of the package.
-
 * +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
   actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 8210e94..9eefe68 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -63,9 +63,6 @@ Additionally, there are some other useful make targets:
 | +show-depends+    | Displays the dependencies required to build the
 package
 
-| +clean+           | Run the clean command of the package; _note that
-  this is not implemented for all packages_
-
 | +dirclean+        | Remove the whole package build directory
 
 | +rebuild+         | Re-run the compilation commands - this only makes
