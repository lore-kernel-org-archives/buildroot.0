Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0348C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 15:52:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 609E56103D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 15:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 609E56103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D162480F2A;
	Wed, 10 Nov 2021 15:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MAwpWP1pnYrt; Wed, 10 Nov 2021 15:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB2280F18;
	Wed, 10 Nov 2021 15:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 045A01BF5AA
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 15:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7E0560AD1
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 15:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wn5heYapjTVo for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 15:52:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4567A605D7
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 15:52:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E87248B8F3; Wed, 10 Nov 2021 15:48:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 16:49:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5efb32b79992fe8e3ce605d00121259506b82f29
X-Git-Newrev: 8b4a156a4a5f588f571bba1686a0eba0400ffcf2
X-Patchwork-Hint: ignore
Message-Id: <20211110154819.E87248B8F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b4a156a4a5f588f571bba1686a0eba0400ffcf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6e0019f9ca380a765dd79b3d3a80bb2bfc291522)
[Peter: drop Makefile/Vagrantfile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CHANGES b/CHANGES
index 50be386cea..14914919f2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -495,6 +495,25 @@
 	#13751: libopenssl (static): huge drop in performance in newer ..
 	#13771: package htop has undeclared dependency on host python
 
+2021.02.7, released November 10th, 2021
+
+	Important / security related fixes.
+
+	OpenJDK 16.x moved to 17.x as 16.x is EOL.
+
+	Updated/fixed packages: asterisk, audit, bind, bitcoin,
+	cryptsetup, dahdi-linux, dbus-python, dfu-util, docker-cli,
+	docker-containerd, docker-engine, earlyoom, exiv2, ffmpeg,
+	freerdp, gdb, gensio, gnupg2, go, gpsd, gst1-plugins-bad,
+	gst1-plugins-ugly, gst1-vaapi, hiredis, lftp, lightning,
+	lrzip, netdata, nodejs, olsr, openjdk, openjdk-bin, pango,
+	qemu, samba4, snort, strongswan, suricata, systemd, vim,
+	wf111, wireguard-linux-compat, xerces
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14311: Cannot compile dahdi (part of Asterisk) for x86 (P1mmx)
+
 2021.02.6, released October 11, 2021
 
 	Important / security related fixes.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
