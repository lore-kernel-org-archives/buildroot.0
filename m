Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EECC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 15:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C9961039
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 15:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73C9961039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BDA401BE;
	Wed, 10 Nov 2021 15:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTds_cy9qSHt; Wed, 10 Nov 2021 15:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AF8401CE;
	Wed, 10 Nov 2021 15:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE6D1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 15:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EA984035B
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 15:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr6Y6rSvDXoD for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 15:47:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C688D40356
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 15:47:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7B1E28B8E9; Wed, 10 Nov 2021 15:43:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 16:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea21670ee830bfd86dca47434ef01c61da2a36cd
X-Git-Newrev: 19e2b2606f7229642de536bb565e3ac58ec4327f
X-Patchwork-Hint: ignore
Message-Id: <20211110154308.7B1E28B8E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2021.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=19e2b2606f7229642de536bb565e3ac58ec4327f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d815599e371d759b193de4207bec6f2701827db0)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 20 ++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index e611898795..50be386cea 100644
--- a/CHANGES
+++ b/CHANGES
@@ -56,6 +56,26 @@
 	        with mkfs.ext4: No such file or directory while trying
 	        to determine filesystem size
 
+2021.08.2, released November 10th, 2021
+
+	Important / security related fixes.
+
+	Updated/fixed packages: asterisk, audit, bind, bitcoin,
+	containerd, cryptsetup, dahdi-linux, dbus-python, dfu-util,
+	docker-cli, docker-engine, earlyoom, edk2-platforms, exiv2,
+	ffmpeg, freerdp, gdb, gensio, gnupg2, go, gpsd,
+	gst1-plugins-bad, gst1-plugins-ugly, gst1-vaapi, gtest,
+	hiredis, lftp, libps1, libva, libva-utils, lightning,
+	log4cplus, lrzip, netdata, nodejs, olsr, openjdk, openjdk-bin,
+	pango, php, python3-cffi, qemu, refpolicy, rng-tools, samba4,
+	snort, strongswan, sunxi-mali-mainline-driver, suricata,
+	systemd, tor, vim, weston, wf111, wireguard-linux-compat,
+	xerces
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14311: Cannot compile dahdi (part of Asterisk) for x86 (P1mmx)
+
 2021.08.1, released October 11, 2021
 
 	Important / security related fixes.
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 6bc64e829a..54ee9c8fbe 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.08.1'
+RELEASE='2021.08.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
