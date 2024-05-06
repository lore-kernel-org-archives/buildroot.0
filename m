Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F72C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7470460ABE;
	Mon,  6 May 2024 21:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYqNTSL9eBkl; Mon,  6 May 2024 21:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D485D60AC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D485D60AC3;
	Mon,  6 May 2024 21:27:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D34111BF861
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B10EF406B7
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPa-deSBbCr5 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70DB406EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70DB406EE
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:27:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9781C86965; Mon,  6 May 2024 21:27:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:59:50 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c28be13d01d7aa216d64817f4e9c728b73157a51
X-Git-Newrev: 2e929607565c479fffe6cfe1e0379f7c53abdf09
X-Patchwork-Hint: ignore
Message-Id: <20240506212727.9781C86965@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: sync
 TestATFAllwinner with orangepi_zero_plus2_defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e929607565c479fffe6cfe1e0379f7c53abdf09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

u-boot-2021.04 seems to be broken when pylibfdt support is enabled
and the latest python3/setuptools are used.

Since the TestATFAllwinner is using bananapi_m64 as u-boot defconfig
but the Buildroot defconfig of this board was removed in 2022.11 [1]
update TestATFAllwinner to use a newer BSP. Use the one provided
by orangepi_zero_plus2_defconfig.

[1] daf3c6661f823e566b6310042884c36c1d73f1de

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656317 (TestATFAllwinner)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eb16148dddc6be39b0d850181c2461fdaba1ee6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/boot/test_atf.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 4fcb9b241c..1995f83a54 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -34,15 +34,15 @@ class TestATFAllwinner(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
         # BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP is not set
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
         BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
-        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
         BR2_TARGET_UBOOT_NEEDS_DTC=y
         BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
         BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
