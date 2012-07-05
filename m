From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  6 Jul 2012 00:06:46 +0200
Subject: [Buildroot] [PATCH v3 5/5] Clean up naming of old GENTARGETS
	infrastructure
In-Reply-To: <20120703093348.6c078602@skate>
References: <20120703093348.6c078602@skate>
Message-ID: <1341526006-31673-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the renaming of XXXTARGETS to xxx-package, the names of the
pkg-xxx.mk files is inconsistent, as well as some internal names in
the documentation.  These inconsistencies are cleaned up here.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 ...kages-autotargets.txt => adding-packages-autotools.txt} |    4 ++--
 ...packages-cmaketargets.txt => adding-packages-cmake.txt} |    4 ++--
 docs/manual/adding-packages-directory.txt                  |   12 ++++++------
 ...packages-gentargets.txt => adding-packages-generic.txt} |    4 ++--
 docs/manual/adding-packages.txt                            |    6 +++---
 package/Makefile.in                                        |    6 +++---
 package/{pkg-autotargets.mk => pkg-autotools.mk}           |    0
 package/{pkg-cmaketargets.mk => pkg-cmake.mk}              |    0
 package/{pkg-gentargets.mk => pkg-generic.mk}              |    0
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/docs/manual/adding-packages-autotargets.txt b/docs/manual/adding-packages-autotools.txt
similarity index 99%
rename from docs/manual/adding-packages-autotargets.txt
rename to docs/manual/adding-packages-autotools.txt
index f67cd06..a9653ce 100644
--- a/docs/manual/adding-packages-autotargets.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -1,7 +1,7 @@
 Infrastructure for autotools-based packages
 -------------------------------------------
 
-[[autotargets-tutorial]]
+[[autotools-package-tutorial]]
 
 +autotools-package+ tutorial
 ~~~~~~~~~~~~~~~~~~~~~~
@@ -61,7 +61,7 @@ Finally, on line line 14, we invoke the +autotools-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
-[[autotargets-reference]]
+[[autotools-package-reference]]
 
 +autotools-package+ reference
 ~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-cmaketargets.txt b/docs/manual/adding-packages-cmake.txt
similarity index 99%
rename from docs/manual/adding-packages-cmaketargets.txt
rename to docs/manual/adding-packages-cmake.txt
index 69acb00..d1489bd 100644
--- a/docs/manual/adding-packages-cmaketargets.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -1,7 +1,7 @@
 Infrastructure for CMake-based packages
 ---------------------------------------
 
-[[cmaketargets-tutorial]]
+[[cmake-package-tutorial]]
 
 +cmake-package+ tutorial
 ~~~~~~~~~~~~~~~~~~~~~~~
@@ -60,7 +60,7 @@ Finally, on line line 14, we invoke the +cmake-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
-[[cmaketargets-reference]]
+[[cmake-package-reference]]
 
 +cmake-package+ reference
 ~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 2670f2f..4a96415 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -163,22 +163,22 @@ different way, using different infrastructures:
   infrastructure must be used for all packages that do not use the
   autotools as their build system. In the future, other specialized
   infrastructures might be written for other build systems.  We cover
-  them through in a xref:gentargets-tutorial[tutorial] and a
-  xref:gentargets-reference[reference].
+  them through in a xref:generic-package-tutorial[tutorial] and a
+  xref:generic-package-reference[reference].
 
 * *Makefiles for autotools-based software* (autoconf, automake, etc.):
   We provide a dedicated infrastructure for such packages, since
   autotools is a very common build system. This infrastructure 'must'
   be used for new packages that rely on the autotools as their build
-  system. We cover them through a xref:autotargets-tutorial[tutorial]
-  and xref:autotargets-reference[reference].
+  system. We cover them through a xref:autotools-package-tutorial[tutorial]
+  and xref:autotools-package-reference[reference].
 
 * *Makefiles for cmake-based software*: We provide a dedicated
    infrastructure for such packages, as CMake is a more and more
    commonly used build system and has a standardized behaviour. This
    infrastructure 'must' be used for new packages that rely on
-   CMake. We cover them through a xref:cmaketargets-tutorial[tutorial]
-   and xref:cmaketargets-reference[reference].
+   CMake. We cover them through a xref:cmake-package-tutorial[tutorial]
+   and xref:cmake-package-reference[reference].
 
 * *Hand-written Makefiles:* These are currently obsolete, and no new
   manual Makefiles should be added. However, since there are still
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-generic.txt
similarity index 99%
rename from docs/manual/adding-packages-gentargets.txt
rename to docs/manual/adding-packages-generic.txt
index dea3707..4348bb9 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -6,7 +6,7 @@ whose build system is not one of the standard ones, such as
 'autotools' or 'CMake'. This typically includes packages whose build
 system is based on hand-written Makefiles or shell scripts.
 
-[[gentargets-tutorial]]
+[[generic-package-tutorial]]
 
 +generic-package+ Tutorial
 ~~~~~~~~~~~~~~~~~~~~~
@@ -87,7 +87,7 @@ Finally, on line 35, we call the +generic-package+ which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
-[[gentargets-reference]]
+[[generic-package-reference]]
 
 +generic-package+ Reference
 ~~~~~~~~~~~~~~~~~~~~~~
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 0217e9f..acbde0c 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -8,11 +8,11 @@ tuning their configuration.
 
 include::adding-packages-directory.txt[]
 
-include::adding-packages-gentargets.txt[]
+include::adding-packages-generic.txt[]
 
-include::adding-packages-autotargets.txt[]
+include::adding-packages-autotools.txt[]
 
-include::adding-packages-cmaketargets.txt[]
+include::adding-packages-cmake.txt[]
 
 include::adding-packages-handwritten.txt[]
 
diff --git a/package/Makefile.in b/package/Makefile.in
index c5ad00a..7996418 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -312,6 +312,6 @@ endif
 
 include package/pkg-utils.mk
 include package/pkg-download.mk
-include package/pkg-autotargets.mk
-include package/pkg-cmaketargets.mk
-include package/pkg-gentargets.mk
+include package/pkg-autotools.mk
+include package/pkg-cmake.mk
+include package/pkg-generic.mk
diff --git a/package/pkg-autotargets.mk b/package/pkg-autotools.mk
similarity index 100%
rename from package/pkg-autotargets.mk
rename to package/pkg-autotools.mk
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmake.mk
similarity index 100%
rename from package/pkg-cmaketargets.mk
rename to package/pkg-cmake.mk
diff --git a/package/pkg-gentargets.mk b/package/pkg-generic.mk
similarity index 100%
rename from package/pkg-gentargets.mk
rename to package/pkg-generic.mk
