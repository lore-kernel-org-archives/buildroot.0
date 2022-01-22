Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B40C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 636D6812B2;
	Sat, 22 Jan 2022 14:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JEFH8OrT3dfj; Sat, 22 Jan 2022 14:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA75980C6A;
	Sat, 22 Jan 2022 14:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8667A1BF390
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D5460767
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IF2GR0V-jLpl for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:08:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5C73606F9
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E319782929; Sat, 22 Jan 2022 14:01:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 15:08:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed380f62e0260cdf91e60bfb3706f17a96fddabf
X-Git-Newrev: 96a1344aaed5a36c25b507e5b21f247438a22c67
X-Patchwork-Hint: ignore
Message-Id: <20220122140143.E319782929@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_pitx_imx8m: bump kernel to
 5.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=96a1344aaed5a36c25b507e5b21f247438a22c67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/kontron_pitx_imx8m_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 2a4aa1a0ab..8f756f5246 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/pitx-imx8mq.dtb"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
