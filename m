Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3168CD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 04:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B747E4097A;
	Thu, 11 Apr 2024 04:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7s05PCtlySWW; Thu, 11 Apr 2024 04:34:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 185434075D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 185434075D;
	Thu, 11 Apr 2024 04:34:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC421BF396
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 852D660768
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 04:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pp2YYYKT-Wy for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 04:34:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E5E360761
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E5E360761
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B0FE86020; Thu, 11 Apr 2024 04:34:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 06:34:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb16148dddc6be39b0d850181c2461fdaba1ee6f
X-Git-Newrev: 107bcd536dae1bc26e4f34ed510484d3abcc6b5f
X-Patchwork-Hint: ignore
Message-Id: <20240411043420.5B0FE86020@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: remove TestATFVexpress
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

commit: https://git.buildroot.net/buildroot/commit/?id=107bcd536dae1bc26e4f34ed510484d3abcc6b5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TestATFVexpress is using vexpress_aemv8a_juno as as u-boot defconfig
but the Buildroot defconfig of this board was removed in 2022.11 [1]

Since both TestATFVexpress and TestATFAllwinner are now using mainline
ATF, we don't really need several ATF test anymore. Initially [2],
several runtime test were added to test ATF/U-Boot combinations when
ATF was provided by a vendor: vexpress (mainline), Allwinner and
Marvell.

Keep TestATFAllwinner as ATF mainline test.

[1] 347c1087388d7782e6865f112f195e6780d473a7
[2] 8cf3ce04e9c4a4c4685b80edd9e8e873fe44d8e8

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/boot/test_atf.py | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index 1995f83a54..352725e721 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -1,31 +1,6 @@
 import infra.basetest
 
 
-class TestATFVexpress(infra.basetest.BRTest):
-    config = \
-        """
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.5"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-        BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
-        BR2_TARGET_UBOOT=y
-        BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
-        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
-        BR2_TARGET_VEXPRESS_FIRMWARE=y
-        """
-
-    def test_run(self):
-        pass
-
-
 class TestATFAllwinner(infra.basetest.BRTest):
     config = \
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
