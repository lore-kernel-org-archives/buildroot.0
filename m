Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D7CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D9E60FD7;
	Sat, 23 Jul 2022 17:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D9E60FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1umPWdx1le6; Sat, 23 Jul 2022 17:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C67D960B71;
	Sat, 23 Jul 2022 17:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C67D960B71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F20C1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 388A360C00
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 388A360C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id st-WnR8G2C9V for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:13:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3152660A46
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3152660A46
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E16FF817FB; Sat, 23 Jul 2022 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 19:13:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1fabe7461fc0e1483deb150d2e35c88715e2b24
X-Git-Newrev: a1e4354d5d0ced7fe0de4c09b78ba5467cc4bcf6
X-Patchwork-Hint: ignore
Message-Id: <20220723170021.E16FF817FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/powerpc-utils: bump to v1.3.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a1e4354d5d0ced7fe0de4c09b78ba5467cc4bcf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v1.3.9 the package requires numa.h from numctl, so add this as a
dependency.

librtas now builds fine with musl/uclibc too, so remove the glibc
restriction for enabling that support.

Drop 0001-add-includes-defines-for-musl-libc-support.patch which is
upstream as of 1.3.10.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-includes-defines-for-musl-libc-support.patch | 101 ---------------------
 package/powerpc-utils/Config.in                    |   9 +-
 package/powerpc-utils/powerpc-utils.hash           |   2 +-
 package/powerpc-utils/powerpc-utils.mk             |   4 +-
 4 files changed, 8 insertions(+), 108 deletions(-)

diff --git a/package/powerpc-utils/0001-add-includes-defines-for-musl-libc-support.patch b/package/powerpc-utils/0001-add-includes-defines-for-musl-libc-support.patch
deleted file mode 100644
index b0206c6e6c..0000000000
--- a/package/powerpc-utils/0001-add-includes-defines-for-musl-libc-support.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 2efa853ef04c331444c9014af108d17544d5ed1b Mon Sep 17 00:00:00 2001
-From: Fabian Groffen <grobian@gentoo.org>
-Date: Fri, 21 May 2021 11:25:21 +0200
-Subject: [PATCH] add includes/defines for musl libc support
-
-- add some missing includes to get proper definitions for beXXtoh and
-  PATH_MAX
-- guard backtrace() from execinfo.h usage for it is glibc only
-
-Signed-off-by: Fabian Groffen <grobian@gentoo.org>
-Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
-Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
-Upstream: c73206b62d6d827cbc37a10f0195b5d2cf3f2fbb
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/common/cpu_info_helpers.c | 1 +
- src/drmgr/common.c            | 6 ++++++
- src/drmgr/dr.h                | 1 +
- src/rtas_dbg.c                | 1 +
- 4 files changed, 9 insertions(+)
-
-diff --git a/src/common/cpu_info_helpers.c b/src/common/cpu_info_helpers.c
-index 3d08ff7..925f220 100644
---- a/src/common/cpu_info_helpers.c
-+++ b/src/common/cpu_info_helpers.c
-@@ -29,6 +29,7 @@
- #include <errno.h>
- #include <stdbool.h>
- #include <dirent.h>
-+#include <limits.h>
- #include <sys/stat.h>
- #include <sys/types.h>
- #include "cpu_info_helpers.h"
-diff --git a/src/drmgr/common.c b/src/drmgr/common.c
-index 5e8135b..32cf805 100644
---- a/src/drmgr/common.c
-+++ b/src/drmgr/common.c
-@@ -28,7 +28,9 @@
- #include <signal.h>
- #include <errno.h>
- #include <dirent.h>
-+#ifdef __GLIBC__
- #include <execinfo.h>
-+#endif
- #include <ctype.h>
- #include <sys/wait.h>
- #include <endian.h>
-@@ -853,6 +855,7 @@ sighandler(int signo)
- 	say(ERROR, "Received signal %d, attempting to cleanup and exit\n",
- 	    signo);
- 
-+#ifdef __GLIBC__
- 	if (log_fd) {
- 		void *callstack[128];
- 		int sz;
-@@ -860,6 +863,7 @@ sighandler(int signo)
- 		sz = backtrace(callstack, 128);
- 		backtrace_symbols_fd(callstack, sz, log_fd);
- 	}
-+#endif
- 
- 	dr_fini();
- 	exit(-1);
-@@ -925,8 +929,10 @@ sig_setup(void)
- 	if (sigaction(SIGBUS, &sigact, NULL))
- 		return -1;
- 
-+#ifdef __GLIBC__
- 	/* dummy call to backtrace to get symbol loaded */
- 	backtrace(callstack, 128);
-+#endif
- 	return 0;
- }
- 
-diff --git a/src/drmgr/dr.h b/src/drmgr/dr.h
-index f171bfe..b32d49a 100644
---- a/src/drmgr/dr.h
-+++ b/src/drmgr/dr.h
-@@ -26,6 +26,7 @@
- #include <nl_types.h>
- #include <unistd.h>
- #include <stdarg.h>
-+#include <limits.h>
- #include "rtas_calls.h"
- #include "drpci.h"
- 
-diff --git a/src/rtas_dbg.c b/src/rtas_dbg.c
-index 526e78b..ebc7474 100644
---- a/src/rtas_dbg.c
-+++ b/src/rtas_dbg.c
-@@ -32,6 +32,7 @@
- #include <getopt.h>
- #include <dirent.h>
- #include <string.h>
-+#include <endian.h>
- #include <sys/syscall.h>
- #include <unistd.h>
- #include <linux/unistd.h>
--- 
-2.37.1
-
diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index d04d81c08a..1ac247fe7c 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -1,12 +1,17 @@
 comment "powerpc-utils tools needs a toolchain w/ dynamic library"
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 
 config BR2_PACKAGE_POWERPC_UTILS
 	bool "powerpc-utils"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	depends on BR2_USE_MMU # numactl
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_NUMACTL
 	help
 	  System utilities for PowerPC machines.
 
@@ -16,7 +21,6 @@ if BR2_PACKAGE_POWERPC_UTILS
 
 config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	bool "RTAS support"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBRTAS
 	help
 	  Enable support for functions that require RTAS.
@@ -28,7 +32,4 @@ config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	  lsslot, activate_firmware, rtas_ibm_get_vpd, serv_config,
 	  rtas_event_decode, sys_ident.
 
-comment "RTAS support needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
 endif
diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 8d0b10425b..b3c77fb223 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e3a21419863c08adde49f0795eff0fbfe4597ce82593fa5fe1f1177913fb7b9  powerpc-utils-1.3.8.tar.gz
+sha256  d64d9016a3e63a1e44c6e0833742cf964ae6bb1c6a9c7f0c7c5748aa335dc3db  powerpc-utils-1.3.10.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index b12194ae8e..19fa84946c 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.3.8
+POWERPC_UTILS_VERSION = 1.3.10
 POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
-POWERPC_UTILS_DEPENDENCIES = zlib
+POWERPC_UTILS_DEPENDENCIES = zlib numactl
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
 POWERPC_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
