Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE15DC5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BB460AB4;
	Thu, 30 Jul 2026 21:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rk1UbYYMItIR; Thu, 30 Jul 2026 21:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C8A6064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446401;
	bh=mS730HTHaRxWFlE2EUQ1lojIc1T5sRAkQAO9AgsE5pw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SUXHw/BxI61USWqROaeksyQ5Mmn3NSXFsnR30LIcUDzahNt4Gwde/iprP9jlHMpCI
	 4Omj/WTHTfPshtW1IYIRMr1oLwv9sPBetEZ4blm2ePynZAPWJ/7bFZQYeTmGrFDz1D
	 kzYPzCVgnErOJahSQ7HbuCgHGukjoxLqPXBanhqQYEW4g71N8UFdMBa8dMiLJahdtm
	 lwdMf/DK+uWM0d41Qr2vV8vjvqjVZlwup0OzK0xrBi4Hg4atY4CjeFlo7ZeYS8+oc7
	 2OHitx6tnXjDIQSqU+1QMG9JudqsnZkwYYkVCjrCrEmMvkZtF2HiD6KUxN68BnXutX
	 Zv29NiGM8Zdlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C8A6064F;
	Thu, 30 Jul 2026 21:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E675C37F
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBBE1811EB
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXbU96UfoNXX for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4E18115E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF4E18115E
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25E1C8B6C8; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06af6828be41004c4ac0e46008dfbb3a6b415745
X-Git-Newrev: 0a6c7e9b703cfe0b1a0e2ddaaa32379932968cdb
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.25E1C8B6C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: bump
 version to 6.4.11.p4.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7206588747225953656=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7206588747225953656==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a6c7e9b703cfe0b1a0e2ddaaa32379932968cdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v58 November 2024" to "v63 May 2025".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 4bd83090a8..58fbb72aab 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  e6c336c0b876efab7598a2d7817111772284487f646d5d83c400692f2cdfebe3  imx-gpu-g2d-6.4.11.p3.0-aarch64-c600d03.bin
-sha256  6e1a42f2c570582b8038d1b5c86dbdcd645e75cc10a1db23e716f662d1c1329f  imx-gpu-g2d-6.4.11.p3.0-arm-c600d03.bin
-sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
-sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
+sha256  3530120f1f79edce525742bf5ea271f70007d5291a015e2518a55925992b6023  imx-gpu-g2d-6.4.11.p4.2-aarch64-846e12e.bin
+sha256  3d5b7d8f3760e0032aaabd2878f67e2d8fd88373af2266b0635689e799dafa07  imx-gpu-g2d-6.4.11.p4.2-arm-846e12e.bin
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
+sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
 sha256  3f3b817ca9490fbe89a83395a0961122aca138bf43acd869c6ca086502a1e131  SCR-imx-gpu-g2d.txt
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 4d29974db1..272f429c11 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IMX_GPU_G2D_REVISION = c600d03
+IMX_GPU_G2D_REVISION = 846e12e
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.11.p3.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.11.p4.2-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.11.p3.0-arm
+IMX_GPU_G2D_VERSION = 6.4.11.p4.2-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION)-$(IMX_GPU_G2D_REVISION).bin

--===============7206588747225953656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7206588747225953656==--
