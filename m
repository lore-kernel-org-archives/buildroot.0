Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB87C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B72A04287E;
	Fri,  7 Jun 2024 17:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFJQNOK_Hcze; Fri,  7 Jun 2024 17:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F22242881
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F22242881;
	Fri,  7 Jun 2024 17:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C08421BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF9B8403FB
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wKOOFdpg7xl for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D80C14004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D80C14004A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D80C14004A
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-35dc0472b7eso2057934f8f.2
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779968; x=1718384768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AxOi7Znm8e5Y3HVPxFJcN/1hPCnLaEc3juQ2n41eSxw=;
 b=rOtlNlzSVU+WFotxtiwJ/YLxABN0WQFSxwNZAlBHYn+Q5HKf+U6YJN5Cc9WMhC/vQb
 jegWhOEshRh9GKBBGJZM/8sYiGp0AwK8w6hKaKQwu2WmiWQ1S3MkZoKNSTmTknOuEhM3
 2nWHZkvZDZZdLkoaGycT1XefCY55nM3RZyH3RiACAPGsBQsB7fYXelQjHVRSizfvwZO5
 9hDZWxpLL6DWsIHD/7/KmgV8uX5azj1mzaYo9n1oUK5xsTHy2KtAMeWxqcog6gI67C9h
 zbqViDfsCnQi8PdUBcKXg4o3wBeTQOH8PgS5zbGGl6q0uAYzSYEDKk3TXhOSuDcboMP1
 eVew==
X-Gm-Message-State: AOJu0YwFPAo5zOzQpV+lPGQ8gjspg5DFqrkDPy7AQMszeT5Kgw33vaGW
 XQ88RtKz3vwNsPijLWH9k3prYSXgHks8J7VcXiDBy9CHtjYkVAEK1U7RyA==
X-Google-Smtp-Source: AGHT+IHuoml33IeOtiL9PM4K/5D2drOY0Ggq19pu7+02Xw+tfhBRDbXIQ6LxSxMUvtwo/193sxCYpQ==
X-Received: by 2002:a05:6000:bce:b0:354:fb50:c1ef with SMTP id
 ffacd0b85a97d-35efee8c5b8mr2123824f8f.68.1717779967881; 
 Fri, 07 Jun 2024 10:06:07 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:07 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:53 +0200
Message-ID: <8f7f18c9f67543b5e6b534bc0562c4a8a44a73c4.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779968; x=1718384768; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxOi7Znm8e5Y3HVPxFJcN/1hPCnLaEc3juQ2n41eSxw=;
 b=PWBXW+qcYp4qBt69RIKEkGw6BfI4dxz7b1jAU4YBxzoCSFMDccf7dYij5XvAAEymqg
 7e0LY+jN+L6NzSEmBWB5hwUuNe5SNCaCUhiePV+NqYNv0VPgZJqq0Q6M32rVQimNl7/E
 Ep8e6UfdI3+i/bft5uTxdIllzXFTX23dADU0vetu9sDGGlCsWdvHFpFrzUgPsBrqKL07
 QlsLRjFewI4JKMLNm4g5sGnisXffu02mOwfZNrVdOc+v90Scd/xIl9rGH8It0AS39+VC
 HMcQ1uIO6UazO0k5MIfzRWgHI1zd4cqASWtNyVKDDmnQdf0+HvaWOCSWvclp2gYyuZmj
 ZHEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PWBXW+qc
Subject: [Buildroot] [PATCH 12/20 v2] package/python-bcrypt: use
 post-process opts to pass Cargo manifest path
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Asaf Kahlon <asafka7@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-bcrypt/python-bcrypt.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index f3137401d7..f09c67441e 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -19,9 +19,8 @@ PYTHON_BCRYPT_ENV = \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS_OPTS = -m src/_bcrypt/Cargo.toml
 PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_BCRYPT_DL_ENV = \
-	$(PKG_CARGO_ENV) \
-	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
+PYTHON_BCRYPT_DL_ENV = $(PKG_CARGO_ENV)
 
 $(eval $(python-package))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
