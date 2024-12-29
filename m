Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46762C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F2D484A00;
	Fri, 28 Feb 2025 16:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJtaGPmY5gJF; Fri, 28 Feb 2025 16:47:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 021EA849FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 021EA849FC;
	Fri, 28 Feb 2025 16:47:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F4031DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEF8142E1D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqKLv6Z5__Tl for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 877E24257C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 877E24257C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 827E282215; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:21:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 48b3ad00b0f80513dedd9f8c5d15f099aa0e5a61
X-Git-Newrev: eb8384bfbb64b1088bb9dca2d1d7df56e767231b
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.827E282215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/numactl: bump to
 version 2.0.19
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb8384bfbb64b1088bb9dca2d1d7df56e767231b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change logs since 2.0.18, see:
https://github.com/numactl/numactl/releases/tag/v2.0.19

This commit also removes the package patch, which is included in
this version.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-when-set_mempolicy_home_node-syscal.patch | 46 ----------------------
 package/numactl/numactl.hash                       |  2 +-
 package/numactl/numactl.mk                         |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)

diff --git a/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch b/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch
deleted file mode 100644
index ac532e1fb5..0000000000
--- a/package/numactl/0001-Don-t-fail-build-when-set_mempolicy_home_node-syscal.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c265971648f82464a76f797c4c20a09def078be9 Mon Sep 17 00:00:00 2001
-From: Andi Kleen <ak@linux.intel.com>
-Date: Thu, 16 May 2024 09:03:24 -0700
-Subject: [PATCH] Don't fail build when set_mempolicy_home_node syscall is
- unknown
-
-Instead just warn at build and return ENOSYS. This fixes build
-on architectures like arm without kernel headers installed.
-
-Fixes #219
-
-Upstream: https://github.com/numactl/numactl/commit/87342c3b9a42aadbe1398ca8233d13ab524aa64f
-Signed-off-by: Andi Kleen <ak@linux.intel.com>
----
- syscall.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/syscall.c b/syscall.c
-index 63b3e53..392f736 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -144,7 +144,7 @@
- #if defined(__x86_64__) || defined(__aarch64__)
- #define __NR_set_mempolicy_home_node 450
- #else
--#error "Add syscalls for your architecture or update kernel headers"
-+#warning "Add syscalls for your architecture or update kernel headers"
- #endif
- 
- #endif
-@@ -261,7 +261,12 @@ long WEAK move_pages(int pid, unsigned long count,
- 
- int WEAK set_mempolicy_home_node(void *start, unsigned long len, int home_node, int flags)
- {
-+#ifndef __NR_set_mempolicy_home_node
-+   errno = ENOSYS;
-+   return -1;
-+#else
-    return syscall(__NR_set_mempolicy_home_node, start, len, home_node, flags);
-+#endif
- }
- 
- /* SLES8 glibc doesn't define those */
--- 
-2.46.2
-
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index c48df0ac69..8851c8c4f5 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b4fc0956317680579992d7815bc43d0538960dc73aa1dd8ca7e3806e30bc1274  numactl-2.0.18.tar.gz
+sha256  f2672a0381cb59196e9c246bf8bcc43d5568bc457700a697f1a1df762b9af884  numactl-2.0.19.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 512a5eb96a..134d03bc53 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.18
+NUMACTL_VERSION = 2.0.19
 NUMACTL_SITE = \
 	https://github.com/numactl/numactl/releases/download/v$(NUMACTL_VERSION)
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
