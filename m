Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B984C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A45041C0F;
	Thu, 29 Feb 2024 15:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYebHBC6XjGZ; Thu, 29 Feb 2024 15:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8FE41D79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8FE41D79;
	Thu, 29 Feb 2024 15:53:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 197CC1BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D36B060ED8
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFF_M4QwVEDk for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1141A60F1D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1141A60F1D
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:32:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2EDE87D11; Thu, 29 Feb 2024 15:31:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:23:39 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 8a8a5622720899c08be4d29dccefcb1e72988e45
X-Git-Newrev: 608bd4d0ccdac416d84927f1fb064c42b5b518f7
X-Patchwork-Hint: ignore
Message-Id: <20240229153159.F2EDE87D11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] configs/imx8mpevk: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Content-Type: multipart/mixed; boundary="===============1457467349603041003=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1457467349603041003==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=608bd4d0ccdac416d84927f1fb064c42b5b518f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1394:12: fatal error: openssl/evp.h: No such file or directory
 1394 | #  include <openssl/evp.h>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180070
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-By: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bce4fe6d1bc8a71918e3d862ebf85d342bf535b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx8mpevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 82ed68c5a9..2aed048482 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y

--===============1457467349603041003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1457467349603041003==--
