Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3A9C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02CA183FB7;
	Sat, 13 Jul 2024 12:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oisx8NF2jm9; Sat, 13 Jul 2024 12:16:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0425183FC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0425183FC4;
	Sat, 13 Jul 2024 12:16:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57C5E1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42FCB83FC7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZJzOPaq2OAY for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA9B83FC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EA9B83FC4
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:16:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50D4486403; Sat, 13 Jul 2024 12:16:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 14:11:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a882426e37181cc36cd59c2a4fbf93d43fa975e4
X-Git-Newrev: 9238ff24090e40a3253412e60a05c1f73e2b4b53
X-Patchwork-Hint: ignore
Message-Id: <20240713121629.50D4486403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2024.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9238ff24090e40a3253412e60a05c1f73e2b4b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2555f47788964d796c8a49e81ce1f5d63b9cb9ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 18 ++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 4916eb0bf4..2d97ce2a3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,21 @@
+2024.05.1, released July 13th, 2024
+
+	Important / security related fixes.
+
+	Infrastructure: Ensure support/scripts/apply-patches can be
+	used outside Buildroot (regression in 2024.05).
+
+	Defconfig: Pine64 rockpro64: Build ethernet driver in kernel
+	rather than as module. QEMU sh4: Change to initramfs to
+	workaround regression in QEMU. Visionfive2: Correct kernel
+	headers version
+
+	Updated/fixed packages: apache, avro-c, daq, dav1d,
+	fluent-bit, ghostscript, glibc, libmad, libopenssl,
+	linux-firmware, mesa3d, network-manager, ntp, nut, octave,
+	openssh, openvpn, php, raspberrypi-usbboot, redis, sentry-cli,
+	tor, uuu, vlc, xmrig, znc
+
 2024.05, released June 12th, 2024
 
 	Various fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index ce57bc0719..b49ea47425 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.05'
+RELEASE='2024.05.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
