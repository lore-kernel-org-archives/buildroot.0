Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77A4C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D048607F7;
	Thu, 29 Dec 2022 19:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D048607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5oTL-Hjrcps; Thu, 29 Dec 2022 19:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9515F60B1C;
	Thu, 29 Dec 2022 19:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9515F60B1C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6201BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734B760593
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 734B760593
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wV9ko1ORZQcM for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:49:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FC9060B23
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FC9060B23
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:49:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 95B48200401;
 Thu, 29 Dec 2022 20:49:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:09 +0100
Message-Id: <20221229194729.8085-7-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343396;
 bh=TusFcioa2k5hF/brTvFK1HVEJx1F/U1AgrBpg3QjqcE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MykPOpA75yXfxRRpFjrNAACqynxy3ZcFmayhDTqR9cRS6/q7NLcP3xAO2FpaI18lQ
 14RmOpBINuS2viqb3lZPLlXtNlr2t206fduTRVABCCn79cQ16m5x8BZT2N73Gn1fc8
 MHxiGscNTRV8Z5YP79dmoIR2axE2uE/CVDBm2zG0U49xWH8SB3amr8e4Lx29lueqtH
 GrYMjhLmh2I9j5eizNMkx950Jd4+hEd9DFVNFCPZ0eZ/rUeUrNF7w7vFVMd3TMGIGB
 xWUmVRmgB6wSDWuPLj8EIPdhLerJrSbrJYpGhe8MBOmpVSVkI+y9DkDGgJnHnxgph8
 8d360sFCk/Bzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MykPOpA7
Subject: [Buildroot] [PATCH 07/27] package/freescale-imx/imx-m4fwloader:
 update URLs to NXPmicro github organization
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

imx-m4fwloader was removed from the github codeauroraforum
organization. It is now redirecting to NXPmicro. This patch
updates the link to directly point to the correct place.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-m4fwloader/Config.in         | 2 +-
 package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-m4fwloader/Config.in b/package/freescale-imx/imx-m4fwloader/Config.in
index 937f82f916..d75480a708 100644
--- a/package/freescale-imx/imx-m4fwloader/Config.in
+++ b/package/freescale-imx/imx-m4fwloader/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_IMX_M4FWLOADER
 	  This package provides a tool to load a firmware to the
 	  Cortex-M4 core available in some i.MX processors.
 
-	  https://github.com/codeauroraforum/imx-m4fwloader
+	  https://github.com/NXPmicro/imx-m4fwloader
diff --git a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
index cc4849330c..320d5dc617 100644
--- a/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
+++ b/package/freescale-imx/imx-m4fwloader/imx-m4fwloader.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_M4FWLOADER_VERSION = 8cf4d17a09ba23250d43381b49ba00d92406fad9
-IMX_M4FWLOADER_SITE = $(call github,codeauroraforum,imx-m4fwloader,$(IMX_M4FWLOADER_VERSION))
+IMX_M4FWLOADER_SITE = $(call github,NXPmicro,imx-m4fwloader,$(IMX_M4FWLOADER_VERSION))
 IMX_M4FWLOADER_LICENSE = GPL-2.0+
 IMX_M4FWLOADER_LICENSE_FILES = LICENSE
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
