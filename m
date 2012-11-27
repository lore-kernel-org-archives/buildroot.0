From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 27 Nov 2012 09:30:10 +0100
Subject: [Buildroot] [PATCH for-2012.11 1/4] manual: various fixes
Message-ID: <1354005013-28626-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Various minor linguistic fixes and consistency and correctness
improvements.

Also removing some sentences that are not or no longer relevant.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Since you need a lot of context to review documentation, I increased the
context to 5 lines.

I originally planned to include only trivial fixes, but there turn
out to be a few more invasive changes. If necessary, I can split the
patch into trivial and potentially-controversial. I haven't done that
yet because I wanted to get this patch out ASAP for the 2012.11 release.
Unless I get some ACKs earlier, I'll split the patch tomorrow.
---
 .topdeps                                   |    1 +
 .topmsg                                    |   18 +++++++++
 docs/manual/adding-packages-autotools.txt  |    4 +-
 docs/manual/adding-packages-cmake.txt      |    4 +-
 docs/manual/adding-packages-conclusion.txt |    2 +-
 docs/manual/adding-packages-directory.txt  |   15 ++++----
 docs/manual/adding-packages-generic.txt    |   57 ++++++++++++++--------------
 docs/manual/adding-packages-gettext.txt    |   20 ++++++----
 docs/manual/adding-packages-tips.txt       |   35 +++++++++++------
 docs/manual/beyond-buildroot.txt           |    2 +
 docs/manual/board-support.txt              |    6 +--
 docs/manual/common-usage.txt               |    8 ++--
 docs/manual/customize-rootfs.txt           |    8 ++--
 docs/manual/customize-toolchain.txt        |   13 +++----
 docs/manual/customize-uclibc-config.txt    |   11 +++---
 docs/manual/download-location.txt          |   14 ++++---
 docs/manual/embedded-basics.txt            |    6 ++-
 docs/manual/external-toolchain.txt         |    9 +++--
 docs/manual/faq-troubleshooting.txt        |    8 +++-
 docs/manual/how-buildroot-works.txt        |   35 ++++++++++-------
 docs/manual/introduction.txt               |    4 +-
 docs/manual/legal-notice.txt               |   30 ++++++++++-----
 docs/manual/make-tips.txt                  |   50 +++++++++++++-----------
 docs/manual/makedev-syntax.txt             |    5 ++-
 docs/manual/package-make-target.txt        |   51 ++++++++++---------------
 docs/manual/patch-policy.txt               |   36 +++++++++---------
 docs/manual/prerequisite.txt               |    6 +--
 docs/manual/rebuilding-packages.txt        |   44 ++++++++-------------
 docs/manual/using.txt                      |   26 ++++++-------
 docs/manual/writing-rules.txt              |   41 +++++++++++++-------
 30 files changed, 317 insertions(+), 252 deletions(-)
 create mode 100644 .topdeps
 create mode 100644 .topmsg

diff --git a/.topdeps b/.topdeps
new file mode 100644
index 0000000..1f7391f
--- /dev/null
+++ b/.topdeps
@@ -0,0 +1 @@
+master
diff --git a/.topmsg b/.topmsg
new file mode 100644
index 0000000..f070122
--- /dev/null
+++ b/.topmsg
@@ -0,0 +1,18 @@
+From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Subject: [PATCH] manual: various fixes
+
+Various minor linguistic fixes and consistency and correctness
+improvements.
+
+Also removing some sentences that are not or no longer relevant.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+Since you need a lot of context to review documentation, I increased the
+context to 5 lines.
+
+I originally planned to include only trivial fixes, but there turn
+out to be a few more invasive changes. If necessary, I can split the
+patch into trivial and potentially-controversial. I haven't done that
+yet because I wanted to get this patch out ASAP for the 2012.11 release.
+Unless I get some ACKs earlier, I'll split the patch tomorrow.
diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 1184b69..4127df4 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -133,13 +133,13 @@ cases, typical packages will therefore only use a few of them.
 
 * +LIBFOO_INSTALL_STAGING_OPT+ contains the make options
   used to install the package to the staging directory. By default, the
-  value is +DESTDIR=$$(STAGING_DIR) install+, which is
+  value is +DESTDIR=$(STAGING_DIR) install+, which is
   correct for most autotools packages. It is still possible to override
   it.
 
 * +LIBFOO_INSTALL_TARGET_OPT+ contains the make options
   used to install the package to the target directory. By default, the
-  value is +DESTDIR=$$(TARGET_DIR) install+. The default
+  value is +DESTDIR=$(TARGET_DIR) install+. The default
   value is correct for most autotools packages, but it is still possible
   to override it if needed.
 
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 81ac0a7..4a9e893 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -115,12 +115,12 @@ typical packages will therefore only use a few of them.
 
 * +LIBFOO_INSTALL_STAGING_OPT+ contains the make options used to
   install the package to the staging directory. By default, the value
-  is +DESTDIR=$$(STAGING_DIR) install+, which is correct for most
+  is +DESTDIR=$(STAGING_DIR) install+, which is correct for most
   CMake packages. It is still possible to override it.
 
 * +LIBFOO_INSTALL_TARGET_OPT+ contains the make options used to
   install the package to the target directory. By default, the value
-  is +DESTDIR=$$(TARGET_DIR) install+. The default value is correct
+  is +DESTDIR=$(TARGET_DIR) install+. The default value is correct
   for most CMake packages, but it is still possible to override it if
   needed.
 
diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
index 42f1c8f..137b7c3 100644
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -8,5 +8,5 @@ matter of writing a Makefile using an existing example and modifying it
 according to the compilation process required by the package.
 
 If you package software that might be useful for other people, don't
-forget to send a patch to Buildroot developers!
+forget to send a patch to the Buildroot mailing list!
 
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c8f41ff..f271e59 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -7,8 +7,9 @@ First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
 
 Some packages have been grouped by topic in a sub-directory:
-+multimedia+, +java+, +x11r7+, and +games+. If your package fits in
++multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
 one of these categories, then create your package directory in these.
+New subdirectories are discouraged, however.
 
 
 +Config.in+ file
@@ -32,12 +33,12 @@ configuration option must be indented with one tab. The help text
 itself should be indented with one tab and two spaces, and it must
 mention the upstream URL of the project.
 
-Of course, you can add other sub-options into a +if
+You can add other sub-options into a +if
 BR2_PACKAGE_LIBFOO...endif+ statement to configure particular things
 in your software. You can look at examples in other packages. The
 syntax of the +Config.in+ file is the same as the one for the kernel
 Kconfig file. The documentation for this syntax is available at
