From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 07 Dec 2013 10:16:47 +0100
Subject: [Buildroot] [PATCH 1 of 3] manual: remove package clean commands
In-Reply-To: <patchbomb.1386407806@argentina>
References: <patchbomb.1386407806@argentina>
Message-ID: <f65a6ab8e62d86ba51b2.1386407807@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-autotools.txt |  3 ---
 docs/manual/adding-packages-cmake.txt     |  3 ---
 docs/manual/adding-packages-directory.txt |  2 +-
 docs/manual/adding-packages-generic.txt   |  3 ---
 docs/manual/package-make-target.txt       |  3 ---
 5 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -145,9 +145,6 @@ cases, typical packages will therefore o
   value is correct for most autotools packages, but it is still possible
   to override it if needed.
 
-* +LIBFOO_CLEAN_OPT+ contains the make options used to
-  clean the package. By default, the value is +clean+.
-
 With the autotools infrastructure, all the steps required to build
 and install the packages are already defined, and they generally work
 well for most autotools-based packages. However, when required, it is
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -126,9 +126,6 @@ typical packages will therefore only use
   for most CMake packages, but it is still possible to override it if
   needed.
 
-* +LIBFOO_CLEAN_OPT+ contains the make options used to clean the
-  package. By default, the value is +clean+.
-
 With the CMake infrastructure, all the steps required to build and
 install the packages are already defined, and they generally work well
 for most CMake-based packages. However, when required, it is still
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -269,7 +269,7 @@ different way, using different infrastru
   These are based on an infrastructure similar to the one used for
   autotools-based packages, but require a little more work from the
   developer. They specify what should be done for the configuration,
-  compilation, installation and cleanup of the package. This
+  compilation and installation of the package. This
   infrastructure must be used for all packages that do not use the
   autotools as their build system. In the future, other specialized
   infrastructures might be written for other build systems.  We cover
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -412,9 +412,6 @@ different steps of the build process.
   should be installed, since they might be needed to compile other
   packages.
 
-* +LIBFOO_CLEAN_CMDS+, lists the actions to perform to clean up
-  the build directory of the package.
-
 * +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
   actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -63,9 +63,6 @@ Additionally, there are some other usefu
 | +show-depends+    | Displays the dependencies required to build the
 package
 
-| +clean+           | Run the clean command of the package; _note that
-  this is not implemented for all packages_
-
 | +dirclean+        | Remove the whole package build directory
 
 | +rebuild+         | Re-run the compilation commands - this only makes
