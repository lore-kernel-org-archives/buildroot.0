Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5214C0015E
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 20:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 666866125F;
	Thu, 20 Jul 2023 20:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 666866125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aj0Z3JUmsuUA; Thu, 20 Jul 2023 20:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABEA66125D;
	Thu, 20 Jul 2023 20:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABEA66125D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D40B01BF59D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD768404FE
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD768404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qz00TUoOXPsc for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:28:32 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED5284013F
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED5284013F
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01F2AA4C042C;
 Thu, 20 Jul 2023 22:28:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42676)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qMaGD-00027u-2a;
 Thu, 20 Jul 2023 22:28:29 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:28:29 +0200
Message-Id: <20230720202829.2568063-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689884910;
 bh=ZzxdAG2ZwGakXViAkTpYQJS1CAMRMo/iO75iEvcNwRk=;
 h=From:To:Cc:Subject:Date:From;
 b=tK8+AD/Mm75Y8h7R9lpRu1+4I9UGraBCBqZaYOgLBC6mvNsGdAVeTGBUab93Sr+gx
 DW/T9lFBE0zpH6P5wCDG6GgohxbhDcFfQ0d+FtT4w3zx0o2hp5vlTAGFdcj3YFpgbO
 n1zPVYTmjI85Yvb8bilU32FCxSiIuSTmPTFWNIvfacokO7yrBiuYYU1JHCOoAaoifL
 Gb2gmnnl7h7IFoeDbL4/N8dSL8zjmYlri7RIO7wi/QYa6IilcxMAlU4R4Zj7wpDrx7
 NHqNxPKaFjbalNHkJXw+PCw8/xY9yyvEFgoOdS44AbNmcitZpCYPxrLDpZLQuagAnT
 O/2v9CF2oq1eQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tK8+AD/M
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: fix comment
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libuhttpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index a552a88f0c..d89f4541b6 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBUHTTPD
 
 comment "libuhttpd needs a toolchain w/ gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
