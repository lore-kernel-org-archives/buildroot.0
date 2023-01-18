Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A6C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCDC3416FF;
	Wed, 18 Jan 2023 10:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCDC3416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VMb7f95d9IU; Wed, 18 Jan 2023 10:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A856A415E5;
	Wed, 18 Jan 2023 10:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A856A415E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA821BF589
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 10:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA42B415E5
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 10:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA42B415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id leTjailW1hrU for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 10:44:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC0D9411C6
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 10:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC0D9411C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B649A87C8A; Wed, 18 Jan 2023 10:44:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 11:44:24 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e18846284cafd8827872f02e9699102740988132
X-Git-Newrev: ae835e094f607d69f1c2581593a4c55723486c39
X-Patchwork-Hint: ignore
Message-Id: <20230118104448.B649A87C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae835e094f607d69f1c2581593a4c55723486c39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 44 ++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3af8c5dcdf..8af15d3b1e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,47 @@
+2022.02.9, released January 18th, 2023
+
+	Important / security related fixes.
+
+	Br2-external: Fix make performance issue when many (> 6)
+	external trees are used together.
+
+	Erofs: Use fixed timestamp and UUID when BR2_REPRODUCIBLE is
+	used.
+
+	Go: Ensure our go build and module cache is used, even for the
+	download step.
+
+	Legal-info: Stop warning about not saving sources for local /
+	override packages if <PKG>_REDISTRIBUTE is set to NO.
+
+	Linux: Fix build of < 5.6 kernels with host-gcc >= 10.
+
+	A large number of NXP related packages and defconfigs have
+	been updated as upstream moved the git repositories to Github.
+
+	Updated/fixed packages: asterisk, bearssl, botan, cairo,
+	capnproto, check, checkpolicy, connman, containerd,
+	docker-cli, docker-engine, exempi, exfat, exfat-utils, fmc,
+	fmlib, glib-networking, go, gobject-introspection, gperf,
+	i2pd, ima-evm-utils, imx-alsa-plugins, imx-kobs, imx-lib,
+	imx-m4fwloader, imx-mkimage, intel-microcode, janus-gateway,
+	libcurl, libftdi1, libksba, libmbim, libmng, libpjsip,
+	libtalloc, libuwsc, libxkbcommon, linux, lpeg, lrzsz,
+	lttng-tools, lua-cqueues, mbedtls, mfgtools, mutt, php,
+	policycoreutils, polkit, postgresql, pptp-linux,
+	qcom-db410c-firmware, qemu, qoriq-rcw, qt5virtualkeyboard,
+	rhash, rtl_433, ruby, sqlite, swupdate, tekui, tiff, tinyxml,
+	tor, wayland, wireshark, wpa_supplicant,
+	xdriver_xf86-video-imx-viv, xserver_xorg-server, xxhash, zip
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14971: Kernel 3.10.108 fail to build in Buildroot 2022.08-rc1
+	#14996: Too many directories in BR2_EXTERNAL causes hang during make
+	#15161: kernel can't support SUBDIR
+	#15196: Setting BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE does not work
+	#15226: lsblk: not found
+
 2022.02.8, released December 10th, 2022
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 404dcaa270..3bdc2f08c9 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.8
+export BR2_VERSION := 2022.02.9
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1670685000
+BR2_VERSION_EPOCH = 1674038000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index b35ccac727..a96b91ea40 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.8'
+RELEASE='2022.02.9'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
