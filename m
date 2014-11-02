From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Nov 2014 00:39:55 +0100
Subject: [Buildroot] [PATCH 6/6] manual: Various tidy changes
In-Reply-To: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414971595-9972-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes performed all over the manual:
    - In AsciiDoc, you only need 4 dashes to make a code block.
    - Remove trailing spaces.
    - Adding '// vim: set syntax=asciidoc:' when missing.
    - Adding empty lines were needed.
    - When an example of an external command is done, harmoize the use
      of the scheme:
      ' $ cmd'

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-autotools.txt     |  6 +--
 docs/manual/adding-packages-cmake.txt         |  4 +-
 docs/manual/adding-packages-directory.txt     | 53 +++++++++++++++------------
 docs/manual/adding-packages-generic.txt       | 24 ++++++------
 docs/manual/adding-packages-hooks.txt         |  4 +-
 docs/manual/adding-packages-kconfig.txt       |  4 +-
 docs/manual/adding-packages-luarocks.txt      |  4 +-
 docs/manual/adding-packages-perl.txt          |  4 +-
 docs/manual/adding-packages-python.txt        |  4 +-
 docs/manual/adding-packages-tips.txt          |  4 +-
 docs/manual/adding-packages-virtual.txt       | 24 ++++++------
 docs/manual/beyond-buildroot.txt              |  4 +-
 docs/manual/ccache-support.txt                |  4 +-
 docs/manual/common-usage.txt                  | 48 ++++++++++++------------
 docs/manual/contribute.txt                    | 28 +++++++-------
 docs/manual/customize-directory-structure.txt | 12 +++---
 docs/manual/customize-outside-br.txt          | 25 +++++++------
 docs/manual/customize-packages.txt            | 16 ++++----
 docs/manual/customize-patches.txt             |  1 +
 docs/manual/download-location.txt             |  4 +-
 docs/manual/faq-troubleshooting.txt           | 12 +++---
 docs/manual/legal-notice.txt                  |  4 +-
 docs/manual/make-tips.txt                     | 20 +++++-----
 docs/manual/makeusers-syntax.txt              |  1 +
 docs/manual/package-make-target.txt           |  4 +-
 docs/manual/patch-policy.txt                  | 12 +++---
 docs/manual/quickstart.txt                    | 20 +++++-----
 docs/manual/rebuilding-packages.txt           |  6 +--
 docs/manual/using-buildroot-debugger.txt      | 12 +++---
 docs/manual/using-buildroot-development.txt   | 20 +++++-----
 docs/manual/writing-rules.txt                 | 32 ++++++++--------
 31 files changed, 214 insertions(+), 206 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index ece6c49..9e8c567 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -10,7 +10,7 @@
 First, let's see how to write a +.mk+ file for an autotools-based
 package, with an example :
 
-------------------------
+----
 01: ################################################################################
 02: #
 03: # libfoo
@@ -26,7 +26,7 @@ package, with an example :
 13: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 14:
 15: $(eval $(autotools-package))
-------------------------
+----
 
 On line 7, we declare the version of the package.
 
@@ -125,7 +125,7 @@ cases, typical packages will therefore only use a few of them.
   variables to pass to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. These are passed in the environment of
   the 'autoreconf' command. By default, empty.
-  
+
 * +LIBFOO_AUTORECONF_OPTS+ to specify additional options
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index 02f1dbb..cf6c852 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -10,7 +10,7 @@
 First, let's see how to write a +.mk+ file for a CMake-based package,
 with an example :
 
-------------------------
+----
 01: ################################################################################
 02: #
 03: # libfoo
@@ -26,7 +26,7 @@ with an example :
 13: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 14:
 15: $(eval $(cmake-package))
-------------------------
+----
 
 On line 7, we declare the version of the package.
 
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index c145829..237f2d5 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -18,14 +18,14 @@ Then, create a file named +Config.in+. This file will contain the
 option descriptions related to our +libfoo+ software that will be used
 and displayed in the configuration tool. It should basically contain:
 
----------------------------
+----
 config BR2_PACKAGE_LIBFOO
 	bool "libfoo"
 	help
 	  This is a comment that explains what libfoo is.
 
 	  http://foosoftware.org/libfoo/
----------------------------
+----
 
 The +bool+ line, +help+ line and other metadata information about the
 configuration option must be indented with one tab. The help text
@@ -45,9 +45,9 @@ put your package in one of the existing categories). The files
 included there are 'sorted alphabetically' per category and are 'NOT'
 supposed to contain anything but the 'bare' name of the package.
 
---------------------------
+----
 source "package/libfoo/Config.in"
---------------------------
+----
 
 [[depends-on-vs-select]]
 ==== Choosing +depends on+ or +select+
@@ -81,7 +81,7 @@ is not met.
 
 An example illustrates both the usage of +select+ and +depends on+.
 
