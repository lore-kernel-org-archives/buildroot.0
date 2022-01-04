Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D161C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50AB481D34;
	Tue,  4 Jan 2022 18:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uF9lkkLnw_Ma; Tue,  4 Jan 2022 18:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B2781AEF;
	Tue,  4 Jan 2022 18:09:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 199F91BF9B4
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F5460B97
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwnZNxHhbI6U for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E73DC60C08
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:09:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4DE028324A; Tue,  4 Jan 2022 18:02:57 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 18:49:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01a4446d1cff0ff67a4fdc7778a259105634643c
X-Git-Newrev: 5ba47c2d4e8c84b57d52d12b60c9efa983eca98a
X-Patchwork-Hint: ignore
Message-Id: <20220104180257.4DE028324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f469_disco_xip: explicitly
 set the kernel version
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ba47c2d4e8c84b57d52d12b60c9efa983eca98a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version of the kernel and its headers must be explicitly set because
if you keep the default setting, the kernel is continuously updated in
buildroot with the risk that its image + dtb grow so much that it again
exceeds the 2 MByte of the flash module.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/stm32f469_disco_xip_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 6c4f227f58..d95b7759f3 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,9 +1,12 @@
 BR2_arm=y
 BR2_cortex_m4=y
+BR2_KERNEL_HEADERS_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_GCC_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
