Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E1EC001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 01:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 840F060BDD;
	Mon, 24 Jul 2023 01:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840F060BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aZMhSNUl0-a9; Mon, 24 Jul 2023 01:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C60F560BDA;
	Mon, 24 Jul 2023 01:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60F560BDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0A521BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA4DA81570
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA4DA81570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmxMEpSYi_uq for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 01:48:43 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B929081497
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 01:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B929081497
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b9e478e122so3715595a34.1
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690163322; x=1690768122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UEVfIOYb9i7Lv9EJn+ggfB+iBkR64IIb0EP2VeWDBAQ=;
 b=R/w+dbiF8+69dm2rYXxrtpv5Sens1PYhvEBbICBeHP2IHHlaxycCEVOgg/ntg6rQKy
 JVbM+UThEWgEdn5xRS4BuVGDXhylTV1OsGW4B7dbjajfGmgsTGKo87wWWqdXXfjvBXk7
 Ou0Yodx/XKRvqYTJ2GqkqRymMcclqmlQ8IDuxPDnuVNcpJBm0kAoteLQC3HDHCkq4IdM
 zO+Px2BDL2CjCccTbMTXBKGiAh1gPwYEU6F4T7bSj80hBjieQt8qlJrOKQmAPGgUy8QO
 0V+QF5VVjNnQ4xIfseFoAPRkCJy+0fkYyXFAlrCN2Ae/3J6Vl1nsv03TZDCEmgHTpJR1
 fGnw==
X-Gm-Message-State: ABy/qLZB2VIub4bXKMbEV1MEKKLycNkPZTd+dVeR8TPpxgBSQIFlWr0x
 zE+I7O1rSdLekUES9WAR4L1tghYq3wSYIb9H
X-Google-Smtp-Source: APBJJlH4CT9DyVLPdgnoS1XCZQiYfmL2cNGQGGpbK9rELpXkTKs05eL6A3PTH9TLmgykq0zuXOFFRQ==
X-Received: by 2002:a05:6358:938c:b0:135:7c30:523 with SMTP id
 h12-20020a056358938c00b001357c300523mr6725423rwb.16.1690163322265; 
 Sun, 23 Jul 2023 18:48:42 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 r24-20020a62e418000000b0064d74808738sm6475330pfh.214.2023.07.23.18.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 18:48:41 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 11:48:31 +1000
Message-Id: <20230724014832.2207166-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690163322; x=1690768122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UEVfIOYb9i7Lv9EJn+ggfB+iBkR64IIb0EP2VeWDBAQ=;
 b=m1KJ+8FKXeb0pBIglMdWbDc1anANZdmVbBpFbbhZF7hznxJozujUz28YgvOWkZQs9V
 MJX2dhCtQ8OA1N4bqYZcG0P6lQWxPCKN6OYK0wUVcgcG5rZI7h20V9woHdrXesnslHBY
 y3+Tr/Y2ur33HSEcUJgxy0oIUSi5cs4HdjDmL+DauZeBgTrvejQxkJBtvxujmapsRMNC
 49bSedoOYRHvghS9QG3hEIbieEChgBqO3RLpbR9T5hdvpxDkX2LLcjOXMcxZonplfuTc
 QCJf3UWpM9K/lAcuNuq5xZftBJn0I2V/mZk2wk6MtjAkRiXV7BKR23CLVK7+LNYmrWPN
 IuOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=m1KJ+8FK
Subject: [Buildroot] [PATCH v2 1/2] package/libopenssl: Copy the crypto
 include files
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libspdm uses the low level OpenSSL crypto APIs.

In a traditional build libspdm has OpenSSL as a submodule and gets the
include from there, when building with buildroot we want to use the
prebuilt OpenSSL library, so we need to expose these crypto includes.

This patch installs the crypto private headers so that libspdm can use
them.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/libopenssl/libopenssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 06eac8f3d9..c66a842cdf 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -126,6 +126,10 @@ endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	mkdir -p $(STAGING_DIR)/usr/include/crypto
+	$(INSTALL) -m 644 $(@D)/include/crypto/* $(STAGING_DIR)/usr/include/crypto/
+	mkdir -p $(STAGING_DIR)/usr/include/internal
+	$(INSTALL) -m 644 $(@D)/include/internal/* $(STAGING_DIR)/usr/include/internal/
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
