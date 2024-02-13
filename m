Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AD5C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6609982129;
	Tue, 13 Feb 2024 21:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSkiEwjPwgIa; Tue, 13 Feb 2024 21:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53B838212D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B838212D;
	Tue, 13 Feb 2024 21:45:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 991251BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 864C14066F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9VQPNdm0AtK for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69FD040669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FD040669
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69FD040669
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:45:20 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 19FC613F88D;
 Tue, 13 Feb 2024 22:45:16 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 22:45:10 +0100
Message-ID: <20240213214510.545574-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707860717;
 bh=oDW0CpQ/ze3QxcST4ayldmRXUr5bjNwTrS4ALUpqXb8=;
 h=From:To:Cc:Subject:Date:From;
 b=gk/1BtvdT0r23SYXxvDoKf/RDDcVu3JXHEjqzsn9xnX2GHtB3YOFEmSIljyY/R+UU
 o1i5pD83UU0CXYDmrlvxwZ9gtOO4vYufrjzovmp6Nnp/sV4+hWQhAZ6Kzb302qSSmP
 KEelw7+mrLP8gRzB7t3ouX//SoEdDAiCdRbA5hO4Mz6cRd131XQkoXtNaxREpV63J3
 7aTlFiEnwBtgXgXREvaNdY1Io1U6+eNwsjAR3EGdcR9AYqj+eqtpjDOggD7Ir9ecrF
 OFfaBkMOBaT4T8TrUUyps+TfOkpQKVfV02sk8RZuHlbea3zngyec52iAYu+Y7GntWc
 +quOY/CcjbScQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gk/1Btvd
Subject: [Buildroot] [PATCH 1/1] package/lvm2: bump to version 2.03.23
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since 2.03.14, see:
https://gitlab.com/lvmteam/lvm2/-/blob/22e482d9655e8d041703af984b81d9b742027a78/WHATS_NEW#L4

This commit removes the package patches 1 and 2 which are now included
in the new release. Patches 3 and 4 are kept and renumbered.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...sible-better-compilation-with-musl-c.patch | 30 ----------------
 ...-freopen-to-reopen-standard-streams.patch} |  0
 ...-freopen-to-reopen-standard-streams.patch} |  0
 ...m-preallocate-memory-only-with-glibc.patch | 34 -------------------
 package/lvm2/lvm2.hash                        |  2 +-
 package/lvm2/lvm2.mk                          |  2 +-
 6 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
 rename package/lvm2/{0003-cmdline-use-freopen-to-reopen-standard-streams.patch => 0001-cmdline-use-freopen-to-reopen-standard-streams.patch} (100%)
 rename package/lvm2/{0004-log-use-freopen-to-reopen-standard-streams.patch => 0002-log-use-freopen-to-reopen-standard-streams.patch} (100%)
 delete mode 100644 package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch

diff --git a/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch b/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
deleted file mode 100644
index f537331a2c..0000000000
--- a/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bac596b3685520acaa404dc3ebd2131e6de96d47 Mon Sep 17 00:00:00 2001
-From: Zdenek Kabelac <zkabelac@redhat.com>
-Date: Wed, 16 Feb 2022 00:48:49 +0100
-Subject: [PATCH] clang: possible better compilation with musl c
-
-Try to help resolving reported compilation problem with
-clang & musl C.
-https://github.com/lvmteam/lvm2/issues/61
-
-Backported from: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=4fd76de4b69f8e5e6d5afa03d54cb4b8986c4bcc
-Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
----
- libdaemon/server/daemon-server.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
-index 88905a7dd..96cfc392e 100644
---- a/libdaemon/server/daemon-server.c
-+++ b/libdaemon/server/daemon-server.c
-@@ -18,6 +18,7 @@
- 
- #include <dlfcn.h>
- #include <errno.h>
-+#include <fcntl.h> /* help musl C */
- #include <pthread.h>
- #include <sys/file.h>
- #include <sys/stat.h>
--- 
-2.22.3
-
diff --git a/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
similarity index 100%
rename from package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
rename to package/lvm2/0001-cmdline-use-freopen-to-reopen-standard-streams.patch
diff --git a/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
similarity index 100%
rename from package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch
rename to package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch
diff --git a/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch b/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
deleted file mode 100644
index db16d60ace..0000000000
--- a/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b668022f9b8aecf52109c9e0b7e5847054231361 Mon Sep 17 00:00:00 2001
-From: Zdenek Kabelac <zkabelac@redhat.com>
-Date: Fri, 19 Aug 2022 16:15:17 +0200
-Subject: [PATCH] mm: preallocate memory only with glibc
-
-Use mallinfo() only with glibc.
-
-Backported from: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=8370d117d7ef8a472c95315a3cd085696c90b3be
-Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
----
- lib/mm/memlock.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
-index 3d1a3927c..efcc6d91f 100644
---- a/lib/mm/memlock.c
-+++ b/lib/mm/memlock.c
-@@ -160,7 +160,12 @@ static void _touch_memory(void *mem, size_t size)
- 
- static void _allocate_memory(void)
- {
--#ifndef VALGRIND_POOL
-+#if defined(__GLIBC__) && !defined(VALGRIND_POOL)
-+	/* Memory allocation is currently only tested with glibc
-+	 * for different C libraries, some other mechanisms might be needed
-+	 * meanwhile let users use lvm2 code without memory preallocation.
-+	 * Compilation for VALGRIND tracing also goes without preallocation.
-+	 */
- 	void *stack_mem;
- 	struct rlimit limit;
- 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
--- 
-2.22.3
-
diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 126748d339..74c5f4f1bc 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,5 @@
 # From https://sourceware.org/ftp/lvm2/sha512.sum
-sha512  6a93bed1d5cf36f0f48d4d413d028b0e480cd4fc20e25d173770a892f265d2a0cc68d01a720b1513469953649e989532cd0c45f9538f92a4190eb3dc4555857d  LVM2.2.03.14.tgz
+sha512  293430a80c7f599d14e77610456d0f44cac8164e6159cd0e2e287462278a89787e289fdb4d481eb8fd6b5eea07a6535c41cb7fdc3deee83df7fea9bf77dcbdaa  LVM2.2.03.23.tgz
 # Locally computed sha256 checksums
 sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 810d668ec2..bda1648955 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.03.14
+LVM2_VERSION = 2.03.23
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
-- 
2.43.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