---------------------------
+----
 config BR2_PACKAGE_ACL
         bool "acl"
         select BR2_PACKAGE_ATTR
@@ -96,7 +96,7 @@ config BR2_PACKAGE_ACL
 
 comment "acl needs a toolchain w/ largefile"
         depends on !BR2_LARGEFILE
---------------------------
+----
 
 
 Note that these two dependency types are only transitive with the
@@ -104,7 +104,7 @@ dependencies of the same kind.
 
 This means, in the following example:
 
---------------------------
+----
 config BR2_PACKAGE_A
         bool "Package A"
 
@@ -123,7 +123,7 @@ config BR2_PACKAGE_D
 config BR2_PACKAGE_E
         bool "Package E"
         select BR2_PACKAGE_D
---------------------------
+----
 
 * Selecting +Package C+ will be visible if +Package B+ has been
   selected, which in turn is only visible if +Package A+ has been
@@ -137,7 +137,7 @@ config BR2_PACKAGE_E
   the dependency of +Package B+ on +Package A+.  Therefore, in such a
   situation, the transitive dependency has to be added explicitly:
 
---------------------------
+----
 config BR2_PACKAGE_D
 	bool "Package D"
 	select BR2_PACKAGE_B
@@ -147,7 +147,7 @@ config BR2_PACKAGE_E
 	bool "Package E"
 	select BR2_PACKAGE_D
 	depends on BR2_PACKAGE_A
---------------------------
+----
 
 Overall, for package library dependencies, +select+ should be
 preferred.
@@ -191,18 +191,22 @@ construct rather than repeating the +depends on+ statement on the
 comment and other config options.
 
 The general format of a dependency +comment+ for package foo is:
---------------------------
+
+----
 foo needs a toolchain w/ featA, featB, featC
---------------------------
+----
 
 for example:
---------------------------
+
+----
 aircrack-ng needs a toolchain w/ largefile, threads
---------------------------
+----
+
 or
---------------------------
+
+----
 crda needs a toolchain w/ threads
---------------------------
+----
 
 Note that this text is kept brief on purpose, so that it will fit on a
 80-character terminal.
@@ -277,31 +281,32 @@ typically kernel modules or firmware. A comment should be added in the
 Config.in file to express this dependency, similar to dependencies on
 toolchain options. The general format is:
 
---------------------------
+----
 foo needs a Linux kernel to be built
---------------------------
+----
 
 If there is a dependency on both toolchain options and the Linux
 kernel, use this format:
---------------------------
+
+----
 foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
---------------------------
+----
 
 ==== Dependencies on udev /dev management
 
 If a package needs udev /dev management, it should depend on symbol
 +BR2_PACKAGE_HAS_UDEV+, and the following comment should be added:
 
---------------------------
+----
 foo needs udev /dev management
---------------------------
+----
 
 If there is a dependency on both toolchain options and udev /dev
 management, use this format:
 
---------------------------
+----
 foo needs udev /dev management and a toolchain w/ featA, featB, featC
---------------------------
+----
 
 ==== Dependencies on features provided by virtual packages
 
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 67a7453..ae924ee 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -12,7 +12,7 @@ system is based on hand-written Makefiles or shell scripts.
 
 ==== +generic-package+ tutorial
 
-------------------------------
+----
 01: ################################################################################
 02: #
 03: # libfoo
@@ -56,7 +56,7 @@ system is based on hand-written Makefiles or shell scripts.
 41: endef
 42:
 43: $(eval $(generic-package))
---------------------------------
+----
 
 The Makefile begins on line 7 to 11 with metadata information: the
 version of the package (+LIBFOO_VERSION+), the name of the
@@ -103,9 +103,9 @@ Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
 
 So its fixup would be:
 
---------------------------------
+----
 DIVINE_CONFIG_SCRIPTS = divine-config
---------------------------------
+----
 ================================
 
 .Config script: 'imagemagick' package:
@@ -115,11 +115,11 @@ Package imagemagick installs the following scripts:
 
 So it's fixup would be:
 
---------------------------------
+----
 IMAGEMAGICK_CONFIG_SCRIPTS = \
    Magick-config Magick++-config \
    MagickCore-config MagickWand-config Wand-config
---------------------------------
+----
 ================================
 
 On line 14, we specify the list of dependencies this package relies
@@ -166,10 +166,10 @@ for the host.  It is possible to call both of them in a single +.mk+
 file: once to create the rules to generate a target
 package and once to create the rules to generate a host package:
 
-----------------------
+----
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-----------------------
+----
 
 This might be useful if the compilation of the target package requires
 some tools to be installed on the host. If the package name is
@@ -371,9 +371,9 @@ information is (assuming the package name is +libfoo+) :
 The recommended way to define these variables is to use the following
 syntax:
 
-----------------------
+----
 LIBFOO_VERSION = 2.32