-http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt[]
+http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
 
 Finally you have to add your new +libfoo/Config.in+ to
 +package/Config.in+ (or in a category subdirectory if you decided to
@@ -68,9 +69,9 @@ rules:
   dependency for dependencies on toolchain options (target
   architecture, MMU support, C library, C++ support, large file
   support, thread support, RPC support, IPV6 support, WCHAR support),
-  or for dependencies on "big" things, such as the X.org system. In
-  some cases, especially dependency on toolchain options, it is
-  recommended to add a +comment+ displayed when the option is not
+  or for dependencies on "big" things, such as the X.org system. For
+  dependencies on toolchain options,there should be a +comment+ that
+  is displayed when the option is not
   enabled, so that the user knows why the package is not available.
   The +depends on+ keyword express the dependency with a forward
   semantic.
@@ -160,7 +161,7 @@ so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
 Further formatting details: see xref:writing-rules-config-in[the
-writing rules].
+coding style].
 
 The +.mk+ file
 ^^^^^^^^^^^^^^
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b05043a..7025320 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -151,11 +151,11 @@ information is (assuming the package name is +libfoo+) :
 * +LIBFOO_PATCH+ may contain the name of a patch, that will be
   downloaded from the same location as the tarball indicated in
   +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
-  defaults to +LIBFOO_PATCH+. Also note that another mechanism is
-  available to patch a package: all files of the form
-  +packagename-packageversion-description.patch+ present in the
+  defaults to +LIBFOO_PATCH+. Note that patches that are included
+  in Buildroot itself use a different mechanism: all files of the
+  form +packagename-packageversion-description.patch+ present in the
   package directory inside Buildroot will be applied to the package
-  after extraction.
+  after extraction (see xref:patch-policy[patching a package]).
 
 * +LIBFOO_SITE+ provides the location of the package, which can be a
   URL or a local filesystem path. HTTP, FTP and SCP are supported URL
@@ -175,8 +175,8 @@ information is (assuming the package name is +libfoo+) :
   Examples: +
     +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
     +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
-    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+
-    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+
+    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+ +
+    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
 
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
@@ -221,7 +221,7 @@ information is (assuming the package name is +libfoo+) :
   name) that are required for the current target package to
   compile. These dependencies are guaranteed to be compiled and
   installed before the configuration of the current package starts. In
-  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependency for
+  a similar way, +HOST_LIBFOO_DEPENDENCIES+ lists the dependencies for
   the current host package.
 
 * +LIBFOO_INSTALL_STAGING+ can be set to +YES+ or +NO+ (default). If
@@ -251,9 +251,6 @@ information is (assuming the package name is +libfoo+) :
   use the same string to make the manifest file uniform.
   Otherwise, describe the license in a precise and concise way, avoiding
   ambiguous names such as +BSD+ which actually name a family of licenses.
-  If the root filesystem you generate contains non-opensource packages, you
-  can define their license as +PROPRIETARY+: Buildroot will not save any
-  licensing info or source code for this package.
   This variable is optional. If it is not defined, +unknown+ will appear in
   the +license+ field of the manifest file for this package.
 
@@ -265,6 +262,11 @@ information is (assuming the package name is +libfoo+) :
   to let you know, and +not saved+ will appear in the +license files+ field
   of the manifest file for this package.
 
+* +LIBFOO_REDISTRIBUTE+ can be set to +YES+ (default) or +NO+ to indicate if
+  the package source code is allowed to be redistributed. Set it to +NO+ for
+  non-opensource packages: Buildroot will not save the source code for this
+  package when collecting the +legal-info+.
+
 The recommended way to define these variables is to use the following
 syntax:
 
@@ -275,46 +277,45 @@ LIBFOO_VERSION = 2.32
 Now, the variables that define what should be performed at the
 different steps of the build process.
 
-* +LIBFOO_CONFIGURE_CMDS+, used to list the actions to be performed to
-  configure the package before its compilation
+* +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
+  configure the package before its compilation.
 
-* +LIBFOO_BUILD_CMDS+, used to list the actions to be performed to
-  compile the package
+* +LIBFOO_BUILD_CMDS+ lists the actions to be performed to
+  compile the package.
 
-* +HOST_LIBFOO_INSTALL_CMDS+, used to list the actions to be performed
+* +HOST_LIBFOO_INSTALL_CMDS+ lists the actions to be performed
   to install the package, when the package is a host package. The
   package must install its files to the directory given by
   +$(HOST_DIR)+. All files, including development files such as
   headers should be installed, since other packages might be compiled
   on top of this package.
 
-* +LIBFOO_INSTALL_TARGET_CMDS+, used to list the actions to be
+* +LIBFOO_INSTALL_TARGET_CMDS+ lists the actions to be
   performed to install the package to the target directory, when the
   package is a target package. The package must install its files to
   the directory given by +$(TARGET_DIR)+. Only the files required for
-  'documentation' and 'execution' of the package should be
-  installed. Header files should not be installed, they will be copied
-  to the target, if the +development files in target filesystem+
-  option is selected.
+  'execution' of the package have to be
+  installed. Header files, static libraries and documentation will be
+  removed again when the target filesystem is finalized.
 
-* +LIBFOO_INSTALL_STAGING_CMDS+, used to list the actions to be
+* +LIBFOO_INSTALL_STAGING_CMDS+ lists the actions to be
   performed to install the package to the staging directory, when the
   package is a target package. The package must install its files to
   the directory given by +$(STAGING_DIR)+. All development files
   should be installed, since they might be needed to compile other
   packages.
 
-* +LIBFOO_CLEAN_CMDS+, used to list the actions to perform to clean up
+* +LIBFOO_CLEAN_CMDS+, lists the actions to perform to clean up
   the build directory of the package.
 
-* +LIBFOO_UNINSTALL_TARGET_CMDS+, used to list the actions to
+* +LIBFOO_UNINSTALL_TARGET_CMDS+ lists the actions to
   uninstall the package from the target directory +$(TARGET_DIR)+
 
-* +LIBFOO_UNINSTALL_STAGING_CMDS+, used to list the actions to
+* +LIBFOO_UNINSTALL_STAGING_CMDS+ lists the actions to
   uninstall the package from the staging directory +$(STAGING_DIR)+.
 
