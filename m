Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CADC32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 16:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F52080316;
	Wed, 18 Jan 2023 16:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F52080316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eboYdk1JfnnD; Wed, 18 Jan 2023 16:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0C481FF4;
	Wed, 18 Jan 2023 16:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0C481FF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 836201BF578
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 16:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F1D341862
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 16:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F1D341862
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfPa3z44V-P6 for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 16:57:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FE324185F
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 16:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE324185F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED94287CE6; Wed, 18 Jan 2023 16:57:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 17:50:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b6ccffcfb84938d2f0813d7c98907d75b49b842
X-Git-Newrev: a796cfb2e0343730a1232d0f5aff405a9788a15d
X-Patchwork-Hint: ignore
Message-Id: <20230118165750.ED94287CE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Update for 2022.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a796cfb2e0343730a1232d0f5aff405a9788a15d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d48a8beb39275a479185ab9b3232cd15dcfb87ab)
[Peter: drop Makefile change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
 support/misc/Vagrantfile |  2 +-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 6de79c7d35..e23cd4eaf8 100644
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
