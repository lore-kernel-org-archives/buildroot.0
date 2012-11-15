From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:38 +0100
Subject: [Buildroot] [git commit] manual: rework the whole documentation stub
Message-ID: <20121115230537.3E68899E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e84b8b73cc32b307642917c70bc3186c1ffd69b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new skeleton of the manual as it has been thought:
1.  About Buildroot:
     Presentation of Buildroot
2.  Starting up:
     Everything to quickly and easily start working with Buildroot
3.  Working with Buildroot
     Basics to make your work fitting your needs
4.  Troubleshooting
5.  Going further in Buildroot's innards
     Explaination of how buildroot is organised, how it works, etc
6.  Developer Guidelines
7.  Getting involved
8.  Contibuting to Buildroot
9.  Legal notice
10. Appendix

It is easy to distinguish two parts in this plan:
- Sections 1 to 4 mainly address people starting with Buildroot
- Sections 5 to 10 are more focused on how to develop Buildroot itself

Most of the existing sections have just been moved in the hierarchy,
few were split and dispatch in, what i think was the relevant section,
and numerous others have been created.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-autotools.txt  |    8 +++++---
 docs/manual/adding-packages-cmake.txt      |    8 +++++---
 docs/manual/adding-packages-conclusion.txt |    4 +++-
 docs/manual/adding-packages-directory.txt  |    8 +++++---
 docs/manual/adding-packages-generic.txt    |    8 +++++---
 docs/manual/adding-packages-gettext.txt    |    4 +++-
 docs/manual/adding-packages.txt            |    6 ++++--
 docs/manual/advanced.txt                   |   12 ++++++++++++
 docs/manual/appendix.txt                   |    2 ++
 docs/manual/board-support.txt              |    5 ++++-
 docs/manual/ccache-support.txt             |    5 ++++-
 docs/manual/common-usage.txt               |    6 ++++++
 docs/manual/customize-busybox-config.txt   |    8 +++++---
 docs/manual/customize-kernel-config.txt    |    5 ++++-
 docs/manual/customize-rootfs.txt           |    5 ++++-
 docs/manual/customize-toolchain.txt        |   12 +++++++-----
 docs/manual/customize-uclibc-config.txt    |    6 ++++--
 docs/manual/customize.txt                  |    4 +++-
 docs/manual/developer-guide.txt            |    8 ++++++++
 docs/manual/download-location.txt          |    4 +++-
 docs/manual/external-toolchain.txt         |    6 ++++--
 docs/manual/getting.txt                    |    5 ++++-
 docs/manual/going-further.txt              |    6 ++++++
 docs/manual/how-buildroot-works.txt        |    4 +++-
 docs/manual/makedev-syntax.txt             |    2 ++
 docs/manual/manual.txt                     |   22 ++++++----------------
 docs/manual/rebuilding-packages.txt        |    4 +++-
 docs/manual/starting-up.txt                |    9 +++++++++
 docs/manual/using-buildroot-toolchain.txt  |    4 +++-
 docs/manual/using.txt                      |    7 +++----
 docs/manual/working-with.txt               |   21 +++++++++++++++++++++
 31 files changed, 160 insertions(+), 58 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index b85b7af..1184b69 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -1,10 +1,12 @@
+// -*- mode:doc; -*-
+
 Infrastructure for autotools-based packages
--------------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 [[autotools-package-tutorial]]
 
 +autotools-package+ tutorial
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 First, let's see how to write a +.mk+ file for an autotools-based
 package, with an example :
@@ -64,7 +66,7 @@ package to be built.
 [[autotools-package-reference]]
 
 +autotools-package+ reference
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The main macro of the autotools package infrastructure is
 +autotools-package+. It is similar to the +generic-package+ macro. The ability to
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index da4984a..81ac0a7 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -1,10 +1,12 @@
+// -*- mode:doc; -*-
+
 Infrastructure for CMake-based packages
----------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 [[cmake-package-tutorial]]
 
 +cmake-package+ tutorial
-~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^
 
 First, let's see how to write a +.mk+ file for a CMake-based package,
 with an example :
@@ -63,7 +65,7 @@ package to be built.
 [[cmake-package-reference]]
 
 +cmake-package+ reference
