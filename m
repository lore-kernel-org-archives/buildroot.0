Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8993FEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D82B607DE;
	Sat,  8 Jul 2023 20:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D82B607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sL8Z8Bkl2kYB; Sat,  8 Jul 2023 20:05:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3F260BDA;
	Sat,  8 Jul 2023 20:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3F260BDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 060DE1BF3DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5D7E4044A
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5D7E4044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bx3wgvQnmZQT for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:05:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 411C6403EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 411C6403EA
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:05:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9ABC4A4C0E86;
 Sat,  8 Jul 2023 22:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-21;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:45 +0200
Message-Id: <20230708200447.3919009-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846688;
 bh=7Or9OJIUFnlHBIJF/EmSjdDI7ipx8ngWk7dmsRjidQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NazJ11mOMZKJ4HYHCaB0EaY0h6ZM1HmGF0paC+E1UcsOtGBoJs3/OcsCAXWF6snXM
 zfV01uYlr67qUT6JrzMk3OcrUa/QNSg8gMdIygG8ar35CxdlBPknnoV8mdfIxmW3Ts
 MIx+mt9WTOIuacttXGgi0JqUMs2a2vZaU5bVnMWi020sQTlwPjicOradd0v8MMIu1R
 S+AoS2JXrvuYa4jctKHcULVDVTx0MO2GIMFtOVtuuNiA1fXSVcvfvTLEAxoUVKZJca
 Wh1wzNu5cOnuST/sCVkssuLCQEmDqHaB6WaCThU/ELd5kX2DaW0Yg01Tf9l4m0/Zuh
 iDfLs6pVFEBnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=NazJ11mO
Subject: [Buildroot] [PATCH 5/7] package/libvips: add optional support for
 libheif
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvips/libvips.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
index f7b15e8e06..1a0f9d5ead 100644
--- a/package/libvips/libvips.mk
+++ b/package/libvips/libvips.mk
@@ -132,6 +132,13 @@ else
 LIBVIPS_CONF_OPTS += --without-libexif
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHEIF),y)
+LIBVIPS_CONF_OPTS += --with-heif
+LIBVIPS_DEPENDENCIES += libheif
+else
+LIBVIPS_CONF_OPTS += --without-heif
+endif
+
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
 LIBVIPS_CONF_OPTS += --with-libwebp
 LIBVIPS_DEPENDENCIES += webp
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