-* +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+, used
-  to install init scripts either for the systemV-like init systems
+* +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
+  actions to install init scripts either for the systemV-like init systems
   (busybox, sysvinit, etc.) or for the systemd units. These commands
   will be run only when the relevant init system is installed (i.e. if
   systemd is selected as the init system in the configuration, only
@@ -352,8 +353,8 @@ using the autotools infrastructure described below.  However, since
 they are provided by the generic infrastructure, they are documented
 here. The exception is +LIBFOO_POST_PATCH_HOOKS+.  Patching the
 package and producing legal info are not user definable, so
-+LIBFOO_POST_PATCH_HOOKS+ and +LIBFOO_POST_LEGAL_INFO_HOOKS+ will be
-userful for generic packages.
++LIBFOO_POST_PATCH_HOOKS+ and +LIBFOO_POST_LEGAL_INFO_HOOKS+ are
+useful for generic packages.
 
 The following hook points are available:
 
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index e9446d2..58fd98d 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -27,16 +27,20 @@ Therefore, Buildroot defines two configuration options:
   doesn't provide its own gettext implementation and if locale support
   is enabled
 
-Therefore, packages that unconditionally need gettext should:
+Packages that need gettext only when locale support is enabled should:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+
+* use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+ in the
+  +Config.in+ file;
 
-* Use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
-  +DEPENDENCIES+ variable
+* use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
+  +DEPENDENCIES+ variable in the +.mk+ file.
 
-Packages that need gettext only when locale support is enabled should:
+Packages that unconditionally need gettext (which should be very rare)
+should:
+
+* use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT+ in the +Config.in+
+  file;
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE+
+* use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
+  +DEPENDENCIES+ variable in the +.mk+ file.
 
-* Use +$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)+ in the package
-  +DEPENDENCIES+ variable
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 6ec632d..b5dc017 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -19,7 +19,10 @@ In Buildroot, there is some relationship between:
 It is mandatory to maintain consistency between these elements,
 using the following rules:
 
-* the _make_ target name will be the _package name_ itself (e.g.:
+* the package directory and the +*.mk+ name are the _package name_
+  itself (e.g.: +package/foo-bar_boo/foo-bar_boo.mk+);
+
+* the _make_ target name is the _package name_ itself (e.g.:
   +foo-bar_boo+);
 
 * the config entry is the upper case _package name_ with `.` and `-`
@@ -32,18 +35,12 @@ using the following rules:
 
 
 [[github-download-url]]
-How to add package from github
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+How to add a package from github
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-If the package has no release version, or its version cannot be
-identified using tag, then the sha1 of the particular commit should be
-used to identify the version (the first 7 characters of the sha1 are
-enough):
-
-------------------------
-FOO_VERSION = 1234567
-FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
-------------------------
+Packages on github often don't have a download area with release tarballs.
+However, it is possible to download tarballs directly from the repository
+on github.
 
 If the package version matches a tag, then this tag should be used to
 identify the version:
@@ -52,3 +49,17 @@ identify the version:
 FOO_VERSION = v1.0
 FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
 ------------------------
+
+If the package has no release version, or its version cannot be
+identified using tag, then the SHA1 of the particular commit should be
+used to identify the version (the first 7 characters of the SHA1 are
+enough):
+
+------------------------
+FOO_VERSION = 1234567
+FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
+------------------------
+
+Note that the name of the name of the tarball is the default
++foo-1234567.tar.gz+ so it is not necessary to specify it in the +.mk+
+file.
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index e7b902d..a87b584 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -19,6 +19,8 @@ NFS-root directory:
 sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
 -------------------
 
+Remember to add this path to +/etc/exports+.
+
 Then, you can execute a NFS-boot from your target.
 
 Chroot
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
index 271f3e0..44ab6eb 100644
--- a/docs/manual/board-support.txt
+++ b/docs/manual/board-support.txt
@@ -21,13 +21,13 @@ selections are highly application-specific.
 Once you have a known working configuration, run +make
 savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +MYBOARD_defconfig+.
+directory, and rename it +BOARDNAME_defconfig+.
 
 It is recommended to use upstream versions of the Linux kernel and
 bootloaders where possible, and also to use default kernel and bootloader
 configurations if possible. If the defaults are incorrect for
-your platform, we encourage you to send fixes to the corresponding upstream
-projects.
+your board, or no default exists, we encourage you to send fixes to the
+corresponding upstream projects.
 
 However, in the mean time, you may want to store kernel or bootloader
 configuration or patches specific to your target platform. To do so,
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 98503b5..5566a39 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -47,7 +47,7 @@ safely run multiple builds in parallel using the same source tree as
 long as they use unique output directories.
 
 For ease of use, Buildroot generates a Makefile wrapper in the output
-directory - So after the first run, you no longer need to pass +O=..+
+directory - so after the first run, you no longer need to pass +O=..+
 and +-C ..+, simply run (in the output directory):
 
 --------------------
@@ -69,21 +69,21 @@ to +make+ or set in the environment:
   internal toolchain is being built.
   +
   Note that the uClibc configuration file can also be set from the
-  configuration interface, so through the Buildroot .config file; this
+  configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
 * +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
   the Busybox configuration file.
   +
   Note that the Busybox configuration file can also be set from the
-  configuration interface, so through the Buildroot .config file; this
+  configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
   +
 * +BUILDROOT_DL_DIR+ to override the directory in which
   Buildroot stores/retrieves downloaded files
   +
   Note that the Buildroot download directory can also be set from the
-  configuration interface, so through the Buildroot .config file; this
+  configuration interface, so through the Buildroot +.config+ file; this
   is the recommended way of setting it.
 
 An example that uses config files located in the toplevel directory and
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index d6224ff..a1a556b 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -5,7 +5,7 @@ Customizing the generated target filesystem
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Besides changing one or another configuration through +make *config+,
-there are a few ways to customize the resulting target filesystem:
+there are a few ways to customize the resulting target filesystem.
 
 * Customize the target filesystem directly and rebuild the image.  The
   target filesystem is available under +output/target/+.  You can
@@ -13,7 +13,7 @@ there are a few ways to customize the resulting target filesystem:
   rebuild the target filesystem image. This method allows you to do
   anything to the target filesystem, but if you decide to completely
   rebuild your toolchain and tools, these changes will be lost.
-  _Changes are not resistent to the +make clean+ command_.
+  _Changes do not survive the +make clean+ command_.
 
 * Create your own 'target skeleton'. You can start with the default
   skeleton available under +system/skeleton+ and then customize it to
@@ -30,13 +30,13 @@ there are a few ways to customize the resulting target filesystem:
   assembled. The +BR2_ROOTFS_POST_BUILD_SCRIPT+ will allow you to
   specify the location of your post-build script. This option can be
   found in the +System configuration+ menu. The destination root
-  filesystem folder *is given as the first argument to this script,
+  filesystem folder is given as the first argument to this script,
   and this script can then be used to copy programs, static data or
   any other needed file to your target filesystem. You should,
   however, use this feature with care. Whenever you find that a
   certain package generates wrong or unneeded files, you should fix
   that package rather than work around it with a post-build cleanup
-  script. _Among these first 3 methods, this one should be prefere_d.
+  script. _Among these first 3 methods, this one should be preferred_.
 
 * A special package, 'customize', stored in +package/customize+ can be
   used. You can put all the files that you want to see in the final
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 91657cf..2b24412 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -24,24 +24,23 @@ The internal Buildroot toolchain backend *only* allows to generate
 
 However, it allows to tune major settings, such as:
 
-* Linux header version
+* Linux headers version;
 
-* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc])
+* http://www.uclibc.org/[uClibc] configuration (see xref:uclibc-custom[uClibc]);
 
