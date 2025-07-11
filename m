Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0235FC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBBC060834;
	Thu, 17 Jul 2025 20:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uNMnN9PFbeE; Thu, 17 Jul 2025 20:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D506360825
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D506360825;
	Thu, 17 Jul 2025 20:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD157226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEF9A400C0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlf6O7JMHudn for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA7C40142
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCA7C40142
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D830D8667F; Thu, 17 Jul 2025 20:32:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 16:02:03 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3028f68635ed66e072ddb3866d7bbb8c16f058c9
X-Git-Newrev: 2b23a3bc199ca3156713530d0a108b27bd11977b
X-Patchwork-Hint: ignore
Message-Id: <20250717203255.D830D8667F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/sudo: drop patch
 that has been merged upstream
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2b23a3bc199ca3156713530d0a108b27bd11977b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The patch has been integrated upstream as part of sudo 1.9.16p2, and was
therefore removed from Buildroot in [1]. However, because that change in
Buildroot was not considered as a security bump at that time, it hasn't
been cherry-picked to the 2025.02.x LTS branch.

Later on, sudo issued a new security version, which has been promptly
merged into Buildroot master in [2]. Since this addressed a security issue,
the patch has also been backported into the 2025.02.x LTS branch [3]. The
backport integrated the 2 versions bumps into one change, but the patch
removal was lost in the process.

Fixes: https://autobuild.buildroot.net/results/260/260a8e8da6e459b7c723fbeaeb23fb1fcf0db155//

[1] 969bdb9d2e1857589292122adbc75073b1b30cd5
[2] ee86844e632d5760355154ea4e928c9228f3dfd1
[3] 9bcbbcc37f99e1526901ec843ca2d9d66f0eddda

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(cherry picked from commit 38264adb15226d0e4d5b1799b7fc288d767fa8ad)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ptrace-fix-build-without-precess_vm_readv.patch | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch b/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
deleted file mode 100644
index 446f1d1797..0000000000
--- a/package/sudo/0001-src-exec_ptrace-fix-build-without-precess_vm_readv.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 17 Feb 2024 17:52:45 +0100
-Subject: [PATCH] src/exec_ptrace: fix build without precess_vm_readv()
-
-Commit 32f4b98f6b4a (sudo frontend: silence most -Wconversion warnings.)
-broke the build on C libraries that miss process_vm_readv(), like
-uClibc-ng.
-
-Indeed, the ssize_t nwritten is declared guarded by HAVE_PROCESS_VM_READV,
-but is then re-assigned and used a few lines below, outside any guard.
-
-Fix that by always declaring the object, as it is always needed.
-
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/sudo-project/sudo/commit/5bbfaa8e68b5ee6f27d4fbfa3c4e789341724f9c
----
- src/exec_ptrace.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/exec_ptrace.c b/src/exec_ptrace.c
-index 9dd36c275..3d44b82e2 100644
---- a/src/exec_ptrace.c
-+++ b/src/exec_ptrace.c
-@@ -878,11 +878,12 @@ ptrace_write_vec(pid_t pid, struct sudo_ptrace_regs *regs, char **vec,
-     unsigned long addr, unsigned long strtab)
- {
-     const unsigned long strtab0 = strtab;
-+    ssize_t nwritten;
-     size_t i;
-     debug_decl(ptrace_write_vec, SUDO_DEBUG_EXEC);
-
- #ifdef HAVE_PROCESS_VM_READV
--    ssize_t nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-+    nwritten = ptrace_writev_vec(pid, regs, vec, addr, strtab);
-     if (nwritten != -1 || errno != ENOSYS)
- 	debug_return_ssize_t(nwritten);
- #endif /* HAVE_PROCESS_VM_READV */
---
-2.43.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
