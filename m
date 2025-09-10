Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065BACA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D300941947;
	Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1WaVhJfVCOU; Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F96641950
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F96641950;
	Wed, 10 Sep 2025 21:33:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F191C234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF17241938
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtHYBcrU4fdL for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9B5441922
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B5441922
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9B5441922
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1CF171A0D98;
 Wed, 10 Sep 2025 21:33:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E6979606D4;
 Wed, 10 Sep 2025 21:33:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0E44F102F29F6; 
 Wed, 10 Sep 2025 23:33:21 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Sep 2025 23:32:20 +0200
Message-ID: <20250910213241.1529448-13-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540002; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fBQMUfEvFDVK18BJNowW30uN+PSq3rZQ4BuIreSQEkU=;
 b=0GBQHP6HsttCvXqbrk4XoquWN9G/GVBiiDZql+1INtzx7yIdvJ/QVG10OJwt+z14YbLhp7
 KhIrNrTm+PKJBoGvZzElUKDweaaYrzB24FbaadjHbI0JIQ2Ho9r7EDoEfxQf5W5TEzwjeJ
 jvEd8M/Rp2i4Z6SR4o0OuuDr47hBDmA4RSlN/4uxlj0dDaZY+HZcF4CVVXy4UIhOZE9U9O
 zO4cGUn7tvFV2Zu0ieGsn9hx3L8zE8S5JDCKJGj4wIuQHoOwfkOdc7mzh268tLszxCx9SK
 +KShsEPdbkYE8Q5/oL0bITRFfxyIB+P7CSuiuod/aXF7QqNDyjfzbvhl5Gwulg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0GBQHP6H
Subject: [Buildroot] [PATCH 12/23] package/lv2: drop optional dependency on
 libgtk2
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

As we're about to remove libgtk2, let's drop the optional dependency
of lv2 on libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lv2/lv2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
index 2dde9b907c..cef90d13f0 100644
--- a/package/lv2/lv2.mk
+++ b/package/lv2/lv2.mk
@@ -24,10 +24,6 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LV2_DEPENDENCIES += libsndfile
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-LV2_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LV2_CONF_OPTS += -Dplugins=disabled
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
