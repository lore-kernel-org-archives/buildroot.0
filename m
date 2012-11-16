From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 16 Nov 2012 11:59:54 +0000
Subject: [Buildroot] [PATCH] manual: minor tweaks
Message-ID: <1353067194-32240-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Minor grammatical and spelling tweaks to the manual content.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 docs/manual/adding-packages-conclusion.txt |    2 +-
 docs/manual/adding-packages-directory.txt  |    6 ++--
 docs/manual/adding-packages-gettext.txt    |    6 ++--
 docs/manual/adding-packages-tips.txt       |    6 ++--
 docs/manual/beyond-buildroot.txt           |    2 +-
 docs/manual/board-support.txt              |    8 ++---
 docs/manual/common-usage.txt               |    8 ++---
 docs/manual/contribute.txt                 |   22 +++++++-------
 docs/manual/customize-uclibc-config.txt    |    2 +-
 docs/manual/download-location.txt          |    2 +-
 docs/manual/embedded-basics.txt            |   14 ++++-----
 docs/manual/faq-troubleshooting.txt        |   44 ++++++++++++++--------------
 docs/manual/how-buildroot-works.txt        |    2 +-
 docs/manual/introduction.txt               |    8 ++---
 docs/manual/legal-notice.txt               |   21 ++++++-------
 docs/manual/make-tips.txt                  |   12 ++++----
 docs/manual/makedev-syntax.txt             |   17 +++++------
 docs/manual/package-make-target.txt        |    2 +-
 docs/manual/patch-policy.txt               |   44 ++++++++++++++--------------
 docs/manual/prerequisite.txt               |    8 ++---
 docs/manual/rebuilding-packages.txt        |    8 ++---
 docs/manual/using.txt                      |    3 +-
 docs/manual/writing-rules.txt              |    2 +-
 23 files changed, 124 insertions(+), 125 deletions(-)

diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
index ac20875..42f1c8f 100644
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -4,7 +4,7 @@ Conclusion
 ~~~~~~~~~~
 
 As you can see, adding a software package to Buildroot is simply a
-matter of writing a Makefile using an  existing example and modifying it
+matter of writing a Makefile using an existing example and modifying it
 according to the compilation process required by the package.
 
 If you package software that might be useful for other people, don't
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 35d28b6..c8f41ff 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -154,12 +154,12 @@ config BR2_PACKAGE_E
 Overall, for package library dependencies, +select+ should be
 preferred.
 
-Note that such dependencies will make sure that the dependency option
+Note that such dependencies will ensure that the dependency option
 is also enabled, but not necessarily built before your package. To do
 so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