-----------------------
+----
 
 Now, the variables that define what should be performed at the
 different steps of the build process.
@@ -431,13 +431,13 @@ different steps of the build process.
 
 The preferred way to define these variables is:
 
-----------------------
+----
 define LIBFOO_CONFIGURE_CMDS
 	action 1
 	action 2
 	action 3
 endef
-----------------------
+----
 
 In the action definitions, you can use the following variables:
 
diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 5b5bf6a..4b3005d 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -50,14 +50,14 @@ These variables are 'lists' of variable names containing actions to be
 performed at this hook point. This allows several hooks to be
 registered at a given hook point. Here is an example:
 
-----------------------
+----
 define LIBFOO_POST_PATCH_FIXUP
 	action1
 	action2
 endef
 
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
-----------------------
+----
 
 ==== Using the +POST_RSYNC+ hook
 The +POST_RSYNC+ hook is run only for packages that use a local source,
diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index e87d393..6f50286 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -24,11 +24,11 @@ In order to use the +kconfig-package+ infrastructure for a Buildroot
 package, the minimally required lines in the +.mk+ file, in addition to
 the variables required by the +generic-package+ infrastructure, are:
 
-------------------------------
+----
 FOO_KCONFIG_FILE = reference-to-source-configuration-file
 
 $(eval $(kconfig-package))
-------------------------------
+----
 
 This snippet creates the following make targets:
 
diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index c914238..01149d7 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -10,7 +10,7 @@
 First, let's see how to write a +.mk+ file for a LuaRocks-based package,
 with an example :
 
-------------------------
+----
 01: ################################################################################
 02: #
 03: # luafoo
@@ -26,7 +26,7 @@ with an example :
 13: LUAFOO_LICENSE_FILES = COPYING
 14:
 15: $(eval $(luarocks-package))
-------------------------
+----
 
 On line 7, we declare the version of the package (the same as in the rockspec,
 which is the concatenation of the upstream version and the rockspec revision,
diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 63fafe6..6047b48 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -10,7 +10,7 @@
 First, let's see how to write a +.mk+ file for a Perl/CPAN package,
 with an example :
 
-------------------------
+----
 01: ################################################################################
 02: #
 03: # perl-foo-bar
@@ -25,7 +25,7 @@ with an example :
 12: PERL_FOO_BAR_LICENSE_FILES = LICENSE
 13:
 14: $(eval $(perl-package))
-------------------------
+----
 
 On line 7, we declare the version of the package.
 
diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 3cbb87d..37cb15f 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -14,7 +14,7 @@ recognizable by the usage of a +setup.py+ script.
 First, let's see how to write a +.mk+ file for a Python package,
 with an example :
 
-------------------------
+----
 01: ################################################################################
 02: #
 03: # python-foo
@@ -31,7 +31,7 @@ with an example :
 14: PYTHON_FOO_SETUP_TYPE = distutils
 15:
 16: $(eval $(python-package))
-------------------------
+----
 
 On line 7, we declare the version of the package.
 
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 0c6018a..06988d1 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -41,10 +41,10 @@ However, it is possible to download tarballs directly from the repository
 on GitHub. As GitHub is known to have changed download mechanisms in the
 past, the 'github' helper function should be used as shown below.
 
-------------------------
+----
 FOO_VERSION = v1.0 # tag or full commit ID
 FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
-------------------------
+----
 
 .Notes
 - The FOO_VERSION can either be a tag or a commit ID.
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index a5f17a2..d0b6a6e 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -26,14 +26,14 @@ First, let's create the virtual package.
 
 The +Config.in+ file of virtual package 'something-virtual' should contain:
 
----------------------------
+----
 01: config BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
 02:	bool
 03:
 04: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
 05:	depends on BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
 06:	string
----------------------------
+----
 
 In this file, we declare two options, +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+ and
 +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+, whose values will be used by the
@@ -43,7 +43,7 @@ providers.
 
 The +.mk+ for the virtual package should just evaluate the +virtual-package+ macro:
 
----------------------------
+----
 01: ################################################################################
 02: #
 03: # something-virtual
@@ -51,7 +51,7 @@ The +.mk+ for the virtual package should just evaluate the +virtual-package+ mac
 05: ################################################################################
 06:
 07: $(eval $(virtual-package))
----------------------------
+----
 
 The ability to have target and host packages is also available, with the
 +host-virtual-package+ macro.
@@ -64,7 +64,7 @@ modifications.
 The +Config.in+ file of the package 'some-provider', which provides the
 functionalities of 'something-virtual', should contain:
 
----------------------------
+----
 01: config BR2_PACKAGE_SOME_PROVIDER
 02:	bool "some-provider"
 03:	select BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
@@ -77,7 +77,7 @@ functionalities of 'something-virtual', should contain:
 10: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
 11:	default "some-provider"
 12: endif
----------------------------
+----
 
 On line 3, we select +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+, and on line 11, we
 set the value of +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+ to the name of the
@@ -92,9 +92,9 @@ The +.mk+ file should also declare an additional variable
 +SOME_PROVIDER_PROVIDES+ to contain the names of all the virtual
 packages it is an implementation of:
 
----------------------------
+----
 01: SOME_PROVIDER_PROVIDES = something-virtual
----------------------------
+----
 
 Of course, do not forget to add the proper build and runtime dependencies for
 this package!
@@ -107,14 +107,14 @@ if you implement a new provider for an existing virtual package.
 When adding a package that requires a certain +FEATURE+ provided by a virtual
 package, you have to use +depends on BR2_PACKAGE_HAS_FEATURE+, like so:
 
----------------------------
+----
 config BR2_PACKAGE_HAS_FEATURE
     bool
 
 config BR2_PACKAGE_FOO
     bool "foo"
     depends on BR2_PACKAGE_HAS_FEATURE
----------------------------
+----
 
 ==== Notes on depending on a specific provider
 
@@ -124,7 +124,7 @@ provider.
 
 Let's take an example with two providers for a +FEATURE+:
 
----------------------------
+----
 config BR2_PACKAGE_HAS_FEATURE
     bool
 
@@ -135,7 +135,7 @@ config BR2_PACKAGE_FOO
 config BR2_PACKAGE_BAR
     bool "bar"
     select BR2_PACKAGE_HAS_FEATURE
----------------------------
+----
 
 And you are adding a package that needs +FEATURE+ as provided by +foo+,
 but not as provided by +bar+.
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index b8b1973..c667ba0 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -13,9 +13,9 @@ images_ menu.
 After a complete build, just run the following commands to setup the
 NFS-root directory:
 
--------------------
+----
 sudo tar -xavf /path/to/output_dir/rootfs.tar -C /path/to/nfs_root_dir
--------------------
+----
 
 Remember to add this path to +/etc/exports+.
 
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index 992471d..39ea4c9 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -26,10 +26,10 @@ misses, etc.) by running +make ccache-stats+.
 The make target +ccache-options+ and the +CCACHE_OPTIONS+ variable
 provide more generic access to the ccache. For example
 
