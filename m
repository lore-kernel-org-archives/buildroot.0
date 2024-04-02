Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E862CD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 20:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E9EE4099F;
	Tue,  2 Apr 2024 20:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuVLati3n5Nt; Tue,  2 Apr 2024 20:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF263410A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF263410A6;
	Tue,  2 Apr 2024 20:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5306F1BF369
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B41C540902
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVWSJ5P8DnsH for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 541354094E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 541354094E
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 039DD8462B; Tue,  2 Apr 2024 20:02:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Apr 2024 21:54:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79f7d71640061f65aedfa4f8845a6757e8b0f3fc
X-Git-Newrev: 4cbac9f70609e676887ad242c65e02b3cf827176
X-Patchwork-Hint: ignore
Message-Id: <20240402200227.039DD8462B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: bump to version 2.03.23
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cbac9f70609e676887ad242c65e02b3cf827176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 2.03.14, see:
https://gitlab.com/lvmteam/lvm2/-/blob/22e482d9655e8d041703af984b81d9b742027a78/WHATS_NEW#L4

This commit removes the package patches 1 and 2 which are now included
in the new release. Patches 3 and 4 are kept and renumbered.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...g-possible-better-compilation-with-musl-c.patch | 30 -------------------
 ...e-use-freopen-to-reopen-standard-streams.patch} |  0
 ...g-use-freopen-to-reopen-standard-streams.patch} |  0
 ...002-mm-preallocate-memory-only-with-glibc.patch | 34 ----------------------
 package/lvm2/lvm2.hash                             |  2 +-
 package/lvm2/lvm2.mk                               |  2 +-
 6 files changed, 2 insertions(+), 66 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
