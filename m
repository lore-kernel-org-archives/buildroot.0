Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD71C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06D6F404DA;
	Wed,  4 Jan 2023 11:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06D6F404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8I5xRCu-704; Wed,  4 Jan 2023 11:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 290E8408F1;
	Wed,  4 Jan 2023 11:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 290E8408F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34DA61BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E06D403F9
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E06D403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIngkU1z5zmZ for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:39:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7C2E40AD9
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7C2E40AD9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5A3D8742C; Wed,  4 Jan 2023 11:39:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 08:49:43 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 6a50ded0c19ebeffcc2a08dd49885c8808d8b154
X-Git-Newrev: f20548fa82d3dd1e6fc918c147432d2f5abc7583
X-Patchwork-Hint: ignore
Message-Id: <20230104113933.C5A3D8742C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 configs/freescale_imx6qsabreauto: update codeaurora URLs to github
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

commit: https://git.buildroot.net/buildroot/commit/?id=f20548fa82d3dd1e6fc918c147432d2f5abc7583
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

NXP moved all its open source code repositories from Code Aurora Forum
to github. See for example:
https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097

Software packages are now grouped in several NXP github
projects/organizations (nxp-imx, nxp-qoriq, ...). See:
https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB

The NXP code published on Code Aurora is still present (at the time of
this commit) but is no longer receiving updates. It is also expected
to be shut down on 2023-03-31. The Code Aurora website
https://source.codeaurora.org/ currently show the following message:
"""
Note: Qualcomm Innovation Center Inc. maintained repositories have
migrated to git.codelinaro.org. QUIC repositories on this site will
not receive any updates after March 31, 2022, and will be deleted on
March 31, 2023. If your project depends on these repositories, please
adjust your tooling configuration to use the new, up-to-date project
location.
"""

For this reason, the NXP recipes using codeaurora.org urls need to be
updated to the correct github.com replacement.

Note: this commit does not change the component version. Only the
download URL is updated. The archive content is expected to be the
same.

Note 2: this commit updates the Kernel and U-Boot download urls.
The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 67a98cdd94b03404bf91b203a998e37a6d5d4e0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6qsabreauto_defconfig | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 58b4a5f92d..72696ab1ad 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -16,9 +16,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
@@ -38,7 +37,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
