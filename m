Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4014AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC15E40968;
	Sat, 13 Jul 2024 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di2at1CWqOH8; Sat, 13 Jul 2024 13:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B035540985
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B035540985;
	Sat, 13 Jul 2024 13:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F01B11BF400
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7FD94099A
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTJMFbePTH6b for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013E240968
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 013E240968
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:17:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E756486491; Sat, 13 Jul 2024 13:17:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 15:14:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42eae73ef1182587236c1f19ead59a7030cd9005
X-Git-Newrev: 68b2091fe5fa79d436e1f57da7cdf497201da99b
X-Patchwork-Hint: ignore
Message-Id: <20240713131719.E756486491@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=68b2091fe5fa79d436e1f57da7cdf497201da99b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e0a2687421a4f93e65aa00a30bcb0b4817f7a195)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/CHANGES b/CHANGES
index 2d97ce2a3f..6567a41545 100644
--- a/CHANGES
+++ b/CHANGES
@@ -145,6 +145,22 @@
         #16036: android-tools version is too old
         #16075: Cannot use linux kernel extensions from external tree..
 
+2024.02.4, released July 13th, 2024
+
+	Important / security related fixes.
+
+	Infrastructure: Ensure a custom tar program specified with
+	make TAR=/path/to/custom/tar is used everwhere.
+
+	Defconfig: Pine64 rockpro64: Build ethernet driver in kernel
+	rather than as module.
+
+	Updated/fixed packages: apache, composer, daq, fluent-bit,
+	ghostscript, glibc, liblockfile, libmad, libopenssl, mesa3d,
+	network-manager, ntp, octave, openssh, openvpn, php, python3,
+	qt6base, raspberrypi-usbboot, redis, sentry-cli, systemd, tor,
+	vlc, xmrig, znc
+
 2024.02.3, released June 10th, 2024
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
