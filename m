Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87894C19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 14:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3045260B5A;
	Fri,  7 Mar 2025 14:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56lRG-o1mS0v; Fri,  7 Mar 2025 14:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4D58607C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4D58607C8;
	Fri,  7 Mar 2025 14:04:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC1021C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F3C7409DB
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Nj25LBxFN61 for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 14:04:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B63384091F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B63384091F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B63384091F
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 14:04:10 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BF8182C80CD0;
 Fri, 07 Mar 2025 15:04:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  7 Mar 2025 15:04:05 +0100
Message-ID: <20250307140407.4091221-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1741356247; bh=25iLTl11YMroLdE9p3C5++T2BO/ZTEGC8TPup6NHXg8=;
 h=From:To:Cc:Subject:Date;
 b=WpyVrsmnV99eDhz7k9LiUPon53usR9xG14p7dD237HFTqRgkvySrzSMhN2a80XiGi
 9X15QQu6zccuCAIYxLjHT+8Qd9G/ejspDhKfCFqRFaEu10fUFMkcZo3FwVuVpyrz5I
 SrZoqYIK5sYXkOKZKiiKu70pXXFWutwHYNDBsQm11Ktcup0AHS/+YkfvUDUAKrx+m9
 OqWPX8LnL4VHAOwG0khNU7BT/4+oIdUfyElylITKfGX2VJxGYe0VdlA2NNpO/UEP1z
 YTpGe1vQP++pQrL2zsikp1rZkz+7CnfxGwsJ4kUZwo8pWOEQUPPYnf0AyCD0w3QPmI
 9XwXzOhpOYI6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=WpyVrsmn
Subject: [Buildroot] [PATCH] package/can-utils: bump to v2025.01
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patches are now included in upstream release.
Package switched from autotools to cmake based build.

Release Notes: https://github.com/linux-can/can-utils/releases/tag/v2025.01

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...ograms-using-fork-on-MMU-less-system.patch | 257 ------------------
 ...y-poption-prefix-to-use-when-logging.patch |  79 ------
 package/can-utils/can-utils.hash              |   2 +-
 package/can-utils/can-utils.mk                |   5 +-
 4 files changed, 3 insertions(+), 340 deletions(-)
 delete mode 100644 package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
 delete mode 100644 package/can-utils/0002-j1939acd-remove-legacy-poption-prefix-to-use-when-logging.patch

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
