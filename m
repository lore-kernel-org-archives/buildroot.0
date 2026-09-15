Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B131C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F324C40383;
	Tue, 15 Sep 2026 21:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHy290dCBT91; Tue, 15 Sep 2026 21:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B64F0403D8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789508689;
	b=gfznzpYfqvq+kLVeznHk6iKGSjKEKqm+JvRc1SpxEOTWK8Sn5vpOJr9HCloaXX+At9/N
	 j1S3xox3sAYV/6TTWGdlmOU9agrCMifiZIOTohz4dw23FFNzRpILkNWDfHI9iQi1zr3vC
	 ujK3khQnl/Umujh2hfg/PrhN8yL/tIX4/saWNcAAWrUQrS/whZSY0LoRkP7AbnZUkN7m3
	 u82sdJdrpFJmgkEhekyQahyzn59dPa8tU+lVVo/4Mx/O+9Wskx7nnobupDCWhiCtPvZGG
	 dM+hA3DwTE2bBd36VwS1tktDXRpmn+A2hVe5plBUrJYsS0g8N1jV/Ib/UNlDPq+71Fw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789508689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=WOBWXGmKdbwO4z6O9MwxRyRo40TXrHOr2vvfY/3cyqw=;
	b=OV5aU26Sx3+lG8LYJi3HKypsa+0kjzKgwbRKQBcFTlH8f2qjf/k8oiHd5KkhUFRlqxh0
	 J9i0v1VMnXANN4Go4AmS/zYpTR3PsvjigdRxLNfL+RIEwF+4pRuOpiIV/UWwjCTHREzp7
	 LX6ua9FyXxWeyMF6CCA/ZrDSBHkG6/dTsFeyaWGEFzquw0hIjCdqSg6JfSqLn1ruKk/Uf
	 V2OkIK1+etk/JEc2nyWqgCgdm+T2udPjauJxrnHDoS4xVKeCLLiu3ZN50FICbS8zh87+i
	 3IBlZfDMF9WHa98FCxHrDPwe/jZuH20b3sg5T6D7ssylCVtfo1Y31to44uzgunTSPSQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789508689;
	bh=WOBWXGmKdbwO4z6O9MwxRyRo40TXrHOr2vvfY/3cyqw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kwx4UObf/B6uQpjc1x294bNvg/mJkQCLRHMBMsIxtFBCL5C674vHXAJhXr/icI0jr
	 R8xRclWWyFspPfVJk2BYsjI/qx5iYoZFlWP/dvkCK/w7GQ1Yz7nWgy4UNRa3dOhO0G
	 BGoaJG9soMChXRvMpoEbmerJrrrObBkRwS23G4j49wsZzrQd8XCMgrid8eWG9h0pkN
	 /4bDaUVR+eHg/SyczF8a4sMO+47CjPSNFjQwPDrZ64PPJqmfodceBoGEr42QWt79vd
	 8kDLaK+9kaDDb5ecPZfyuIzDhjH8wnvNhtrcoV2T7F7wWCr2QKF9cOCHqM7J8HL/8j
	 KVcyVeZA0yorw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B64F0403D8;
	Tue, 15 Sep 2026 21:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F8282E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45BD66060D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kR0YvobNH4e for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 21:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F01DD605B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789508687;
 b=ohnXWCLZDq6oLqPiMGJTvCvXMFDglVLEW5jJXLRRJngKMqD7NJRMqK/ByBa86WWKobIk
 Z8jr9RKaccdSmPHEMdpAHMHQq7v7fmpCtb2tgUZ6xWQ8QU9O/WCCZr2sQcXdhN6CwaIDm
 orGdVDYxxy9iin/BdVi86dhGGVvB2NoUTNiBaVD0rrv3yyXHUgxyecERBaIARrQWcuzh0
 vMjdA/eVkWenypXPR9rAHkXWU3mfGY3BHhBM0UEZE5eGV6rcddbBfN0wHx1tAwHIMJV2c
 cM+AfS0N/CjNtS++x7b6Vd6aEwPSmVGrMzNScOuteMhcD67e+xpF4GzAW6uUxlS/8XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789508687;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=x0ESj9FVUzMNtjwCAKC/OHsSSraVLZKzmI3v2GkoG5M=;
 b=b5OiWiyRwNy/zf1Op2Lpv8JQ4XGF5zn32kZkIg183sfUx52tuDdQw1994rINd4pw7FA8
 fr0Rwq2TDez4Qv7W1XZPEjQ1a2/Z6v0CYbX1v49h0ox2YTyI6GaklsZlgyj/x93ClXXRS
 AKrNGirBePbgi20VyVsQmGXR8D/TY0ZetPugr0BaIlM3LNUMCX3ahveJJB1UCp/1lhRUD
 41+k1Fps4seU8UmqMBLXypNOSUi4jmQOk0iMQRIZGK2/mRx8otJvckc/yfvt8oSMFJdeB
 ZqP/8TEKrYGhFHMmi4v56s4I1OyUaD4MjRYnEI4RWYlOk3zC+5NMjD3hTw8rm7+jaQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bUC4qMAg; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F01DD605B7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:44:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6DE62C62207
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 974CD602B0;
 Tue, 15 Sep 2026 21:44:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E9C511C7AFE7; 
 Tue, 15 Sep 2026 23:44:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Tue, 15 Sep 2026 23:44:35 +0200
Message-ID: <20260915214437.2029799-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/rpi-rgb-led-matrix: propagate ffmpeg
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER selects
BR2_PACKAGE_FFMPEG, but without propagating its depends on, and most
notably BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS.

Fixes: e821078031e14df69e5142f23e9cb7b5a1ea0e77 ("package/rpi-rgb-led-matrix: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-rgb-led-matrix/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-rgb-led-matrix/Config.in b/package/rpi-rgb-led-matrix/Config.in
index 5088af3bf1..8bf9a81908 100644
--- a/package/rpi-rgb-led-matrix/Config.in
+++ b/package/rpi-rgb-led-matrix/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_RPI_RGB_LED_MATRIX_TEXT_SCROLLER
 
 config BR2_PACKAGE_RPI_RGB_LED_MATRIX_VIDEO_VIEWER
 	bool "Build video-viewer"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	help
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
