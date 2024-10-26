Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD76FD10C03
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96606404E3;
	Sat, 26 Oct 2024 19:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kbq5OJOEIHnx; Sat, 26 Oct 2024 19:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50BDA4056C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BDA4056C;
	Sat, 26 Oct 2024 19:00:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF6E65C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD4624042C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUEqsLOTUDgq for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 19:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF08240197
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF08240197
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 19:00:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7CC28403C; Sat, 26 Oct 2024 19:00:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 20:56:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88a3f285bb7a94fc94f0a34dd43800b8a329e540
X-Git-Newrev: 4ca8f0ea762061ad04016d065f37e0c351d578f1
X-Patchwork-Hint: ignore
Message-Id: <20241026190031.B7CC28403C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/icnova-a20-adb4006: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ca8f0ea762061ad04016d065f37e0c351d578f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                     | 1 -
 .../icnova-a20-adb4006/patches/linux-headers/linux-headers.hash         | 1 +
 board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash            | 2 ++
 board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash            | 2 ++
 configs/icnova-a20-adb4006_defconfig                                    | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9e81400f89..4788f97694 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -153,7 +153,6 @@ configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
 configs/grinn_chiliboard_defconfig lib_defconfig.ForceCheckHash
 configs/grinn_liteboard_defconfig lib_defconfig.ForceCheckHash
 configs/hifive_unleashed_defconfig lib_defconfig.ForceCheckHash
-configs/icnova-a20-adb4006_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabresd_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash b/board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash b/board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash
new file mode 100644
index 0000000000..98edd13a58
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
diff --git a/board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash b/board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index 88b670a37c..01f4abe215 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/in-circuit/icnova-a20-adb4006/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ICnova A20 ADB4006"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ICnova A20 ADB4006!"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
