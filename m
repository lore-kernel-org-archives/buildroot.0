Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215D1C83F3D
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616AF60DF4;
	Thu, 31 Aug 2023 19:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 616AF60DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSE4AdnBg1E9; Thu, 31 Aug 2023 19:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A627160B3C;
	Thu, 31 Aug 2023 19:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A627160B3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF4AB1BF396
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C01EF417F6
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C01EF417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCUBfcQdiF-5 for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:11:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF7CE408BF
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF7CE408BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAE1B8678D; Thu, 31 Aug 2023 19:11:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 20:49:28 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f6f9b0938b41371d49207f99f86e50d9984dc05a
X-Git-Newrev: 3b8e5b19ad9117c0ebcace9cde2e075108462c98
X-Patchwork-Hint: ignore
Message-Id: <20230831191123.BAE1B8678D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Update for 2023.02.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b8e5b19ad9117c0ebcace9cde2e075108462c98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 29 +++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index b5cb5e7665..abf5b4bd7c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2023.02.4, released August 31th, 2023
+
+	Important / security related fixes.
+
+	Toolchains: Correctly mark Bootlin external toolchains as
+	having OpenMP support.
+
+	Arch: Mark Alderlake x86 variants as having no AVX512 support.
+
+	Utils: Ensure utils/docker-run correctly supports git
+	worktrees.
+
+	Defconfigs: Beaglebone qt5: Enable support for green wireless
+	variant.
+
+	Updated/fixed packages: arm-trusted-firmware, bind, cairo,
+	cmocka, containerd, crudini, dmidecode, ffmpeg, freescale-imx,
+	gcc, gdb, ghostscript, gkrellm, gnuradio, go, heimdall,
+	iperf3, libcurl, libmodsecurity, libopenssl, libssh,
+	libubootenv, libuhttpd, linux-tools, ntp, openssh, php,
+	pipewire, python-iniparse, python-iptables, python-pysmb,
+	rtl8189fs, sam-ba, samba4, seatd, speex, supertuxkart, sysdig,
+	tor, tpm2-tss, uboot, unzip, webkitgtk, wireless-regdb,
+	wolfssl, wpebackend-fdo wpewebkit, xenomai, yaml-cpp, yavta
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15634: fluidsynths refers to missing libgomp.so.1
+
 2023.02.3, released July 17th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 7309fd9976..42bb7a7b1f 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.02.3
+export BR2_VERSION := 2023.02.4
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1689628000
+BR2_VERSION_EPOCH = 1693507700
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 250766fb1d..29f1e8223d 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.02.3'
+RELEASE='2023.02.4'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
