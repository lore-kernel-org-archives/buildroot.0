Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128F7C282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB1F883BD9;
	Tue, 18 Mar 2025 15:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PrXemOdK1siT; Tue, 18 Mar 2025 15:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F49B82AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F49B82AED;
	Tue, 18 Mar 2025 15:05:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E32D94
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38E9481BD9
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7khJHaKWtUy for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 555F481E55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 555F481E55
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51CB78713E; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 22:25:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1cbe13462ea4305e339ff7545221e32979ce99f
X-Git-Newrev: 291a3263e0993d3cba9100cf01cb3bc0c04deee7
X-Patchwork-Hint: ignore
Message-Id: <20250318150244.51CB78713E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/can-utils: bump to v2025.01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=291a3263e0993d3cba9100cf01cb3bc0c04deee7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches that are now included in upstream release.
Package switched from autotools to cmake based build.
Backport two build fixes that are already merged upstream.

* 0001-Include-time.h-for-timespec-struct-definition.patch fixes a musl
  build issue
* 0002-CMakeLists.txt-add-an-option-to-control-shared-libra.patch fixes
  static only builds

Release Notes: https://github.com/linux-can/can-utils/releases/tag/v2025.01

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...le-programs-using-fork-on-MMU-less-system.patch | 257 ---------------------
 ...ude-time.h-for-timespec-struct-definition.patch |  28 +++
 ...txt-add-an-option-to-control-shared-libra.patch |  37 +++
 ...legacy-poption-prefix-to-use-when-logging.patch |  79 -------
 package/can-utils/can-utils.hash                   |   2 +-
 package/can-utils/can-utils.mk                     |   5 +-
 6 files changed, 68 insertions(+), 340 deletions(-)

