Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74133C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B8B4607B8;
	Sat, 19 Apr 2025 14:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIGGrJsK45za; Sat, 19 Apr 2025 14:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C3C607FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68C3C607FC;
	Sat, 19 Apr 2025 14:35:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35263230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1923D40235
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6C0ngzBSQvw3 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE4840151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DE4840151
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5851985518; Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:34:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3012fbdec745640f7ef9f52f4ee9d94d07c82eb6
X-Git-Newrev: 2ef9e7ff57e86e410c6b638bf74c5bf5f414a31d
X-Patchwork-Hint: ignore
Message-Id: <20250419143510.5851985518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: fix build failure with
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ef9e7ff57e86e410c6b638bf74c5bf5f414a31d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix build failure with Linux 6.13

Fixes:
https://autobuild.buildroot.org/results/4a0ebbcd62a2bfc59a7f6183f100f0e111cee750

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../rtl8188eu/0001-Fix-build-with-Linux-6.13.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
new file mode 100644
index 0000000000..3594283ff1
--- /dev/null
+++ b/package/rtl8188eu/0001-Fix-build-with-Linux-6.13.patch
@@ -0,0 +1,35 @@
+From 408ac4abdd1e187624ebef9f6a45ecc437525de5 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Apr 2025 17:34:54 +0200
+Subject: [PATCH] Fix build with Linux 6.13
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9c4f830927750a2bf9fd9426a5257f0fdce3b662
+adds struct net_device *dev as argument to set_monitor_channel(), so let's
+add it to cfg80211_rtw_set_monitor_channel() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8188eu/pull/463
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ioctl_cfg80211.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
+index c6ae5aa..270cfce 100644
+--- a/ioctl_cfg80211.c
++++ b/ioctl_cfg80211.c
+@@ -4404,7 +4404,10 @@ static int	cfg80211_rtw_set_channel(struct wiphy *wiphy
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
