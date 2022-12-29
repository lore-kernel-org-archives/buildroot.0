Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22E4C3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E1860AF4;
	Thu, 29 Dec 2022 19:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E1860AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEBrJ7gCHJxs; Thu, 29 Dec 2022 19:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD04260AE1;
	Thu, 29 Dec 2022 19:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD04260AE1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDA131BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B630240891
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 19:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B630240891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiWL4VlT1jml for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 19:49:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 804C340881
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 804C340881
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 19:49:25 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.174.182])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3489B200385;
 Thu, 29 Dec 2022 20:49:06 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 20:47:07 +0100
Message-Id: <20221229194729.8085-5-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672343363;
 bh=HtWq8u4lYNiyJ0b6Wj+8rnTeQXiPZVXiuCI7eB0jecs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q6ZlVGlj1HGx/URoj7jwszBhPB5fruKuS87PGzrBbkzaJ0GjvDFtBg9vQ4lNiqpIM
 osFyLR1XaG6/f4jHCwOfv1MNHbK+hLX0dzKdwDuVDdr6nabV4/Ca0YKZ8kFM2rmjHu
 cb9Jvi8ixAbzkeQatePbGKjkWJykwOZGBgaoN0U9jN3eM1I+uTtoa7QSuKYIAcs+mm
 p7F5lzVlqRTkTai/1KAXi5voi221UrlUni10CDZbh6fkJfUH/jfsaU/oywA55aWRX8
 QVr+sktCSPVLzlbvYkpp4Gn7O+M/8gBTfigAP/7Vc5b5fYNRm0nIvlRXadD65MbcCX
 /Pajog7pzLrlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q6ZlVGlj
Subject: [Buildroot] [PATCH 05/27] package/freescale-imx/imx-kobs: update to
 NXPmicro github organization
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

imx-kobs was removed from the github codeauroraforum organization.
It is now redirecting to NXPmicro. This patch updates the link to
directly point to the correct place.

The commit also replaces the Config.in comment saying the package does
not have an upstream by the github.com project page.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-kobs/Config.in   | 3 +--
 package/freescale-imx/imx-kobs/imx-kobs.mk | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/Config.in b/package/freescale-imx/imx-kobs/Config.in
index 61be9f26d4..a81842b9a5 100644
--- a/package/freescale-imx/imx-kobs/Config.in
+++ b/package/freescale-imx/imx-kobs/Config.in
@@ -5,5 +5,4 @@ config BR2_PACKAGE_IMX_KOBS
 	  The imx-kobs tool is used for writing images to NAND on i.MX
 	  platforms.
 
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
+	  https://github.com/NXPmicro/imx-kobs
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index d6a250cf72..91b39f6fa4 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMX_KOBS_VERSION = a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b
-IMX_KOBS_SITE = $(call github,codeauroraforum,imx-kobs,$(IMX_KOBS_VERSION))
+IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPL-2.0+
 IMX_KOBS_LICENSE_FILES = COPYING
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