-~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The main macro of the CMake package infrastructure is
 +cmake-package+. It is similar to the +generic-package+ macro. The ability to
diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
index 3475827..ac20875 100644
--- a/docs/manual/adding-packages-conclusion.txt
+++ b/docs/manual/adding-packages-conclusion.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Conclusion
-----------
+~~~~~~~~~~
 
 As you can see, adding a software package to Buildroot is simply a
 matter of writing a Makefile using an  existing example and modifying it
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 4a96415..6030e08 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Package directory
------------------
+~~~~~~~~~~~~~~~~~
 
 First of all, create a directory under the +package+ directory for
 your software, for example +libfoo+.
@@ -10,7 +12,7 @@ one of these categories, then create your package directory in these.
 
 
 +Config.in+ file
-~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^
 
 Then, create a file named +Config.in+. This file will contain the
 option descriptions related to our +libfoo+ software that will be used
@@ -146,7 +148,7 @@ so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
 The +.mk+ file
-~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^
 
 Finally, here's the hardest part. Create a file named +libfoo.mk+. It
 describes how the package should be downloaded, configured, built,
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7ecdb91..e3f16c2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Infrastructure for packages with specific build systems
--------------------------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 By 'packages with specific build systems' we mean all the packages
 whose build system is not one of the standard ones, such as
@@ -9,7 +11,7 @@ system is based on hand-written Makefiles or shell scripts.
 [[generic-package-tutorial]]
 
 +generic-package+ Tutorial
-~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 ------------------------------
 01: #############################################################
@@ -90,7 +92,7 @@ Makefile code necessary to make your package working.
 [[generic-package-reference]]
 
 +generic-package+ Reference
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 There are two variants of the generic target. The +generic-package+ macro is
 used for packages to be cross-compiled for the target.  The
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index e0df1a4..89461a7 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Gettext integration and interaction with packages
--------------------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Many packages that support internationalization use the gettext
 library. Dependencies for this library are fairly complicated and
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index f672ec6..8221c85 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -1,6 +1,8 @@
-Adding new packages to Buildroot
-================================
+// -*- mode:doc -*- ;
+
 [[adding-packages]]
+Adding new packages to Buildroot
+--------------------------------
 
 This section covers how new packages (userspace libraries or
 applications) can be integrated into Buildroot. It also shows how
diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
new file mode 100644
index 0000000..cd53182
--- /dev/null
+++ b/docs/manual/advanced.txt
@@ -0,0 +1,12 @@
+// -*- mode:doc; -*-
+
+Advanced usage
+--------------
+
+include::using-buildroot-toolchain.txt[]
+
+include::external-toolchain.txt[]
+
+include::ccache-support.txt[]
+
+include::download-location.txt[]
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index f41c82c..a6642b5 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -1,3 +1,5 @@
+// -*- mode:doc; -*-
+
 Appendix
 ========
 
diff --git a/docs/manual/board-support.txt b/docs/manual/board-support.txt
index d1d9d63..e20e721 100644
--- a/docs/manual/board-support.txt
+++ b/docs/manual/board-support.txt
@@ -1,5 +1,8 @@
+// -*- mode:doc -*- ;
+
+[[board-support]]
 Creating your own board support
-===============================
+-------------------------------
 
 Creating your own board support in Buildroot allows users of a
 particular hardware platform to easily build a system that is known to
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index ab8cbad..95cd662 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -1,5 +1,8 @@
+// -*- mode:doc -*- ;
+
+[[ccache]]
 Using +ccache+ in Buildroot
-===========================
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 http://ccache.samba.org[ccache] is a compiler cache. It stores the
 object files resulting from each compilation process, and is able to
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
new file mode 100644
index 0000000..b343606
--- /dev/null
+++ b/docs/manual/common-usage.txt
@@ -0,0 +1,6 @@
+// -*- mode:doc; -*-
+
+Daily use
+---------
+
+include::rebuilding-packages.txt[]
diff --git a/docs/manual/customize-busybox-config.txt b/docs/manual/customize-busybox-config.txt
index 60e6a55..fe9cdda 100644
--- a/docs/manual/customize-busybox-config.txt
+++ b/docs/manual/customize-busybox-config.txt
@@ -1,6 +1,8 @@
-Customizing the Busybox configuration
--------------------------------------
+// -*- mode:doc -*- ;
+
 [[busybox-custom]]
