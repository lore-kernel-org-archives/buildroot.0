Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882E9C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 17:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BADA5413A9;
	Wed, 19 Feb 2025 17:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Bw7QpgOkuOz; Wed, 19 Feb 2025 17:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3061155E71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3061155E71;
	Wed, 19 Feb 2025 16:01:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B699127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 15:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81C014098F
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 15:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ht0v_IndzLeE for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 15:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC9D3400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC9D3400AC
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC9D3400AC
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 15:27:12 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C221735207DF; Wed, 19 Feb 2025 16:27:10 +0100 (CET)
Date: Wed, 19 Feb 2025 16:27:10 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z7X4Tnu6xLc118qs@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-33-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1739978830; bh=EiDCjlEeW/rncHFM4LpTWDjpivljklhbFHYYxdlbkhE=;
 h=Date:From:To:Subject:From;
 b=CyC9eF7abwjCN2t2wKVoGE2NCuubqXNXaEA3945QQv5zR2xnjKofzfn23h5GOLBYR
 njHZEwUoM5PcTfR3nMHybWS4QaUxOnFMqd+JYVsWVK6kAQkyy+JS3x8wgUZsL7fqp5
 VuEA8lvZmhUsVUJ9QJ+Ta5nC/cmv9inM04BPlkilCq/cTLi2Pfk5z3gIS34vUld6yp
 xAADJVjQaGuSMQMIi+fG1ubDzRC9J1Y+ilQXu6m5ufT6aB21Jg3/Oq+sAJRnV+HhjI
 a9FdUrRi+sLs+okVEjAeZu7BFCAVEd5u7GEgXFfU/oZGJXh6HagnClf8wnClnKX5o1
 GtAFmM8pmo2XQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=CyC9eF7a
Subject: [Buildroot] [PATCH] package/valgrind: update to 3.24.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a changelog:
https://valgrind.org/docs/manual/dist.news.html

Patches 0003/0004 are applied upstream and so got removed here.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ninitialized-err-in-handle_extension.patch | 47 -------------------
 ...st_IP_AT_SYSCALL-in-handle_extension.patch | 33 -------------
 package/valgrind/valgrind.hash                |  4 +-
 package/valgrind/valgrind.mk                  |  2 +-
 4 files changed, 3 insertions(+), 83 deletions(-)
 delete mode 100644 package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
 delete mode 100644 package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
