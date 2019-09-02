From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 12:31:31 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/oniguruma: bump
 to version 6.9.2
Message-ID: <20190902102838.EEA9388EE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11f32dee2943954eb80788135bdd0e4bc97223b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d2bb13904dda447ea0e74433316e86fa3530a4da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oniguruma/0001-fix-cross-compilation.patch | 61 ----------------------
 package/oniguruma/oniguruma.hash                   |  2 +-
 package/oniguruma/oniguruma.mk                     |  2 +-
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/oniguruma/0001-fix-cross-compilation.patch b/package/oniguruma/0001-fix-cross-compilation.patch
deleted file mode 100644
index 9186cfd625..0000000000
--- a/package/oniguruma/0001-fix-cross-compilation.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 39619b1c04640375b2fc2c29991137b741a47976 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 20 Mar 2019 20:33:11 +0100
-Subject: [PATCH] fix cross-compilation
-
-Don't add -I$(includedir) to CPPFLAGS or cross-compilation will fail on:
-
-libtool: compile: /home/fabrice/buildroot/output/host/bin/m68k-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
--D_FILE_OFFSET_BITS=64 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-dwarf2-cfi-asm -Wl,-elf2flt -c regparse.c -o regparse.o
-m68k-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kkos/oniguruma/pull/137]
----
- sample/Makefile.am | 2 +-
- src/Makefile.am    | 2 +-
- test/Makefile.am   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/sample/Makefile.am b/sample/Makefile.am
-index fd809fa..320afcf 100644
---- a/sample/Makefile.am
-+++ b/sample/Makefile.am
-@@ -4,7 +4,7 @@ lib_onig = ../src/libonig.la
- LDADD  = $(lib_onig)
- 
- AM_LDFLAGS  = -L$(prefix)/lib
--AM_CPPFLAGS = -I$(top_srcdir)/src -I$(includedir)
-+AM_CPPFLAGS = -I$(top_srcdir)/src
- 
- TESTS = encode listcap names posix simple sql syntax user_property callout echo count bug_fix
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index ba7807a..1330620 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -2,7 +2,7 @@
- libname = libonig.la
- 
- AM_CFLAGS = -Wall
--AM_CPPFLAGS = -I$(top_srcdir) -I$(includedir)
-+AM_CPPFLAGS = -I$(top_srcdir)
- 
- include_HEADERS = oniguruma.h oniggnu.h
- 
-diff --git a/test/Makefile.am b/test/Makefile.am
-index c623aa3..67b5d1e 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -3,7 +3,7 @@ lib_onig = ../src/libonig.la
- 
- AM_LDFLAGS  = -L$(prefix)/lib
- AM_CFLAGS = -Wall -Wno-invalid-source-encoding
--AM_CPPFLAGS = -I$(top_srcdir)/src -I$(includedir)
-+AM_CPPFLAGS = -I$(top_srcdir)/src
- 
- if ENABLE_POSIX_API
- TESTS = test_utf8 testc testp testcu
--- 
-2.14.1
-
diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 4d3392c972..0adbba167c 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  733a91e257c20cb17b81596db48fd0fbd2e0074fe922ae4c2bc4fefcec110aae  oniguruma-6.9.1.tar.gz
+sha256  3b568a9050839e7828b2f2d5bc9cd3650979b6b54a080f54c515320dddda06b0  oniguruma-6.9.2.tar.gz
 sha256  84e55812150474adf4170d4656744dfcc5f260ff7602e447a70bf13c56203e4b  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 1f992c2b94..9e8858b618 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.1
+ONIGURUMA_VERSION = 6.9.2
 ONIGURUMA_SITE = $(call github,kkos,oniguruma,v$(ONIGURUMA_VERSION))
 ONIGURUMA_LICENSE = BSD-2-Clause
 ONIGURUMA_LICENSE_FILES = COPYING
