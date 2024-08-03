Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633A2C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 14:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4CC606A5;
	Sat,  3 Aug 2024 14:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmHeR9ciVkgZ; Sat,  3 Aug 2024 14:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C39E860626
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C39E860626;
	Sat,  3 Aug 2024 14:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE261BF376
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 14:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A3E7812A1
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 14:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlfZQLvxL0dS for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 14:25:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6921880E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6921880E5D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6921880E5D
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 14:25:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0A183B00619;
 Sat,  3 Aug 2024 16:25:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  3 Aug 2024 16:25:40 +0200
Message-ID: <20240803142540.3241396-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722695149;
 bh=9XiC0XXGseXh73VWBmvHrv8tKIL8QC2jbhE3TxjA4os=;
 h=From:To:Cc:Subject:Date:From;
 b=EnLNf+PK+pQayrAXzray/XHm7TS5eDjwjyvq6CUZ46ClOSOjPjfEX96/nLHgUpSIf
 DJUYjkCYjvTliK+yUr7o0eVLFRfdjsCgLVkdR3JJjsQZk0aN+KPxrLpEQbXPSruk7T
 bXJGb1x83EQ9QGAC9zT2sdbGBcKxuiTbNrkS4UzPRBChsoauP+tGz3/VKdQPxhg/pm
 rSBFn3noqcODTsEF9Q4dDtejQj0bDwO/+lriMe72eTfeRdUG81SaPf605ZhD+tjIMm
 /k1sdYK0q2LU3XOt8c7d+WE+1bjsiRUPV8IiAk6ZNjanhH4UyxQOrPp7Xdyc/dfIx6
 qBh0EMhKEkSDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EnLNf+PK
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-gpu-viv: bump to
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version is aligned to the NXP BSP lf-6.6.23-2.0.0. See [1].

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v49 September 2023" to "v56 April 2024".

[1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-graphics/imx-gpu-viv/imx-gpu-viv_6.4.11.p2.6-aarch64.bb

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index b350443a51..cce08e2727 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  15efe6da5d4bac2a6067c2a898190be8754df6f14128c3db4756cff59c6da049  imx-gpu-viv-6.4.11.p2.2-aarch32-fd0148d.bin
-sha256  6e34f3718925ba37c362cd09a3228cc56d03cfad323ebae0932f64449dbaeb2e  imx-gpu-viv-6.4.11.p2.2-aarch64-fd0148d.bin
-sha256  24d7cb3a7e51011466a149bd99acf89387b832be2d0890ce2e183dfbc9d7cb84  COPYING
-sha256  3282d88fad766897f93b0827297a70c2707d9358db24cccd5777abf7c997da77  EULA
+sha256  cf6e42c9c9a903cd933b767d411131390d237a4b92ecad579db57d54538707f3  imx-gpu-viv-6.4.11.p2.6-aarch32-bc7b6a2.bin
+sha256  5fe828113b9b2801b3fd60cd15eadfd0ac747e5897ef7db7fa22f80e7dd8a8e1  imx-gpu-viv-6.4.11.p2.6-aarch64-bc7b6a2.bin
+sha256  c9ee518510d72e254d62743f5098163eacdb6428c6ba4d8119afe2d12edba068  COPYING
+sha256  165f6c0eacb4d3a05289dfb79331c9a2c05207eb7a67ef28a117f246a0145428  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 3cfbfe3ccc..a559bb7478 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p2.2-aarch64-fd0148d
+IMX_GPU_VIV_VERSION = 6.4.11.p2.6-aarch64-bc7b6a2
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p2.2-aarch32-fd0148d
+IMX_GPU_VIV_VERSION = 6.4.11.p2.6-aarch32-bc7b6a2
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