------------------
+----
 # set cache limit size
 make CCACHE_OPTIONS="--max-size=5G" ccache-options
 
 # zero statistics counters
 make CCACHE_OPTIONS="--zero-stats" ccache-options
------------------
+----
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 89cd9fe..c368a60 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -13,9 +13,9 @@ If you intend to do an offline build and just want to download
 all sources that you previously selected in the configurator
 ('menuconfig', 'nconfig', 'xconfig' or 'gconfig'), then issue:
 
---------------------
+----
  $ make source
---------------------
+----
 
 You can now disconnect or copy the content of your +dl+
 directory to the build-host.
@@ -29,15 +29,15 @@ Buildroot also supports building out of tree with a syntax similar to
 the Linux kernel. To use it, add +O=<directory>+ to the make command
 line:
 
---------------------
+----
  $ make O=/tmp/build
---------------------
+----
 
 Or:
 
---------------------
+----
  $ cd /tmp/build; make O=$PWD -C path/to/buildroot
---------------------
+----
 
 All the output files will be located under +/tmp/build+. If the +O+
 path does not exist, Buildroot will create it.
@@ -56,9 +56,9 @@ For ease of use, Buildroot generates a Makefile wrapper in the output
 directory - so after the first run, you no longer need to pass +O=<...>+
 and +-C <...>+, simply run (in the output directory):
 
---------------------
+----
  $ make <target>
---------------------
+----
 
 [[env-vars]]
 
@@ -102,16 +102,16 @@ to +make+ or set in the environment:
 An example that uses config files located in the toplevel directory and
 in your $HOME:
 
---------------------
+----
  $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
---------------------
+----
 
 If you want to use a compiler other than the default +gcc+
 or +g+++ for building helper-binaries on your host, then do
 
---------------------
+----
  $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
---------------------
+----
 
 === Dealing efficiently with filesystem images
 
@@ -169,9 +169,9 @@ graphs.
 To generate a dependency graph of the full system you have compiled,
 simply run:
 
-------------------------
+----
 make graph-depends
-------------------------
+----
 
 You will find the generated graph in
 +output/graphs/graph-depends.pdf+.
@@ -180,9 +180,9 @@ If your system is quite large, the dependency graph may be too complex
 and difficult to read. It is therefore possible to generate the
 dependency graph just for a given package:
 
-------------------------
+----
 make <pkg>-graph-depends
-------------------------
+----
 
 You will find the generated graph in
 +output/graph/<pkg>-graph-depends.pdf+.
