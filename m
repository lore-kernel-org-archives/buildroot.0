Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46D4CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59107418FB;
	Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDWZyj-ey3bm; Wed, 10 Sep 2025 21:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7879F418E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7879F418E4;
	Wed, 10 Sep 2025 21:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ED5B2BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8599E60D86
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXOfn1pGKsW8 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF67160BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF67160BF8
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF67160BF8
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4E8594E40BDB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 20C2D606D4;
 Wed, 10 Sep 2025 21:33:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A00E102F293A; 
 Wed, 10 Sep 2025 23:33:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 10 Sep 2025 23:32:09 +0200
Message-ID: <20250910213241.1529448-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539989; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=B7gUvyL+EesdUJwgEZ/VIGWN/Rpiw3CfmYL3Ug5piUg=;
 b=Xf+gPzUR1G5DFM2JAHIEu0NrtZucs/BsOnqXb8/IDbylhBoiRgdf+D+0ucWQrPml3kWFWA
 ePdORGCwGFI157cb1ep9TpQNq8AGzomnHgJGjm0JQWyuhrnK9ET75rwzapxBK+l6ZXG8kh
 hA0uDEypSlnVqhuo6wb/SEwm3Nq4sIoHfkx+HafgrJPo9F25dpH9TepC3GjclbXU+RiV2X
 xVNXOr4KsWGSn/uFGN1c5Vx7adJO7dtDHM0hATqh63xqMKNQfLiEvrv8XAp80PW2VPd0T7
 XMc1sUIuVzTggnZ/0XzS4WjyZfP/igR9BX0FtmMdYMXXPbmv0h4pOc9tj+HHBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Xf+gPzUR
Subject: [Buildroot] [PATCH 01/23] package/adwaita-icon-theme: drop
 reference to libgtk2
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

As we are about to drop support for libgtk2, let's drop the reference
to libgtk2 from the adwaita-icon-theme package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/adwaita-icon-theme/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index 71b839d996..0eb856ad9e 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
-	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK3
 	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
 	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	help
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
