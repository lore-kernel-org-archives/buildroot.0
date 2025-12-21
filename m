Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828E7E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 14:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16FC2814C8;
	Sun, 21 Dec 2025 14:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsH2w8K2gLCr; Sun, 21 Dec 2025 14:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D9D81493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766328816;
	bh=Y10ccKZi9KLh25sCnyNgI2Z3UbfNfgD4tnvnjqrPiLM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EacK6s1BqyiY2RuoBHMHAdk5KzHTENxrUvuPU+45bnYAFAL6zFSGpZ1f2K8q/Kzsu
	 Shh/ylGvVla6D8P0e+5xgXSv3c7MD8Q2yxlUi0eTYVjr31wMLhQExrAwo/DprVDvzF
	 u7gWXsu6Xy6tiq7S45T+5bRQ/ItaKQ6X1wJKPLGUTNRIui3vvygHS9eFBJlrz2qFFk
	 VsG6dNGXMo/iT86/2gKW1x71JX0A89cf/OinVvS39k9nEdPFmX5mYL97FtvIK4maKT
	 F0pbA4g/OUqGsncLT1nZzCAYHFAEcfJD60RoxfEFLLXvscO1QyKLU41gjEp+QLhcsr
	 o94oL4/kFwK3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D9D81493;
	Sun, 21 Dec 2025 14:53:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFB531A6
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 14:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1A66407CB
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 14:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixlvACAOiQHc for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 14:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2B11407BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B11407BD
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 14:53:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FD778750E; Sun, 21 Dec 2025 14:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 14:56:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ab46339aa1efb7c226fe01113d19c4682435f5c
X-Git-Newrev: a8446df007e319b71c7b96fa50c323461fd0c61a
X-Patchwork-Hint: ignore
Message-Id: <20251221145333.8FD778750E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20250930
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8446df007e319b71c7b96fa50c323461fd0c61a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/linux-test-project/ltp/releases/tag/20250930

Remove patches backported from this release.

Remove LTP_TESTSUITE_AUTORECONF (patch, which required it was backported
from this release).

Require kernel headers for uclibc >= 4.5 for uclibc due F_GETOWN_EX from <fcntl.h>.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...onfigure-Fix-build-on-kernel-6.14-headers.patch |  51 ---
 .../0002-statmount02-Remove-linux-btrfs.h.patch    |  52 ----
 .../0003-tlibio-Detect-aio.h-support.patch         | 342 ---------------------
 package/ltp-testsuite/Config.in                    |   1 +
 package/ltp-testsuite/ltp-testsuite.hash           |   4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |   5 +-
 6 files changed, 4 insertions(+), 451 deletions(-)

