Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E7DC531DA
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 11:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F11C41359;
	Fri,  9 Aug 2024 11:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJNu-2jCEVqB; Fri,  9 Aug 2024 11:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125064135C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125064135C;
	Fri,  9 Aug 2024 11:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66A2B1BF990
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54DC4412C0
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 11:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYqfDCW12l_C for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 11:27:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52E20412CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52E20412CC
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52E20412CC
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 11:27:54 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ef2cce8be8so20389411fa.1
 for <buildroot@buildroot.org>; Fri, 09 Aug 2024 04:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723202872; x=1723807672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUa4V9JrgBox92gjhvOaksJncdjhlWh/xHYL6VvD4zk=;
 b=mjCQaF8MzIu44DScz9pJyJhhG8dYEzc3p9yHzIJmlPcuLEU60+vdV887vbcbHf86kE
 7eUgfTCS1dW+WbWG2A8/LW5cwZwY4S+3cCYfjtZ/UW/1mkXB99qjKCNuVtJLy0X0NAIR
 AJ9WHD4sP/K4owNzKI/+K95j7APoDiA6eQ0KAm68e0teNuJ0ru5cBwTnovSAT4aNN0df
 4cdX5RT7pjx9Ikdx274TmXlMMFQ44c0bQ2DjEfR4h+amXWOqHSAT00sg6L86GUHwv2jt
 UPk0GlFu33s4j25qAFfVi7rRMNm9b1K+bg3pvf6YJAnkofnS5VaEtVSo2YQpo8/FPOIY
 brAA==
X-Gm-Message-State: AOJu0Yy3DnoLHCpjXhv4L+JEA/b6mMbnfGrtEjWiNxew8y99enaQdCNT
 aP514Nk67EHewJIcCynujYFfERFPs1Ah6UMlA4Dtv1aGCbgVmg1YtMsuUbv/3LW8cA==
X-Google-Smtp-Source: AGHT+IE6jNVA0LX5fPEFDsiMNjOSYGwDn9FfdUtGmb4WYc7lo0MpVVtEg5K84/cc8yLNIDwEvAUz3g==
X-Received: by 2002:a2e:7c08:0:b0:2ef:5d1d:773f with SMTP id
 38308e7fff4ca-2f1a6c6a0e4mr10694211fa.24.1723202871198; 
 Fri, 09 Aug 2024 04:27:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36d272291c9sm4989102f8f.97.2024.08.09.04.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 04:27:50 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri,  9 Aug 2024 13:27:38 +0200
Message-ID: <20240809112739.690823-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240809112739.690823-1-gael.portay@rtone.fr>
References: <20240809112739.690823-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723202872; x=1723807672; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUa4V9JrgBox92gjhvOaksJncdjhlWh/xHYL6VvD4zk=;
 b=DGrMxOaJBVSym9+E9GHdn5Zqx285D35inL/ijqpXdxZI2b+vkOICrDhrKssUnW6cs1
 dJPr5uDsOV/GQDaEXYmjYPlS4Pu+/E9yMGcbp7aYo/ipJRsSXZoPafHvRU9rIynEBYyj
 +vplGd0bbXOMLHCbY5WouA/uIJByEfYJ+pGTugrDt/gVklrsmmL9XhMYUsbfXJeGZWZp
 oASrOdjzxBe/Ls8KVhHt0S7WiaTNFoOilm5cSgleCfCV8Bc9Y9TDVH1KtNJJWQf9C9R1
 W9V7K2LEEDqNABmmoWBK5hONHCqO7s3pfsedWIbInTjyHq9KpK5SVar9FDbadx8w88iI
 FlSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DGrMxOaJ
Subject: [Buildroot] [PATCH v2 2/3] DEVELOPERS: add myself as developer for
 raspberrypi
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KLS0tCiBE
RVZFTE9QRVJTIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggYzUyZjUzNTY1Yy4uMjU3YWJk
YzVmNSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMjAxLDYg
KzEyMDEsMTAgQEAgTjoJRnJhbmsgVmFuYmV2ZXIgPGZyYW5rLnZhbmJldmVyQG1pbmQuYmU+CiBG
OglwYWNrYWdlL2xpYm1vZHNlY3VyaXR5LwogRjoJcGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS8K
IAorTjoJR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KK0Y6CWJvYXJkL3Jhc3Bi
ZXJyeXBpLworRjoJY29uZmlncy9yYXNwYmVycnlwaSoKKwogTjoJR2FvIFhpYW5nIDxoc2lhbmdr
YW9AYW9sLmNvbT4KIEY6CXBhY2thZ2UvZXJvZnMtdXRpbHMvCiAKLS0gCjIuNDYuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