@@ -198,9 +198,9 @@ can switch to other output formats, such as PNG, PostScript or
 SVG. All formats supported by the +-T+ option of the +dot+ tool are
 supported.
 
---------------------------------
+----
 BR2_GRAPH_OUT=svg make graph-depends
---------------------------------
+----
 
 The +graph-depends+ behaviour can be controlled by setting options in the
 +BR2_GRAPH_DEPS_OPTS+ environment variable. The accepted options are:
@@ -215,9 +215,9 @@ The +graph-depends+ behaviour can be controlled by setting options in the
   root package (+R+), the target packages (+T+) and the host packages
   (+H+). Defaults to: +lightblue,grey,gainsboro+
 
---------------------------------
+----
 BR2_GRAPH_DEPS_OPTS='-d 3 --no-transitive --colours=red,green,blue' make graph-depends
---------------------------------
+----
 
 === Graphing the build duration
 
@@ -231,9 +231,9 @@ step of each package, and allows to generate graphs from this data.
 
 To generate the build time graph after a build, run:
 
-----------------
+----
 make graph-build
-----------------
+----
 
 This will generate a set of files in +output/graphs+ :
 
@@ -261,9 +261,9 @@ By default, the output format for the graph is PDF, but a different
 format can be selected using the +BR2_GRAPH_OUT+ environment variable. The
 only other format supported is PNG:
 
-----------------
+----
 BR2_GRAPH_OUT=png make graph-build
-----------------
+----
 
 include::eclipse-integration.txt[]
 
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index dd6fc8b..ccb0c2f 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -72,9 +72,9 @@ basically two things that can be done:
     can be removed.
     In the commit message of a patch fixing an autobuild failure, add a
     reference to the build result directory, as follows:
----------------------
+----
 Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
----------------------
+----
 
 === Reviewing and testing patches
 
@@ -153,10 +153,10 @@ When browsing patches in the patchwork management interface, an +mbox+
 link is provided at the top of the page. Copy this link address and
 run the following commands:
 
----------------------
+----
 $ git checkout -b <test-branch-name>
 $ wget -O - <mbox-url> | git am
----------------------
+----
 
 Another option for applying patches is to create a bundle. A bundle is
 a set of patches that you can group together using the patchwork
@@ -187,18 +187,18 @@ changes committed in your local git view, _rebase_ your development
 branch on top of the upstream tree before generating a patch set. To do
 so, run:
 
----------------------
+----
 $ git fetch --all --tags
 $ git rebase origin/master
----------------------
+----
 
 Now, you are ready to generate then submit your patch set.
 
 To generate it, run:
 
----------------------
+----
 $ git format-patch -M -n -s -o outgoing origin/master
----------------------
+----
 
 This will generate patch files in the +outgoing+ subdirectory,
 automatically adding the +Signed-off-by+ line.
@@ -208,9 +208,9 @@ before submitting them, using your favorite text editor.
 
 Lastly, send/submit your patch set to the Buildroot mailing list:
 
