Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F37C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2183401E1;
	Thu, 29 Dec 2022 19:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2183401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58Bc-xDGyI4c; Thu, 29 Dec 2022 19:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E64334019D;
	Thu, 29 Dec 2022 19:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E64334019D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDB001BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9AE960640
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AE960640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUgmAbXZJQ49 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A444460593
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A444460593
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:50:49 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3D6EC2003CC;
 Thu, 29 Dec 2022 20:50:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:12 +0100
Message-Id: <20221229194729.8085-10-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343448;
 bh=PtPSH5pTesYmVa7izNObxb2pApusacSX6wRAMc+ixM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RuAtPcC2A6si/gSMant8HNUbr3dKkUhCmgqv687hiN8pUjuwbQufMkxffl+Aydcht
 dlDLI0jBTGB9tNKsJa7hTJrZgN8LYCQEZpZvGQL+xnxt2ePwpQDO2zvGCYJI4CH69S
 b4JMPDrx8fk5SOkzVxBzaw0b0cWR69cu7UOQfvvsSCG0zBQoj66B8vDLUsDCbdlFUW
 H4+7AXvGMOXkO/zbiLnQR1pma5G8EeziwQVZX4QkHuOrT/a5OxYjYBeevGFrKuH0Ly
 9tIC9ojOUvp59NKBCTIcyzNKf4lZRD9NT3n+a7Hxp6ZNCef+QZyxyI/E4uwuDqGZ72
 HVvHza4NMgTsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RuAtPcC2
Subject: [Buildroot] [PATCH 10/27] package/x11r7/xdriver_xf86-video-imx-viv:
 update codeaurora URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

Note 2: the _SITE_METHOD is also changed from "git" to the default
"wget", for faster downloads. This is why the package hash has
changed.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash | 2 +-
 .../xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index 5873b4b11c..b79c236478 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  638a8aa8b64f860900d003527529689bc342d18ff5e41a9e1750884544898e67  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga-br1.tar.gz
+sha256  8fe1f57334b22926d4ff3b0b9fdf50af835a99cdfd0ad3ba6a604b226b723e89  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
 sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 0913427542..3b346f323a 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = rel_imx_4.9.x_1.0.0_ga
-XDRIVER_XF86_VIDEO_IMX_VIV_SITE = https://source.codeaurora.org/external/imx/xf86-video-imx-vivante
-XDRIVER_XF86_VIDEO_IMX_VIV_SITE_METHOD = git
+XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(call github,nxp-imx,xf86-video-imx-vivante,$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION))
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv imx-gpu-g2d xserver_xorg-server \
 	xorgproto libdrm
 XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = MIT
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
