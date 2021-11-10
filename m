Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4B4C43219
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 13:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DC96108E
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 13:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3DC96108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA6B402C1;
	Wed, 10 Nov 2021 13:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jse9Vs9XoraY; Wed, 10 Nov 2021 13:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D643E40402;
	Wed, 10 Nov 2021 13:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E74C81BF322
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 13:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6A7060ABE
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 13:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qcKdC6277BA for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 13:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F0C60A77
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 13:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D2B6C8B8BE; Wed, 10 Nov 2021 13:16:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 14:20:12 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0fe38150f9a1846ae6473a5e3e1b0d51e9a738bb
X-Git-Newrev: 6e0019f9ca380a765dd79b3d3a80bb2bfc291522
X-Patchwork-Hint: ignore
Message-Id: <20211110131635.D2B6C8B8BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Update for 2021.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e0019f9ca380a765dd79b3d3a80bb2bfc291522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 19 +++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 80382c7f9e..b7b335d598 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,22 @@
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
diff --git a/Makefile b/Makefile
index 2b96d5afa8..07301f2f10 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2021.02.6
+export BR2_VERSION := 2021.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1633977000
+BR2_VERSION_EPOCH = 1636550000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 4092879130..c05053f2b2 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2021.02.6'
+RELEASE='2021.02.7'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
