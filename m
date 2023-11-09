Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C95DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB9BC42090;
	Thu,  9 Nov 2023 21:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB9BC42090
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYaRffyTKAo9; Thu,  9 Nov 2023 21:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDD9420A1;
	Thu,  9 Nov 2023 21:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDD9420A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30211BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F1883294
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F1883294
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6IJ5VedvQTZ for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:29:05 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FF9D83281
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FF9D83281
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.114]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MEFvj-1r8ei03ygX-00AIu2; Thu, 09 Nov 2023 22:29:02 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 22:28:59 +0100
Message-ID: <20231109212901.5596-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231109212901.5596-1-ps.report@gmx.net>
References: <20231109212901.5596-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vCex5rxuOBfFoq74GBa24PrsDI1M3oiE50+cNaX3SexRTbjDZRv
 UE+5qxwcf8Qr5ByerKgkYq9FGavkJEZ8quWHd51Y3nScTu66aNriMAIoFHBfiY2HoZzt5Q8
 vrd3l7Kz57mT3VN411KwCjc3gINYJlaWQ2SeDHKLU53FC1kjgUFvm4J7SBj90N0kYSr9MQx
 0woIjAQSUitTyqDypFNNw==
UI-OutboundReport: notjunk:1;M01:P0:VM4oTBo3XKM=;3/ZT550SZG2qn/m1hyYM6yYVewf
 Jt2oXOC/oxS8N5mqSEyLutWBBQwxyn1ma0Snt6MK05x5qmf/7g1bT+8v2gJG4eLsplm9rqO69
 Kq8CjPY5S/LiA76sxjapfxKKtUvzoRNrQwkJeHK0AyrYnKtY5PdR2COV/FeBsmIh9IIm9Bay+
 i16M+XGkzyvOZAdCA+6e8jgmAAIuA5zIXsGLUA89TcbTd/9xfUylQtvITZ1aIDoVLqnzZq6G4
 eKgSA3Mgfhh/LXKkzIWGJsuygS/ElJJGwAclIWfgGpXLVxl/5edKae1slqWOJfYWFSJZEpX+l
 KJ7Lo3JKadSUTKmkBYnL9W7/CDOC/naxqW30irdpYGrwIyQmNFJRSyPQjKo5II/rQ3VQ9Wec0
 IiRBBI4PRoyFltLU/lO36T0l4kXPaZpijmRwj+AZi/FQWYK73rmhV1A+bJ4sLuppPWxzJ0XCW
 cKhI4B6bIFDQRBz9AiizDET2R74g0pL+iF4COg1Ibo9CDivHAObWBy2CLMJfLjRPonRXkm1xN
 KLoRw/Gd08VaegNB20s9Y8pkdKaIWiu/8UL5ys9/bRmFJ1whqsB2+0NHCL5Mp2djj8n3MhlWE
 D/PtfubxBlM89tZhW8nm4RfrQVNvU3C+JdQLXaKLEyiTPIc8OukogssqZ6FC2CBBuTR9C4qlg
 GnyS5j1zO2vpUIspFBqv+Dm3dsoA7kfNldtb5EMnhd+RcBNenDr3Gl2+XBh1+3yCjjJOIuLMY
 y4nvtCx9D5GgkjX2+QeW6jYLUX8ZSMXFqDt3X1mSTjNJ5O2BDfwCiWpLk2EvTGXuweKhyqc5m
 83u8EeV/vZmflTDfXGrPH5S/pgsi05Ij6BjPBvw59euldDgzJr6LhP4r/w5uEv/jTGVLikuur
 eaZxwQ6tHt3lb0cNftG4lyZ3vgoSY3N+RxOBibiHLKUGROnztOJhN9XSJ6tase/xoonly7EFH
 XbFb8w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1699565342; x=1700170142; i=ps.report@gmx.net;
 bh=x+Jek/hrh57KfKofxSqB1Mw+tegFOlxo3depp/jLGqs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=U/rOfLAn+Y5ZJjx91lx30XyksxhvLC8IIMKIdEBe+np9GinPyV3t/uh156EMBFnr
 txB4Nwkgfx+RNh8kFxYDuoP878kAO7OI/IV30MUIg44NirgE9isOCctAwe5Vp+5xP
 pu1Fvq2iLFhBKW9BFuZG2RLADqrPOIwDrOCLZleVcw3ME7i7uBZGgy8gylCM0JUin
 vD53KglVIfUbaTfX8CtWW5a7zckuHQjrucpLvpcOCd3S3n0/tYD1u0vz30IrWinx0
 53ZoMlwOr2GT0yqcdp5tUo4sS6VMhcldgC/6jqTxkk6FTptHWUtfVgmCjmPeBKT+P
 ACJyxgR6ClVtnorRWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=U/rOfLAn
Subject: [Buildroot] [PATCH v1 2/4] package/libcamera: disable python
 bindings by default
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable python binding option (introduced with upstream commit [1] (since
version v0.0.1) by default.

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=8aa02271fd716ed046970a0b1f89176963303f50

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index c1c8bb7b33..8b33b9e708 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -19,6 +19,7 @@ LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
 	-Dtest=false \
+	-Dpycamera=disabled \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
 LIBCAMERA_LICENSE = \
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
