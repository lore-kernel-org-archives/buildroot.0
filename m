Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1ABC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2367A42AEA;
	Mon, 20 Feb 2023 21:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2367A42AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OuDNjCYbhlce; Mon, 20 Feb 2023 21:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0BAD42CB6;
	Mon, 20 Feb 2023 21:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0BAD42CB6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E79F1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90C5A41591
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90C5A41591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUkMj-Ro6MVZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B445C40C29
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B445C40C29
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1F8F86495; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 10:14:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0cc7c63f91ffadb0835bb57cdb7bfffdf7803add
X-Git-Newrev: 8f706ebb2cf325565f12b532c84a9d5ebe14d0d2
X-Patchwork-Hint: ignore
Message-Id: <20230220205151.B1F8F86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openpgm: fix build for
 non-x86 targets
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f706ebb2cf325565f12b532c84a9d5ebe14d0d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

openpgm-5-3-128 has assembly code for x86 that is not guarded by
architecture defines. A patch to fix that has been merged upstream
some time ago, and the next release will have it. This includes
that patch for the time being.

Fixes: http://autobuild.buildroot.net/results/338291e5bf0671cb7ed7a32cc10e546c7a521acc
Fixes: http://autobuild.buildroot.net/results/3ab6d7f9ee841fa18c1c220d722b1c06ca1fff30
Fixes: http://autobuild.buildroot.net/results/68e840b1fec8f14775cef0b6a14d9b847337324b

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openpgm/0003-fix-build-on-macOS-ARM.patch | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/openpgm/0003-fix-build-on-macOS-ARM.patch b/package/openpgm/0003-fix-build-on-macOS-ARM.patch
new file mode 100644
index 0000000000..5769c5d7f1
--- /dev/null
+++ b/package/openpgm/0003-fix-build-on-macOS-ARM.patch
@@ -0,0 +1,34 @@
+From 43dfc3e3a66b8e4584eb46219b129197a2428181 Mon Sep 17 00:00:00 2001
+From: Michael Cho <cho-m@tuta.io>
+Date: Thu, 10 Mar 2022 22:46:29 -0800
+Subject: [PATCH] fix build on macOS ARM
+
+[alexander.lukichev@gmail.com: backport from upstream]
+Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
+---
+ openpgm/pgm/cpu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openpgm/pgm/cpu.c b/openpgm/pgm/cpu.c
+index cbcc988..f5da471 100644
+--- a/openpgm/pgm/cpu.c
++++ b/openpgm/pgm/cpu.c
+@@ -33,6 +33,7 @@
+ //#define CPU_DEBUG
+ 
+ 
++#if defined(__i386__) || defined(__x86_64__)
+ #ifndef _MSC_VER
+ static
+ void
+@@ -59,7 +60,6 @@ _xgetbv(uint32_t xcr) {
+ #endif
+ 
+ 
+-#if defined(__i386__) || defined(__x86_64__)
+ PGM_GNUC_INTERNAL
+ void
+ pgm_cpuid (pgm_cpu_t* cpu)
+-- 
+2.37.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
