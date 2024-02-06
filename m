Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A52C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8582E8217B;
	Tue,  6 Feb 2024 17:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0N54nVhKZd2; Tue,  6 Feb 2024 17:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7365682668
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7365682668;
	Tue,  6 Feb 2024 17:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D19A71BF976
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF68482668
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRgu4pgdWi8w for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A558217B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0A558217B
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC7C387390; Tue,  6 Feb 2024 17:47:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:46:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 041e8e7e403121fcdf4c5a5fc363230c5ded2980
X-Git-Newrev: c77a7acb8806a775cd6365c1c5de0f03141e138f
X-Patchwork-Hint: ignore
Message-Id: <20240206174709.BC7C387390@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/radxa/rock5b: Disable FIQ debug
 interface
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
Content-Type: multipart/mixed; boundary="===============8354650668804298313=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8354650668804298313==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c77a7acb8806a775cd6365c1c5de0f03141e138f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The custom kernel used for the Rock5B features an FIQ debug
interface which is enabled by default. As it is not needed, it is
disabled. The documentation features instructions on how to
re-enable it, if it is needed.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/radxa/rock5b/linux.fragment |  1 +
 board/radxa/rock5b/readme.txt     | 20 ++++++++++++++++++++
 board/radxa/rock5b/rock5b.dts     | 12 ++++++++++++
 board/radxa/rock5b/rock5b.its     |  2 +-
 configs/rock5b_defconfig          |  3 ++-
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
index 6d65cb7bb8..28bb373ef2 100644
--- a/board/radxa/rock5b/linux.fragment
+++ b/board/radxa/rock5b/linux.fragment
@@ -1,4 +1,5 @@
 CONFIG_R8169=y
+# CONFIG_ROCKCHIP_FIQ_DEBUGGER is not set
 # Disable Rockchip specific WiFi drivers, as the kernel
 # code cannot be build with GCC 12 due to several Werrors
 # CONFIG_WL_ROCKCHIP is not set
diff --git a/board/radxa/rock5b/readme.txt b/board/radxa/rock5b/readme.txt
index f02f3d380e..b3eb06851a 100644
--- a/board/radxa/rock5b/readme.txt
+++ b/board/radxa/rock5b/readme.txt
@@ -20,6 +20,7 @@ output/images
 ├── rk3588-rock-5b.dtb
 ├── rk3588_bl31_v1.40.elf
 ├── rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
+├── rock5b.dts
 ├── rock5b.its
 ├── rootfs.ext2
 ├── rootfs.ext4
@@ -64,6 +65,8 @@ https://forum.radxa.com/c/rock5
 Issues:
 =======
 
+WiFi
+----
 The custom Radxa kernel provides custom code to support WiFi. However,
 that code does not compile with GCC 12, which is the current default
 version in buildroot. Hence, the WiFi kernel drivers are disabled, until
@@ -80,3 +83,20 @@ BR2_GCC_VERSION_11_X=y
 board/radxa/rock5b/linux.fragment:
 
 # CONFIG_WL_ROCKCHIP is not set
+
+Rockchip FIQ Debugger
+---------------------
+The custom kernel used for this board features an FIQ debugger, which
+can be activated by typing "fiq" on the serial interface. As this can be
+annoying if a user wants to type these charakters and it is not needed
+for most users, this board support disables the FIQ debugger by default.
+To re-enable the FIQ debugger follow the steps:
+
+1. In board/radxa/rock5b/rock5b.dts set the status property of the
+fiq_debugger node to "okay" and set the status property of the uart2
+node to "disabled"
+
+2. Re-enable the fiq debugger module  by removing the following line
+from board/radxa/rock5b/linux.fragment:
+
+# CONFIG_ROCKCHIP_FIQ_DEBUGGER is not set
diff --git a/board/radxa/rock5b/rock5b.dts b/board/radxa/rock5b/rock5b.dts
new file mode 100644
index 0000000000..71a4e42b5e
--- /dev/null
+++ b/board/radxa/rock5b/rock5b.dts
@@ -0,0 +1,12 @@
+/dts-v1/;
+
+#include "rockchip/rk3588-rock-5b.dts"
+
+&fiq_debugger {
+	status = "disabled";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
diff --git a/board/radxa/rock5b/rock5b.its b/board/radxa/rock5b/rock5b.its
index d73659a56e..9ce235d041 100644
--- a/board/radxa/rock5b/rock5b.its
+++ b/board/radxa/rock5b/rock5b.its
@@ -20,7 +20,7 @@
 		};
 		fdt {
 			description = "Device Tree";
-			data = /incbin/("rk3588-rock-5b.dtb");
+			data = /incbin/("rock5b.dtb");
 			type = "flat_dt";
 			arch = "arm64";
 			compression = "none";
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 2e72b386b1..7175aa66bf 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -14,7 +14,8 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
 BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+# BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/radxa/rock5b/rock5b.dts"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_TARGET_ROOTFS_EXT2=y

--===============8354650668804298313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8354650668804298313==--
