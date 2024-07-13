Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E786C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D109140105;
	Sat, 13 Jul 2024 11:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhtBhisAMuNt; Sat, 13 Jul 2024 11:50:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9102240385
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9102240385;
	Sat, 13 Jul 2024 11:50:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D129F1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9FD240879
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXwgJvWzEDR6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F748407D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F748407D2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:50:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95771863FE; Sat, 13 Jul 2024 11:50:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 13:48:13 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 38b5b420863a1736080b88dff7f541c17c517d0e
X-Git-Newrev: 2555f47788964d796c8a49e81ce1f5d63b9cb9ac
X-Patchwork-Hint: ignore
Message-Id: <20240713115039.95771863FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] Update for 2024.05.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2555f47788964d796c8a49e81ce1f5d63b9cb9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 18 ++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 21 insertions(+), 3 deletions(-)

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
diff --git a/Makefile b/Makefile
index 4320eeb1b7..d616c08c0a 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.05
+export BR2_VERSION := 2024.05.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1718188000
+BR2_VERSION_EPOCH = 1720871000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
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
