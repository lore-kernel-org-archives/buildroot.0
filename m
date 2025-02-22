Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CA4C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A76650878;
	Fri, 28 Feb 2025 17:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND4lmUaTsibc; Fri, 28 Feb 2025 17:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E8CF50ACD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E8CF50ACD;
	Fri, 28 Feb 2025 17:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 165D9711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB2BB4263E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3FVhJ7gDFNj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A8447488
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1A8447488
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCBB586143; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 12:40:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3cd0519efd5f79a7ee46d59fc559d46942c9d36
X-Git-Newrev: b13373466bd7e8ac2d587cbd2489b1396fbb2f82
X-Patchwork-Hint: ignore
Message-Id: <20250228163045.BCBB586143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/valgrind: update to
 3.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b13373466bd7e8ac2d587cbd2489b1396fbb2f82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See here for a changelog:
https://valgrind.org/docs/manual/dist.news.html

Patches 0003/0004 are applied upstream and so got removed here.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Fix-uninitialized-err-in-handle_extension.patch | 47 ----------------------
 ...f-guest_IP_AT_SYSCALL-in-handle_extension.patch | 33 ---------------
 package/valgrind/valgrind.hash                     |  4 +-
 package/valgrind/valgrind.mk                       |  2 +-
 4 files changed, 3 insertions(+), 83 deletions(-)

diff --git a/package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch b/package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
deleted file mode 100644
index c6a6b3dce3..0000000000
--- a/package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 94c2e5c6be23c6323f24deacdad5f98fb9f0b1c2 Mon Sep 17 00:00:00 2001
-From: Andreas Arnez <arnez@linux.ibm.com>
-Date: Wed, 15 May 2024 14:32:42 +0200
-Subject: [PATCH] Fix uninitialized `err' in handle_extension()
-
-In handle_extension(), in the case of a second return from SCHEDSETJMP the
-variable `err' would be used uninitialized.  Fix this by avoiding any
-access to `err' in this case.
-
-Signed-off-by: Andreas Arnez <arnez@linux.ibm.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=valgrind.git;a=commit;h=94c2e5c6be23c6323f24deacdad5f98fb9f0b1c2
----
- coregrind/m_scheduler/scheduler.c | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/coregrind/m_scheduler/scheduler.c b/coregrind/m_scheduler/scheduler.c
-index fc8cf7c9c..29751bb28 100644
---- a/coregrind/m_scheduler/scheduler.c
-+++ b/coregrind/m_scheduler/scheduler.c
-@@ -1233,7 +1233,10 @@ static void handle_extension(ThreadId tid)
-    SCHEDSETJMP(tid, jumped, err = VG_(client_extension)(tid));
-    vg_assert(VG_(is_running_thread)(tid));
- 
--   if (err != ExtErr_OK) {
-+   if (jumped != (UWord)0) {
-+      block_signals();
-+      VG_(poll_signals)(tid);
-+   } else if (err != ExtErr_OK) {
-       ThreadState* tst = VG_(get_ThreadState)(tid);
-       Addr addr = tst->arch.vex.guest_IP_AT_SYSCALL;
-       switch (err) {
-@@ -1244,11 +1247,6 @@ static void handle_extension(ThreadId tid)
-          VG_(core_panic)("scheduler: bad return code from extension");
-       }
-    }
--
--   if (jumped != (UWord)0) {
--      block_signals();
--      VG_(poll_signals)(tid);
--   }
- }
- 
- /* tid just requested a jump to the noredir version of its current
--- 
-2.39.2
-
diff --git a/package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch b/package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch
deleted file mode 100644
index 006e24096e..0000000000
--- a/package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16249b21456d681b5d98400287b8dbd926050c75 Mon Sep 17 00:00:00 2001
-From: Andreas Arnez <arnez@linux.ibm.com>
-Date: Wed, 15 May 2024 14:32:42 +0200
-Subject: [PATCH] Avoid use of guest_IP_AT_SYSCALL in handle_extension()
-
-The guest state field guest_IP_AT_SYSCALL is referenced in
-handle_extension(), even though it may not be defined by all
-architectures.  Avoid its use altogether.
-
-Signed-off-by: Andreas Arnez <arnez@linux.ibm.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://sourceware.org/git/?p=valgrind.git;a=commit;h=16249b21456d681b5d98400287b8dbd926050c75
----
- coregrind/m_scheduler/scheduler.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/coregrind/m_scheduler/scheduler.c b/coregrind/m_scheduler/scheduler.c
-index 29751bb28..cc8d070b7 100644
---- a/coregrind/m_scheduler/scheduler.c
-+++ b/coregrind/m_scheduler/scheduler.c
-@@ -1237,8 +1237,7 @@ static void handle_extension(ThreadId tid)
-       block_signals();
-       VG_(poll_signals)(tid);
-    } else if (err != ExtErr_OK) {
--      ThreadState* tst = VG_(get_ThreadState)(tid);
--      Addr addr = tst->arch.vex.guest_IP_AT_SYSCALL;
-+      Addr addr = VG_(get_IP)(tid);
-       switch (err) {
-       case ExtErr_Illop:
-          VG_(synth_sigill)(tid, addr);
--- 
-2.39.2
-
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 9cb66b583a..203a0770e1 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  ec410c75d3920d4f9249a5cfa2cac31e1bf6d586  valgrind-3.23.0.tar.bz2
+sha1  6fc0470fedc0d85dae3e042297cabd13c6100749  valgrind-3.24.0.tar.bz2
 # locally computed
-sha256  c5c34a3380457b9b75606df890102e7df2c702b9420c2ebef9540f8b5d56264d  valgrind-3.23.0.tar.bz2
+sha256  71aee202bdef1ae73898ccf7e9c315134fa7db6c246063afc503aef702ec03bd  valgrind-3.24.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index a5cb4b1c03..f0638f464b 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.23.0
+VALGRIND_VERSION = 3.24.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
