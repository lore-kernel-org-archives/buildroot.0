Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87245C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 10:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B4E6085E;
	Mon, 10 Mar 2025 10:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPHm4o_Qfk0G; Mon, 10 Mar 2025 10:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C84F607CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C84F607CF;
	Mon, 10 Mar 2025 10:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3870DC
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2051605BE
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 10:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHoMkXs1AR9L for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 10:54:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C311C607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C311C607CF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C311C607CF
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 10:54:09 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.124.30]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1tmu4K1kFX-00SyYp; Mon, 10
 Mar 2025 11:54:07 +0100
To: buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon, 10 Mar 2025 11:53:49 +0100
Message-ID: <20250310105350.2848707-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:l6UaYzhl9eG9gmL0QRtRKjILFys98orY4a6F/3AvRbjCefdQDX5
 b/JPCmRzIEAMW05799QLzrIz/sNCBo3AxxcjqTyjDQJ1x6Ad8LVq7foSQnPTcu4c2jEq//i
 w0cQfn2Yzfav4VJ/1QpHxMOuNO+LzTO2Wn6r6p8Ul0Co05FN/VkI7pwJK5ggzg32qC5Xsbd
 SEVdUUyvM70aNFscW7Dgg==
UI-OutboundReport: notjunk:1;M01:P0:4bbpJ33V5Uo=;DXVS9Znlv2UXhQvw4YQZRIIo8Bi
 lFG05642AhIQGDXXt6b3GN+gY/SNRNwUEvbaR9f32dikIxWdewoteK+Se+vhieiZVb0lq+PdJ
 M3UiNfPVI6mXSfU9C58mbAvJvKSlCaLA6asNH39yNAsD9IXj0WhC4L8wZrDzRRoPWhsnUGeh7
 aLeLMYEsJCGBzSBkFRYVOMpSnuC6/8Mb9Hj3AwFP5gD2xQzJNKlgohebsZ4o3dWq8f9sovlsr
 jTcWmCR5sA1dQOUDiVeMxHMmLPTiGZEILkhpOErqHSDI3Gk9abwV0U05yuS5FH3w8RG8tNrs2
 l2aXVAXy43QYU8oiHEme7W+GPpD93Ha1biBoG1Cg6WBG8407p65TAjGW7bpd/5oNNNFvaokWU
 OPyDWyuQm2FPw1Ab0KPv+e2Fx6kxcRX05Qjku6HPdsBQ5iiW/WQppyID0GehYQg6VFcluUdpb
 zx3wMZ7fEkEXtcmO4HT8ZWhamqMXYaYzwN+8llaiqksNA2vHdw0P+0tSqrxpwnmf1fNyffkUK
 Gj7nJBHvnyurtFyYU7vhJQxDv9mwQBIynASjUWCARB1sXSPc//15D0Cv09pcprgc6+/BLxFWj
 aj8Cn67Sdq5QWKu61qy65IWoDbYNcdgnu5bquI/5HCZnAr8L74Whj2lTH5xqsHxGDjTSG1mG9
 Kjhw9mHSDp6BZjlaYA/w+y2CEj1YAFDUrAgLa8dIpJpZeqJkFiyVaboEGMpbjbLEp8sSx7XjH
 5s/9dpzknNwI3Mr1EgqsKfX2rOsCctKMDM/pY7K+7QeW05S9HshTkC7bo9lIMYWpVfxHgVewL
 uUhc2Jt6kacPE1NQyPxKkyalQ+DlmS9QwEQtg4bhKeBGCq02zUPVomXRVOqm1380i8Kru5quJ
 RMiTfsGd1jEa8C+sSTZWDRscP7ooJE/+mzZlOI4F8csCxWblhGn0b8Zuoj1bBD+cJTFAt2458
 NpdVI+ZBKmc/B7Cqu5rdxsKO6ZVUUCowhx73Z6A9aFoH36A9JojzMbwgwb4wWUy3EM2apRWHw
 C/qEZ/z5jiXAiQHjLZxzEuT/twaH5vmqY3J98yVIKyEqFYbl67qNZRlHVZhcmpua+fVbvqjrm
 48jp0dJ2vCUeW2Q6juqBKxSR0GWrjImDQ3+Xr+vWbcXLdRongD3HR2CG3XF34kaxgf4EXYwbT
 iqe5/7Dz30DJUozfziLISd4TwM5yQBYKQQNE4lqb9z6viKH+TYom9boDubt9ksMno3JR6Frs6
 8gdTzTQbomSVtLyzJcLQ0bjpy+OR700Cr7stN+r80VJOOTbRD9Xs4QaVeJ2eVSZfUC8l1lGqF
 E/UIWpTGI3OcMs4pAeQdX6DEJb7HMel4ie5b79iHIsshtfFMzZJ5BvmfzRZT0lSfNynUzs9QR
 fBFSPStw47YY3BIIozX44sjd7kNfN5DsJCXHZQEXJlDJtGcLlq9ezVlcuXxpYkK6+FXx9CWNk
 4QW+PNw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1741604047; x=1742208847; i=fiona.klute@gmx.de;
 bh=nC092Bh0b087jIUqyenGtEK1stw86VdbDftOVrvcJuQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=h86n6iTTGm7SVWyvvolvAalF7BXiUckDc/ygqLRifqQNBz3FzoSLeP0ReuINgf50
 DAzsjKaIgEUxXJsSsKZeJ4mR0LgTiJdbOOT++SZD/y95hiIy1nxWqgUw90a4VGnsf
 otBkJ5kihRmx2XUfzEGnx0KgXxxiij2vrSx4TypDN2bxOEMNldL81u04DMt7+Jaja
 zz0pL3rcDUBACW+BXsviLAcIUpxO2UYRoTSsEehykYSyrvgse4gexaU4lK+ukgp8f
 YnZ/U84X8CXNMuMa12/Oqd9F9oWeZDX77+zqRIQNmNGrqyEnLzJFuxivAPo5VN/Is
 XcZjXCd3jKR50QrLMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=h86n6iTT
Subject: [Buildroot] [PATCH v3 1/2] package/mesa3d-demos: depend on
 vulkan-loader if enabled
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Vulkan support in mesa3d-demos requires vulkan-loader. Without an
explicit config flag it is autodetected, and may or may not be enabled
depending on build order, leading to unpredictable results.

Fix this by explicitly enabling Vulkan support and depending on
vulkan-loader if BR2_PACKAGE_VULKAN_LOADER=y, and disabling Vulkan
support otherwise.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3: Add this patch to reliably enable/disable Vulkan support

 package/mesa3d-demos/mesa3d-demos.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 8acba9270a..cc0121f6d6 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -69,4 +69,11 @@ else
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_VULKAN_LOADER),y)
+MESA3D_DEMOS_DEPENDENCIES += vulkan-loader
+MESA3D_DEMOS_CONF_OPTS += -Dvulkan=enabled
+else
+MESA3D_DEMOS_CONF_OPTS += -Dvulkan=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
