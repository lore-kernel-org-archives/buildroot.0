Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088EBC25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 19:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AAB4415F3;
	Thu, 30 May 2024 19:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kN6Oa1cyeoYG; Thu, 30 May 2024 19:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B93F415D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B93F415D4;
	Thu, 30 May 2024 19:13:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 256861D4A16
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 120284033C
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4KhZsL74mwn for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 19:13:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E1DB402EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E1DB402EA
 for <buildroot@buildroot.org>; Thu, 30 May 2024 19:13:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F40787736; Thu, 30 May 2024 19:13:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 20:19:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f5723e3864cd109f6ac25fa4cbad93d927e938d
X-Git-Newrev: 14bb97ff9d23359ffa0dd9078f0efb94f1f6a8c2
X-Patchwork-Hint: ignore
Message-Id: <20240530191341.6F40787736@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/lego_ev3_defconfig: add hashes for
 Linux/headers/u-boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=14bb97ff9d23359ffa0dd9078f0efb94f1f6a8c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop
the defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                     | 1 -
 board/lego/ev3/patches/linux-headers/linux-headers.hash | 1 +
 board/lego/ev3/patches/linux/linux.hash                 | 2 ++
 board/lego/ev3/patches/uboot/uboot.hash                 | 2 ++
 configs/lego_ev3_defconfig                              | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f6d54361bc..bb27977d8c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -218,7 +218,6 @@ configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/lego_ev3_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
 configs/ls1028ardb_defconfig lib_defconfig.ForceCheckHash
 configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/lego/ev3/patches/linux-headers/linux-headers.hash b/board/lego/ev3/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/lego/ev3/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/lego/ev3/patches/linux/linux.hash b/board/lego/ev3/patches/linux/linux.hash
new file mode 100644
index 0000000000..81824a41ee
--- /dev/null
+++ b/board/lego/ev3/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/board/lego/ev3/patches/uboot/uboot.hash b/board/lego/ev3/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..c53d9ecc5c
--- /dev/null
+++ b/board/lego/ev3/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  312b7eeae44581d1362c3a3f02c28d806647756c82ba8c72241c7cdbe68ba77e  u-boot-2021.07.tar.bz2
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 86b2aea656..df80bb3f10 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -5,6 +5,8 @@ BR2_arm926t=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.19 series
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
