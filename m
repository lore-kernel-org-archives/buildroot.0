From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2013 17:02:43 +0100
Subject: [Buildroot] [git commit] libpng: disable tools
Message-ID: <20131028162845.68EAF9BC1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=405af8c93f29a1f73135c5bf114be6a0b26b498c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They can fail on some odd toolchain configurations because of
buildsystem shortcomings and aren't expected to be used in normal
scenarios.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng-01-disable-tools.patch |   30 ++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libpng/libpng-01-disable-tools.patch b/package/libpng/libpng-01-disable-tools.patch
new file mode 100644
index 0000000..cd7040c
--- /dev/null
+++ b/package/libpng/libpng-01-disable-tools.patch
@@ -0,0 +1,30 @@
+Disable the new pngfix and png-fix-itxt tools: they take up space, fail to
+build on some oddball toolchain configurations and aren't expected/needed
+in a non-interactive embedded system.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libpng-1.6.6.orig/Makefile.am libpng-1.6.6/Makefile.am
+--- libpng-1.6.6.orig/Makefile.am	2013-10-27 19:13:39.183376955 -0300
++++ libpng-1.6.6/Makefile.am	2013-10-27 19:13:50.388744191 -0300
+@@ -10,7 +10,7 @@
+ check_PROGRAMS= pngtest pngunknown pngstest pngvalid
+ 
+ # Utilities - installed
+-bin_PROGRAMS= pngfix png-fix-itxt
++bin_PROGRAMS=
+ 
+ pngtest_SOURCES = pngtest.c
+ pngtest_LDADD = libpng at PNGLIB_MAJOR@@PNGLIB_MINOR at .la
+diff -Nura libpng-1.6.6.orig/Makefile.in libpng-1.6.6/Makefile.in
+--- libpng-1.6.6.orig/Makefile.in	2013-10-27 19:13:39.180376856 -0300
++++ libpng-1.6.6/Makefile.in	2013-10-27 19:14:55.332872643 -0300
+@@ -59,7 +59,7 @@
+ host_triplet = @host@
+ check_PROGRAMS = pngtest$(EXEEXT) pngunknown$(EXEEXT) \
+ 	pngstest$(EXEEXT) pngvalid$(EXEEXT)
+-bin_PROGRAMS = pngfix$(EXEEXT) png-fix-itxt$(EXEEXT)
++bin_PROGRAMS =
+ @PNG_ARM_NEON_TRUE at am__append_1 = arm/arm_init.c\
+ @PNG_ARM_NEON_TRUE@	arm/filter_neon.S
+ 
