Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB577C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A08B802C0;
	Sat,  3 Aug 2024 20:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXTaDlEivnPk; Sat,  3 Aug 2024 20:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B77380CB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B77380CB9;
	Sat,  3 Aug 2024 20:23:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB0051BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8A5E60611
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZIImnchT26j for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AB39605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB39605EB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AB39605EB
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:23:51 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0D35CB00535;
 Sat,  3 Aug 2024 22:23:46 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 22:23:40 +0200
Message-ID: <20240803202340.372011-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722716629;
 bh=ap9Nwrb2Z7/AElenQOgBhvcq7orOeteWcnFpQQM4cKE=;
 h=From:To:Cc:Subject:Date:From;
 b=Zdg466x0fqOhh4hZ/LssJuKCYaivwCE8m8/Faf3ohL3j6Msx/5GPFPm6Kyb50WqK5
 p3NMpJTymhqTvB8reZWPjiQdgzC0F7T6jqncbDnwpDkTjXLpqeJjb3BCiAe3qvGt+B
 5SzSS014a6iWu2PfCSxYMIGZBD8wupY405fU9CxpTV/YJrb/jOIzSU5WjHwcJ9CMu1
 Q2BQZrRyMRXEM4XW+E42HQctPVnCsX4LuiL0uic+ucjkjbTfUapOnZ4/JkaKVm89RD
 4bgb8mWpLtnAhsQFjwmhrMnYCD1J0WS4/h3XWCzInSOg0vWw+yb4zC04ij8Cv3XE+E
 05PJu8RtYqAbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zdg466x0
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.11.p2.6
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version is aligned to the NXP BSP lf-6.6.23-2.0.0. See [1].

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v49 September 2023" to "v56 April 2024".

[1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-graphics/imx-g2d/imx-gpu-g2d_6.4.11.p2.6.bb

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index d15287ebc7..922fce2236 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bc168b19096a997251e7137f82ffcff404c61709cf5f227c53a099f631569f76  imx-gpu-g2d-6.4.11.p2.2-arm-fd0148d.bin
-sha256  1cedc606be965b01300613ccea81b4fd589d940306bb1caa30a37c41928616ec  imx-gpu-g2d-6.4.11.p2.2-aarch64-fd0148d.bin
-sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
-sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
+sha256  413610ce4730eb9adbde30c8ad4a72df3edd69d84e1154a0c29efa7f33a30663  imx-gpu-g2d-6.4.11.p2.6-arm-bc7b6a2.bin
+sha256  b2e4c580bf887042f479fde7c8b07c6215794d8123263d10ff0c167af7ba5918  imx-gpu-g2d-6.4.11.p2.6-aarch64-bc7b6a2.bin
+sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
+sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 51a49b6972..0a7ee3c298 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p2.2-aarch64-fd0148d
+IMX_GPU_G2D_VERSION = 6.4.11.p2.6-aarch64-bc7b6a2
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p2.2-arm-fd0148d
+IMX_GPU_G2D_VERSION = 6.4.11.p2.6-arm-bc7b6a2
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