----------------------
+----
 $ git send-email --to buildroot at buildroot.org outgoing/*
----------------------
+----
 
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or google it.
@@ -261,7 +261,7 @@ be preserved forever in the +git+ history of the project.
 
 Hereafter the recommended layout:
 
----------------
+----
 Patch title: short explanation, max 72 chars
 
 A paragraph that explains the problem, and how it manifests itself. If
@@ -284,7 +284,7 @@ Changes v2 -> v3:
 Changes v1 -> v2:
   - alpha bravo  (suggested by John)
   - charly delta
----------------
+----
 
 Any patch revision should include the version number. The version number
 is simply composed of the letter +v+ followed by an +integer+ greater or
@@ -293,10 +293,10 @@ equal to two (i.e. "PATCH v2", "PATCH v3" ...).
 This can be easily handled with +git format-patch+ by using the option
 +--subject-prefix+:
 
----------------------
+----
 $ git format-patch --subject-prefix "PATCH v4" \
     -M -s -o outgoing origin/master
----------------------
+----
 
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index 0be3f77..086b789 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -15,7 +15,7 @@ Orthogonal to this directory structure, you can choose _where_ you place
 this structure itself: either inside the Buildroot tree, or outside of
 it using +BR2_EXTERNAL+. Both options are valid, the choice is up to you.
 
------
+----
 +-- board/
 |   +-- <company>/
 |       +-- <boardname>/
@@ -49,7 +49,7 @@ it using +BR2_EXTERNAL+. Both options are valid, the choice is up to you.
 |
 +-- Config.in (if using BR2_EXTERNAL)
 +-- external.mk (if using BR2_EXTERNAL)
-------
+----
 
 Details on the files shown above are given further in this chapter.
 
@@ -77,7 +77,7 @@ more than two layers.
 An example directory structure for where a user has two customization
 layers 'common' and 'fooboard' is:
 
------
+----
 +-- board/
     +-- <company>/
         +-- common/
@@ -96,14 +96,14 @@ layers 'common' and 'fooboard' is:
             |   +-- ...
             +-- patches/
                 +-- ...
------
+----
 
 For example, if the user has the +BR2_GLOBAL_PATCH_DIR+ configuration
 option set as:
 
------
+----
 BR2_GLOBAL_PATCH_DIR="board/<company>/common/patches board/<company>/fooboard/patches"
------
+----
 
 then first the patches from the 'common' layer would be applied,
 followed by the patches from the 'fooboard' layer.
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 1109843..7f00922 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
 
 [[outside-br-custom]]
 === Keeping customizations outside of Buildroot
@@ -31,29 +32,29 @@ to the Buildroot output directory.
 
 Some examples:
 
------
+----
  buildroot/ $ make BR2_EXTERNAL=/path/to/foobar menuconfig
------
+----
 
 From now on, external definitions from the +/path/to/foobar+
 directory will be used:
 
------
+----
  buildroot/ $ make
  buildroot/ $ make legal-info
------
+----
 
 We can switch to another external definitions directory at any time:
 
------
+----
  buildroot/ $ make BR2_EXTERNAL=/where/we/have/barfoo xconfig
------
+----
 
 Or disable the usage of external definitions:
 
------
+----
  buildroot/ $ make BR2_EXTERNAL= xconfig
------
+----
 
 +BR2_EXTERNAL+ allows three different things:
 
@@ -80,16 +81,16 @@ The main usage of this is to store package recipes. The recommended
    way to do this is to write a +$(BR2_EXTERNAL)/Config.in+ file that
    looks like:
 +
-------
+----
 source "$BR2_EXTERNAL/package/package1/Config.in"
 source "$BR2_EXTERNAL/package/package2/Config.in"
-------
+----
 +
 Then, have a +$(BR2_EXTERNAL)/external.mk+ file that looks like:
 +
-------
+----
 include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
-------
+----
 +
 And then in +$(BR2_EXTERNAL)/package/package1+ and
    +$(BR2_EXTERNAL)/package/package2+ create normal Buildroot
diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index e3ecb4c..871f51e 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -33,27 +33,27 @@ includes these additional +.mk+ files. Therefore, create a file
 +package/<company>/<company>.mk+ with following contents (assuming you
 have only one extra directory level below +package/<company>/+):
 
------
+----
 include $(sort $(wildcard package/<company>/*/*.mk))
------
+----
 
 If you are using +BR2_EXTERNAL+, create a file
 +$(BR2_EXTERNAL)/external.mk+ with following contents (again assuming only
 one extra level):
 
------
+----
 include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))
------
+----
 
 For the +Config.in+ files, create a file +package/<company>/Config.in+
 that includes the +Config.in+ files of all your packages. An exhaustive
 list has to be provided since wildcards are not supported in the source command of kconfig.
 For example:
 
------
+----
 source "package/<company>/package1/Config.in"
 source "package/<company>/package2/Config.in"
------
+----
 
 Include this new file +package/<company>/Config.in+ from
 +package/Config.in+, preferably in a company-specific menu to make
@@ -62,10 +62,10 @@ merges with future Buildroot versions easier.
 If you are using +BR2_EXTERNAL+, create a file
 +$(BR2_EXTERNAL)/Config.in+ with similar contents:
 
------
+----
 source "$BR2_EXTERNAL/package/package1/Config.in"
 source "$BR2_EXTERNAL/package/package2/Config.in"
------
+----
 
 You do not have to add an include for this +$(BR2_EXTERNAL)/Config.in+
 file as it is included automatically.
diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
index a052915..e129a64 100644
--- a/docs/manual/customize-patches.txt
+++ b/docs/manual/customize-patches.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
 
 [[customize-patches]]
 === Adding project-specific patches
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 6a1bd67..9ea4f75 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -16,9 +16,9 @@ shared download location. This can be achieved by pointing the
 set, then the value of +BR2_DL_DIR+ in the Buildroot configuration is
 overridden. The following line should be added to +<~/.bashrc>+.
 
------------------
+----
  $ export BR2_DL_DIR <shared download location>
------------------
+----
 
 The download location can also be set in the +.config+ file, with the
 +BR2_DL_DIR+ option. Unlike most options in the .config file, this value
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 693028c..18e900f 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -10,19 +10,19 @@ If the boot process seems to hang after the following messages
 (messages not necessarily exactly similar, depending on the list of
 packages selected):
 
-------------------------
+----
 Freeing init memory: 3972K
 Initializing random number generator... done.
 Starting network...
 Starting dropbear sshd: generating rsa key... generating dsa key... OK
-------------------------
+----
 
 then it means that your system is running, but didn't start a shell on
 the serial console. In order to have the system start a shell on your
