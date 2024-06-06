Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D2C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 10:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D8361086;
	Thu, 13 Jun 2024 10:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNi8qtvM4fWN; Thu, 13 Jun 2024 10:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33DB7610B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33DB7610B5;
	Thu, 13 Jun 2024 10:07:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC561BF354
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6162760EC2
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPL3OfCtp5ru for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C95160ED3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C95160ED3
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4793F87F56; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 15:32:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c286c345cf42bc341a3f0502e33fc8477fdd904
X-Git-Newrev: c1554df688cb1563c8da2f8fcba21020dcf126a1
X-Patchwork-Hint: ignore
Message-Id: <20240613100500.4793F87F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal_vck190_defconfig: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1554df688cb1563c8da2f8fcba21020dcf126a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                                 | 1 -
 board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 ++
 board/xilinx/patches/versal-firmware/versal-firmware.hash           | 2 ++
 configs/versal_vck190_defconfig                                     | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c3de61111f..eea412d01d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -358,7 +358,6 @@ configs/ts4900_defconfig lib_defconfig.ForceCheckHash
 configs/ts5500_defconfig lib_defconfig.ForceCheckHash
 configs/ts7680_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
-configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..e300398541
--- /dev/null
+++ b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c3369c89eab4e452bbc76c630e5dccb6c0ae588c0175b6c8549aa0241deb06ef  xlnx_rebase_v2.10_2024.1.tar.gz
diff --git a/board/xilinx/patches/versal-firmware/versal-firmware.hash b/board/xilinx/patches/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..c4d745f22c
--- /dev/null
+++ b/board/xilinx/patches/versal-firmware/versal-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  versal-firmware-xilinx_v2024.1.tar.gz
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index ecfc10cc91..69272e721c 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -39,3 +39,5 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
