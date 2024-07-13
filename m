Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA48AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7959F8191E;
	Sat, 13 Jul 2024 12:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3mPeD9PRKPk; Sat, 13 Jul 2024 12:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7357681951
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7357681951;
	Sat, 13 Jul 2024 12:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B93C71BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2A87400DD
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLb28jrzCkJT for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9398D400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9398D400A4
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFA2A86417; Sat, 13 Jul 2024 12:29:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 14:29:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e01bb070d95f00915f00f2b1d2ff61b9283a6cea
X-Git-Newrev: e0a2687421a4f93e65aa00a30bcb0b4817f7a195
X-Patchwork-Hint: ignore
Message-Id: <20240713122943.EFA2A86417@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0a2687421a4f93e65aa00a30bcb0b4817f7a195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 16 ++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 91cc951a26..8788916288 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
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
diff --git a/Makefile b/Makefile
index e5053e4221..5e054ca2dc 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.3
+export BR2_VERSION := 2024.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1718005000
+BR2_VERSION_EPOCH = 1720873000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 983f2f58b3..90d097bc4f 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.3'
+RELEASE='2024.02.4'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