diff --git a/package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch b/package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
deleted file mode 100644
index 57f93b18e0..0000000000
--- a/package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 5ed3b4ded6cf3e4de6fc8c8739b84231b0285b0e Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Fri, 5 May 2023 08:57:45 +0200
-Subject: [PATCH] Don't compile programs using fork() on MMU-less systems
-
-Systems that lack a MMU cannot use fork() to create the child process.
-The patch does not compile the affected programs on MMU-less systems.
-
-Co-developed-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/linux-can/can-utils/commit/5ed3b4ded6cf3e4de6fc8c8739b84231b0285b0e
----
- CMakeLists.txt | 15 ++++++++++++---
- GNUmakefile.am | 10 +++++++---
- Makefile       | 16 +++++++++++++---
- check_cc.sh    | 16 ++++++++++++++++
- configure.ac   |  2 ++
- fork_test.c    | 27 +++++++++++++++++++++++++++
- 6 files changed, 77 insertions(+), 9 deletions(-)
- create mode 100755 check_cc.sh
- create mode 100644 fork_test.c
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 09ccd805de66..aee8ff7fca02 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,6 +2,7 @@ cmake_minimum_required(VERSION 3.3)
- 
- project(can-utils LANGUAGES C)
- 
-+include (CheckFunctionExists)
- include (CheckSymbolExists)
- include (GNUInstallDirs)
- 
-@@ -25,12 +26,13 @@ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DSCM_TXTIME=SO_TXTIME")
- include_directories (.)
- include_directories (./include)
- 
-+check_function_exists(fork HAVE_FORK)
-+
- set(PROGRAMS_CANLIB
-     asc2log
-     canbusload
-     candump
-     cangen
--    canlogserver
-     canplayer
-     cansend
-     cansequence
-@@ -39,6 +41,10 @@ set(PROGRAMS_CANLIB
-     slcanpty
- )
- 
-+if(HAVE_FORK)
-+    list(APPEND PROGRAMS_CANLIB canlogserver)
-+endif()
-+
- set(PROGRAMS_J1939
-     j1939acd
-     j1939cat
-@@ -49,7 +55,6 @@ set(PROGRAMS_J1939
- 
- set(PROGRAMS
-     ${PROGRAMS_CANLIB}
--    bcmserver
-     canfdtest
-     cangw
-     cansniffer
-@@ -57,13 +62,17 @@ set(PROGRAMS
-     isotpperf
-     isotprecv
-     isotpsend
--    isotpserver
-     isotpsniffer
-     isotptun
-     slcan_attach
-     slcand
- )
- 
-+if(HAVE_FORK)
-+    list(APPEND PROGRAMS bcmserver)
-+    list(APPEND PROGRAMS isotpserver)
-+endif()
-+
- add_executable(can-calc-bit-timing
-     calc-bit-timing/can-calc-bit-timing.c
- )
-diff --git a/GNUmakefile.am b/GNUmakefile.am
-index 5a7ad75f682e..e818754db3a4 100644
---- a/GNUmakefile.am
-+++ b/GNUmakefile.am
-@@ -75,14 +75,12 @@ EXTRA_DIST += \
- 
- bin_PROGRAMS = \
- 	asc2log \
--	bcmserver \
- 	can-calc-bit-timing \
- 	canbusload \
- 	candump \
- 	canfdtest \
- 	cangen \
- 	cangw \
--	canlogserver \
- 	canplayer \
- 	cansend \
- 	cansequence \
-@@ -91,7 +89,6 @@ bin_PROGRAMS = \
- 	isotpperf \
- 	isotprecv \
- 	isotpsend \
--	isotpserver \
- 	isotpsniffer \
- 	isotptun \
- 	j1939acd \
-@@ -106,6 +103,13 @@ bin_PROGRAMS = \
- 	slcanpty \
- 	testj1939
- 
-+if HAVE_FORK
-+bin_PROGRAMS += \
-+	bcmserver \
-+	canlogserver \
-+	isotpserver
-+endif
-+
- j1939acd_LDADD = libj1939.la
- j1939cat_LDADD = libj1939.la
- j1939spy_LDADD = libj1939.la
-diff --git a/Makefile b/Makefile
-index 29eef997b290..a26ff3d75e67 100644
---- a/Makefile
-+++ b/Makefile
-@@ -45,6 +45,8 @@ MAKEFLAGS := -k
- 
- CFLAGS := -O2 -Wall -Wno-parentheses
- 
-+HAVE_FORK := $(shell ./check_cc.sh "$(CC)" fork_test.c)
-+
- CPPFLAGS += \
- 	-I. \
- 	-Iinclude \
-@@ -66,10 +68,14 @@ PROGRAMS_ISOTP := \
- 	isotpperf \
- 	isotprecv \
- 	isotpsend \
--	isotpserver \
- 	isotpsniffer \
- 	isotptun
- 
-+ifeq ($(HAVE_FORK),1)
-+PROGRAMS_ISOTP += \
-+	isotpserver
-+endif
-+
- PROGRAMS_J1939 := \
- 	j1939acd \
- 	j1939cat \
-@@ -87,14 +93,12 @@ PROGRAMS := \
- 	$(PROGRAMS_J1939) \
- 	$(PROGRAMS_SLCAN) \
- 	asc2log \
--	bcmserver \
- 	can-calc-bit-timing \
- 	canbusload \
- 	candump \
- 	canfdtest \
- 	cangen \
- 	cansequence \
--	canlogserver \
- 	canplayer \
- 	cansend \
- 	cansniffer \
-@@ -103,6 +107,12 @@ PROGRAMS := \
- 	mcp251xfd-dump \
- 	slcanpty
- 
-+ifeq ($(HAVE_FORK),1)
-+PROGRAMS += \
-+	canlogserver \
-+	bcmserver
-+endif
-+
- all: $(PROGRAMS)
- 
- clean:
-diff --git a/check_cc.sh b/check_cc.sh
-new file mode 100755
-index 000000000000..d85ad129da9d
---- /dev/null
-+++ b/check_cc.sh
-@@ -0,0 +1,16 @@
-+#!/bin/sh
-+# SPDX-License-Identifier: GPL-2.0-only
-+# check_cc.sh - Helper to test userspace compilation support
-+# Copyright (c) 2015 Andrew Lutomirski
-+
-+CC="$1"
-+TESTPROG="$2"
-+shift 2
-+
-+if [ -n "$CC" ] && $CC -o /dev/null "$TESTPROG" -O0 "$@"; then
-+    echo 1
-+else
-+    echo 0
-+fi
-+
-+exit 0
-diff --git a/configure.ac b/configure.ac
-index 5493c9c7ccdf..9bf62a5c6409 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,6 +76,8 @@ AC_CHECK_FUNCS([ \
- 	strtoul \
- ])
- 
-+AM_CONDITIONAL(HAVE_FORK, test "$ac_cv_func_fork_works" = "yes")
-+
- # glibc versions before 2.17 needs to link with -lrt for clock_nanosleep
- AC_SEARCH_LIBS([clock_nanosleep], [rt])
- 
-diff --git a/fork_test.c b/fork_test.c
-new file mode 100644
-index 000000000000..036692392483
---- /dev/null
-+++ b/fork_test.c
-@@ -0,0 +1,27 @@
-+/* SPDX-License-Identifier: GPL-2.0-only */
-+/*
-+ * Copyright (C) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the version 2 of the GNU General Public License
-+ * as published by the Free Software Foundation
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
-+ */
-+
-+#include <stdio.h>
-+#include <sys/types.h>
-+#include <unistd.h>
-+
-+int main(int argc, char **argv)
-+{
-+	fork();
-+
-+	return 0;
-+}
--- 
-2.32.0
-
diff --git a/package/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch b/package/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
new file mode 100644
index 0000000000..ca7f658553
--- /dev/null
+++ b/package/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
@@ -0,0 +1,28 @@
+From 2b8c7c5f4b71726806de0d718c4c56eeba2c7332 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Feb 2025 22:14:47 -0800
+Subject: [PATCH] Include time.h for timespec struct definition
+
+Fixes
+git/isobusfs/../libj1939.h:33:18: error: field has incomplete type 'struct timespec'
+   33 |         struct timespec next_send_time;
+      |                         ^
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://github.com/linux-can/can-utils/commit/2b8c7c5f4b71726806de0d718c4c56eeba2c7332
+---
+ libj1939.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libj1939.h b/libj1939.h
+index 44393a2a..7c19f43e 100644
+--- a/libj1939.h
++++ b/libj1939.h
+@@ -17,6 +17,7 @@
+ #include <linux/can/j1939.h>
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <sys/socket.h>
+ 
+ #ifndef J1939_LIB_H
diff --git a/package/can-utils/0002-CMakeLists.txt-add-an-option-to-control-shared-libra.patch b/package/can-utils/0002-CMakeLists.txt-add-an-option-to-control-shared-libra.patch
new file mode 100644
index 0000000000..390ffa50e6
--- /dev/null
+++ b/package/can-utils/0002-CMakeLists.txt-add-an-option-to-control-shared-libra.patch
@@ -0,0 +1,37 @@
+From 59716ea66203b4d5f70dd0e41fe6f9661f8ad686 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 12 Mar 2025 10:27:48 +0100
+Subject: [PATCH] CMakeLists.txt: add an option to control shared library
+ creation
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Upstream: Backported from https://github.com/linux-can/can-utils/commit/a904183b4e65a6d982db3d12ad9d0a9a883edc1d
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 01f90f9..318a236 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -14,6 +14,7 @@ endif()
+ 
+ # Add an option to enable treating warnings as errors
+ option(ENABLE_WERROR "Treat all compiler warnings as errors" OFF)
++option(BUILD_SHARED_LIBS "Build shared libraries" ON)
+ 
+ if(ENABLE_WERROR)
+   add_compile_options(-Werror)
+@@ -114,7 +115,7 @@ if(NOT ANDROID)
+     PRIVATE can
+   )
+ 
+-  add_library(isobusfs SHARED
++  add_library(isobusfs
+     isobusfs/isobusfs_cmn.c
+     isobusfs/isobusfs_cmn_dh.c
+   )
+-- 
+2.43.0
+
diff --git a/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch b/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch
deleted file mode 100644
index 36c96d59e4..0000000000
--- a/package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From d337863d9189501dbbb15467cc3dcba85946a2a3 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 22 Jul 2024 16:12:04 +0200
-Subject: [PATCH] j1939acd: remove legacy '-p' option (prefix to use when
- logging)
-
-- remove legacy '-p' option (prefix to use when logging), fixes uclibc
-  compile
-
-Fixes:
-
-  j1939acd.c: In function 'main':
-  j1939acd.c:489:38: error: passing argument 1 of 'asprintf' from incompatible pointer type [-Wincompatible-pointer-types]
-    489 |                         if (asprintf(&program_invocation_name, "%s.%s",
-        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
-        |                                      |
-        |                                      const char **
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Upstream: https://github.com/linux-can/can-utils/commit/d337863d9189501dbbb15467cc3dcba85946a2a3
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- j1939acd.c | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/j1939acd.c b/j1939acd.c
-index 44bb826c..ae4e58ac 100644
---- a/j1939acd.c
-+++ b/j1939acd.c
-@@ -38,7 +38,6 @@ static const char help_msg[] =
- 	"			e.g. 80,50-100,200-210 (defaults to 0-253)" "\n"
- 	"  -c, --cache=FILE	Cache file to save/restore the source address" "\n"
- 	"  -a, --address=ADDRESS	Start with Source Address ADDRESS" "\n"
--	"  -p, --prefix=STR	Prefix to use when logging" "\n"
- 	"\n"
- 	"NAME is the 64bit nodename" "\n"
- 	"\n"
-@@ -54,14 +53,13 @@ static struct option long_opts[] = {
- 	{ "range", required_argument, NULL, 'r', },
- 	{ "cache", required_argument, NULL, 'c', },
- 	{ "address", required_argument, NULL, 'a', },
--	{ "prefix", required_argument, NULL, 'p', },
- 	{ },
- };
- #else
- #define getopt_long(argc, argv, optstring, longopts, longindex) \
- 	getopt((argc), (argv), (optstring))
- #endif
--static const char optstring[] = "vr:c:a:p:?";
-+static const char optstring[] = "vr:c:a:?";
- 
- /* byte swap functions */
- static inline int host_is_little_endian(void)
-@@ -466,9 +464,6 @@ int main(int argc, char *argv[])
- 	struct sockaddr_can saddr;
- 	uint64_t cmd_name;
- 
--#ifdef _GNU_SOURCE
--	program_invocation_name = program_invocation_short_name;
--#endif
- 	/* argument parsing */
- 	while ((opt = getopt_long(argc, argv, optstring, long_opts, NULL)) != -1)
- 		switch (opt) {
-@@ -484,15 +479,6 @@ int main(int argc, char *argv[])
- 		case 'a':
- 			s.current_sa = strtoul(optarg, 0, 0);
- 			break;
--		case 'p':
--#ifdef _GNU_SOURCE
--			if (asprintf(&program_invocation_name, "%s.%s",
--				     program_invocation_short_name, optarg) < 0)
--				err(1, "asprintf(program invocation name)");
--#else
--			err(0, "compile with -D_GNU_SOURCE to use -p");
--#endif
--			break;
- 		default:
- 			fputs(help_msg, stderr);
- 			exit(1);
diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index e539e05b45..1112e47448 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2790dfb57fe3ec22b6fd512838c6480c39f7c9ae193e59f1ae01221216505a7e  can-utils-2023.03.tar.gz
+sha256  88b30feace372c4a61e6adb2534791c0cfba6123ebcca7f59bbb76580d4a6915  can-utils-2025.01.tar.gz
 sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
 sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 462e123c6d..fc5170ed9d 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 2023.03
+CAN_UTILS_VERSION = 2025.01
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0
 CAN_UTILS_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
-CAN_UTILS_AUTORECONF = YES
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
