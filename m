From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:58:49 +0100
Subject: [Buildroot] [git commit] manual: adding-package-directory.txt:
	update, cleanup and typo fixes
Message-ID: <20121115230538.DFE7E99E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4783b41a90bf4791b5d0b6354e969a51c9c5425
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |   34 +++++++++++++++++++---------
 1 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6030e08..35d28b6 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -49,6 +49,7 @@ supposed to contain anything but the 'bare' name of the package.
 source "package/libfoo/Config.in"
 --------------------------
 
+[[depends-on-vs-select]]
 The +Config.in+ file of your package must also ensure that
 dependencies are enabled. Typically, Buildroot uses the following
 rules:
@@ -59,15 +60,26 @@ rules:
   dependencies are selected. For example, the _libgtk2_ package uses
   +select BR2_PACKAGE_LIBGLIB2+ to make sure this library is also
   enabled.
+  The +select+ keyword express the dependency with a backward
+  semantic.
 
 * Use a +depends on+ type of dependency when the user really needs to
   be aware of the dependency. Typically, Buildroot uses this type of
-  dependency for dependencies on toolchain options (large file
-  support, RPC support, IPV6 support), or for dependencies on "big"
-  things, such as the X.org system. In some cases, especially
-  dependency on toolchain options, it is recommended to add a
-  +comment+ displayed when the option is not enabled, so that the user
-  knows why the package is not available.
+  dependency for dependencies on toolchain options (target
+  architecture, MMU support, C library, C++ support, large file
+  support, thread support, RPC support, IPV6 support, WCHAR support),
+  or for dependencies on "big" things, such as the X.org system. In
+  some cases, especially dependency on toolchain options, it is
+  recommended to add a +comment+ displayed when the option is not
+  enabled, so that the user knows why the package is not available.
+  The +depends on+ keyword express the dependency with a forward
+  semantic.
+
+.Note
+The current problem with the _kconfig_ language is that these two
+dependency semantics are not internally linked. Therefore, it may be
+possible to select a package, whom one of its dependencies/requirement
+is not met.
 
 An example illustrates both the usage of +select+ and +depends on+.
 
@@ -147,6 +159,9 @@ is also enabled, but not necessarily built before your package. To do
 so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
+Further formating details: see xref:writing-rules-config-in[the
+writing rules].
+
 The +.mk+ file
 ^^^^^^^^^^^^^^
 
@@ -182,8 +197,5 @@ different way, using different infrastructures:
    CMake. We cover them through a xref:cmake-package-tutorial[tutorial]
    and xref:cmake-package-reference[reference].
 
-* *Hand-written Makefiles:* These are currently obsolete, and no new
-  manual Makefiles should be added. However, since there are still
-  many of them in the tree, we keep them documented in a
-  xref:handwritten-tutorial[tutorial].
-
+Further formating details: see xref:writing-rules-mk[the writing
+rules].
