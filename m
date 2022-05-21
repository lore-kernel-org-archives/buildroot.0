Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 12:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD3E860FF7;
	Sat, 21 May 2022 12:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nY8iWqLshaDK; Sat, 21 May 2022 12:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA7D260BD7;
	Sat, 21 May 2022 12:39:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6290D1BF2C0
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517B0844AB
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3K9PSwliW3L for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 12:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CD2082BED
 for <buildroot@buildroot.org>; Sat, 21 May 2022 12:39:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g12so13656862edq.4
 for <buildroot@buildroot.org>; Sat, 21 May 2022 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GrgrdxNZUASAlhugSqHByv8PRwZHsiBpFc79fYW/VG0=;
 b=QkbIx2aZDJPE9SSda68k1uRfs3I5BV73RtWdwtL6xPC+hn1iTK3wj6S2pdmI6AMmld
 uAcDOmOW4Br2biWpKzeJhxHMq30szzD3MCjn9n+3IoXMDL+dZLJeMpYbM+h4v4OQaTc0
 GSF4QvAh4Xj6mX9vWQPg5LZX4LHcQPDd0LRsQbpqLriTYWXerY3r1BAys24yhYKJqkNd
 wyZPYTD81kqkIfC/0yPyseCVBaT1cdQ5cpsF8J1xR4VB6AjhrqIk2sPblCuvk3nP9fwy
 r0isUkzuGHbrpcsjoXEERdBhFqAWax0ICZrU9gpiQyjoz2fTVabcuN6ZfLKKzM6OQ6W2
 jutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrgrdxNZUASAlhugSqHByv8PRwZHsiBpFc79fYW/VG0=;
 b=X6rRJmnTovR3EQ8tleZ/WN1GHxHup/dlPUW/MO1EkUWu5vg8H9MY2Cp5sIHfawQxDh
 9jZFeVIeS5WzA4g2IhHu9NKBuylJaq67ne8KVg5B0emBJVLGjYuYD5SkdC3sAYfkgsnq
 90dAE9p+QQBLwoznrP1uQADwRKBhrNOHNo4zfkKT4pOz8yw20enERzsWIzDkpgsRjGw6
 dPF7xGY8RzOD4ILrPYFRxqoYn61mrrb65nULtUDvp6yH97DA6QnuzYzO+pQ0Af/dE8cR
 J8cR/+yo2cq5AG0dhamJyIBfq8rWFtQChMgIE81Uau6Jeq2E5i6tisLW18vOfBLf9ksR
 9z4A==
X-Gm-Message-State: AOAM5315Gr/rD3zMxg4xwJ4dURNju17wpEiFdE3ME8APSJydQ9sM5m/a
 2Eq0aQ45tEkfPxwQwkw1P6bIL2Irj+M=
X-Google-Smtp-Source: ABdhPJz1ScwDn8B1clKIofpBJZgN8OmG+R43Lcj5P09KMS2Qw68lKTMIdowYJWyk56QAWXW5X6PYsA==
X-Received: by 2002:aa7:d414:0:b0:42a:b49e:d502 with SMTP id
 z20-20020aa7d414000000b0042ab49ed502mr15984701edq.68.1653136757945; 
 Sat, 21 May 2022 05:39:17 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 jx4-20020a170907760400b006f3ef214da3sm4110479ejc.9.2022.05.21.05.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 05:39:17 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:38:44 +0200
Message-Id: <20220521123838.2881-5-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220521123838.2881-1-heiko.thiery@gmail.com>
References: <20220521123838.2881-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] boot/uboot: bump to 2022.04
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2022.04 a host dependency to gnutls is required.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/Config.in | 4 ++--
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 953c36135e..d525faea1c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2022.01"
+	bool "2022.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2022.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2022.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cb26fc8d3e..86e28004c4 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -17,7 +17,7 @@ UBOOT_CPE_ID_PRODUCT = u-boot
 UBOOT_INSTALL_IMAGES = YES
 
 # u-boot 2020.01+ needs make 4.0+
-UBOOT_DEPENDENCIES = host-pkgconf $(BR2_MAKE_HOST_DEPENDENCY)
+UBOOT_DEPENDENCIES = host-pkgconf host-gnutls $(BR2_MAKE_HOST_DEPENDENCY)
 UBOOT_MAKE = $(BR2_MAKE)
 
 ifeq ($(UBOOT_VERSION),custom)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