-* Binutils, GCC, Gdb and toolchain options
+* Binutils, GCC, Gdb and toolchain options.
 
-This is directly available after selecting the +Buildroot toolchain+ type in
+These settings are available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.
 
 Using the Crosstool-NG backend
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
-limited set of settings under the Buildroot +Toolchain+ menu (ie. when invoking
-+make menuconfig+); mostly:
+limited set of settings under the Buildroot +Toolchain+ menu:
 
 * The http://crosstool-ng.org[crosstool-NG] configuration file
 
 * Gdb and some toolchain options
 
-Then, the toolchain can be finely tuned invoking +make ctng-menuconfig+.
+Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
index d340c9a..38a1575 100644
--- a/docs/manual/customize-uclibc-config.txt
+++ b/docs/manual/customize-uclibc-config.txt
@@ -18,17 +18,16 @@ follow these steps:
   similar to the one used in the Linux kernel or Buildroot,
   appears. Make your configuration changes as appropriate.
 
-* Copy the +$(O)/toolchain/uclibc-VERSION/.config+ file to a different
-  place (like +toolchain/uClibc/uClibc-myconfig.config+, or
-  +board/mymanufacturer/myboard/uClibc.config+) and adjust the uClibc
-  configuration (configuration option +BR2_UCLIBC_CONFIG+) to use this
+* Copy the +$(O)/toolchain/uClibc-VERSION/.config+ file to a different
+  place (e.g. +board/MANUFACTURER/BOARDNAME/uClibc.config+) and adjust
+  the uClibc configuration file option +BR2_UCLIBC_CONFIG+ to refer to this
   configuration instead of the default one.
 
 * Run the compilation of Buildroot again.
 
-Otherwise, you can simply change +toolchain/uClibc/uClibc.config+,
+Otherwise, you can simply change +toolchain/uClibc/uClibc-VERSION.config+,
 without running the configuration assistant.
 
-If you want to use an existing config file for uclibc, then see
+If you want to use an existing config file for uClibc, then see
 xref:env-vars[].
 
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 13e675c..4befe0a 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -3,12 +3,12 @@
 Location of downloaded packages
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-It might be useful to know that the various tarballs that are
-downloaded by the Makefiles are all stored in +DL_DIR+ which by
-default is the +dl+ directory. This is useful, for example, if you want
+The various tarballs that are downloaded by Buildroot are all stored in
++DL_DIR+, which by default is the +dl+ directory. If you want
 to keep a complete version of Buildroot which is known to be working
-with the associated tarballs. This will allow you to regenerate the
-toolchain and the target filesystem with exactly the same versions.
+with the associated tarballs, you can make a copy of this directory.
+This will allow you to regenerate the toolchain and the target filesystem
+with exactly the same versions.
 
 If you maintain several Buildroot trees, it might be better to have a
 shared download location. This can be accessed by creating a symbolic
@@ -26,3 +26,7 @@ should be added to +<~/.bashrc>+.
 -----------------
  $ export BUILDROOT_DL_DIR <shared download location>
 -----------------
+
+The download location can also be set in the +.config+ file, with the
++BR2_DL_DIR+ option. This value is overridden by the +BUILDROOT_DL_DIR+
+environment variable.
diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
index d1ee88c..fdadf62 100644
--- a/docs/manual/embedded-basics.txt
+++ b/docs/manual/embedded-basics.txt
@@ -49,7 +49,9 @@ processor. Under most Linux systems, the compilation toolchain uses
 the GNU libc (glibc) as the C standard library. This compilation
 toolchain is called the "host compilation toolchain". The machine on
 which it is running, and on which you're working, is called the "host
