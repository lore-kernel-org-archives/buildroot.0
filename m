Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567BEC5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4BB60B12;
	Thu, 30 Jul 2026 21:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gux2CKyMod8t; Thu, 30 Jul 2026 21:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0093860B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446414;
	bh=PLNja09Po5pZ493unodA5o7y2lmW1/hkH1h3WpdEUL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H8pZlFSobzMY6xlQTP260lcPWkddd48E/6B4Dm/+sfHHIeuj8jmmpYwDZaXdnntID
	 ceRnohoE+Q3LePvI2JhR1B+i3dDKgfSnkhKABr60NSofuoFI9EnWV158dvGv8ZHXEF
	 VS1WoEXaGvyhkcSwt8crbDil5yqB+wHX19tgDhg1PPP9WaabNiIh8I/rZ67It2qrWp
	 v4Y97LOPJzTseAvs3AhP8q/feC4mCT3Jq1KvX+1PrJ99yU4ixB2AfniURCGgAG8DxI
	 mYCKXBmxqEFYBeFEnxKplv8yqg1OaG8e4a2KKvze1IxLAPjsdfLD/hkvSyF/Xr/+ro
	 Ku7sMErtqdZaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0093860B30;
	Thu, 30 Jul 2026 21:20:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D42F926C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5D6560644
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDBj0t1qRH-e for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 054D96064F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054D96064F
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 307228B676; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a6c7e9b703cfe0b1a0e2ddaaa32379932968cdb
X-Git-Newrev: 2fcef2ee2c98aa0ffdcc4d6cfe1b190ccdb9d801
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.307228B676@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump
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
Content-Type: multipart/mixed; boundary="===============3142604226274924114=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3142604226274924114==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2fcef2ee2c98aa0ffdcc4d6cfe1b190ccdb9d801
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v58 November 2024" to "v63 May 2025".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 7b4fcedf4a..7f7320ce21 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  fe8fc231f18047b9547a038e111c08e855760190d0e9848ead22b383d793499d  imx-gpu-viv-6.4.11.p3.0-aarch32-c600d03.bin
-sha256  82e1bb6304d2aac70c72b691239d1bb5f6738cadfa812d07196db2f580c63d29  imx-gpu-viv-6.4.11.p3.0-aarch64-c600d03.bin
-sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
-sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
+sha256  19a6377c817e0049f8b6bddb78badc18adccb2075429c27c89aee95d44196113  imx-gpu-viv-6.4.11.p4.2-aarch32-846e12e.bin
+sha256  aa120f37d9010fbddabc60387300fabaf43b2cf30894b6e7b5973947ec6bbe62  imx-gpu-viv-6.4.11.p4.2-aarch64-846e12e.bin
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
+sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
 sha256  ab20fa3f527fce99087d8d3cd4e2cf4b9cfdfaaa98b3d766a2b5953a981323d3  SCR-imx-gpu-viv.txt
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 8494e875e2..6c8a3aadb7 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_REVISION = c600d03
+IMX_GPU_VIV_REVISION = 846e12e
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.11.p3.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.11.p4.2-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.11.p3.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.11.p4.2-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION)-$(IMX_GPU_VIV_REVISION).bin

--===============3142604226274924114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3142604226274924114==--
