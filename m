Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0765FCC05A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6379060BF2;
	Fri,  6 Mar 2026 18:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUWz_YKcYYmI; Fri,  6 Mar 2026 18:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7178561397
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822434;
	bh=5ZO3nlQ2rsFqiXOILyOlE0Jva/tBf0tiFBhjnZT5vww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S6WQNwPI57bH3dG/PVAo7vJ2h+BfmhZ3CoaNDCVp90Jdox8jFPrwroN5NXg7WwaP8
	 HWMWHQ1c0Z37y0MX0lsWNHdB3HF3oHtPLO5iHM0U7bItOgF+2oFWpNFODRXo6INoDO
	 52aYkiUzgVDCoaQCqSrOptnuLpCRgJN/GG85TxKha1wemlhjCBQQXjinhFaWZWBJ3Z
	 IA40VNwhJGjOeuFswOhWAfFCGohXxRANV88KXe7+OltxJYddtUX2bDNN4aMLxtTW1x
	 iWeaYHouC9WGRWyLPcCekdd6tqR6RWEryhU7u9NVtFCGR1CAPVfEG53HEM+YJ8nDAZ
	 jr59x87WevAYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7178561397;
	Fri,  6 Mar 2026 18:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 414C4339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EB9740549
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpEl_yiEl-j8 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DBED40147
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DBED40147
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82D44867A3; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb5086ae7abb3e4127bceb156363939273645044
X-Git-Newrev: 94916981ceb194af5c03b2f877d4b345601996f8
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.82D44867A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/waffle: fix build with glibc 2.43
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94916981ceb194af5c03b2f877d4b345601996f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../waffle/0001-c11-threads-fix-build-on-c23.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/waffle/0001-c11-threads-fix-build-on-c23.patch b/package/waffle/0001-c11-threads-fix-build-on-c23.patch
new file mode 100644
index 0000000000..0bed2a6548
--- /dev/null
+++ b/package/waffle/0001-c11-threads-fix-build-on-c23.patch
@@ -0,0 +1,57 @@
+From 6b3c46483844faba4dfe7dd90dc2b0cd06e67158 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Nov 2025 19:20:22 -0800
+Subject: [PATCH] c11/threads: fix build on c23
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-107b-5a8a15521083@redhat.com/#213088
+
+Conditionally check if glibc already provided c23 definition via stdlib.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/158
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ third_party/threads/threads.h       | 3 ++-
+ third_party/threads/threads_posix.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/third_party/threads/threads.h b/third_party/threads/threads.h
+index b4db50c..cdc7bea 100644
+--- a/third_party/threads/threads.h
++++ b/third_party/threads/threads.h
+@@ -102,8 +102,9 @@ typedef pthread_cond_t  cnd_t;
+ typedef pthread_t       thrd_t;
+ typedef pthread_key_t   tss_t;
+ typedef pthread_mutex_t mtx_t;
++#ifndef __once_flag_defined
+ typedef pthread_once_t  once_flag;
+-
++#endif
+ #else
+ #error Not supported on this platform.
+ #endif
+diff --git a/third_party/threads/threads_posix.c b/third_party/threads/threads_posix.c
+index bc50825..d93013b 100644
+--- a/third_party/threads/threads_posix.c
++++ b/third_party/threads/threads_posix.c
+@@ -75,11 +75,12 @@ static void *impl_thrd_routine(void *p)
+ 
+ /*--------------- 7.25.2 Initialization functions ---------------*/
+ // 7.25.2.1
++#ifndef __once_flag_defined
+ void call_once(once_flag *flag, void (*func)(void))
+ {
+     pthread_once(flag, func);
+ }
+-
++#endif
+ 
+ /*------------- 7.25.3 Condition variable functions -------------*/
+ // 7.25.3.1
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