-system".
+system" footnote:[This terminology differs from what is used by GNU
+configure, where the host is the machine on which the application will
+run (which is usually the same as target)].
 
 The compilation toolchain is provided by your distribution, and
 Buildroot has nothing to do with it (other than using it to build a
@@ -82,7 +84,7 @@ interested in Buildroot for two reasons:
 
 You might wonder why such a tool is needed when you can compile +gcc+,
 +binutils+, +uClibc+ and all the other tools by hand. Of course doing
-so is possible but, dealing with all of the configure options and
+so is possible, but dealing with all of the configure options and
 problems of every +gcc+ or +binutils+ version is very time-consuming
 and uninteresting.  Buildroot automates this process through the use
 of Makefiles and has a collection of patches for each +gcc+ and
diff --git a/docs/manual/external-toolchain.txt b/docs/manual/external-toolchain.txt
index b337376..6124fe4 100644
--- a/docs/manual/external-toolchain.txt
+++ b/docs/manual/external-toolchain.txt
@@ -26,8 +26,8 @@ Then, you have three solutions to use an external toolchain:
 
 * Use a predefined external toolchain profile, and let Buildroot
   download, extract and install the toolchain. Buildroot already knows
-  about a few CodeSourcery toolchains for ARM, PowerPC, MIPS and
-  SuperH. Just select the toolchain profile in +Toolchain+ through the
+  about a few CodeSourcery, Linaro, Blackfin and Xilinx toolchains.
+  Just select the toolchain profile in +Toolchain+ from the
   available ones. This is definitely the easiest solution.
 
 * Use a predefined external toolchain profile, but instead of having
@@ -45,7 +45,8 @@ Then, you have three solutions to use an external toolchain:
   toolchain C library+ options. Then, you have to tell Buildroot what
   your external toolchain supports. If your external toolchain uses
   the 'glibc' library, you only have to tell whether your toolchain
-  supports C++ or not. If your external toolchain uses the 'uclibc'
+  supports C\+\+ or not and whether it has built-in RPC support. If
+  your external toolchain uses the 'uClibc'
   library, then you have to tell Buildroot if it supports largefile,
   IPv6, RPC, wide-char, locale, program invocation, threads and
   C++. At the beginning of the execution, Buildroot will tell you if
@@ -53,7 +54,7 @@ Then, you have three solutions to use an external toolchain:
 
 
 Our external toolchain support has been tested with toolchains from
-CodeSourcery, toolchains generated by
+CodeSourcery and Linaro, toolchains generated by
 http://crosstool-ng.org[crosstool-NG], and toolchains generated by
 Buildroot itself. In general, all toolchains that support the
 'sysroot' feature should work. If not, do not hesitate to contact the
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index fc75d66..5a22702 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -98,7 +98,7 @@ deal with expressing the dependencies of this package.
 
 In the +Config.in+ file, dependencies may be expressed following two
 semantics.
-See xref:depends-on-vs-select[].
+See xref:depends-on-vs-select[choosing between _depends_ and _select_].
 
 [[faq-why-not-visible-package]]
 Why are some packages not visible in the Buildroot config menu?
@@ -131,4 +131,8 @@ one, among these:
 * device nodes are not created in the target directory.
 
 For these reasons, commands run through chroot, using the target
-directory as the new root, would fail.
+directory as the new root, will most likely fail.
+
+If you want to run the target filesystem inside a chroot, or as an NFS
+root, then use the tarball image generated in +images/+ and extract it
+as root.
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 879cff3..ec08f95 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -6,29 +6,38 @@ How Buildroot works
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
 also includes patches for various software packages - mainly the ones
-involved in the cross-compilation tool chain (+gcc+, +binutils+ and
+involved in the cross-compilation toolchain (+gcc+, +binutils+ and
 +uClibc+).
 
 There is basically one Makefile per software package, and they are
-named with the +.mk+ extension. Makefiles are split into three main
-sections:
+named with the +.mk+ extension. Makefiles are split into many different
+parts.
 
-* *toolchain* (in the +toolchain/+ directory) contains the Makefiles
+* The +toolchain/+ directory contains the Makefiles
   and associated files for all software related to the
   cross-compilation toolchain: +binutils+, +gcc+, +gdb+,
   +kernel-headers+ and +uClibc+.
 
-* *package* (in the +package/+ directory) contains the Makefiles and
-  associated files for all user-space tools that Buildroot can compile
-  and add to the target root filesystem. There is one sub-directory
-  per tool.
+* The +arch/+ directory contains the definitions for all the processor
+  architectures that are supported by Buildroot.
 
-* *target* (in the +target+ directory) contains the Makefiles and
+* The +package/+ directory contains the Makefiles and
+  associated files for all user-space tools and libraries that Buildroot
+  can compile and add to the target root filesystem. There is one
+  sub-directory per package.
+
+* The +linux/+ directory contains the Makefiles and associated files for
+  the Linux kernel.
+
+* The +boot/+ directory contains the Makefiles and associated files for
+  the bootloaders supported by Buildroot.
+
+* The +system/+ directory contains support for system integration, e.g.
+  the target filesystem skeleton and the selection of an init system.
+
+* The +fs/+ directory contains the Makefiles and
   associated files for software related to the generation of the
-  target root filesystem image. Four types of filesystems are
-  supported: ext2, jffs2, cramfs and squashfs. For each of them there
-  is a sub-directory with the required files. There is also a
-  +default/+ directory that contains the target filesystem skeleton.
+  target root filesystem image.
 
 Each directory contains at least 2 files:
 
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index bcca544..9353f8c 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -17,5 +17,5 @@ processors, MIPS processors, ARM processors, etc.
 Buildroot supports numerous processors and their variants; it also
 comes with default configurations for several boards available
 off-the-shelf. Besides this, a number of third-party projects are based on,
-or develop their BSP footnote:[BSP: Board Software Package] or
-SDK footnote:[SDK: Standard Development Kit] on top of Buildroot.
+or develop their BSP footnote:[BSP: Board Support Package] or
+SDK footnote:[SDK: Software Development Kit] on top of Buildroot.
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index a7af5a8..c23b550 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -5,13 +5,13 @@
 Legal notice and licensing
 ==========================
 
-Complying with opensource licenses
-----------------------------------
+Complying with open source licenses
+-----------------------------------
 
 All of the end products of Buildroot (toolchain, root filesystem, kernel,
-bootloaders) contain opensource software, released under various licenses.
+bootloaders) contain open source software, released under various licenses.
 
-Using opensource software gives you the freedom to build rich embedded
+Using open source software gives you the freedom to build rich embedded
 systems, choosing from a wide range of packages, but also imposes some
 obligations that you must know and honour.
 Some licenses require you to publish the license text in the documentation of
@@ -46,7 +46,7 @@ There you will find:
 * A manifest file listing the configured packages, their version, license and
   related information.
   Some of this information might not be defined in Buildroot; such items are
-  clearly marked as "unknown" or similar.
+  marked as "unknown".
 * A +licenses/+ subdirectory, which contains the license text of packages.
   If the license file(s) are not defined in Buildroot, the file is not produced
   and a warning in the +README+ indicates this.
@@ -56,16 +56,20 @@ produce all the material that is somehow relevant for legal compliance with the
 package licenses. Buildroot does not try to produce the exact material that
 you must somehow make public. Certainly, more material is produced than is
 needed for a strict legal compliance. For example, it produces the source code
-for packages released under BSD-like licenses, that you might not want to
+for packages released under BSD-like licenses, that you are not required to
 redistribute in source form.
 
 Moreover, due to technical limitations, Buildroot does not produce some
 material that you will or may need, such as the toolchain source code and the
-Buildroot source code itself.
+Buildroot source code itself (including patches to packages for which source
+distribution is required).
 When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
 [[legal-info-list-licenses]]
+License abbreviations
+---------------------
+
 Here is a list of the licenses that are most widely used by packages in
 Buildroot, with the name used in the manifest file:
 
@@ -86,6 +90,13 @@ Buildroot, with the name used in the manifest file:
 * +GPL+:
   http://www.gnu.org/licenses/gpl.html[
   GNU General Public License] (any version);