-serial console, you have to go into the Buildroot configuration, in 
-+System configuration+, modify +Run a getty (login prompt) after boot+ 
-and set the appropriate port and baud rate in the +getty options+ 
-submenu. This will automatically tune the +/etc/inittab+ file of the 
+serial console, you have to go into the Buildroot configuration, in
++System configuration+, modify +Run a getty (login prompt) after boot+
+and set the appropriate port and baud rate in the +getty options+
+submenu. This will automatically tune the +/etc/inittab+ file of the
 generated system so that a shell starts on the correct serial port.
 
 [[faq-no-compiler-on-target]]
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index 7b17438..8f5fff9 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -24,9 +24,9 @@ To make this easier for you, Buildroot can collect for you some material you
 will probably need. To produce this material, after you have configured
 Buildroot with +make menuconfig+, +make xconfig+ or +make gconfig+, run:
 
---------------------
+----
 make legal-info
---------------------
+----
 
 Buildroot will collect legally-relevant material in your output directory,
 under the +legal-info/+ subdirectory.
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 027eddf..3c11aa3 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -8,15 +8,15 @@ This is a collection of tips that help you make the most of Buildroot.
 
 .Display all commands executed by make:
 
---------------------
+----
  $ make V=1 <target>
---------------------
+----
 
 .Display all available targets:
 
---------------------
+----
  $ make help
---------------------
+----
 
 Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
@@ -37,19 +37,19 @@ configuration options are changed.
 To delete all build products (including build directories, host, staging
 and target trees, the images and the toolchain):
 
---------------------
+----
  $ make clean
---------------------
+----
 
 .Generating the manual:
 
 The present manual sources are located in the 'docs/manual' directory.
 To generate the manual:
 
----------------------------------
+----
  $ make manual-clean
  $ make manual
----------------------------------
+----
 
 The manual outputs will be generated in 'output/docs/manual'.
 
@@ -61,9 +61,9 @@ The manual outputs will be generated in 'output/docs/manual'.
 
 To delete all build products as well as the configuration:
 
---------------------
+----
  $ make distclean
---------------------
+----
 
 .Notes
 If +ccache+ is enabled, running +make clean+ or +distclean+ does
diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index ecf3eb0..ffdb961 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -1,4 +1,5 @@
 // -*- mode:doc -*- ;
+// vim: set syntax=asciidoc:
 
 [[makeuser-syntax]]
 == Makeusers syntax documentation
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 25d3f44..8b2446e 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -12,9 +12,9 @@ For packages relying on the Buildroot infrastructure, there are
 numerous special make targets that can be called independently like
 this:
 
-------------
+----
 make <package>-<target>
-------------
+----
 
 The package build targets are (in the order they are executed):
 
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 745f58d..8e4fa1e 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -101,7 +101,7 @@ Otherwise, concatenate the header with the output of the
 
 At the end, the patch should look like:
 
----------------
+----
 configure.ac: add C++ support test
 
 Signed-off-by: John Doe <john.doe@noname.org>
@@ -121,7 +121,7 @@ AC_PROG_MAKE_SET
 +                AC_LANG_POP([C++])])
 +
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
----------------
+----
 
 === Integrating patches found on the Web
 
@@ -132,15 +132,15 @@ Depending on whether the patch has been obtained from the project
 repository itself, or from somewhere on the web, add one of the
 following tags:
 
----------------
+----
 Backported from: <some commit id>
----------------
+----
 
 or
 
----------------
+----
 Fetch from: <some url>
----------------
+----
 
 It is also sensible to add a few words about any changes to the patch
 that may have been necessary.
diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 975fffc..dd04cb8 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -15,27 +15,27 @@ http://www.busybox.net/[BusyBox].
 
 From the buildroot directory, run
 
---------------------
+----
  $ make menuconfig
---------------------
+----
 
 for the original curses-based configurator, or
 
---------------------
+----
  $ make nconfig
---------------------
+----
 
 for the new curses-based configurator, or
 
---------------------
+----
  $ make xconfig
---------------------
+----
 
 for the Qt-based configurator, or
 
---------------------
+----
  $ make gconfig
---------------------
+----
 
 for the GTK-based configurator.
 
@@ -56,9 +56,9 @@ read by the top-level Makefile.
 
 To start the build process, simply run:
 
---------------------
+----
  $ make
---------------------
+----
 
 You *should never* use +make -jN+ with Buildroot: top-level parallel
 make is currently not supported. Instead, use the +BR2_JLEVEL+ option
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index 6faa67a..a104dbb 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -76,9 +76,9 @@ necessary, and you will save more and more time.
 
 For reference, a full rebuild is achieved by running:
 
----------------
-$ make clean all
----------------
+----
+ $ make clean all
+----
 
 [[rebuild-pkg]]
 === Understanding how to rebuild packages
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index b5063ca..88e2975 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -24,9 +24,9 @@ To achieve this:
 Now, to start debugging a program called +foo+, you should run on the
 target:
 
