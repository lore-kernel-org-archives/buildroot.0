Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60991C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 08:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E089F81E91;
	Wed, 18 Jan 2023 08:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E089F81E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJuq7uMBjFsR; Wed, 18 Jan 2023 08:05:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EBA81E33;
	Wed, 18 Jan 2023 08:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09EBA81E33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 647AB1BF425
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 08:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37FBE60E85
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 08:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37FBE60E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKyYSQv8RDIo for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 08:05:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23677606F9
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 08:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23677606F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E38787C52; Wed, 18 Jan 2023 08:05:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 09:04:16 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: bcb39cdd583096d5f9ec576c1ec8a9930dacb85c
X-Git-Newrev: d48a8beb39275a479185ab9b3232cd15dcfb87ab
X-Patchwork-Hint: ignore
Message-Id: <20230118080518.0E38787C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] Update for 2022.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d48a8beb39275a479185ab9b3232cd15dcfb87ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index f71e53fe4b..e501fcb4c6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,53 @@
+2022.11.1, released January 18th, 2023
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
+	Defconfigs: zcu106, kria kv260: Fix U-Boot build
+
+	Updated/fixed packages: asterisk, bearssl, botan, cairo,
+	capnproto, check, checkpolicy, connman, containerd, crun,
+	dbus-cxx, docker-cli, docker-engine, exempi, exfat,
+	exfat-utils, falcosecurity-libs, fluidsynth, fmc, fmlib,
+	freeradius-server, gcc, glib-networking, go,
+	gobject-introspection, gperf, i2pd, ima-evm-utils,
+	imx-alsa-plugins, imx-kobs, imx-lib, imx-m4fwloader,
+	imx-mkimage, intel-microcode, janus-gateway, libcurl,
+	libdeflate, libftdi1, libkcapi, libksba, libmbim, libmng,
+	libpjsip, libtalloc, libuwsc, libxkbcommon, lpeg, lrzsz,
+	lttng-tools, lua-cqueues, mali-driver, mbedtls, mfgtools,
+	moby-buildkit, mutt, opensc, php, policycoreutils, polkit,
+	postgresql, pptp-linux, qcom-db410c-firmware, qemu, qoriq-rcw,
+	qt5virtualkeyboard, redis, rhash, rtl8189es, rtl8192eu,
+	rtl_433, ruby, sqlite, swupdate, tealdeer, tekui, tiff,
+	tinyxml, tor, webkitgtk, wireshark, wpasupplicant, wpewebkit,
+	xr819-xradio, xdriver_xf86-video-imx-viv, xserver_xorg-server,
+	xxhash, zip
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#14971: Kernel 3.10.108 fail to build in Buildroot 2022.08-rc1
+	#14996: Too many directories in BR2_EXTERNAL causes hang during make
+	#15161: kernel can't support SUBDIR
+	#15196: Setting BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE does not work
+	#15226: lsblk: not found
+
 2022.11, released December 5th, 2022
 
 	Fixes all over the tree.
diff --git a/Makefile b/Makefile
index 66fe04962d..ab5f97aeff 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.11
+export BR2_VERSION := 2022.11.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1669308000
+BR2_VERSION_EPOCH = 1674028000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 02fe6bca67..9eee9955ec 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.11'
+RELEASE='2022.11.1'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