+* +LGPLv2+:
+  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
+  GNU Library General Public License, version 2];
+* +LGPLv2++:
+  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
+  GNU Library General Public License, version 2.1]
+  or (at your option) any later version;
 * +LGPLv2.1+:
   http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
   GNU Lesser General Public License, version 2.1];
@@ -106,13 +117,12 @@ Buildroot, with the name used in the manifest file:
 * +BSD-4c+: Original BSD 4-clause license;
 * +BSD-3c+: BSD 3-clause license;
 * +BSD-2c+: BSD 2-clause license;
-* +PROPRIETARY+: marks a non-opensource package;
-  Buildroot does not save any licensing info or source code for these packages.
+* +MIT+: MIT-style license.
 
 Complying with the Buildroot license
 ------------------------------------
 
-Buildroot itself is an opensource software, released under the
+Buildroot itself is an open source software, released under the
 http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
 License, version 2] or (at your option) any later version.
 However, being a build system, it is not normally part of the end product:
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 25c4e35..8cd77c0 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -4,55 +4,61 @@
 'make' tips
 -----------
 
-Because Buildroot is a set of Makefiles and patches, there are a few
-things that are useful to know, such as:
+This is a collection of tips that help you make the most of Buildroot.
 
-+make *config+ commands offer a search tool. Read the help message in
+.Configuration searches:
+
+The +make *config+ commands offer a search tool. Read the help message in
 the different frontend menus to know how to use it:
 
-* in _menuconfig_, search tool is called by pressing +/+;
-* in _xconfig_, search tool is called by pressing +ctrl+ + +f+.
+* in _menuconfig_, the search tool is called by pressing +/+;
+* in _xconfig_, the search tool is called by pressing +Ctrl+ + +f+.
 
 The result of the search shows the help message of the matching items.
 
-Display all commands executed by make:
+.Display all commands executed by make:
 
 --------------------
- $ make V=0|1 <target>
+ $ make V=1 <target>
 --------------------
 
-Display all available targets:
+.Display all available targets:
 
 --------------------
  $ make help
 --------------------
 
-Note that some settings in the +.config+ file may hide some targets:
+.Not all targets are always available,
+
+some settings in the +.config+ file may hide some targets:
+
+* +linux-menuconfig+ and +linux-savedefconfig+ only work when
+  +linux+ is enabled;
+* +uclibc-menuconfig+ is only available when the
+  Buildroot internal toolchain backend is used;
+* +ctng-menuconfig+ is only available when the
+  crosstool-NG backend is used;
+* +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
+  +barebox+ bootloader is enabled.
+
+.Cleaning:
 
-* +busybox-menuconfig+ depends on whether +busybox+ is enabled or not
-  in the +Package selection+ menu
-* +linux-menuconfig+ and +linux-savedefconfig+ depend on whether
-  +linux+ is enabled or not
-* +uclibc-menuconfig+ depends on whether the toolchain uses the
-  Buildroot internal toolchain backend or not
-* +ctng-menuconfig+ depends on whether the toolchain uses the
-  crosstool-NG backend or not
-* +barebox-menuconfig+ and +barebox-savedefconfig+ depend on whether
-  +barebox+ bootloader is enabled or not
+Explicit cleaning is required when any of the architecture or toolchain
+configuration options are changed.
 
