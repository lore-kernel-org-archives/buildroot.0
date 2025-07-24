Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C0C87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 20:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF1E66149B;
	Thu, 24 Jul 2025 20:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTUY7ziSN2Ep; Thu, 24 Jul 2025 20:13:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424D06143C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424D06143C;
	Thu, 24 Jul 2025 20:13:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBB73115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B168B823C0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mY1zATCkNIM5 for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF58B81387
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF58B81387
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 20:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE58A86ACF; Thu, 24 Jul 2025 20:13:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:48:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6645d7407dc50ceda855b75ca4b9309e4e1863c
X-Git-Newrev: 25e87d068c9a796a04c12ac89b7b91c3034fa838
X-Patchwork-Hint: ignore
Message-Id: <20250724201354.AE58A86ACF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arm_foundationv8: bump to Linux
 6.15 and model 11.29
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4218169703422297151=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4218169703422297151==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=25e87d068c9a796a04c12ac89b7b91c3034fa838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux kernel to v6.15.7 and update the hash file.
- Bump the model in the readme to version 11.29 build 27.

While at it, adjust the model's path in the readme to take the host
architecture into account.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/arm/foundation-v8/patches/linux/linux.hash |  2 +-
 board/arm/foundation-v8/readme.txt               | 11 ++++++++---
 configs/arm_foundationv8_defconfig               |  4 ++--
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/board/arm/foundation-v8/patches/linux/linux.hash b/board/arm/foundation-v8/patches/linux/linux.hash
index 47cbb0181a..e58afb7bc7 100644
--- a/board/arm/foundation-v8/patches/linux/linux.hash
+++ b/board/arm/foundation-v8/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5ff5bd84ea0e22c53437302db5d394d0a92d8b8b1a88ce20d1098298e9f7630a  linux-6.12.15.tar.xz
+sha256  3507dd105b0a0e1101bd43d294472fccf853429a259a5fa7c67467bba318f8e9  linux-6.15.7.tar.xz
diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index c640491215..c281faf9d6 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -22,12 +22,17 @@ Running on the simulator
 Download the AArch64 software simulator from one of the following sources,
 corresponding to your host computer:
 
-- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.27/Foundation_Platform_11.27_19_Linux64.tgz
-- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.27/Foundation_Platform_11.27_19_Linux64_armv8l.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.29/Foundation_Platform_11.29_27_Linux64.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.29/Foundation_Platform_11.29_27_Linux64_armv8l.tgz
+
+The model will be located under one of the corresponding folders:
+
+- Foundation_Platformpkg/models/Linux64_GCC-9.3
+- Foundation_Platformpkg/models/Linux64_armv8l_GCC-9.3
 
 Finally, boot your system with:
 
- ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-9.3/Foundation_Platform \
+ Foundation_Platform \
     --arm-v8.0 \
     --image output/images/linux-system.axf \
     --block-device output/images/rootfs.ext2 \
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 93613f5a34..921fbf62c5 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_15=y
 BR2_GLOBAL_PATCH_DIR="board/arm/foundation-v8/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.15.7"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8-gicv3-psci"

--===============4218169703422297151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4218169703422297151==--
