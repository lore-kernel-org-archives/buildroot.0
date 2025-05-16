Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF6C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FFEC825BF;
	Fri, 16 May 2025 15:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFtslUxv_Jb8; Fri, 16 May 2025 15:15:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEE9E824F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE9E824F4;
	Fri, 16 May 2025 15:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 268A4185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C990612C1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:15:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stBZUwUVE0w4 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:15:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4017E612AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4017E612AE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:15:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F09E86BEE; Fri, 16 May 2025 15:15:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 17:15:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0841c007b4fbfaa4d9070d5936ad6924d61a105
X-Git-Newrev: b0a703a974503b59881630a6b36ee8f5a1d37248
X-Patchwork-Hint: ignore
Message-Id: <20250516151539.2F09E86BEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: fix building with Linux
 6.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0a703a974503b59881630a6b36ee8f5a1d37248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream to fix build failure with Linux 6.14.

Fixes:
https://autobuild.buildroot.org/results/065b9afc1c6f9f5561547b12171269adc8c12275

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../rtl8188eu/0002-Fix-build-with-Linux-6.14.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
new file mode 100644
index 0000000000..a05a760d22
--- /dev/null
+++ b/package/rtl8188eu/0002-Fix-build-with-Linux-6.14.patch
@@ -0,0 +1,33 @@
+From 0363681349f683050bc9a265db8310e8c4eb6534 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 15 May 2025 22:32:48 +0200
+Subject: [PATCH] Fix build with Linux 6.14
+
+Commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a53af85d3bbdbe06cd47b81a6d99a04dc0a3963
+adds argument "unsigned int link_id" to get_tx_power(), so let's add it to
+cfg80211_rtw_get_txpower() according to Linux version.
+
+Upstream: https://github.com/lwfinger/rtl8188eu/pull/464
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ioctl_cfg80211.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
+index 270cfce..04434fa 100644
+--- a/ioctl_cfg80211.c
++++ b/ioctl_cfg80211.c
+@@ -3240,6 +3240,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
+ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
+ 	struct wireless_dev *wdev,
++#endif
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
++	unsigned int link_id,
+ #endif
+ 	int *dbm)
+ {
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