-----------------------------
+----
 gdbserver :2345 foo
-----------------------------
+----
 
 This will cause +gdbserver+ to listen on TCP port 2345 for a connection
 from the cross gdb.
@@ -34,9 +34,9 @@ from the cross gdb.
 Then, on the host, you should start the cross gdb using the following
 command line:
 
-----------------------------
+----
 <buildroot>/output/host/usr/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
-----------------------------
+----
 
 Of course, +foo+ must be available in the current directory, built
 with debugging symbols. Typically you start this command from the
@@ -48,6 +48,6 @@ cross gdb where to find the libraries of the target.
 
 Finally, to connect to the target from the cross gdb:
 
-----------------------------
+----
 (gdb) target remote <target ip address>:2345
-----------------------------
+----
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index a075416..f89c912 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -35,17 +35,17 @@ tree, but a different location can be specified through the
 
 In this _override_ file, Buildroot expects to find lines of the form:
 
-------------------
+----
 <pkg1>_OVERRIDE_SRCDIR = /path/to/pkg1/sources
 <pkg2>_OVERRIDE_SRCDIR = /path/to/pkg2/sources
-------------------
+----
 
 For example:
 
-------------------
+----
 LINUX_OVERRIDE_SRCDIR = /home/bob/linux/
 BUSYBOX_OVERRIDE_SRCDIR = /home/bob/busybox/
-------------------
+----
 
 When Buildroot finds that for a given package, an
 +<pkg>_OVERRIDE_SRCDIR+ has been defined, it will no longer attempt to
@@ -67,17 +67,17 @@ process of just this package.
 In the example of the +linux+ package above, the developer can then
 make a source code change in +/home/bob/linux+ and then run:
 
------------------------
-make linux-rebuild all
------------------------
+----
+ $ make linux-rebuild all
+----
 
 and in a matter of seconds gets the updated Linux kernel image in
 +output/images+. Similarly, a change can be made to the BusyBox source
 code in +/home/bob/busybox+, and after:
 
------------------------
-make busybox-rebuild all
------------------------
+----
+ $ make busybox-rebuild all
+----
 
 the root filesystem image in +output/images+ contains the updated
 BusyBox.
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index e6401a4..96ebc1e 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -23,7 +23,7 @@ Buildroot.
 
 An entry has the following pattern:
 
----------------------
+----
 config BR2_PACKAGE_LIBFOO
 	bool "libfoo"
 	depends on BR2_PACKAGE_LIBBAZ
@@ -32,7 +32,7 @@ config BR2_PACKAGE_LIBFOO
 	  This is a comment that explains what libfoo is.
 
 	  http://foosoftware.org/libfoo/
----------------------
+----
 
 * The +bool+, +depends on+, +select+ and +help+ lines are indented
   with one tab.
@@ -53,31 +53,31 @@ http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[].
 preferably in lowercase, enclosed between separators made of 80 hashes. A
 blank line is mandatory after the header:
 +
----------------------
+----
 ################################################################################
 #
 # libfoo
 #
 ################################################################################
----------------------
+----
 +
 * Assignment: use +=+ preceded and followed by one space:
 +
----------------------
+----
 LIBFOO_VERSION = 1.0
 LIBFOO_CONF_OPTS += --without-python-support
----------------------
+----
 +
 Do not align the +=+ signs.
 
 * Indentation: use tab only:
 +
----------------------
+----
 define LIBFOO_REMOVE_DOC
 	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
 		$(TARGET_DIR)/usr/share/man/man3/libfoo*
 endef
----------------------
+----
 +
 Note that commands inside a +define+ block should always start with a tab,
 so _make_ recognizes them as commands.
@@ -88,21 +88,21 @@ so _make_ recognizes them as commands.
 +
 YES:
 +
----------------------
+----
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBFOO_CONF_OPTS += --with-python-support
 LIBFOO_DEPENDENCIES += python
 else
 LIBFOO_CONF_OPTS += --without-python-support
 endif
----------------------
+----
 +
 NO:
 +
----------------------
+----
 LIBFOO_CONF_OPTS += --with$(if $(BR2_PACKAGE_PYTHON),,out)-python-support
 LIBFOO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,)
----------------------
+----
 
 ** Keep configure options and dependencies close together.
 
@@ -111,18 +111,18 @@ LIBFOO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,)
 +
 YES:
 +
----------------------
+----
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
 define LIBFOO_REMOVE_DATA
 	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
 endef
 LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
----------------------
+----
 +
 NO:
 +
----------------------
+----
 define LIBFOO_REMOVE_DATA
 	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
 endef
@@ -130,7 +130,7 @@ endef
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
 LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
----------------------
+----
 
 === The documentation
 
-- 
2.1.1