-Further formating details: see xref:writing-rules-config-in[the
+Further formatting details: see xref:writing-rules-config-in[the
 writing rules].
 
 The +.mk+ file
@@ -174,7 +174,7 @@ different way, using different infrastructures:
 
 * *Makefiles for generic packages* (not using autotools or CMake):
   These are based on an infrastructure similar to the one used for
-  autotools-based packages, but requires a little more work from the
+  autotools-based packages, but require a little more work from the
   developer. They specify what should be done for the configuration,
   compilation, installation and cleanup of the package. This
   infrastructure must be used for all packages that do not use the
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index 89461a7..e9446d2 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -5,12 +5,12 @@ Gettext integration and interaction with packages
 
 Many packages that support internationalization use the gettext
 library. Dependencies for this library are fairly complicated and
-therefore, deserves some explanation.
+therefore, deserve some explanation.
 
-The 'uClibc' C library doesn't implement gettext functionality,
+The 'uClibc' C library doesn't implement gettext functionality;
 therefore with this C library, a separate gettext must be compiled. On
 the other hand, the 'glibc' C library does integrate its own gettext,
-and in this case, the separate gettext library should not be compiled,
+and in this case the separate gettext library should not be compiled,
 because it creates various kinds of build failures.
 
 Additionally, some packages (such as +libglib2+) do require gettext
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index acc73d3..38dfa2b 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -7,7 +7,7 @@ Tips and tricks
 Package name, config entry name and makefile variable relationship
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-In Buildroot, there are some relation between:
+In Buildroot, there are some relationships between:
 
 * the _package name_, which is the package directory name (and the
   name of the +*.mk+ file);
@@ -16,8 +16,8 @@ In Buildroot, there are some relation between:
 
 * the makefile variable prefix.
 
-Thus, it is mandatory to keep consistency between all this stuff,
-matching the following rules:
+It is mandatory to be maintain consistency between these elements,
+using the following rules:
 
 * the _make_ target name will be the _package name_ itself (e.g.:
   +foo-bar_boo+);
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index 12ce78c..e7b902d 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -12,7 +12,7 @@ NFS boot
 To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
 images_ menu.
 
-After complete build, just run the following commands to setup the
+After a complete build, just run the following commands to setup the
 NFS-root directory:
 
 -------------------
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
index e20e721..271f3e0 100644
--- a/docs/manual/board-support.txt
+++ b/docs/manual/board-support.txt
@@ -23,10 +23,10 @@ savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
 directory, and rename it +MYBOARD_defconfig+.
 
-It is recommended to use as much as possible upstream versions of the
-Linux kernel and bootloaders, and to use as much as possible default
-kernel and bootloader configurations. If they are incorrect for your
-platform, we encourage you to send fixes to the corresponding upstream
+It is recommended to use upstream versions of the Linux kernel and
+bootloaders where possible, and also to use default kernel and bootloader
+configurations if possible. If the defaults are incorrect for
+your platform, we encourage you to send fixes to the corresponding upstream
 projects.
 
 However, in the mean time, you may want to store kernel or bootloader
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index c08c10e..98503b5 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -23,7 +23,7 @@ Building out-of-tree
 ~~~~~~~~~~~~~~~~~~~~
 
 As default, everything built by Buildroot is stored in the directory
-+output+ in the buildroot tree.
++output+ in the Buildroot tree.
 
 Buildroot also supports building out of tree with a syntax similar to
 the Linux kernel. To use it, add +O=<directory>+ to the make command
@@ -70,21 +70,21 @@ to +make+ or set in the environment:
   +
   Note that the uClibc configuration file can also be set from the
   configuration interface, so through the Buildroot .config file; this
-  the actual recommended way of setting it.
+  is the recommended way of setting it.
   +
 * +BUSYBOX_CONFIG_FILE=<path/to/.config>+, path to
   the Busybox configuration file.
   +
   Note that the Busybox configuration file can also be set from the
   configuration interface, so through the Buildroot .config file; this
-  the actual recommended way of setting it.
+  is the recommended way of setting it.
   +
 * +BUILDROOT_DL_DIR+ to override the directory in which
   Buildroot stores/retrieves downloaded files
   +
   Note that the Buildroot download directory can also be set from the
   configuration interface, so through the Buildroot .config file; this
-  the actual recommended way of setting it.
+  is the recommended way of setting it.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index b2e6e7d..b94b670 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -57,7 +57,7 @@ Lastly, send/submit your patch set to the Buildroot mailing list:
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or google it.
 
-Make sure posted *patches are not line-wrapped*, otherwise it cannot
+Make sure posted *patches are not line-wrapped*, otherwise they cannot
 easily be applied. In such a case, fix your e-mail client, or better,
 use +git send-email+ to send your patches.
 
@@ -79,11 +79,11 @@ Tested-by:: Indicates that the patch has been tested. It is useful
 Autobuild
 ---------
 
-The Buildroot community is currently setting up automatic build i
-order to test more and more configuration. All build results are
+The Buildroot community is currently setting up automatic builds in
+order to test more and more configurations. All build results are
 available at http://autobuild.buildroot.org[]
 
-A way to contribute is fixing broken builds.
+A good way to contribute is by fixing broken builds.
 
 In the commit message of a patch fixing an _autobuild_, add a
 reference to the _build result directory_ (the +dir+ link in the _data
@@ -97,17 +97,17 @@ Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2
 Reporting issues/bugs, get help
 -------------------------------
 
-Before reporting some issues, please chek
-xref:mailing-list-subscribe[the mailing list archive] in case someone had
+Before reporting some issues, please check
+xref:mailing-list-subscribe[the mailing list archive] in case someone has
 already reported and fixed a similar problem.
 
-Whatever the way you choose to report some bugs or get help,
+However you choose to report bugs or get help,
 xref:bugtracker[opening a bug] or
-xref:mailing-list-subscribe[send a mail to the mailing list], there is
-a number of detail to provide in order to help people reproduce and
+xref:mailing-list-subscribe[send a mail to the mailing list], there are
+a number of details to provide in order to help people reproduce and
 find a solution to the issue.
 
-Try to think as you would be the one who will help someone else; in
+Try to think as you would if you were helping someone else; in
 that case, what would you need?
 
 Here is a short list of details to provide in such case:
@@ -121,6 +121,6 @@ Here is a short list of details to provide in such case:
 
 Additionnally, your can add the +.config+ file.
 
-If some of these details are too large, do not hesitate to use some
+If some of these details are too large, do not hesitate to use a
 pastebin service (see
 http://en.wikipedia.org/wiki/Comparison_of_pastebins[]).
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
index 88121ea..d340c9a 100644
--- a/docs/manual/customize-uclibc-config.txt
+++ b/docs/manual/customize-uclibc-config.txt
@@ -14,7 +14,7 @@ follow these steps:
 * Do an initial compilation of Buildroot without trying to customize
   uClibc.
 
-* Invoke +make uclibc-menuconfig+.  The nice configuration assistant,
+* Invoke +make uclibc-menuconfig+. The nice configuration assistant,
   similar to the one used in the Linux kernel or Buildroot,
   appears. Make your configuration changes as appropriate.
 
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 8c66a76..dac5669 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -5,7 +5,7 @@ Location of downloaded packages
 
 It might be useful to know that the various tarballs that are
 downloaded by the Makefiles are all stored in the +DL_DIR+ which by
-default is the +dl+ directory. It's useful, for example, if you want
+default is the +dl+ directory. This is useful, for example, if you want
 to keep a complete version of Buildroot which is known to be working
 with the associated tarballs. This will allow you to regenerate the
 toolchain and the target filesystem with exactly the same versions.
diff --git a/docs/manual/embedded-basics.txt b/docs/manual/embedded-basics.txt
index 27dda37..bf65554 100644
--- a/docs/manual/embedded-basics.txt
+++ b/docs/manual/embedded-basics.txt
@@ -4,7 +4,7 @@ Embedded system basics
 ----------------------
 
 When developing an embedded system, there are a number of choices to
-do:
+make:
 
 * the cross-toolchain: target architecture/C library/...
 * the bootloader
@@ -14,14 +14,14 @@ do:
 * the package selection (busybox vs. "real" programs, ...)
 * ...
 
-Some of them may be influenced by the target hardware.
+Some of these may be influenced by the target hardware.
 
-Some of them may also add some constraints when you will develop the
-final application for what your target is designed (e.g. some
-functions may be provided by soem C libraries and missing in some
-others, ...). So, these choices should be carefully done.
+Some of the choices may also add some constraints when you develop the
+final application for which your target is designed (e.g. some
+functions may be provided by some C libraries and missing in some
+others, ...). So, these choices should be carefully made.
 
-Buildroot allows to set most of these options to fit your needs.
+Buildroot allows you to set most of these options to fit your needs.
 
 Moreover, Buildroot provides an infrastructure for reproducing the
 build process of your kernel, cross-toolchain, and embedded root
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 6911c55..3ecc3ae 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -7,7 +7,7 @@ Frequently Asked Questions & Troubleshooting
 The boot hangs after 'Starting network...'
 ------------------------------------------
 
-If the boot process seems to hand after the following messages
+If the boot process seems to hang after the following messages
 (messages not necessarily exactly similar, depending on the list of
 packages selected):
 
@@ -20,7 +20,7 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
 
 then it means that your system is running, but didn't start a shell on
 the serial console. In order to have the system start a shell on your
-serial console, you have to go in the Buildroot configuration, +System
+serial console, you have to go into the Buildroot configuration, +System
 configuration+, and modify +Port to run a getty (login prompt) on+ and
 +Baudrate to use+ as appropriate. This will automatically tune the
 +/etc/inittab+ file of the generated system so that a shell starts on
@@ -42,21 +42,21 @@ you should install the +glibc-static+ package. This is because the
 C library.
 
 [[faq-no-compiler-on-target]]
-Why there is no compiler on the target?
+Why is there no compiler on the target?
 ---------------------------------------
 
-It has been decided that the support of the _native compiler for the
-target_ would be stopped since the Buildroot-2012.11 release because:
+It has been decided that support for the _native compiler on the
+target_ would be stopped from the Buildroot-2012.11 release because:
 
-* this feature was not maintained nor tested and often broken;
+* this feature was not maintained or tested, and often broken;
 * this feature was only available for Buildroot toolchains;
 * Buildroot mostly targets _small_ or _very small_ target hardware
-  with limited resource onboard (CPU, ram, mass-storage), on which
+  with limited resource onboard (CPU, ram, mass-storage), for which
   compiling does not make much sense.
 
 If you need a compiler on your target anyway, then Buildroot is not
 suitable for your purpose. In such case, you need a _real
-distribution_ and you should for something like:
+distribution_ and you should opt for something like:
 
 * http://www.openembedded.org[openembedded]
 * https://www.yoctoproject.org[yocto]
@@ -67,8 +67,8 @@ distribution_ and you should for something like:
 * ...
 
 [[faq-no-dev-files-on-target]]
-Why there is no development files on the target?
-------------------------------------------------
+Why are there no development files on the target?
+-------------------------------------------------
 
 Since there is no compiler available on the target (see
 xref:faq-no-compiler-on-target[]), it does not make sense to waste
@@ -78,7 +78,7 @@ Therefore, those files are always removed from the target since the
 Buildroot-2012.11 release.
 
 [[faq-no-doc-on-target]]
-Why there is no documentation on the target?
+Why is there no documentation on the target?
 --------------------------------------------
 
 Because Buildroot mostly targets _small_ or _very small_ target
@@ -101,21 +101,21 @@ semantics.
 See xref:depends-on-vs-select[].
 
 [[faq-why-not-visible-package]]
-Why some packages are not visible in the Buildroot config menu?
+Why are some packages not visible in the Buildroot config menu?
 ---------------------------------------------------------------
 
-If a package exists in the Buildroot tree and does not appears in the
+If a package exists in the Buildroot tree and does not appear in the
 config menu, this most likely means that some of the package's
 dependencies are not met.
 
-To know more about the dependencies of a package, search the package
-symbol using in teh config menu (see xref:make-tips[]).
+To know more about the dependencies of a package, search for the
+package symbol in the config menu (see xref:make-tips[]).
 
 Then, you may have to recursively enable several options (which
-correspond to the unmeet dependencies) to finally be able to select
+correspond to the unmet dependencies) to finally be able to select
 the package.
 
-If the package is not visible due to some unmeet toolchain options,
+If the package is not visible due to some unmet toolchain options,
 then you should certainly run a full rebuild (see xref:make-tips[] for
 more explanations).
 
@@ -123,12 +123,12 @@ more explanations).
 Why not use the target directory as a chroot directory?
 -------------------------------------------------------
 
-There are plenty of reason to *not* use the target directory a chroot
+There are plenty of reasons to *not* use the target directory a chroot
 one, among these:
 
-* files' owners, modes and permissions are not correctly set in the
+* file ownerships, modes and permissions are not correctly set in the
   target directory;
-* devices nodes are not created in the target directory.
+* device nodes are not created in the target directory.
 
-Because of that, commands run in through chroot, using the target
-directory as new root, will fail.
+For these reasons, commands run through chroot, using the target
+directory as the new root, will fail.
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 879cff3..31774c0 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -9,7 +9,7 @@ also includes patches for various software packages - mainly the ones
 involved in the cross-compilation tool chain (+gcc+, +binutils+ and
 +uClibc+).
 
-There is basically one Makefile per software package, and they are
+There is basically one Makefile for each software package, and they are
 named with the +.mk+ extension. Makefiles are split into three main
 sections:
 
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index 91ecb04..3f4cca8 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -3,10 +3,10 @@
 About Buildroot
 ===============
 
-Buildroot provides a full featured environment for cross-development.
+Buildroot provides a full-featured environment for cross-development.
 Buildroot is able to generate a cross-compilation toolchain, a root
 filesystem, a Linux kernel image and a bootloader for your target.
-Buildroot can be used for any combinaison of these options,
+Buildroot can be used for any combination of these options,
 independently.
 
 Buildroot is useful mainly for people working with embedded systems.
@@ -15,7 +15,7 @@ processors everyone is used to having in his PC. They can be PowerPC
 processors, MIPS processors, ARM processors, etc.
 
 Buildroot supports numerous processors and their variants; it also
-comes with default configuration for several boards available
-off-the-shelf. Besides, a number of third-party projects are based on
+comes with default configurations for several boards available
+off-the-shelf. Besides this, a number of third-party projects are based on
 or develop their BSP footnote:[BSP: Board Software Package] or
 SDK footnote:[SDK: Standard Development Kit] on top of Buildroot.
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 22e5769..c98da6c 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -12,17 +12,18 @@ All of the end products of Buildroot (toolchain, root filesystem, kernel,
 bootloaders) contain opensource software, released under various licenses.
 
 Using opensource software gives you the freedom to build rich embedded
-systems choosing from a wide range of packages, but also gives some
+systems choosing from a wide range of packages, but also imposes some
 obligations that you must know and honour.
 Some licenses require you to publish the license text in the documentation of
-your product. Other require you to redistribute the source code of the
+your product. Others require you to redistribute the source code of the
 software to those that receive your product.
 
 The exact requirements of each license is documented in each package, and it is
-your (or your legal office's) responsibility to comply with these requirements.
+your responsibility (or that of your legal office) to comply with these
+requirements.
 To make this easier for you, Buildroot can collect for you some material you
-will probably need. To produce this material, after you configured Buildroot
-with +make menuconfig+, +make xconfig+ or +make gconfig+, run:
+will probably need. To produce this material, after you have configured
+Buildroot with +make menuconfig+, +make xconfig+ or +make gconfig+, run:
 
 --------------------
 make legal-info
@@ -44,8 +45,8 @@ There you will find:
   Buildroot sources and are not duplicated in the +sources/+ subdirectory.
 * A manifest file listing the configured packages, their version, license and
   related information.
-  Some of these information might be not defined in Buildroot; in this case
-  they are clearly marked as "unknown" or similar.
+  Some of this information might not be defined in Buildroot; such items are
+  clearly marked as "unknown" or similar.
 * A +licenses/+ subdirectory, which contains the license text of packages.
   If the license file(s) are not defined in Buildroot, the file is not produced
   and a warning in the +README+ indicates this.
@@ -53,7 +54,7 @@ There you will find:
 Please note that the aim of the +legal-info+ feature of Buildroot is to
 produce all the material that is somehow relevant for legal compliance with the
 package licenses. Buildroot does not try to produce the exact material that
-you must somehow make public. It does surely produce some more material than is
+you must somehow make public. Certainly, more material is produced than is
 needed for a strict legal compliance. For example, it produces the source code
 for packages released under BSD-like licenses, that you might not want to
 redistribute in source form.
@@ -132,5 +133,5 @@ Buildroot is part of the 'scripts used to control compilation and
 installation of the executable', and as such it is considered part of the
 material that must be redistributed.
 
-Keep in mind this is only the Buildroot developers' opinion, and you should
-consult your legal department or lawyer in case of any doubt.
+Keep in mind that this is only the Buildroot developers' opinion, and you
+should consult your legal department or lawyer in case of any doubt.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 5b00536..25c4e35 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -4,18 +4,18 @@
 'make' tips
 -----------
 
-Because Buildroot is a set of Makefiles and patches, there are few
-things useful to know, such as:
+Because Buildroot is a set of Makefiles and patches, there are a few
+things that are useful to know, such as:
 
 +make *config+ commands offer a search tool. Read the help message in
-the different frontend menu to know how to use it:
+the different frontend menus to know how to use it:
 
 * in _menuconfig_, search tool is called by pressing +/+;
 * in _xconfig_, search tool is called by pressing +ctrl+ + +f+.
 
-The result of the search show the help message of the matching items.
+The result of the search shows the help message of the matching items.
 
-Display all command executed by make:
+Display all commands executed by make:
 
 --------------------
  $ make V=0|1 <target>
@@ -54,5 +54,5 @@ Delete all build products as well as the configuration:
 --------------------
 
 Note that if +ccache+ is enabled, running +make clean|distclean+ does
-not empty the cache of compiler used by Buildroot. To delete it, refer
+not empty the compiler cache used by Buildroot. To delete it, refer
 to xref:ccache[].
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 4703b2f..99ecdea 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -4,12 +4,11 @@
 Makedev syntax documentation
 ----------------------------
 
-The makedev syntax is used across several places in Buildroot to
-define changes to be made for permissions or which device files to
-create and how to create them, in order to avoid to call mkdnod every
-now and then.
+The makedev syntax is used in several places in Buildroot to
+define changes to be made for permissions, or which device files to
+create and how to create them, in order to avoid calls to mknod.
 
-This syntax is derived from the makedev utility, and a more complete
+This syntax is derived from the makedev utility, and more complete
 documentation can be found in the +package/makedevs/README+ file.
 
 It takes the form of a line for each file, with the following layout:
@@ -18,7 +17,7 @@ It takes the form of a line for each file, with the following layout:
 |name |type |mode |uid |gid |major |minor |start |inc |count
 |===========================================================
 
-There is a few non-trivial blocks here:
+There are a few non-trivial blocks here:
 
 - +name+ is the path to the file you want to create/modify
 - +type+ is the type of the file, being one of :
@@ -27,13 +26,13 @@ There is a few non-trivial blocks here:
   * c: a character device file
   * b: a block device file
   * p: a named pipe
-- +mode+, +uid+ and +gid+ are the usual permissions stuff
+- +mode+, +uid+ and +gid+ are the usual permissions settings
 - +major+ and +minor+ are here for device files
-- +start+, +inc+ and +count+ are when you want to create a whole batch
+- +start+, +inc+ and +count+ are for when you want to create a batch
   of files, and can be reduced to a loop, beginning at +start+,
   incrementing its counter by +inc+ until it reaches +count+
 
-Let's say you want to change the permissions of a given file, using
+Let's say you want to change the permissions of a given file; using
 this syntax, you will need to put:
 -------------------------------------------------------------------
 /usr/bin/foobar	f	644	0	0	-	-	-	-	-
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 1813af3..e8d5f53 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -82,7 +82,7 @@ uninstall the package from both the target and the staging directory
 | +rebuild+         | Rebuild only necessary binaries and install them
 again
 
-| +reconfigure+     | Run again the configure command, then rebuild
+| +reconfigure+     | Re-run the configure command, then rebuild
 only necessary binaries, and lastly install them again
 
 |===================================================
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 551ea12..a54df35 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -10,16 +10,16 @@ necessary to patch the source of the software to get it built within
 Buildroot.
 
 Buildroot offers an infrastructure to automatically handle this during
-the builds. It support several ways of applying patch sets:
+the builds. It supports several ways of applying patch sets:
 
-Provinding patches
+Providing patches
 ~~~~~~~~~~~~~~~~~~
 
-Additionnal tarball
-^^^^^^^^^^^^^^^^^^^
+Additional tarball
+^^^^^^^^^^^^^^^^^^
 
-If there needs to apply a patch set available as a tarball and
-downloadable, then add the patch tarball to the +<packagename>_PATCH+
+If it is necessary to apply a patch set available as a downloadable
+tarball, then add the patch tarball to the +<packagename>_PATCH+
 variable.
 
 Note that the patch tarballs are downloaded from the same site as the
@@ -28,13 +28,13 @@ sources.
 Within Buildroot
 ^^^^^^^^^^^^^^^^
 
-Most of the patches are provided within Buildroot, in the package
-directory, because they aim to fix cross-compilation, +libc+ support,
-or whatever the reason is.
+Most patches are provided within Buildroot, in the package
+directory; these typically aim to fix cross-compilation, +libc+ support,
+or other such issues.
 
 These patch files should have the extension +*.patch+.
 
-A +series+ file, like +quilt+ uses it, may also be added in the
+A +series+ file, as used by +quilt+, may also be added in the
 package directory. In that case, the +series+ file defines the patch
 application order.
 
@@ -43,7 +43,7 @@ How patches are applied
 
 . Run the +<packagename>_PRE_PATCH_HOOKS+ commands if defined;
 
-. Cleanup the build directory from any existing +*.rej+ files;
+. Cleanup the build directory, removing any existing +*.rej+ files;
 
 . If +<packagename>_PATCH+ is defined, then patches from these
   tarballs are applied;
@@ -65,17 +65,17 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
 Format and licensing of the package patches
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Patches are released under the same license the software that is
+Patches are released under the same license as the software that is
 modified.
 
-A message explaining what does the patch and why should be add in the
-patch's header.
+A message explaining what the patch does, and why it is needed, should
+be added in the header commentary of the patch.
 
 You should add a +signed-off-by+ statement in the header of the each
-patch to help keeping track of the changes.
+patch to help with keeping track of the changes.
 
-If the software is under versionning, it is recommended to use the SCM
-software to generate the patch set.
+If the software is under version control, it is recommended to use the
+SCM software to generate the patch set.
 
 Otherwise, concatenate the header with the output of the
 +diff -purN source.c.orig source.c+ command.
@@ -107,10 +107,10 @@ AC_PROG_MAKE_SET
 Integrating patches found on the Web
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-When integrating a patch whom you are not the author, you have to add
-few things in the header of the patch itself.
+When integrating a patch of which you are not the author, you have to
+add a few things in the header of the patch itself.
 
-Depending on whether the patch has been pick-up from the project
+Depending on whether the patch has been obtained from the project
 repository itself, or from somewhere on the web, add one of the
 following tags:
 
@@ -124,5 +124,5 @@ or
 Fetch from: <some url>
 ---------------
 
-It is also possible to add few words about the changes that may have
-been necessary if any.
+It is also sensible to add a few words about any changes to the patch
+that may have been necessary.
diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 31d437d..36d8da7 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -4,13 +4,13 @@
 System requirements
 -------------------
 
-Buildroot is design to run on Linux system.
+Buildroot is designed to run on Linux systems.
 
 Buildroot needs some software to be already installed on the host
-system; hereafter the lists of the mandatory and optional packages
+system; here are the lists of the mandatory and optional packages
 (package names may vary between distributions).
 
-Take care of _installing both runtime and development data_, especially
+Take care to _install both runtime and development data_, especially
 for the libraries that may be packaged in 2 distinct packages.
 
 
@@ -58,7 +58,7 @@ Optional packages
 * Source fetching tools:
 +
 In the official tree, most of the package sources are retrieved
-using +wget+, few are only available through their +git+, +mercurial+,
+using +wget+; a few are only available through their +git+, +mercurial+,
 or +svn+ repository.
 +
 All other source fetching methods are implemented and may be used in a
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index a723d11..d3c087a 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -10,7 +10,7 @@ A full rebuild is achieved by running:
 $ make clean all
 ---------------
 
-In what cases, a full rebuild is mandatory:
+In certain cases, a full rebuild is mandatory:
 
 * each time the toolchain properties are changed, this includes:
 
@@ -22,14 +22,14 @@ In what cases, a full rebuild is mandatory:
 
 * after removing some libraries from the package selection.
 
-In what cases, a full rebuild is recommended:
+In certain cases, a full rebuild is recommended:
 
 * after adding some libraries to the package selection (otherwise,
   some packages that can be optionally linked against those libraries
   won't be rebuilt, so they won't support those new available
   features).
 
-In other cases, it is up to you to decide if you should or not run a
+In other cases, it is up to you to decide if you should run a
 full rebuild, but you should know what is impacted and understand what
 you are doing anyway.
 
@@ -81,7 +81,7 @@ files are relevant:
 Buildroot infrastructures.
 - Only toolchain packages remain using custom makefiles (i.e. do not
 use any Buildroot infrastructure).
-- Most packages and toolchain packages, if not all, will progressively
+- Most, if not all, packages and toolchain packages will progressively
 be ported over to the generic, autotools or CMake infrastructure,
 making it much easier to rebuild individual packages.
 
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index e8136f8..892caf5 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -56,8 +56,7 @@ This command will generally perform the following steps:
 
 * Download source files (as required)
 * Configure, build and install the cross-compiling toolchain using the
-  appropriate toolchain backend is used, or simply import a toolchain
-  if an external toolchain
+  appropriate toolchain backend, or simply import an external toolchain
 * Build/install selected target packages
 * Build a kernel image, if selected
 * Build a bootloader image, if selected
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index e0a5a2a..c32f855 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -3,7 +3,7 @@
 Writing rules
 -------------
 
-Overall, those writing rules are here to help you add new files in
+Overall, these writing rules are here to help you add new files in
 Buildroot or refactor existing ones.
 
 If you slightly modify some existing file, the important thing is
-- 
1.7.10.4