+Customizing the Busybox configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 http://www.busybox.net/[Busybox] is very configurable, and you may
 want to customize it. You can follow these simple steps to do so. This
@@ -20,5 +22,5 @@ Otherwise, you can simply change the
 options you want to change, without using the configuration tool.
 
 If you want to use an existing config file for busybox, then see
-section xref:env-vars[].
+xref:env-vars[].
 
diff --git a/docs/manual/customize-kernel-config.txt b/docs/manual/customize-kernel-config.txt
index 6bafe46..1072270 100644
--- a/docs/manual/customize-kernel-config.txt
+++ b/docs/manual/customize-kernel-config.txt
@@ -1,5 +1,8 @@
+// -*- mode:doc -*- ;
+
+[[kernel-custom]]
 Customizing the Linux kernel configuration
-------------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The Linux kernel configuration can be customized just like
 xref:busybox-custom[BusyBox] and xref:uclibc-custom[uClibc] using
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 44007c7..7ac5195 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -1,5 +1,8 @@
+// -*- mode:doc -*- ;
+
+[[rootfs-custom]]
 Customizing the generated target filesystem
--------------------------------------------
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 There are a few ways to customize the resulting target filesystem:
 
diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 08b60a2..91657cf 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -1,12 +1,14 @@
-Customizing the toolchain
--------------------------
+// -*- mode:doc -*- ;
+
 [[toolchain-custom]]
+Customizing the toolchain
+~~~~~~~~~~~~~~~~~~~~~~~~~
 
 There are three distinct types of toolchain backend supported in Buildroot,
 available under the menu +Toolchain+, invoking +make menuconfig+.
 
 Using the external toolchain backend
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 There is no way of tuning an external toolchain since Buildroot does not
 generate it.
@@ -15,7 +17,7 @@ It also requires to set the Buildroot settings according to the toolchain ones
 (see xref:external-toolchain[]).
 
 Using the internal Buildroot toolchain backend
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The internal Buildroot toolchain backend *only* allows to generate
 *http://www.uclibc.org/[uClibc]-based toolchains*.
