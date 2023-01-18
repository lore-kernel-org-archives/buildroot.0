Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80087C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 16:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1505241863;
	Wed, 18 Jan 2023 16:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1505241863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbhNvSS6ThjN; Wed, 18 Jan 2023 16:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFC8C41862;
	Wed, 18 Jan 2023 16:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFC8C41862
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F88C1BF95F
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B39341862
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 16:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B39341862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sg-QqSaKervz for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 16:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CCCC41861
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 16:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CCCC41861
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18D9E87CE8; Wed, 18 Jan 2023 16:57:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 17:55:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 281e51f00b838dc26be5babf4acf9730f8ad87be
X-Git-Newrev: 7b56604060a9bb6d06e790934421909dc1b763d8
X-Patchwork-Hint: ignore
Message-Id: <20230118165751.18D9E87CE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.02.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b56604060a9bb6d06e790934421909dc1b763d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ae835e094f607d69f1c2581593a4c55723486c39)
[Peter: drop Makefile/Vagrantfile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/CHANGES b/CHANGES
index e23cd4eaf8..dbf62e5a63 100644
--- a/CHANGES
+++ b/CHANGES
@@ -580,6 +580,50 @@
 	#14731: BR2_PACKAGE_IOSTAT
 	#14751: LVM2 Outdated Link
 
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
