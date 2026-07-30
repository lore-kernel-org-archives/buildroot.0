Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C7C55167
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC5ED60AB0;
	Thu, 30 Jul 2026 21:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piPhLGEbhkiK; Thu, 30 Jul 2026 21:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A1360A89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446402;
	bh=jHMxUajbPAz3JGZuSDvDq1+BPYFDmo0Bd1Zn4xbqYWY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b3HgUHHqjp+1hwhtsdK5IsYp7j2WMYkkqCeS5N4E60gLq5B/SY0qz5ySATy513FDw
	 93E5SGr2HLx2U+1dEhUepP7WKJROsYnsMGjLoXRbPtKOfuNT5l+9Zd+FKH9SGWXVMo
	 +ZK0Kea643+t+8q0izH5YD1rKKfPnT44Fb8AZd1CzGmPScNo4XEp3/+o1u+NH0+Lrw
	 //BS2w6I2K300ElVBb4QJ1xgux7qpbIhX01ek+uxHus1gt0O0Qz8SGIhQwMhwnfoPw
	 9uP1caCCBrJX62S/IES/LqH++jqMqD8P9aN3CiY6iGTBkYre8zWEKDzEgRVEq47n+a
	 exbbZyjZ6lDow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A1360A89;
	Thu, 30 Jul 2026 21:20:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEDB226C
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBDEA608AA
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Am2XWBbIM8RB for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1C7460644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1C7460644
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:19:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10CE38B6C6; Thu, 30 Jul 2026 21:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4140720904763fac42863708acb6be355a23e663
X-Git-Newrev: 0db3ea93d826d508bb10e2fa0a3a491aced4e306
X-Patchwork-Hint: ignore
Message-Id: <20260730211915.10CE38B6C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.4
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
Content-Type: multipart/mixed; boundary="===============9197552811475330680=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9197552811475330680==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0db3ea93d826d508bb10e2fa0a3a491aced4e306
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version is aligned with NXP Linux BSP version "LF6.12.49_2.2.0".

License hashes changed because the LA_OPT_NXP_Software_License changed
from "v58 November 2024" to "v63 May 2025".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com> # MX95-15x15-FRDM
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash | 6 +++---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index 55e1864e31..f064ef1830 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a2f16e43e8aff9cf018d0962b70313940f77079b314331ab3980c4c5f44249cb  firmware-ele-imx-2.0.1-0a66c34.bin
-sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
-sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
+sha256  c3ae4a1e1a41da441bd61483ef011ac24bf624aa6bad36f879b5dfa435647b4c  firmware-ele-imx-2.0.4-93492e0.bin
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
+sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
 sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 8f25f4b5b5..a844ca0d94 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 2.0.1
-FIRMWARE_ELE_IMX_REVISION = 0a66c34
+FIRMWARE_ELE_IMX_VERSION = 2.0.4
+FIRMWARE_ELE_IMX_REVISION = 93492e0
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 

--===============9197552811475330680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9197552811475330680==--
