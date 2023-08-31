Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DCC83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 14:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE0940443;
	Thu, 31 Aug 2023 14:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FE0940443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0XrYdVZQGQo; Thu, 31 Aug 2023 14:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56635405F4;
	Thu, 31 Aug 2023 14:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56635405F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC23F1BF418
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2EFF8330B
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 14:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2EFF8330B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuW7pQqiY0Lj for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 14:44:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B147F832EB
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 14:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B147F832EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0F9786756; Thu, 31 Aug 2023 14:44:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 16:44:21 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: bd1991e228cfd7478b3bac29fccb3c7fd71b10ab
X-Git-Newrev: 3923a4fac8c9e501b5fd94eea98bd7e842b31876
X-Patchwork-Hint: ignore
Message-Id: <20230831144440.A0F9786756@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] Update for 2023.05.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3923a4fac8c9e501b5fd94eea98bd7e842b31876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 32 ++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 937b50ea7d..fb52f9bd1a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,35 @@
+2023.05.2, released August 31th, 2023
+
+	Important / security related fixes.
+
+	Toolchains: Correctly mark Bootlin external toolchains as
+	having OpenMP support.
+
+	Arch: Mark Alderlake x86 variants as no AVX512 support.
+
+	Utils: Ensure utils/docker-run correctly supports git
+	worktrees.
+
+	Defconfigs: Beaglebone: U-Boot needs OpenSSL. Beaglebone qt5:
+	Enable support for green wireless variant.
+
+	Updated/fixed packages: arm-trusted-firmware, bind, cairo,
+	cmocka, containerd, crudini, cryptodev-linux, dmidecode,
+	ffmpeg, firmware-imx, gcc, gdb, ghostscript, gkrellm,
+	gnuradio, go, igh-ethercat, iperf3, kodi, libcurl, libopenssl,
+	libssh, libubootenv, libuhttpd, linux-tools, mali-driver,
+	nfs-utils, ntp, openssh, php, pipewire, python-pysmb,
+	python-iniparse, python-iptables, rtl8189es, rtl8189fs,
+	sam-ba, samba4, seatd, shadow, speex,
+	sunxi-mali-utgard-driver, supertuxkart, sysdig, systemd, tor,
+	tpm2-tss, transmission, uboot, unzip, webkitgtk,
+	wireless-regdb, wolfssl, wpebackend-fdo, wpewebkit, xenomai,
+	yaml-cpp, yavta
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#15634: fluidsynths refers to missing libgomp.so.1
+
 2023.05.1, released July 17th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index dbf13c1e07..2ea0467fc9 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.05.1
+export BR2_VERSION := 2023.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1689606300
+BR2_VERSION_EPOCH = 1693493000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 12da353f2e..75aae858b7 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2023.05.1'
+RELEASE='2023.05.2'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
