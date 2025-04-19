Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E98C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 11:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D6148148D;
	Sat, 19 Apr 2025 11:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8gMczqQ7urd; Sat, 19 Apr 2025 11:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47B6481468
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47B6481468;
	Sat, 19 Apr 2025 11:15:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0F86230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6AA3406F9
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aYuUFjVam3hK for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 11:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A46406F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5A46406F6
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 11:15:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0E2981494; Sat, 19 Apr 2025 11:15:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 12:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3329a1e8203371243b9e3b75c529649fbdae7ff
X-Git-Newrev: 2bea32478d80b0aa5a8a3094734a93e94aebf94a
X-Patchwork-Hint: ignore
Message-Id: <20250419111556.B0E2981494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: add patch to fix build on
 ARC, OpenRISC, Microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bea32478d80b0aa5a8a3094734a93e94aebf94a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of libcap to version 2.76 in commit
e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
ARC, OpenRISC, Microblaze. The bug was reported upstream at
https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
subsequently fixed by upstream commit:

  https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7a2eee56607218d017af8d26c2c41dba83629708

Which we backport in this commit.

Fixes:

  http://autobuild.buildroot.net/results/c99f461ac757d2934a353818a302a67ef3ad5cf5/ (ARC)
  http://autobuild.buildroot.net/results/8cae72f02d25a48287320d9c991f41761487e353/ (Microblaze)
  http://autobuild.buildroot.net/results/74e2c4d37c5b0ae2749c7d77ca7431bd0d510971/ (OpenRISC)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...pt-at-PSX-support-for-microblaze-arc-and-.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch b/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
new file mode 100644
index 0000000000..3f569d6d2c
--- /dev/null
+++ b/package/libcap/0001-First-attempt-at-PSX-support-for-microblaze-arc-and-.patch
@@ -0,0 +1,56 @@
+From 7a2eee56607218d017af8d26c2c41dba83629708 Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Thu, 17 Apr 2025 20:20:09 -0700
+Subject: [PATCH] First attempt at PSX support for microblaze, arc and
+ openrisc.
+
+I found some confusing macrology for openrisc. I'm optimistic that
+this is recognized with the __or1k__ gcc macro.
+
+See for details:
+
+  https://bugzilla.kernel.org/show_bug.cgi?id=219915
+
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7a2eee56607218d017af8d26c2c41dba83629708
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ psx/psx_calls.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/psx/psx_calls.c b/psx/psx_calls.c
+index 9662fbd..8195964 100644
+--- a/psx/psx_calls.c
++++ b/psx/psx_calls.c
+@@ -48,7 +48,8 @@
+     || defined(__mips__) || defined(__loongarch__) \
+     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
+     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
+-    || defined(__m68k__) || defined(__sparc__)
++    || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
++    || defined(__microblaze__) || defined(__or1k__)
+ 
+ #undef _NSIG
+ #undef _NSIG_BPW
+@@ -69,7 +70,8 @@
+ 
+ #if defined(__x86_64__) || defined(__i386__) \
+     || defined(__arm__) \
+-    || defined(__powerpc__)
++    || defined(__powerpc__) \
++    || defined(__arc__)
+ /* field used */
+ #define SA_RESTORER  0x04000000
+ #endif /* architectures that use SA_RESTORER */
+@@ -201,6 +203,8 @@ static void psx_posix_syscall_actor(int signum, siginfo_t *info, void *ignore) {
+ 	    __asm__ __volatile__("\npsx_restorer:\n\tmov r7,#173\n\tswi 0\n");
+ #elif defined(__powerpc__)
+ 	    __asm__ __volatile__("\npsx_restorer:\n\tli 0, 172\n\tsc\n");
++#elif defined(__arc__)
++	    __asm__ __volatile__("\npsx_restorer:\n\tmov r8, 139\n\ttrap_s 0\n");
+ #else
+ #error "unsupported architecture - https://bugzilla.kernel.org/show_bug.cgi?id=219687"
+ #endif /* supported architectures */
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
