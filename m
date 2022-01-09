Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79FAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7EC4031B;
	Sun,  9 Jan 2022 21:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2O6u2mtxEu2; Sun,  9 Jan 2022 20:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7976402D7;
	Sun,  9 Jan 2022 20:59:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF4D71BF20B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB60B605A2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlkiwO6gD1g3 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:59:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E13C96009C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:59:55 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b13so45712633edd.8
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=VRd12K5FhADFrhZIFKtTxPJ0YkI3Wlxv2xep+j/0n1c=;
 b=WvM6RYXlTDzTobqXA7fAsTGZTRVjY9f3bXY4MpBv9DPF43gvffMD5FFpWOWsgxGjEj
 FVs05XyT/EFrnCZ7WOigB4Nir2RpI8F5itl06CsVX1KZTQykq8/LNpMnSHb1v8EH5zNM
 Ww2m8QautkBk90h1cOzlCgrMo1u21/FzOL9nnFeriBJMtaWo5pu56g8olfjRphKlwfb4
 hPTjRkCcevhCOYblJg3WdBv8z9vno+ioqhvWxJi/7GGsWDXlUDemXNfu3+Am9ZvM0MDC
 7ImxtXqjnQXHTLbhf7gk4IAghkxDOlyWkssmiAg7dZNmQWYuBsmDSmxGXJN3HDRgriKp
 7aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VRd12K5FhADFrhZIFKtTxPJ0YkI3Wlxv2xep+j/0n1c=;
 b=r+WjJ5Q17uONLP+T+cjKu7Qnk0nCAn+6Dpev7II3YvGrXF10REx0DtqkDFp7hKHqrY
 HazSS2efDwkBwLxKLsqPz6E0wsx1wskT+MeV4vqufDXOwp6EOE/SUx6u4dc99DSe8IX1
 pOv8hydNgQ3HJ/ekW6fGZKoLj4jVB9yLACTnRqht6BFkjvCJ6o/ta+v/+pFDmTszOvNz
 8K+mVlZgTUL0BCIwTozch7GQPRn4lG9wU18DWNX5BIZNsD4YiYKqx6g11Bx2IOOR0NJR
 FP832qPAjZyX7F3yjraCnwlph80ZjWCrclRhdAne0IUQ9LfJMGI9bkXUNx8PJvyF+/s8
 svdg==
X-Gm-Message-State: AOAM531XajBqT3KD9S9RFfw12X0pDjPnNSMMrxmCNV+27jn0Y84RuST4
 MbsofhcoNboCdHT06yupADIIhb0cMzY=
X-Google-Smtp-Source: ABdhPJzTBZ9mL2LJnzfVZyfxtEWpeN2IIwLpU2Um8Ftpa+0JgTNvXmuDKzRKNsdxE9KoxYQoJ2RKzw==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr58069031ejc.337.1641761993856; 
 Sun, 09 Jan 2022 12:59:53 -0800 (PST)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202])
 by smtp.gmail.com with ESMTPSA id b26sm1694768ejb.201.2022.01.09.12.59.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Jan 2022 12:59:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 21:59:46 +0100
Message-Id: <20220109205946.14456-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/avrdude: add support for hidapi
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

If BR2_PACKAGE_HIDAPI is selected, add it to avrdude build
dependencies.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/avrdude/avrdude.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 5bbbc4e8c2..63cc3bbc7e 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -28,6 +28,10 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
+ifeq ($(BR2_PACKAGE_HIDAPI),y)
+AVRDUDE_DEPENDENCIES += hidapi
+endif
+
 # if /etc/avrdude.conf exists, the installation process creates a
 # backup file, which we do not want in the context of Buildroot.
 define AVRDUDE_REMOVE_BACKUP_FILE
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
