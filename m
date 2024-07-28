Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D4FC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE36C404CE;
	Sun, 28 Jul 2024 11:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjZvw4D7sgKu; Sun, 28 Jul 2024 11:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59373404CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59373404CC;
	Sun, 28 Jul 2024 11:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C45DD1BF471
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD06F403CA
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kh0vUA3RKNl for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3087403CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3087403CD
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8972D87565; Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:36:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2c4db30b366f2e6c7f437ef7f2613e5f49053c35
X-Git-Newrev: e55cdb58f3a9d5eac092586cc297b309cc0a372b
X-Patchwork-Hint: ignore
Message-Id: <20240728110735.8972D87565@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] board/chromebook: use
 global-patch-dir for kernel patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e55cdb58f3a9d5eac092586cc297b309cc0a372b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

We're going to add hashes soon, so we'll need to have that directory
populated with hash files, and it would then be a bit confusing to not
have the patch file in the patches directory...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 552a8cec8cb1a9a66591d075992957ad32547528)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                    | 1 -
 .../linux/0001-linux-4.15-dts-tpm.patch}                               | 3 +++
 configs/chromebook_snow_defconfig                                      | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 41698e1cde..3533b1df33 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -26,7 +26,6 @@ board/canaan/k210-soc/post-build.sh Shellcheck
 board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
 board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
-board/chromebook/snow/linux-4.15-dts-tpm.patch ApplyOrder Upstream
 board/chromebook/snow/sign.sh Shellcheck
 board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch Upstream
 board/cubietech/cubieboard2/post-image.sh Shellcheck
diff --git a/board/chromebook/snow/linux-4.15-dts-tpm.patch b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
similarity index 85%
rename from board/chromebook/snow/linux-4.15-dts-tpm.patch
rename to board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
index c71ff1b584..01f452b563 100644
--- a/board/chromebook/snow/linux-4.15-dts-tpm.patch
+++ b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
@@ -9,6 +9,9 @@ See https://code.google.com/p/chromium/issues/detail?id=220169
 and https://lkml.org/lkml/2013/3/4/242
 
 Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+Upstream: Not Applicable
+[yann.morin.1998@free.fr: add Upstream tag]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 
 --- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
 +++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index bcb94b716b..50e355647c 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_GLOBAL_PATCH_DIR="board/chromebook/snow/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
@@ -8,7 +9,6 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
-BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.15-dts-tpm.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.15.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
