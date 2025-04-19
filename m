Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFBDC369CB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1798A6071E;
	Sat, 19 Apr 2025 14:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TP_7DiuplCop; Sat, 19 Apr 2025 14:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EADCA60833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EADCA60833;
	Sat, 19 Apr 2025 14:35:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 499E4231
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B0766080C
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPlJxWphCB6q for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB84607EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB84607EE
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6800C8553F; Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:34:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ef9e7ff57e86e410c6b638bf74c5bf5f414a31d
X-Git-Newrev: 7b9a021dfd7f3ea9c17f2ce354c509659adfa099
X-Patchwork-Hint: ignore
Message-Id: <20250419143510.6800C8553F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: fix build failure with
 Linux 6.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b9a021dfd7f3ea9c17f2ce354c509659adfa099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix build failure with Linux 6.13

Fixes:
https://autobuild.buildroot.org/results/940e7f95fff017b8c7cffb778911ae0386980fa3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../rtl8723ds/0001-Fix-build-with-Linux-6.13.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
new file mode 100644
index 0000000000..2350dc2e5e
--- /dev/null
+++ b/package/rtl8723ds/0001-Fix-build-with-Linux-6.13.patch
@@ -0,0 +1,35 @@
+From d71ab09447d9c3043203b5c3b5868e99bc4e0ca8 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Apr 2025 22:00:59 +0200
+Subject: [PATCH] Fix build with Linux 6.13
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
+adds struct net_device *dev as argument to set_monitor_channel(), so let's
+add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8723ds/pull/51
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/linux/ioctl_cfg80211.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 53ccef4..75391e7 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -4520,7 +4520,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
+ }
+ 
+ static int cfg80211_rtw_set_monitor_channel(struct wiphy *wiphy
+-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 13, 0))
++	, struct net_device *dev
++	, struct cfg80211_chan_def *chandef
++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	, struct cfg80211_chan_def *chandef
+ #else
+ 	, struct ieee80211_channel *chan
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
