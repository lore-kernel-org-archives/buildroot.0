From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Dec 2012 22:39:13 +0100
Subject: [Buildroot] [git commit] docs/manual: small fixes and enhancements
	to adding generic packages
Message-ID: <20121230215034.68C569A559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1d44593a04ff3be981c8a3b01a502f0b18193ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add overall description of LIBFOO_DEVICES and LIBFOO_PERMISSIONS.
Fix line numbers.

Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |   32 +++++++++++++++++++-----------
 1 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 6c1c35e..0759d4f 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -53,30 +53,32 @@ system is based on hand-written Makefiles or shell scripts.
 37: $(eval $(generic-package))
 --------------------------------
 
-The Makefile begins on line 6 to 8 with metadata information: the
+The Makefile begins on line 6 to 10 with metadata information: the
 version of the package (+LIBFOO_VERSION+), the name of the
-tarball containing the package (+LIBFOO_SOURCE+) and the
-Internet location at which the tarball can be downloaded
-(+LIBFOO_SITE+). All variables must start with the same prefix,
-+LIBFOO_+ in this case. This prefix is always the uppercased
-version of the package name (see below to understand where the package
-name is defined).
-
-On line 9, we specify that this package wants to install something to
+tarball containing the package (+LIBFOO_SOURCE+) the
+Internet location at which the tarball can be downloaded from
+(+LIBFOO_SITE+), the license (+LIBFOO_LICENSE+) and file with the
+license text (+LIBFOO_LICENSE_FILES+). All variables must start with
+the same prefix, +LIBFOO_+ in this case. This prefix is always the
+uppercased version of the package name (see below to understand where
+the package name is defined).
+
+On line 11, we specify that this package wants to install something to
 the staging space. This is often needed for libraries, since they must
 install header files and other development files in the staging space.
 This will ensure that the commands listed in the
 +LIBFOO_INSTALL_STAGING_CMDS+ variable will be executed.
 
-On line 10, we specify the list of dependencies this package relies
+On line 12, we specify the list of dependencies this package relies
 on. These dependencies are listed in terms of lower-case package names,
 which can be packages for the target (without the +host-+
 prefix) or packages for the host (with the +host-+) prefix).
 Buildroot will ensure that all these packages are built and installed
 'before' the current package starts its configuration.
 
-The rest of the Makefile defines what should be done at the different
-steps of the package configuration, compilation and installation.
+The rest of the Makefile, lines 14..27, defines what should be done
+at the different steps of the package configuration, compilation and
+installation.
 +LIBFOO_BUILD_CMDS+ tells what steps should be performed to
 build the package. +LIBFOO_INSTALL_STAGING_CMDS+ tells what
 steps should be performed to install the package in the staging space.
@@ -87,7 +89,13 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-Finally, on line 35, we call the +generic-package+ which
+On line 29..31, we define a device-node file used by this package
+(+LIBFOO_DEVICES+).
+
+On line 33..35, we define the permissions to set to specific files
+installed by this package (+LIBFOO_PERMISSIONS+).
+
+Finally, on line 37, we call the +generic-package+ function, which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
