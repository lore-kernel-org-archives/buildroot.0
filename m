Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F98AC55167
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 101D460AD5;
	Thu, 30 Jul 2026 21:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z88wfpCgmAPR; Thu, 30 Jul 2026 21:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27F260B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446410;
	bh=816qtwnNGO5OFupJQrMbQ8BSrq5xCv7PQsJoAuahTC8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iNccIIoV8/098RrKQE6Lx1aK3nG//rH8N1ELYMBRcFk8tMvHyBb4eeKsH5/gA68YE
	 5bhCPMYtGRW4rIpVzWaz8ks+kKE+UZRx8nQtg0U9DCpFPEEuuj7J+Z1ObdHQIFvioM
	 VvIcMlQrz7QhlHjx8GAXiF1TWRa9hv2WIv/Asm6Lmw/xwjdBkCkKIW2oyCk2iX5BCY
	 hqypxTkiizNUlUFLh3zPDDhxoow0wTaA9SoAZBXN4cRRWnSDy55SkP5ZVhLwzMp1YE
	 ap1vP4h2rPYNRW0E7VhCS+DTFzTKR/xE1tfGhqgy4QvlxOI0Ce0fHBACIfnDrBHVqm
	 zrk6jxU8z41iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D27F260B12;
	Thu, 30 Jul 2026 21:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B8FF26C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D20740DB9
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qROwm9lYQq1n for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70DA40DAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E70DA40DAF
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BD428B6C7; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0db3ea93d826d508bb10e2fa0a3a491aced4e306
X-Git-Newrev: 06af6828be41004c4ac0e46008dfbb3a6b415745
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.1BD428B6C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: bump
 version to 8.30
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
Content-Type: multipart/mixed; boundary="===============5756563700243721051=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5756563700243721051==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06af6828be41004c4ac0e46008dfbb3a6b415745
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v58 November 2024" to "v63 May 2025".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 13e9e1a87b..7ec6d7b2cb 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  61f925e606ab020b1a36f3f7f7e459c6847f5b9dbc79421f9ef86e8fc124eb2f  firmware-imx-8.27-5af0ceb.bin
-sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
-sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
+sha256  154b1b5890ddebe45ca280634260a8cdaf38adc5b303aeea28a5ebad504a7912  firmware-imx-8.30-3fa84fd.bin
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
+sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
 sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index f8c9df1cce..8645f6b907 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.27
-FIRMWARE_IMX_REVISION = 5af0ceb
+FIRMWARE_IMX_VERSION = 8.30
+FIRMWARE_IMX_REVISION = 3fa84fd
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION)-$(FIRMWARE_IMX_REVISION).bin
 

--===============5756563700243721051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5756563700243721051==--
