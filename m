Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE8C0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65F882E1A;
	Sat, 28 Oct 2023 10:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65F882E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aiVrg0AYunc; Sat, 28 Oct 2023 10:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3AD82B2F;
	Sat, 28 Oct 2023 10:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3AD82B2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75891BF83C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 10:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88EEC60FEF
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 10:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EEC60FEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NyOQQyggcty for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 10:25:32 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC1F160FC7
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 10:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC1F160FC7
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-542d3e47fd5so714239a12.0
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 03:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698488729; x=1699093529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lsjeZ6aI7ylFhLOADaczu8d159AQv54TIf2foqO8TVg=;
 b=CsugPHILdx66/YWBosW6iFxokwluZ97FZbmBpCEbgLX6ZUxXdT8ikMJs9RV2GOkSFc
 vQEmH/GR6N+ctV4HKoy5okeRhVkU15UZQ9PhZWTs8YorRxwJYFwLyqXrYxGA7Hpj1N3X
 agXOCVEx1zd3len0/eJZViTCk6+EXGG2iGuU0vhDWS4nrms8sJ15Gini4Tol3MIxS4SI
 XOpyHC9qpO9Tc3BYnSdN3RQGn12gOXlFJQPQpclmgGf3YaQCxQRTIjkEaoWIqwRvV3ks
 qyzWGoF1yl4XbjDaKZtmxaHTjSPgRmNAl94YbAcMBtuXIdrLJNekz7XVx+5cRjsIyVvU
 PG/g==
X-Gm-Message-State: AOJu0Yw5bjBRn7j1HvmwSMsoLpPx8SysDEZq/+yv0P+TjfRdNTx2DC+Z
 s4emCMqYqWrZNAPePfnMaz097w4yAo8=
X-Google-Smtp-Source: AGHT+IG8Yi81Mk8p2URduLl+R5DKc1vsxbBF2sDLqnjiPWy5y9quvQkpb2MwS6MdcPsQ+26bOBz1bA==
X-Received: by 2002:a50:9e2c:0:b0:53e:76e4:3706 with SMTP id
 z41-20020a509e2c000000b0053e76e43706mr4665173ede.0.1698488729188; 
 Sat, 28 Oct 2023 03:25:29 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 e2-20020a50d4c2000000b0053e8f1f79afsm2709805edj.30.2023.10.28.03.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 03:25:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 12:24:35 +0200
Message-Id: <20231028102435.1771460-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1698488729; x=1699093529; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lsjeZ6aI7ylFhLOADaczu8d159AQv54TIf2foqO8TVg=;
 b=lR3UApffE2Go/juJ4w05hMGC5yALDdWuYRvdD3Ls2UaH4XC/+iu1TJp4EQ0RkTGtk4
 3SEOG+DBmfXW4tIOf21xmvPiBYEj0lfmCEojqKyYEs9qkL6Z8X9jn+I3zVxpq/lpFz8g
 fgUyC6/93At8w0Df7WTRAjhl8ICr3hecT1iLUQyr3TSANs6S95VJelAPE6PvB9NWRTH+
 4HOKSpTa3a/bxr6QE3UNv+EjwiLb2fhv4E/sVDQKLQLSJW+/uHq/bkuilvxfrvgVdoBE
 63FV8Vv4TTTLFENibRiX3G9tZgweJmECIUmNp1TtJx9jylN6VNFxapbIy654l/QGNgNf
 JOsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lR3UApff
Subject: [Buildroot] [RFC PATCH] package/pkg-python.mk: PEP517: add support
 for setuptools backend
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
Cc: adam.duskett@amarulasolutions.com, james.hilliard1@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 41.0.0, setuptools has an experimental PEP517 support.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/pkg-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 28ee4cb85f..00f71f6b19 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -300,7 +300,7 @@ ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
 $(2)_DEPENDENCIES += host-python-setuptools-rust
 endif
 else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
-$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer
+$(2)_DEPENDENCIES += host-python-pypa-build host-python-installer host-python-setuptools
 ifeq ($$($(2)_SETUP_TYPE),flit)
 $(2)_DEPENDENCIES += host-python-flit-core
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
