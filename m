Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B298C25B75
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 16:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D05EA40324;
	Sun, 26 May 2024 16:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyNWoaU4zLge; Sun, 26 May 2024 16:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66069402BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66069402BA;
	Sun, 26 May 2024 16:44:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 311EF1D1159
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 16:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B73A80DA3
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 16:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gw96n4zq-COS for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 16:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDBFC80D74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBFC80D74
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDBFC80D74
 for <buildroot@buildroot.org>; Sun, 26 May 2024 16:43:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7A815B0053E;
 Sun, 26 May 2024 18:43:53 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 18:43:46 +0200
Message-ID: <20240526164346.564204-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716741835;
 bh=q1TrxaFQezamHFu9BZxclxG92WVInkonnB3jkNRYApw=;
 h=From:To:Cc:Subject:Date:From;
 b=eJ6OfXZtIyXGJYvEDDpf+bJpXGjGpkcY/BUxxYqbe1c4imjjfNFZESJkms76//Vm8
 oY5tO8lZzlN1Ya+65JsfhBZG/XSrzi9AYSdbKxJoMuZDOpwO4h8z0hqWaN/1EPH9vj
 Wv6p8U+J8ywxdpAaD4j4pxl9KrW/2iYsPnpn/npJXiGxFCDDN+swwAMz/OYqXnDA/h
 SSilbgm/ZmGKmpEqhQggjgdwEqJs28Y68f+lMicE2WDV2A8ZSpO26Wbv8x6/bzeF0Z
 K9UsrHQVzhPdM2vxBy0W2QZWanMxQCCYo+jsz/5Ga0qFf2k+uF0k9+xIhGUZG0rIZW
 pyF47ghuD/w4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eJ6OfXZt
Subject: [Buildroot] [PATCH v2 1/1] configs/mx51evk: bump kernel to 5.10.218
 to fix build
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit dc0f721 "package/gcc: switch to 13.x as default",
mx51evk_defconfig is failing to build in Kernel (see [1]),
with output:

    drivers/ata/libahci.c: In function 'ahci_led_store':
    ././include/linux/compiler_types.h:315:45: error: call to '__compiletime_assert_328' declared with attribute error: BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
      315 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          |                                             ^

This commit fixes the issue by bumping the Kernel to 5.10.218.

The kernel commit fixing the build failure is [2], first included in
v5.10.184. There is also many other gcc-13 fixes.

While bumping the Kernel, this commit also enables
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, add the relevant archive hash files,
and removes the defconfig entry in ".checkpackageignore".

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6918688967
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4c3ddc06cedb62f2904e58fd95170bf206bee149

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: I did not tested the generated image on an actual board
(I don't have access to it).

Changes v1 -> v2:
- Bump only the kernel to 5.10.218 (instead of 6.6.31).
- No longer bump uboot
---
 .checkpackageignore                                         | 1 -
 .../imx51evk/patches/linux-headers/linux-headers.hash       | 1 +
 board/freescale/imx51evk/patches/linux/linux.hash           | 2 ++
 board/freescale/imx51evk/patches/uboot/uboot.hash           | 2 ++
 configs/mx51evk_defconfig                                   | 6 +++++-
 5 files changed, 10 insertions(+), 2 deletions(-)
 create mode 120000 board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx51evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx51evk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 9b9e4a61f9f..68c0ea83dd7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -235,7 +235,6 @@ configs/microchip_sama7g5ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
-configs/mx51evk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
 configs/mx6cubox_defconfig lib_defconfig.ForceCheckHash
 configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 00000000000..5808d92afe8
--- /dev/null
+++ b/board/freescale/imx51evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx51evk/patches/linux/linux.hash b/board/freescale/imx51evk/patches/linux/linux.hash
new file mode 100644
index 00000000000..fdda2dfdaa8
--- /dev/null
+++ b/board/freescale/imx51evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From: https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
diff --git a/board/freescale/imx51evk/patches/uboot/uboot.hash b/board/freescale/imx51evk/patches/uboot/uboot.hash
new file mode 100644
index 00000000000..716b56e14d4
--- /dev/null
+++ b/board/freescale/imx51evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  b407e1510a74e863b8b5cb42a24625344f0e0c2fc7582d8c866bd899367d0454  u-boot-2021.01.tar.bz2
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index a4bebdec976..e633a6228d7 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,6 +2,10 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
+# Global patches directory and hash check
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx51evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
@@ -28,7 +32,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.218"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
