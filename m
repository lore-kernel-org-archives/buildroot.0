Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F0FC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C6B8191E;
	Sat,  9 Aug 2025 21:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfWXtER18CZc; Sat,  9 Aug 2025 21:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDF91818C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDF91818C2;
	Sat,  9 Aug 2025 21:47:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD2891D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A378740887
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cn1xz1md9nZD for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:47:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59B0040811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B0040811
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59B0040811
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:47:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.137]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiacR-1u5Duv1WTP-00oty3; Sat, 09
 Aug 2025 23:41:54 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  9 Aug 2025 23:41:51 +0200
Message-ID: <20250809214151.2423583-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809214151.2423583-1-ps.report@gmx.net>
References: <20250809214151.2423583-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:NMzOmHZk6YYLT4b//rx5fxLZ2qdOeAP8A8i42gdSiC25n4B16NE
 oPmwH5tQ31gS+fx1kBM6/oJfkN2L1oDt36b1gMt3GjyaWZ7PTvrIzs7Sndb/7DVrGLHW6UZ
 I+NY/SoKP2QX6wvmzuiKRGiyEEUXGABJfC4Dt9D8UZeHoV6MPIVMPg01fe5CHsZvzUcC27U
 0llGr6eg7rvc942O1J+kA==
UI-OutboundReport: notjunk:1;M01:P0:4uO0ZZMG0wg=;yu0ivu3SRnpGNC+f0Ek21wE7zhZ
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1754776018; x=1755380818; i=ps.report@gmx.net;
 bh=rglKsmW8tPsQ/CApTW5k/wBcEAwj0VSz7lwtipRgQek=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DFYMceJr84bU2YxMudpHrmAbL+G/zH4WsCSpjI9RRInyW8WzAcQLiVAh00jTqIqX
 Y3uuUoKq3AO8y1cbQe0eTXN5McrZqG+zzOMjmGsU6uKSsHdzQ1aJ5lDtkRrzxYpBp
 cfnJ/OSoRqtpKKFhuMcwZBXB0Dy2zsdFa6tO3Z1vaUU2CUJrTDn1rRjksRSUz3rkU
 tDs+lvB4GqyYfBO++0fDeKcmv4OBEfoM4K2IkIZXJCaUzqJ8piHc/lEm9kLw++XOT
 brDKKy2HlEF6lgrfe1HkFPnNzYMoZEAJYhLvtqnAyuHC5VIDURhJVWL50btk550eB
 7JmL6qr4JBD7hCo/IQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=DFYMceJr
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: add iwctl readline
 dependency hint in help text
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add iwctl readline dependency hint in help text.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index 4255e01e70..e4b0ead882 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_IWD
 	select BR2_PACKAGE_OPENRESOLV if !BR2_PACKAGE_SYSTEMD_RESOLVED
 	help
 	  iNet Wireless daemon (iwd)
+	  Enable the readline package to enable the iwctl tool.
 
 	  https://iwd.wiki.kernel.org/
 
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
