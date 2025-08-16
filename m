Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1518ECA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D70D6614D1;
	Sat, 16 Aug 2025 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4zFRdi8pjHd; Sat, 16 Aug 2025 19:56:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F84614D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0F84614D2;
	Sat, 16 Aug 2025 19:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28B7A196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F1DF40B92
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_6GOPIxh5Cs for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43A9A40AAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43A9A40AAB
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DDF087622; Sat, 16 Aug 2025 19:56:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 21:55:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93e37c58b0a0c66c6faf81925ce5777b1e863779
X-Git-Newrev: c73243468fbf65b815f39fdf95068f2d49fad6ac
X-Patchwork-Hint: ignore
Message-Id: <20250816195627.2DDF087622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: fix build
 with Linux 6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=c73243468fbf65b815f39fdf95068f2d49fad6ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix build failure with Linux 6.16.

Fixes:
https://autobuild.buildroot.org/results/7a5b5f3e8d34e3e8ca155ffe168768275256c17e/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-build-for-kernel-6.16.patch           | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch b/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
new file mode 100644
index 0000000000..46f67f14ac
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
@@ -0,0 +1,34 @@
+From de764c6b43fef79bdea8783232a89d2e8ff0e059 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 15 Aug 2025 23:48:33 +0200
+Subject: [PATCH] fix build for kernel 6.16
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
+from_timer() has been renamed to timer_container_of() so let's rename
+according to linux version >= 6.16
+
+Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1236
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ include/osdep_service_linux.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
+index 4c276f6..9f9a317 100644
+--- a/include/osdep_service_linux.h
++++ b/include/osdep_service_linux.h
+@@ -355,7 +355,9 @@ static inline void timer_hdl(struct timer_list *in_timer)
+ static inline void timer_hdl(unsigned long cntx)
+ #endif
+ {
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
++	_timer *ptimer = timer_container_of(ptimer, in_timer, timer);
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0))
+ 	_timer *ptimer = from_timer(ptimer, in_timer, timer);
+ #else
+ 	_timer *ptimer = (_timer *)cntx;
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