@@ -32,7 +34,7 @@ This is directly available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.
 
 Using the Crosstool-NG backend
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The http://crosstool-ng.org[crosstool-NG] toolchain backend enables a rather
 limited set of settings under the Buildroot +Toolchain+ menu (ie. when invoking
diff --git a/docs/manual/customize-uclibc-config.txt b/docs/manual/customize-uclibc-config.txt
index e2e6799..88121ea 100644
--- a/docs/manual/customize-uclibc-config.txt
+++ b/docs/manual/customize-uclibc-config.txt
@@ -1,6 +1,8 @@
-Customizing the uClibc configuration
-------------------------------------
+// -*- mode:doc -*- ;
+
 [[uclibc-custom]]
+Customizing the uClibc configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Just like xref:busybox-custom[BusyBox], http://www.uclibc.org/[uClibc]
 offers a lot of configuration options. They allow you to select
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index e8235de..1e6f4e8 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Customization
-=============
+-------------
 
 include::customize-rootfs.txt[]
 
diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
new file mode 100644
index 0000000..37f703d
--- /dev/null
+++ b/docs/manual/developer-guide.txt
@@ -0,0 +1,8 @@
+// -*- mode:doc; -*-
+
+Developer Guidelines
+====================
+
+include::adding-packages.txt[]
+
+include::board-support.txt[]
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index cb6147f..8c66a76 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Location of downloaded packages
-===============================
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 It might be useful to know that the various tarballs that are
 downloaded by the Makefiles are all stored in the +DL_DIR+ which by
diff --git a/docs/manual/external-toolchain.txt b/docs/manual/external-toolchain.txt
index 62eb0a3..b337376 100644
--- a/docs/manual/external-toolchain.txt
+++ b/docs/manual/external-toolchain.txt
@@ -1,6 +1,8 @@
-Using an external toolchain
-===========================
+// -*- mode:doc -*- ;
+
 [[external-toolchain]]
+Using an external toolchain
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Using an already existing toolchain is useful for different
 reasons:
diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index 42ca009..a51caa0 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -1,5 +1,8 @@
+// -*- mode:doc -*- ;
+
+[[getting-buildroot]]
 Getting Buildroot
-=================
+-----------------
 
 Buildroot releases are made approximately every 3 months. Direct Git
 access and daily snapshots are also available, if you want more
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
new file mode 100644
index 0000000..6f3cd6e
--- /dev/null
+++ b/docs/manual/going-further.txt
@@ -0,0 +1,6 @@
+Going further in Buildroot's innards
+====================================
+
+include::how-buildroot-works.txt[]
+
+include::advanced.txt[]
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 481e5a4..879cff3 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 How Buildroot works
-===================
+-------------------
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
index 4728c4b..4703b2f 100644
--- a/docs/manual/makedev-syntax.txt
+++ b/docs/manual/makedev-syntax.txt
@@ -1,3 +1,5 @@
+// -*- mode:doc -*- ;
+
 [[makedev-syntax]]
 Makedev syntax documentation
 ----------------------------
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index de4b594..00bd037 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -1,3 +1,5 @@
+// -*- mode:doc; -*-
+
 The Buildroot user manual
 =========================
 :toc:
@@ -11,25 +13,13 @@ image::logo.png[]
 
 include::introduction.txt[]
 
-include::getting.txt[]
-
-include::using.txt[]
-
-include::customize.txt[]
-
-include::rebuilding-packages.txt[]
-
-include::how-buildroot-works.txt[]
-
-include::using-buildroot-toolchain.txt[]
-
-include::external-toolchain.txt[]
+include::starting-up.txt[]
 
-include::ccache-support.txt[]
+include::working-with.txt[]
 
-include::download-location.txt[]
+include::going-further.txt[]
 
-include::adding-packages.txt[]
+include::developer-guide.txt[]
 
 include::faq.txt[]
 
diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
index fb6d696..824b35c 100644
--- a/docs/manual/rebuilding-packages.txt
+++ b/docs/manual/rebuilding-packages.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc -*- ;
+
 Understanding how to rebuild packages
-=====================================
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 One of the most common questions asked by Buildroot users is how to
 rebuild a given package or how to remove a package without rebuilding
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
new file mode 100644
index 0000000..8ba16c9
--- /dev/null
+++ b/docs/manual/starting-up.txt
@@ -0,0 +1,9 @@
+// -*- mode:doc; -*-
+
+Starting up
+===========
+
+include::getting.txt[]
+
+include::using.txt[]
+
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 712e9a8..750fa99 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -1,5 +1,7 @@
+// -*- mode:doc; -*-
+
 Using the generated toolchain outside Buildroot
-===============================================
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 You may want to compile, for your target, your own programs or other
 software that are not packaged in Buildroot. In order to do this you
diff --git a/docs/manual/using.txt b/docs/manual/using.txt
index fcbd24b..5741473 100644
--- a/docs/manual/using.txt
+++ b/docs/manual/using.txt
@@ -1,8 +1,7 @@
-Using Buildroot
-===============
+// -*- mode:doc; -*-
 
-Configuration and general usage
--------------------------------
+Using Buildroot
+---------------
 
 Buildroot has a nice configuration tool similar to the one you can
 find in the http://www.kernel.org/[Linux kernel] or in
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
new file mode 100644
index 0000000..3c57504
--- /dev/null
+++ b/docs/manual/working-with.txt
@@ -0,0 +1,21 @@
+// -*- mode:doc; -*-
+
+Working with Buildroot
+======================
+
+This section explains how you can customize Buildroot to fit your
+needs.
+
+include::customize.txt[]
+
+include::common-usage.txt[]
+
+Hacking Buildroot
+-----------------
+
+If Buildroot does not yet fit all your requirements, you may be
+interested in hacking it to add:
+
+* new packages: refer to the xref:adding-packages[Developer guide]
+
+* new board support: refer to the xref:board-support[Developer guide]