-Delete all build products (including build directories, host, staging
+To delete all build products (including build directories, host, staging
 and target trees, the images and the toolchain):
 
 --------------------
  $ make clean
 --------------------
 
-Delete all build products as well as the configuration:
+To delete all build products as well as the configuration:
 
 --------------------
  $ make distclean
 --------------------
 
-Note that if +ccache+ is enabled, running +make clean|distclean+ does
+Note that if +ccache+ is enabled, running +make clean+ or +distclean+ does
 not empty the compiler cache used by Buildroot. To delete it, refer
 to xref:ccache[].
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 99ecdea..27517b3 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -20,14 +20,15 @@ It takes the form of a line for each file, with the following layout:
 There are a few non-trivial blocks here:
 
 - +name+ is the path to the file you want to create/modify
-- +type+ is the type of the file, being one of :
+- +type+ is the type of the file, being one of:
   * f: a regular file
   * d: a directory
   * c: a character device file
   * b: a block device file
   * p: a named pipe
 - +mode+, +uid+ and +gid+ are the usual permissions settings
-- +major+ and +minor+ are here for device files
+- +major+ and +minor+ are here for device files - set to - for other
+  files
 - +start+, +inc+ and +count+ are for when you want to create a batch
   of files, and can be reduced to a loop, beginning at +start+,
   incrementing its counter by +inc+ until it reaches +count+
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index e8d5f53..7374957 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -2,20 +2,13 @@
 
 [[pkg-build-steps]]
 
-Package make targets
-~~~~~~~~~~~~~~~~~~~~
+Package-specific _make_ targets
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-A +make <package>+ call achieves several _make targets_ with, as a
-result, this particular package and its dependencies built, installed
-in their destination directory (target, staging or host directory).
+Running +make <package>+ builds and installs that particular package
+and its dependencies.
 
-For packages based on the Buildroot infrastructures (+generic-package+,
-+autotools-package+ or +cmake-package+), each of those
-actions/steps/commands. For packages relying on other build system,
-then there is no other choice than looking at the +.mk+ file (see also
-the xref:rebuild-pkg[]).
-
-For packages relying on the Buildroot infrastructures, there are
+For packages relying on the Buildroot infrastructure, there are
 numerous special make targets that can be called independently like
 this:
 
@@ -23,7 +16,7 @@ this:
 make <package>-<target>
 ------------
 
-In order, the package build commands are:
+The package build targets are (in the order they are executed):
 
 [width="90%",cols="^1,4",options="header"]
 |===================================================
@@ -38,27 +31,22 @@ build the package
 | +extract+         | Put the source in the package build directory
 (extract the tarball, copy the source, etc)
 
-| +patch+           | Apply the patches if any
+| +patch+           | Apply the patches, if any
 
-| +configure+       | Run the configure command
+| +configure+       | Run the configure commands, if any
 
-| +build+           | Compile the source
+| +build+           | Run the compilation commands
 
 | +install-staging+ |
 *target package:* Run the installation of the package in the
-staging directory
-
-*host package:* Does nothing
+staging directory, if necessary
 
 | +install-target+  |
 *target package:* Run the installation of the package in the
-staging directory
-
-*host package:* Does nothing
+target directory, if necessary
 
 | +install+         |
-*target package:* Run the 2 previous installation commands for the
-target packages
+*target package:* Run the 2 previous installation commands
 
 *host package:* Run the installation of the package in the host
 directory
@@ -74,15 +62,18 @@ Additionally, there are some other useful make targets:
 | +show-depends+    | Displays the dependencies required to build the
 package
 
-| +clean+           | Clean the package build directory, also
-uninstall the package from both the target and the staging directory
+| +clean+           | Run the clean command of the package, also
+uninstall the package from both the target and the staging directory; _note
+that this is not implemented for all packages_
 
 | +dirclean+        | Remove the whole package build directory
 
-| +rebuild+         | Rebuild only necessary binaries and install them
-again
+| +rebuild+         | Re-run the compilation commands - this only makes
+sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a file
+directly in the build directory
 
-| +reconfigure+     | Re-run the configure command, then rebuild
-only necessary binaries, and lastly install them again
+| +reconfigure+     | Re-run the configure commands, then rebuild - this only
+makes sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a
+file directly in the build directory
 
 |===================================================
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 1fdb04e..9bc6537 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -2,37 +2,38 @@
 
 [[patch-policy]]
 
-Patch Policy
-------------
+Patching a package
+------------------
 
 While integrating a new package or updating an existing one, it may be
-necessary to patch the source of the software to get it built within
+necessary to patch the source of the software to get it cross-built within
 Buildroot.
 
 Buildroot offers an infrastructure to automatically handle this during
-the builds. It supports several ways of applying patch sets:
+the builds. It supports two ways of applying patch sets: downloaded patches
+and patches supplied within buildroot.
 
 Providing patches
 ~~~~~~~~~~~~~~~~~
 
-Additional tarball
-^^^^^^^^^^^^^^^^^^
+Downloaded
+^^^^^^^^^^
 
-If it is necessary to apply a patch set available as a downloadable
-tarball, then add the patch tarball to the +<packagename>_PATCH+
-variable.
+If it is necessary to apply a patch that is available for download, then it
+to the +<packagename>_PATCH+ variable. It is downloaded from the same site
+as the package itself. It can be a single patch, or a tarball containing a
+patch series.
 
-Note that the patch tarballs are downloaded from the same site as the
-sources.
+This method is typically used for packages from Debian.
 
 Within Buildroot
 ^^^^^^^^^^^^^^^^
 
 Most patches are provided within Buildroot, in the package
-directory; these typically aim to fix cross-compilation, +libc+ support,
+directory; these typically aim to fix cross-compilation, libc support,
 or other such issues.
 
-These patch files should have the extension +*.patch+.
+These patch files should be named +<packagename>-*.patch+.
 
 A +series+ file, as used by +quilt+, may also be added in the
 package directory. In that case, the +series+ file defines the patch
@@ -71,14 +72,15 @@ modified.
 A message explaining what the patch does, and why it is needed, should
 be added in the header commentary of the patch.
 
-You should add a +signed-off-by+ statement in the header of the each
-patch to help with keeping track of the changes.
+You should add a +Signed-off-by+ statement in the header of the each
+patch to help with keeping track of the changes and to certify that the
+patch is released under the same license as the software that is modified.
 
 If the software is under version control, it is recommended to use the
-SCM software to generate the patch set.
+upstream SCM software to generate the patch set.
 
 Otherwise, concatenate the header with the output of the
-+diff -purN source.c.orig source.c+ command.
++diff -purN package-version.orig/ package-version/+ command.
 
 At the end, the patch should look like:
 
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 36d8da7..17660b7 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -23,7 +23,7 @@ Mandatory packages
 
 ** +which+
 ** +sed+
-** +make+ (version 3.82 or any later)
+** +make+ (version 3.81 or any later)
 ** +binutils+
 ** +build-essential+ (only for Debian based systems)
 ** +gcc+ (version 2.95 or any later)
@@ -47,9 +47,6 @@ Mandatory packages
 * Source fetching tools:
 ** +wget+
 
-* Configuration interface dependencies (requires development libraries):
-** +ncurses5+
-
 [[requirement-optional]]
 
 Optional packages
@@ -73,6 +70,7 @@ development context (further details: refer to xref:download-infra[]).
 ** +subversion+
 
 * Configuration interface dependencies (requires development libraries):
+** +ncurses5+ to use the 'menuconfig' interface
 ** +qt4+ to use the 'xconfig' interface
 ** +glib2+, +gtk2+ and +glade2+ to use the 'gconfig' interface
 
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 83f6a36..d6a77a7 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -14,7 +14,7 @@ In some cases, a full rebuild is mandatory:
 
 * each time the toolchain properties are changed, this includes:
 
-** after changing some toolchain option under the _Toolchain_ menu (if
+** after changing any toolchain option under the _Toolchain_ menu (if
    the internal Buildroot backend is used);
 ** after running +make ctng-menuconfig+ (if the crosstool-NG backend
    is used);
@@ -25,7 +25,7 @@ In some cases, a full rebuild is mandatory:
 In some cases, a full rebuild is recommended:
 
 * after adding some libraries to the package selection (otherwise,
-  some packages that can be optionally linked against those libraries
+  packages that can be optionally linked against those libraries
   won't be rebuilt, so they won't support those new available
   features).
 
@@ -41,49 +41,37 @@ One of the most common questions asked by Buildroot users is how to
 rebuild a given package or how to remove a package without rebuilding
 everything from scratch.
 
-Removing a package is currently unsupported by Buildroot without
+Removing a package is unsupported by Buildroot without
 rebuilding from scratch. This is because Buildroot doesn't keep track
 of which package installs what files in the +output/staging+ and
-+output/target+ directories. However, implementing clean package
-removal is on the TODO-list of Buildroot developers.
++output/target+ directories, or which package would be compiled differently
+depending on the availability of another package.
 
 The easiest way to rebuild a single package from scratch is to remove
 its build directory in +output/build+. Buildroot will then re-extract,
-re-configure, re-compile and re-install this package from scratch.
+re-configure, re-compile and re-install this package from scratch. You
+can ask buildroot to do this with the +make <package>-dirclean+ command.
 
-For convenience, most packages support the special make targets
-<package>-reconfigure and <package>-rebuild to repeat the configure
-and build steps.
+For convenience, the special make targets
+<package>-reconfigure and <package>-rebuild repeat the configure
+resp. build steps.
 
 However, if you don't want to rebuild the package completely from
 scratch, a better understanding of the Buildroot internals is
 needed. Internally, to keep track of which steps have been done and
 which steps remain to be done, Buildroot maintains stamp files (empty
-files that just tell whether this or that action has been done). The
-problem is that these stamp files are not uniformly named and handled
-by the different packages, so some understanding of the particular
-package is needed.
+files that just tell whether this or that action has been done):
 
-For packages relying on Buildroot packages infrastructures (see
-xref:adding-packages[this section] for details), the following stamp
-files are relevant:
-
-* +output/build/packagename-version/.stamp_configured+. If removed,
+* +output/build/<package>-<version>/.stamp_configured+. If removed,
   Buildroot will trigger the recompilation of the package from the
   configuration step (execution of +./configure+).
 
-* +output/build/packagename-version/.stamp_built+. If removed,
+* +output/build/<package>-<version>/.stamp_built+. If removed,
   Buildroot will trigger the recompilation of the package from the
   compilation step (execution of +make+).
 
-.Notes
-- Since the _Buildroot-2012.11_ release, all packages rely on the
-Buildroot infrastructures.
-- Only toolchain packages remain using custom makefiles (i.e. do not
-use any Buildroot infrastructure).
-- Most, if not all, packages and toolchain packages will progressively
-be ported over to the generic, autotools or CMake infrastructure,
-making it much easier to rebuild individual packages.
+Note: toolchain packages use custom makefiles. Their stamp files are named
+differently.
 
-Further details about package special make target at the
+Further details about package special make targets are explained in
 xref:pkg-build-steps[].
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index 892caf5..6e144d0 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -31,9 +31,9 @@ to run the Qt or GTK-based configurators.
 All of these "make" commands will need to build a configuration
 utility (including the interface), so you may need to install
 "development" packages for relevant libraries used by the
-configuration utilities. Check the xref:requirement[] to know what
-Buildroot needs, and specifically the xref:requirement-optional[system requirements]
-to get the dependencies of favorite interface.
+configuration utilities. Check xref:requirement[] to know what
+Buildroot needs, and specifically the xref:requirement-optional[optional requirements]
+to get the dependencies of your favorite interface.
 
 For each menu entry in the configuration tool, you can find associated
 help that describes the purpose of the entry.
@@ -52,15 +52,15 @@ You *should never* use +make -jN+ with Buildroot: it does not support
 'top-level parallel make'. Instead, use the +BR2_JLEVEL+ option to
 tell Buildroot to run each package compilation with +make -jN+.
 
-This command will generally perform the following steps:
+The `make` command will generally perform the following steps:
 
-* Download source files (as required)
-* Configure, build and install the cross-compiling toolchain using the
-  appropriate toolchain backend, or simply import an external toolchain
-* Build/install selected target packages
-* Build a kernel image, if selected
-* Build a bootloader image, if selected
-* Create a root filesystem in selected formats
+* download source files (as required);
+* configure, build and install the cross-compiling toolchain using the
+  appropriate toolchain backend, or simply import an external toolchain;
+* build/install selected target packages;
+* build a kernel image, if selected;
+* build a bootloader image, if selected;
+* create a root filesystem in selected formats.
 
 Buildroot output is stored in a single directory, +output/+.
 This directory contains several subdirectories:
@@ -93,8 +93,8 @@ This directory contains several subdirectories:
   use the tarball image generated in +images/+ and extract it as
   root. Compared to +staging/+, +target/+ contains only the files and
   libraries needed to run the selected target applications: the
-  development files (headers, etc.) are not present, unless the
-  +development files in target filesystem+ option is selected.
+  development files (headers, etc.) are not present, the binaries are
+  stripped.
 
 * +host/+ contains the installation of tools compiled for the host
   that are needed for the proper execution of Buildroot, including the
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index c32f855..f6382b5 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -1,16 +1,18 @@
 // -*- mode:doc; -*-
 
-Writing rules
--------------
+Coding style
+------------
 
-Overall, these writing rules are here to help you add new files in
+Overall, these coding style rules are here to help you to add new files in
 Buildroot or refactor existing ones.
 
 If you slightly modify some existing file, the important thing is
-keeping the consistency of the whole file, so you can:
-* either follow the potentially deprecated rules used all over this
-file
-* or entirely rework it in order to make it comply with those rules.
+to keep the consistency of the whole file, so you can:
+
+* either follow the potentially deprecated coding style used in this
+file,
+
+* or entirely rework it in order to make it comply with these rules.
 
 [[writing-rules-config-in]]
 
@@ -39,9 +41,9 @@ config BR2_PACKAGE_LIBFOO
 * The help text itself should be indented with one tab and two
   spaces.
 
-The configuration system used in Buildroot, so the content of the
-+Config.in+ files, is regular _Kconfig_. Further details about
-_Kconfig_: refer to
+The +Config.in+ files are the input for the configuration tool
+used in Buildroot, which is the regular _Kconfig_. For further
+details about the _Kconfig_ language, refer to
 http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[].
 
 [[writing-rules-mk]]
@@ -55,15 +57,26 @@ The +.mk+ file
 LIBFOO_VERSION = 1.0
 LIBFOO_CONF_OPT += --without-python-support
 ---------------------
++
+It is also possible to align the +=+ signs:
++
+---------------------
+LIBFOO_VERSION   = 1.0
+LIBFOO_SOURCE    = foo-$(LIBFOO_VERSION).tar.gz
+LIBFOO_CONF_OPT += --without-python-support
+---------------------
 
 * Indentation: use tab only:
 +
 ---------------------
 define LIBFOO_REMOVE_DOC
-$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
-	$(TARGET_DIR)/usr/share/man/man3/libfoo*
+	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
+		$(TARGET_DIR)/usr/share/man/man3/libfoo*
 endef
 ---------------------
++
+Note that commands inside a +define+ block should always start with a tab,
+so _make_ recognizes them as commands.
 
 * Optional dependency:
 
@@ -121,5 +134,5 @@ The documentation
 The documentation uses the
 http://www.methods.co.nz/asciidoc/[asciidoc] format.
 
-Further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
-syntax: refer to http://www.methods.co.nz/asciidoc/userguide.html[].
+For further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
+syntax, refer to http://www.methods.co.nz/asciidoc/userguide.html[].
-- 
1.7.10.4