diff --git a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
deleted file mode 100644
index 6638ee2ccd..0000000000
--- a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3ef4bac1dd253628dfdb8a823b51ae0d24fa0616 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Mon, 2 Jun 2025 19:08:30 +0200
-Subject: [PATCH] configure: Fix build on kernel 6.14 headers
-
-We decided in a2300dc0f5 to remove <linux/mount.h> in lapi/mount.h and
-use only <sys/mount.h>. But later in 5c5411ea8e we add autotools checks
-in configure.ac which use <linux/mount.h> for detection, but kept using
-lapi/mount.h. This worked until now, because no toolchain used new
-header enough. Recent Alpine update broke that.
-
-This fixes CI build on Alpine v3.22 (the default Alpine version in
-GitHub action), which uses 6.14.2 kernel headers, which already define
-struct mnt_id_req (configure.ac detect it but lapi/mount.h was not using
-a correct header):
-
-    listmount.h: In function 'listmount':
-    listmount.h:18:16: error: variable 'req' has initializer but incomplete type
-       18 |         struct mnt_id_req req = {
-	  |                ^~~~~~~~~~
-
-Link: https://lore.kernel.org/ltp/20250602170831.404641-1-pvorel@suse.cz/
-Fixes: 5c5411ea8e ("Add listmount/statmount fallback declarations")
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://github.com/linux-test-project/ltp/commit/3ef4bac1dd253628dfdb8a823b51ae0d24fa0616
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9ff098b273..69c5be7362 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -254,8 +254,10 @@ AC_CHECK_TYPES([struct mount_attr],,,[
- 
- AC_CHECK_TYPES([struct cachestat_range],,,[#include <sys/mman.h>])
- AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
--AC_CHECK_TYPES([struct mnt_id_req],,,[#include <linux/mount.h>])
--AC_CHECK_TYPES([struct statmount],,,[#include <linux/mount.h>])
-+
-+# Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
-+AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
-+AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
- 
- # Tools knobs
- 
--- 
-2.50.0
-
diff --git a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
deleted file mode 100644
index c82c422000..0000000000
--- a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Wed, 4 Jun 2025 16:13:18 +0200
-Subject: [PATCH] statmount02: Remove <linux/btrfs.h>
-
-statmount02.c does not need <linux/btrfs.h> because it's skipped.
-
-Avoid using it fixes the problem due the old problem of indirect include
-<linux/mount.h> by <linux/fs.h> on Alpine v3.22 (the default Alpine
-version in GitHub action), which uses 6.14.2 kernel headers:
-
-    In file included from /usr/include/linux/fs.h:19,
-                     from /usr/include/linux/btrfs.h:29,
-                     from statmount02.c:23:
-    /usr/include/linux/mount.h:155:8: error: redefinition of 'struct statmount'
-      155 | struct statmount {
-          |        ^~~~~~~~~
-    In file included from statmount.h:12,
-                     from statmount02.c:20:
-    ../../../../include/lapi/mount.h:58:8: note: originally defined here
-       58 | struct statmount {
-          |        ^~~~~~~~~
-    /usr/include/linux/mount.h:193:8: error: redefinition of 'struct mnt_id_req'
-      193 | struct mnt_id_req {
-          |        ^~~~~~~~~~
-    ../../../../include/lapi/mount.h:49:8: note: originally defined here
-       49 | struct mnt_id_req {
-          |        ^~~~~~~~~~
-
-Fixes: 5f9942dffe ("Add statmount02 test")
-Suggested-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://github.com/linux-test-project/ltp/commit/fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435
----
- testcases/kernel/syscalls/statmount/statmount02.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/statmount/statmount02.c b/testcases/kernel/syscalls/statmount/statmount02.c
-index 504c558a11..07f877e040 100644
---- a/testcases/kernel/syscalls/statmount/statmount02.c
-+++ b/testcases/kernel/syscalls/statmount/statmount02.c
-@@ -20,7 +20,6 @@
- #include "statmount.h"
- #include "lapi/stat.h"
- #include "lapi/sched.h"
--#include <linux/btrfs.h>
- 
- #define MNTPOINT "mntpoint"
- 
--- 
-2.50.0
-
diff --git a/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch b/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
deleted file mode 100644
index 442e2fd96b..0000000000
--- a/package/ltp-testsuite/0003-tlibio-Detect-aio.h-support.patch
+++ /dev/null
@@ -1,342 +0,0 @@
-From 91e6272febf95e19a8300695dfc2089569adf9d8 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Sun, 27 Jul 2025 22:54:54 +0200
-Subject: [PATCH] tlibio: Detect <aio.h> support
-
-Some libc (i.e. uclibc-ng or uclibc) does not implement <aio.h>.
-Requiring it for the core LTP library breaks build of these libc.
-Restore unintentional removal in fed3e3ee63.
-
-Changes:
-* Fix for all libc without <aio.h> support: previous check
-  'defined(__linux__) && !defined(__UCLIBC__)' was uclibc-ng specific
-  (and check for __linux__ was not needed anyway). All of these used
-  prior fed3e3ee63 is replaced just by HAVE_AIO_H.
-* Comment out also if block first and last 'line if (...) {' and '}' if
-  the block would be empty anyway.
-* Further join preprocessor checks as code prior fed3e3ee63 contained
-  code compiled for old unixes (e.g. sgi), which fed3e3ee63 removed.
-* Remove nested preprocessors checks in code which is already checked
-  (i.e. lio_wait4asyncio()).
-* Fix wrong #endif comments.
-* Add further cleanup of old unixes.
-
-I also wonder if #else part of struct lio_info_type Lio_info1[]
-should be really defined for code without <aio.h>.
-
-Fixes: fed3e3ee63 ("lib/tlibio: Get rid of support for old UNIXes")
-Fixes: https://autobuild.buildroot.org/results/f3e/f3e03b9a1a69988d6497f36c9d64a37a66e9ad20/
-Fixes: https://autobuild.buildroot.org/results/856/856365f467efc449faee1951250e63d8d4442bbc/
-Fixes: https://autobuild.buildroot.org/results/2ac/2ac08cecd6a505f1bac1a673efc280b3a8dcb23a/
-Fixes: https://autobuild.buildroot.org/results/59b/59b3ad33667b7e87c81e49dd434d5f494e189e0d/
-Fixes: https://autobuild.buildroot.org/results/b1a/b1a36f9971c97300670d8d772ace11e5fedceaaa/
-Reviewed-by: Li Wang <liwang@redhat.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-Upstream: https://github.com/linux-test-project/ltp/commit/91e6272febf95e19a8300695dfc2089569adf9d8
----
- configure.ac |  1 +
- lib/tlibio.c | 52 +++++++++++++++++++++++++++++++++++++++++++---------
- 2 files changed, 44 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8ec37639c1..12025be51c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,6 +48,7 @@ AC_CHECK_DECLS([PR_CAPBSET_DROP, PR_CAPBSET_READ],,,[#include <sys/prctl.h>])
- AC_CHECK_DECLS([SEM_STAT_ANY],,,[#include <sys/sem.h>])
- 
- AC_CHECK_HEADERS_ONCE([ \
-+    aio.h \
-     asm/ldt.h \
-     asm/prctl.h \
-     cpuid.h \
-diff --git a/lib/tlibio.c b/lib/tlibio.c
-index b877393df2..70e0c6f7d2 100644
---- a/lib/tlibio.c
-+++ b/lib/tlibio.c
-@@ -88,7 +88,9 @@
- #include <stdint.h>
- #include <sys/uio.h>		/* readv(2)/writev(2) */
- #include <string.h>
--#include <aio.h>
-+#ifdef HAVE_AIO_H
-+# include <aio.h>
-+#endif
- #include <stdlib.h>		/* atoi, abs */
- 
- #include "tlibio.h"		/* defines LIO* macros */
-@@ -108,7 +110,7 @@ struct lio_info_type Lio_info1[] = {
- 	{"b", LIO_IO_ASYNC | LIO_WAIT_SIGPAUSE, "async i/o using pause"},
- 	{"a", LIO_IO_ASYNC | LIO_WAIT_RECALL,
- 	 "async i/o using recall/aio_suspend"},
--#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
-+#ifdef HAVE_AIO_H
- 	{"r",
- 	 LIO_RANDOM | LIO_IO_TYPES | LIO_WAIT_TYPES,
- 	 "random sync i/o types and wait methods"},
-@@ -159,7 +161,7 @@ char Lio_SysCall[PATH_MAX];	/* string containing last i/o system call */
- 
- static volatile int Received_signal = 0;	/* number of signals received */
- static volatile int Rec_signal;
--#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
-+#ifdef HAVE_AIO_H
- static volatile int Received_callback = 0;	/* number of callbacks received */
- static volatile int Rec_callback;
- #endif
-@@ -399,7 +401,7 @@ static void lio_async_signal_handler(int sig)
- 	return;
- }
- 
--#if defined(sgi) || (defined(__linux__) && !defined(__UCLIBC__))
-+#ifdef HAVE_AIO_H
- /***********************************************************************
-  * This is an internal callback handler.
-  * If the handler is called, it will increment the Received_callback
-@@ -417,7 +419,7 @@ static void lio_async_callback_handler(union sigval sigval)
- 
- 	return;
- }
--#endif /* sgi */
-+#endif
- 
- /***********************************************************************
-  * lio_random_methods
-@@ -515,9 +517,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	int omethod = method;
- 	int listio_cmd;		/* Holds the listio/lio_listio cmd */
- 	struct iovec iov;	/* iovec for writev(2) */
-+#ifdef HAVE_AIO_H
- 	struct aiocb aiocbp;	/* POSIX aio control block */
- 	struct aiocb *aiolist[1];	/* list of aio control blocks for lio_listio */
- 	off64_t poffset;	/* pwrite(2) offset */
-+#endif
- 
- 	/*
- 	 * If LIO_RANDOM bit specified, get new method randomly.
-@@ -536,12 +540,15 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 		*errmsg = Errormsg;
- 
- 	Rec_signal = Received_signal;	/* get the current number of signals received */
-+#ifdef HAVE_AIO_H
- 	Rec_callback = Received_callback;	/* get the current number of callbacks received */
-+#endif
- 
- 	memset(&iov, 0x00, sizeof(struct iovec));
- 	iov.iov_base = buffer;
- 	iov.iov_len = size;
- 
-+#ifdef HAVE_AIO_H
- 	memset(&aiocbp, 0x00, sizeof(struct aiocb));
- 
- 	aiocbp.aio_fildes = fd;
-@@ -589,6 +596,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 	poffset = (off64_t) ret;
- 	aiocbp.aio_offset = ret;
-+#endif
- 
- 	/*
- 	 * If the LIO_USE_SIGNAL bit is not set, only use the signal
-@@ -597,9 +605,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	 * the signal.
- 	 */
- 	if (sig && !(method & LIO_USE_SIGNAL) && !(method & LIO_WAIT_SIGTYPES)) {
--
- 		sig = 0;	/* ignore signal parameter */
- 	}
-+#ifdef HAVE_AIO_H
- 	if (sig && (method & LIO_WAIT_CBTYPES))
- 		sig = 0;	/* ignore signal parameter */
- 
-@@ -626,6 +634,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 		aiocbp.aio_sigevent.sigev_notify_attributes =
- 		    (void *)(uintptr_t) size;
- 	}
-+#endif
- 
- 	/*
- 	 * Determine the system call that will be called and produce
-@@ -684,6 +693,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	}
- 
- 	else if (method & LIO_IO_ASYNC) {
-+#ifdef HAVE_AIO_H
- 		sprintf(Lio_SysCall,
- 			"aio_write(fildes=%d, buf, nbytes=%d, signo=%d)", fd,
- 			size, sig);
-@@ -705,9 +715,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 				sigrelse(sig);
- 			return -errno;
- 		}
-+#endif
- 	}
- 	/* LIO_IO_ASYNC */
- 	else if (method & LIO_IO_SLISTIO) {
-+#ifdef HAVE_AIO_H
- 		aiocbp.aio_lio_opcode = LIO_WRITE;
- 		listio_cmd = LIO_WAIT;
- 		io_type = "lio_listio(3) sync write";
-@@ -739,9 +751,11 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 		ret = lio_check_asyncio(io_type, size, &aiocbp, method);
- 		return ret;
-+#endif
- 	}
- 	/* LIO_IO_SLISTIO */
- 	else if (method & LIO_IO_ALISTIO) {
-+#ifdef HAVE_AIO_H
- 		aiocbp.aio_lio_opcode = LIO_WRITE;
- 		listio_cmd = LIO_NOWAIT;
- 		io_type = "lio_listio(3) async write";
-@@ -766,6 +780,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 				sigrelse(sig);
- 			return -errno;
- 		}
-+#endif
- 	}
- 	/* LIO_IO_ALISTIO */
- 	else if (method & LIO_IO_SYNCV) {
-@@ -796,6 +811,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 		return ret;
- 	}			/* LIO_IO_SYNCV */
-+#ifdef HAVE_AIO_H
- 	else if (method & LIO_IO_SYNCP) {
- 		io_type = "pwrite(2)";
- 
-@@ -827,6 +843,7 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 
- 		return ret;
- 	}			/* LIO_IO_SYNCP */
-+#endif
- 	else {
- 		printf("DEBUG %s/%d: No I/O method chosen\n", __FILE__,
- 		       __LINE__);
-@@ -836,7 +853,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	/*
- 	 * wait for async io to complete.
- 	 */
-+#ifdef HAVE_AIO_H
- 	ret = lio_wait4asyncio(method, fd, &aiocbp);
-+#endif
- 
- 	/*
- 	 * If there was an error waiting for async i/o to complete,
-@@ -862,7 +881,9 @@ int lio_write_buffer(int fd,		/* open file descriptor */
- 	 * have been updated but the actual i/o size if returned.
- 	 */
- 
-+#ifdef HAVE_AIO_H
- 	ret = lio_check_asyncio(io_type, size, &aiocbp, method);
-+#endif
- 
- 	return ret;
- }				/* end of lio_write_buffer */
-@@ -924,9 +945,11 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	int listio_cmd;		/* Holds the listio/lio_listio cmd */
- 	int omethod = method;
- 	struct iovec iov;	/* iovec for readv(2) */
-+#ifdef HAVE_AIO_H
- 	struct aiocb aiocbp;	/* POSIX aio control block */
- 	struct aiocb *aiolist[1];	/* list of aio control blocks for lio_listio */
- 	off64_t poffset;	/* pread(2) offset */
-+#endif
- 
- 	/*
- 	 * If LIO_RANDOM bit specified, get new method randomly.
-@@ -945,12 +968,15 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 		*errmsg = Errormsg;
- 
- 	Rec_signal = Received_signal;	/* get the current number of signals received */
-+#ifdef HAVE_AIO_H
- 	Rec_callback = Received_callback;	/* get the current number of callbacks received */
-+#endif
- 
- 	memset(&iov, 0x00, sizeof(struct iovec));
- 	iov.iov_base = buffer;
- 	iov.iov_len = size;
- 
-+#ifdef HAVE_AIO_H
- 	memset(&aiocbp, 0x00, sizeof(struct aiocb));
- 
- 	aiocbp.aio_fildes = fd;
-@@ -998,6 +1024,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	}
- 	poffset = (off64_t) ret;
- 	aiocbp.aio_offset = ret;
-+#endif
- 
- 	/*
- 	 * If the LIO_USE_SIGNAL bit is not set, only use the signal
-@@ -1010,6 +1037,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 		sig = 0;	/* ignore signal parameter */
- 	}
- 
-+#ifdef HAVE_AIO_H
- 	if (sig && (method & LIO_WAIT_CBTYPES))
- 		sig = 0;	/* ignore signal parameter */
- 
-@@ -1020,7 +1048,6 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	 * old signal handler will not be restored.
- 	 *** restoring the signal handler could be added ***
- 	 */
--
- 	if (sig && (method & LIO_WAIT_SIGTYPES)) {
- 		aiocbp.aio_sigevent.sigev_notify = SIGEV_SIGNAL;
- 		aiocbp.aio_sigevent.sigev_signo = sig;
-@@ -1035,6 +1062,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 		aiocbp.aio_sigevent.sigev_notify_attributes =
- 		    (void *)(uintptr_t) size;
- 	}
-+#endif
- 
- 	/*
- 	 * Determine the system call that will be called and produce
-@@ -1093,6 +1121,7 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 			wait4sync_io(fd, 1);
- 		}
- 
-+#ifdef HAVE_AIO_H
- 	} else if (method & LIO_IO_ASYNC) {
- 		sprintf(Lio_SysCall,
- 			"aio_read(fildes=%d, buf, nbytes=%d, signo=%d)", fd,
-@@ -1236,7 +1265,8 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 			     __FILE__, __LINE__, ret);
- 
- 		return ret;
--	}			/* LIO_IO_SYNCP */
-+#endif
-+	}
- 
- 	else {
- 		printf("DEBUG %s/%d: No I/O method chosen\n", __FILE__,
-@@ -1248,7 +1278,9 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	 * wait for async io to complete.
- 	 * Note: Sync io should have returned prior to getting here.
- 	 */
-+#ifdef HAVE_AIO_H
- 	ret = lio_wait4asyncio(method, fd, &aiocbp);
-+#endif
- 
- 	/*
- 	 * If there was an error waiting for async i/o to complete,
-@@ -1274,12 +1306,14 @@ int lio_read_buffer(int fd,	/* open file descriptor */
- 	 * have been updated but the actual i/o size if returned.
- 	 */
- 
-+#ifdef HAVE_AIO_H
- 	ret = lio_check_asyncio(io_type, size, &aiocbp, method);
-+#endif
- 
- 	return ret;
- }				/* end of lio_read_buffer */
- 
--#if !defined(__sun) && !defined(__hpux) && !defined(_AIX)
-+#ifdef HAVE_AIO_H
- /***********************************************************************
-  * This function will check that async io was successful.
-  * It can also be used to check sync listio since it uses the
--- 
-2.50.0
-
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index eafac0743c..81dc9dffee 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 8ffde75e37..b96e1f46fa 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20250530/ltp-full-20250530.tar.xz.sha256
-sha256  27586ba78eac1e40cd422add2842f1ad70f09fea55da3bd6a25e10feb786d4f2  ltp-full-20250530.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20250930/ltp-full-20250930.tar.xz.sha256
+sha256  048fa4d69ddbe8a94aa15da9bdc85713ab07a0abbc3de2b8bdd9757644aef1e4  ltp-full-20250930.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8be3b21b38..e4e3ff8717 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20250530
+LTP_TESTSUITE_VERSION = 20250930
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 
-# 0001-configure-Fix-build-on-kernel-6.14-headers.patch
-LTP_TESTSUITE_AUTORECONF = YES
-
 LTP_TESTSUITE_CONF_OPTS += --disable-metadata
 
 ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
