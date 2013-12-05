From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 05 Dec 2013 11:54:06 +0100
Subject: [Buildroot] [PATCH 1 of 3] manual: remove references to uninstall
	commands
In-Reply-To: <patchbomb.1386240845@argentina>
References: <patchbomb.1386240845@argentina>
Message-ID: <f2f1b59c4cfbf80a1592.1386240846@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-autotools.txt |  8 --------
 docs/manual/adding-packages-generic.txt   |  6 ------
 docs/manual/package-make-target.txt       |  4 +---
 3 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -148,14 +148,6 @@ cases, typical packages will therefore o
 * +LIBFOO_CLEAN_OPT+ contains the make options used to
   clean the package. By default, the value is +clean+.
 
-* +LIBFOO_UNINSTALL_STAGING_OPT+, contains the make
-  options used to uninstall the package from the staging directory. By
-  default, the value is +DESTDIR=$$(STAGING_DIR) uninstall+.
-
-* +LIBFOO_UNINSTALL_TARGET_OPT+, contains the make
-  options used to uninstall the package from the target directory. By
-  default, the value is +DESTDIR=$$(TARGET_DIR) uninstall+.
-
 With the autotools infrastructure, all the steps required to build
 and install the packages are already defined, and they generally work
 well for most autotools-based packages. However, when required, it is
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -415,12 +415,6 @@ different steps of the build process.
 * +LIBFOO_CLEAN_CMDS+, lists the actions to perform to clean up
   the build directory of the package.
 
-* +LIBFOO_UNINSTALL_TARGET_CMDS+ lists the actions to
-  uninstall the package from the target directory +$(TARGET_DIR)+
-
-* +LIBFOO_UNINSTALL_STAGING_CMDS+ lists the actions to
-  uninstall the package from the staging directory +$(STAGING_DIR)+.
-
 * +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
   actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -63,9 +63,7 @@ Additionally, there are some other usefu
 | +show-depends+    | Displays the dependencies required to build the
 package
 
-| +clean+           | Run the clean command of the package, also
-uninstall the package from both the target and the staging directory; _note
-that this is not implemented for all packages_
+| +clean+           | Run the clean command of the package
 
 | +dirclean+        | Remove the whole package build directory
 
