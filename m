Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C12C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 13:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DA3402FE;
	Sun, 23 Jan 2022 13:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NyNdenz7v2c; Sun, 23 Jan 2022 13:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D87D4028B;
	Sun, 23 Jan 2022 13:49:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01B521BF422
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 13:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E43AF60BE8
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 13:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2-qzOqkmCLR for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 13:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C55B760BE0
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:49:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 r132-20020a1c448a000000b0034e043aaac7so8470126wma.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 05:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8CDXu7q6/HaRW3NQSE+sXCjHR2RIQBCWYWi3FLyb154=;
 b=A2hoAA+hQLcVByvwut2zv/xJyHZneR3ZIlnWgQaR6nGrfiBCU3rHwehPBvTO6O3oWp
 +/b2ZLa1ezq84Bl7pZtNuAe7zhFU/DpdqM7ngHXrGRg8UOzWqOfcAxMMVuoqzT2U6/Qq
 XBUGzYqFVJL2A070n4PVKnEoWs/0pgivuIrFPtbXJxSdp6ne0qAKSdyTYTOry58U9zYE
 kD12x2ul/XzKvK2jRJgj90hfJ8/xcUx0cCefCA1pbNLvh54UUtxMI30Uh6OlXme4tbbE
 gzPRIoWLhd7AUnH2QsGkKqFs+Cu6yAWaF3QppHdkulivv//PTTuKlRJm/4NymgsVJCuw
 8ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8CDXu7q6/HaRW3NQSE+sXCjHR2RIQBCWYWi3FLyb154=;
 b=qCgX3qJM4TIIEW92/2Q52ID7RAW/shSqT1+isEnajeCrILJXJJ17tRbL1vX3yfIoKA
 YrRdln/vKVl+Rw4Ei2jgiujp97z0vaoGilGkbuvFRZGb+xvJOlKQB1ysSKJOOeFg10/n
 rLOOZCbdtDqloAgaNWqxIlBMM7cHFo1nicGYZrLPCidLotwKC2DQ/eTm/9sCLIppIJQW
 3Er2CF3vbYyVVtIi33b/iQCGxAgIJYfYnxsjAaalphxgq9kTqPXH7amlWW2uDeLY6h4e
 2AQmWYPrZ1FXOFt3RoaEJFcC1aNySVNOn5NxvOfbuM0znmlS+oCmWgskR3m6ivxZ7j1B
 1hIQ==
X-Gm-Message-State: AOAM5310wepcFB0b1K05z4SvifJI8JYSxDAoQjFzuZXz4qEBM3fKvHIB
 k3fBJimzGK9dNsKQayBMzaTXH/iacyk=
X-Google-Smtp-Source: ABdhPJx8YJ6S9skxgUjwHdoKlAnyjijcehNl5pvH6kWCt+P9MrbZqtgGYd/1YkUEqoF8YB0EOeoD1A==
X-Received: by 2002:a05:600c:1911:: with SMTP id
 j17mr4845113wmq.148.1642945772892; 
 Sun, 23 Jan 2022 05:49:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n8sm1671232wmk.18.2022.01.23.05.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 05:49:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 14:47:50 +0100
Message-Id: <20220123134751.703269-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libpjsip: update
 LIBPJSIP_CPE_ID_VENDOR
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pjsip:pjsip has been deprecated by teluu:pjsip since September 2021:

 <cpe-23:cpe23-item name="cpe:2.3:a:pjsip:pjsip:2.7.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:teluu:pjsip:2.7.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>
  <cpe-item name="cpe:/a:pjsip:pjsip:2.7.2" deprecated="true" deprecation_date="2021-09-02T14:49:19.527Z">

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpjsip/libpjsip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 8feec9bcb2..771db0ac72 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -12,7 +12,7 @@ LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
-LIBPJSIP_CPE_ID_VENDOR = pjsip
+LIBPJSIP_CPE_ID_VENDOR = teluu
 LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
