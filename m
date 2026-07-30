Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01246C5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8A560ABA;
	Thu, 30 Jul 2026 21:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vs3QCsrD99Wr; Thu, 30 Jul 2026 21:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525F160AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446406;
	bh=rAn69xGkNXK69yvqGLUXkqWkU879p9zKso4TXU4GVjc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cEd3ThQQ/zUNeV5Mmi7Q7hxnqxpmEXdPleuqtC1BvI03ls8KbtTmOdd6hkHfmSeIr
	 KjOVallig+jKbfxnNIriaI4HA8BDbDGGvuS47o4LqAFRL7Nt8iebKKKIAd93yFlK8P
	 +2qfzN9CxPhOk5Kubf0JdOqZHvsM5p00EEj5aV8G0/Thh6HV1Tk3uevz00mx0z94Ex
	 T61D8hGvfzzZgkDyaIjnF4fYjpgHEUO1p1H5sJh3SyCdHNNz4xH4DfXX6sm4CRRV+y
	 x0IM05JoUto+FykCUC0BKjLBNdXiXbo1CqxgfLa5+iLo18sDlVFrBn8p9OUKVNazMO
	 1DuefsGvtsUlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 525F160AD5;
	Thu, 30 Jul 2026 21:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 068BB45B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9F1A8115E
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yiVRqr3UZ_0 for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23FB9811E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23FB9811E6
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 508CF8B6B9; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e2b38c890cc73dff6b9e79093df644042d14e87
X-Git-Newrev: 2b4e9e0859d4c3c69c78835c0b68a2327ff3ce7f
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.508CF8B6B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro-vc:
 bump version to 1.11.0
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
Content-Type: multipart/mixed; boundary="===============7790653112160958409=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7790653112160958409==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b4e9e0859d4c3c69c78835c0b68a2327ff3ce7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v57 July 2024" to "v63 May 2025".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash | 6 +++---
 package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
index 1b1447c34e..12eeb2f214 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  713ba375f25490727fcc62bab5d5508f74de03204b4c153464b696b652c5c7df  imx-vpu-hantro-vc-1.10.1-c0244a1.bin
-sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  COPYING
-sha256  c3d9a7b2a5a7db5da690e9c1081b98b665802c3efbbba7fb237339395a92f607  EULA
+sha256  04d2a9c5c75804a11a4500a0133dfc7d8e84f74254cee52c42075f5ecc229550  imx-vpu-hantro-vc-1.11.0-5e18a84.bin
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
+sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
 sha256  a6f0297ad8ab4906229957c2c7c4bf825d543d99ffb5bdafc2de5a8d884eb88b  SCR.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index b28e61bd8a..0e8e2dc860 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_VC_VERSION = 1.10.1
-IMX_VPU_HANTRO_VC_REVISION = c0244a1
+IMX_VPU_HANTRO_VC_VERSION = 1.11.0
+IMX_VPU_HANTRO_VC_REVISION = 5e18a84
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION)-$(IMX_VPU_HANTRO_VC_REVISION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux

--===============7790653112160958409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7790653112160958409==--
