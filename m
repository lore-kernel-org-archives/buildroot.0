Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CE4C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 19:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D8E982081;
	Thu,  1 Aug 2024 19:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q47Rbrucg4Vr; Thu,  1 Aug 2024 19:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 137D882082
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 137D882082;
	Thu,  1 Aug 2024 19:15:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA0741BF401
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9582F82082
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROAQ720O5aSG for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 19:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70C8782081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C8782081
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70C8782081
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 19:15:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D99EDB0051B;
 Thu,  1 Aug 2024 21:15:20 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 21:15:05 +0200
Message-ID: <20240801191505.44772-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722539725;
 bh=P76KqxsSvfFq7Dn4udDsx0impFtfYCvsUVDGkk7urOU=;
 h=From:To:Cc:Subject:Date:From;
 b=RpNb6COePxoEIUOSBmHq9A1wYTR99+VEduR5xyzwLbP+7yWN8PUANjXkfDEgPlwA6
 3PZqPKxEYcTDnNtizACSyXDqwV5Gku7a0i6aX+0zV5Efy4zWcF4MC01tQu4EuFR5Yd
 U+8U6L4DSNLS0eRFvFZXArQLVBhnRE6MxxoRc85Vg4UsjUWkgJuu0C9BsvqfqJlmlX
 XL+sYEJFrzoaP2YbhqZ31CTRXKgkT3xRQpfseuQVdqt+vGinQzIi3R51Dlaz/SRfC+
 +XEwCbjw+FOS87ozuuYMNdYEHRsumzMThmSXqhOLmSL9TxMGmkS08mPU/V8VqfCAi3
 fDH1f+dRVUmPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RpNb6COe
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx: bump
 version to 8.24
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version is aligned with NXP Linux BSP version "lf-6.6.23-2.0.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v49 September 2023" to "v56 April 2024".

Note: in this release, the package source archive name changed to
include a revision. This commit adds a new _REVISION variable with the
value published in the corresponding NXP BSP. See [1].

[1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-bsp/firmware-imx/firmware-imx-8.24.inc#L10

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index d9443374c5..d606ae6da6 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  94c8bceac56ec503c232e614f77d6bbd8e17c7daa71d4e651ea8fd5034c30350  firmware-imx-8.22.bin
-sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
-sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
+sha256  2e27962332197ebebbb30138f6dfb365361d48d7efa565df97c4f79285b1ca50  firmware-imx-8.24-fbe0a4c.bin
+sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
+sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index c131558c37..8666d76a73 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.22
+FIRMWARE_IMX_VERSION = 8.24
+FIRMWARE_IMX_REVISION = fbe0a4c
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
-FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
+FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION)-$(FIRMWARE_IMX_REVISION).bin
 
 FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING SCR.txt
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
