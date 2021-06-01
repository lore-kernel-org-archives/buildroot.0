Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A5BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C566056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6C566056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B42D84056E;
	Tue,  3 Aug 2021 22:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7tPASMnGBuD; Tue,  3 Aug 2021 22:54:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04814405EC;
	Tue,  3 Aug 2021 22:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11F9B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D7F1405F3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHFa3FI_0OVk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30AA40544
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 365EF843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 22:40:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb6fd050cde0eaf6b9b3c8f4cab2b6d925974922
X-Git-Newrev: e8c2a3e2d8e1386f9f153238046e5968acf4517a
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.365EF843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/capnproto: fix build
 on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e8c2a3e2d8e1386f9f153238046e5968acf4517a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.org/results/1c1cd4775241ee57d878cad5c978413d4b4a8736

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-32-bit-architectures-using-64-bit-time_t.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
new file mode 100644
index 0000000000..ce70ab8f29
--- /dev/null
+++ b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
@@ -0,0 +1,37 @@
+From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 12:10:28 -0800
+Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
+
+mutex code uses SYS_futex, which it expects from system C library.
+in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
+rv32 is using 64bit time_t from get go unlike other 32bit architectures
+in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
+this aliases it to NR_futex so that SYS_futex is then defined for rv32
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Retrieved from:
+https://github.com/capnproto/capnproto/commit/e2a05a19e9dc51287e19cc9f11fd91449219e361]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ c++/src/kj/mutex.c++ | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
+index c81cead7b..e1594b117 100644
+--- a/c++/src/kj/mutex.c++
++++ b/c++/src/kj/mutex.c++
+@@ -39,7 +39,13 @@
+ 
+ #ifndef SYS_futex
+ // Missing on Android/Bionic.
++#ifdef __NR_futex
+ #define SYS_futex __NR_futex
++#elif defined(SYS_futex_time64)
++#define SYS_futex SYS_futex_time64
++#else
++#error "Need working SYS_futex"
++#endif
+ #endif
+ 
+ #ifndef FUTEX_WAIT_PRIVATE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
