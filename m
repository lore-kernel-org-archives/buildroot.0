Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B65FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 12:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5405661251
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 12:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5405661251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23D5A81882;
	Wed, 10 Nov 2021 12:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86y0c7jBI6kZ; Wed, 10 Nov 2021 12:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79992818B5;
	Wed, 10 Nov 2021 12:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6888F1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 12:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57E85814B7
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 12:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGD_ssGkSXg2 for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 12:18:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ED8680EF6
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 12:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45D6F8B8A1; Wed, 10 Nov 2021 12:14:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 13:17:38 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 4f0c76c14bdcb96b96de3f2e62828223ed1a23a5
X-Git-Newrev: d815599e371d759b193de4207bec6f2701827db0
X-Patchwork-Hint: ignore
Message-Id: <20211110121407.45D6F8B8A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] Update for 2021.08.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d815599e371d759b193de4207bec6f2701827db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 20 ++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index e1765f2c68..4ac1774541 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,23 @@
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
diff --git a/Makefile b/Makefile
index eb4fde4ea1..beacab0661 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.08.1
+export BR2_VERSION := 2021.08.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1633945000
+BR2_VERSION_EPOCH = 1636546000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
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
