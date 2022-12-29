Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567E4C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE178607F7;
	Thu, 29 Dec 2022 19:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE178607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESX0zarJDgQL; Thu, 29 Dec 2022 19:49:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E615F607B5;
	Thu, 29 Dec 2022 19:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E615F607B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 436441BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B3EC4088C
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B3EC4088C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFX5BWHLYy5r for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:49:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07E840891
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C07E840891
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:49:07 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C5F722003C6;
 Thu, 29 Dec 2022 20:48:48 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:06 +0100
Message-Id: <20221229194729.8085-4-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343346;
 bh=Svh9iGEf7quLMUsMAlmxoTsfA1dFeWAvAwSaH/1mZTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bd+E5DyOIk/eJ2auTscJALtv/4V6qKFhQydbg574UL1roXtaB+p3Y96diXbF1Hio1
 Y1Iyqg9EzsTL5eLXDMddDHgFiz23h7QWXOUSM0eweb08oxX+kZZwu2LMe5LnAYD+Wp
 NTSXDLkWrEunYf/0LUNnOJFqoWtOH+tMaup2dv0X4zuijynkUO0vHx5LY+LXQtrlB7
 CnDUDkfwrVRMmRpwuGgscXq6A4E0QujXioCV10DLmQJ6XvHbWf5G5xOCJXvqcT9CHE
 86oCpyB/tx/VTQs3teQ78hj6XSTkUZsbVx1DHnoarqXLngGCtT57xazCyiJQiUJxid
 V0LhzsRGmKGBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bd+E5DyO
Subject: [Buildroot] [PATCH 04/27] package/freescale-imx/imx-alsa-plugins:
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

Note 3: this commit also adds the github as project homepage in
Config.in.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-alsa-plugins/Config.in             | 2 ++
 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash | 2 +-
 package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk   | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-alsa-plugins/Config.in b/package/freescale-imx/imx-alsa-plugins/Config.in
index ec9b5b19cf..df47edd16d 100644
--- a/package/freescale-imx/imx-alsa-plugins/Config.in
+++ b/package/freescale-imx/imx-alsa-plugins/Config.in
@@ -13,6 +13,8 @@ config BR2_PACKAGE_IMX_ALSA_PLUGINS
 	    * Rate Converter Plugin Using Freescale ASRC Hardware
 	      Resampler (i.MX53 and most i.MX6)
 
+	  https://github.com/nxp-imx/imx-alsa-plugins
+
 comment "imx-alsa-libs needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
index bb7beede9d..1ca7697f03 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  a9a5ef408a7329c2c5fa2a084ae7824afbfbebed68612bd72509488ccb0b94b3  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga-br1.tar.gz
+sha256  089bba009f82bf5e4a1e34b77a7d3badce2948619d92bec7a7ad42e766442d4c  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
index 9c81ff0df0..912cc7c68b 100644
--- a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 IMX_ALSA_PLUGINS_VERSION = rel_imx_4.9.x_1.0.0_ga
-IMX_ALSA_PLUGINS_SITE = https://source.codeaurora.org/external/imx/imx-alsa-plugins
-IMX_ALSA_PLUGINS_SITE_METHOD = git
+IMX_ALSA_PLUGINS_SITE = $(call github,nxp-imx,imx-alsa-plugins,$(IMX_ALSA_PLUGINS_VERSION))
 IMX_ALSA_PLUGINS_LICENSE = GPL-2.0+
 IMX_ALSA_PLUGINS_LICENSE_FILES = COPYING.GPL
 IMX_ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
