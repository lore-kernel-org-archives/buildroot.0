Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F8DE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 15:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3ED240493;
	Sun,  8 Dec 2024 15:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu1vsuJa8eg5; Sun,  8 Dec 2024 15:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D940C40499
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D940C40499;
	Sun,  8 Dec 2024 15:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AC496F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 15:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25C1B80EC1
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 15:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pb_N8OXGLXc for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 15:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 017CF80ED5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 017CF80ED5
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 15:59:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED3478696F; Sun,  8 Dec 2024 15:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Dec 2024 16:58:41 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: bb5b5055eedb5535ada672b8a459ad32bd2880e2
X-Git-Newrev: 563852c4362c5128ecaae6deb8057b395681e087
X-Patchwork-Hint: ignore
Message-Id: <20241208155909.ED3478696F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] Update for 2024.08.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=563852c4362c5128ecaae6deb8057b395681e087
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 22 ++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index b1a558adba..5cfffe63df 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2024.08.3, released December 8th, 2024
+
+	Important / security related fixes.
+
+	Defconfigs: fix mender_x86_64_efi_defconfig build on setups
+	where /bin/sh is not bash.
+
+	Updated/fixed packages: alsa-lib, android-tools, bats-core,
+	bluez-alsa, bmap-tools, boost, checksec, ebtables, expat, fbv,
+	ffmpeg, foot, frr, gnuplot, gnutls, intel-microcode, irssi,
+	libcurl, libgit2, libkrb5, libmodbus, libpng, libvpl,
+	linux-pam, linux-tools, lmbench, mbedtls, mosquitto, musl,
+	musl-compat-headers, nfs-utils, ntp, php, picotool,
+	postgresql, procps-ng, python-psycopg2, python-sip, qt6base,
+	quagga, rt-tests, sexpect, sshguard, systemd, tiff, x11vnc
+
+	Issues resolved:
+	- procps-ng: builderror in 2024.08
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/38
+	- fbv package download link is broken in long term support branch
+	  https://gitlab.com/buildroot.org/buildroot/-/issues/73
+
 2024.08.2, released November 14th, 2024
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 3d89449eee..28bb3ab12c 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.08.2
+export BR2_VERSION := 2024.08.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1729431000
+BR2_VERSION_EPOCH = 1733673000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index c3cb15d727..f48a99d7eb 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.08.2'
+RELEASE='2024.08.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
