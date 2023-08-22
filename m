Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C224EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 01:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5424063C;
	Tue, 22 Aug 2023 01:33:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A5424063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJk8vR1Hs6wW; Tue, 22 Aug 2023 01:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8D78404DF;
	Tue, 22 Aug 2023 01:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8D78404DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3574F1BF30A
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BC28404DF
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 01:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC28404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tq3mUGOBaHAZ for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 01:33:39 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 528EC404BB
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 01:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 528EC404BB
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-58fc4d319d2so27164667b3.1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 18:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692668017; x=1693272817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKlGefgGWsUN7Pk7q3U3bEXV3Si+ACLsV1jkcrbxvG4=;
 b=EjqR1GtPm97pJz5uhxMEOMEuJWdd05FVSUHgYKvzwS2QCKW/ntEjV4ZN4Bn0utPSmR
 ANUciKpfG+Li6Lu0EQsA63oTCuQmBJp9cuDO1wVgt8ExiRYnnVUcxFU5ZsKmZkZmyjjF
 DwDGYWvcGYkuinmusmKwBz1W9ElQ3p8Nr1VgesCwIRi6XBoRhl9KPH8vzQLrW2F13j6C
 MNebhfV+hpWCBcq5r1lYXrAa5pVo1p5j3xc00/nGpRlS0YMQZ+lGGn4/0Nsj2OfdYSNu
 Ir69UQh/l/PkzFLiDwYEwZSRpeYDRHoh1z07zGQfBWBi9IRyXsfN17gPVryfWB21LtYG
 Emnw==
X-Gm-Message-State: AOJu0YxfZwPjOlHhVGgEdm7LXvMxQQCKPbTJ4TLnkGjFjhvlYj00Wpcg
 GOBSfojHw2hBXngkjETUf8z30D1KX5ZLRA==
X-Google-Smtp-Source: AGHT+IEDl1xzqwlzBHX22lOdboLVJkaBelIyAVutGn2fwkjnfBTBH2tn0eQ9+43yDtNq0QbuobFWJg==
X-Received: by 2002:a81:520b:0:b0:58d:7599:676a with SMTP id
 g11-20020a81520b000000b0058d7599676amr10751295ywb.37.1692668017616; 
 Mon, 21 Aug 2023 18:33:37 -0700 (PDT)
Received: from purgatory.attlocal.net
 ([2600:1700:65a0:14f0:55db:9e25:2c0a:ecb3])
 by smtp.gmail.com with ESMTPSA id
 n127-20020a0de485000000b0058451c12076sm2550229ywe.14.2023.08.21.18.33.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 21 Aug 2023 18:33:37 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 18:33:30 -0700
Message-Id: <20230822013333.47036-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230821175828.42827-1-ckhardin@gmail.com>
References: <20230821175828.42827-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692668017; x=1693272817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKlGefgGWsUN7Pk7q3U3bEXV3Si+ACLsV1jkcrbxvG4=;
 b=GshDeQuKRC71fXkMIrL8OwT4bQvIkBSsaV84Yap6usCZURjWPvUvPrq4qebfjoUm+D
 ly8otmfEGQVsvgD6V+Km82MLs4W7JbY+2NMI2AYofjO4Ku95llerH2dRmEJ9oorH8TVk
 Zj5R8swaTcfiya2buxIYQXy3Npsd+yVGm05zYkkrMIGFNkJjTbul7QwfSUwZPAXqfPrO
 VpfZ5EmHX9Gf7xbqoQYPFe/ua577MtEsU60ycLrfsYVdFdY5QE29CzXMBzMMH/DP9cKi
 aKt2NQB+GGHccofYGuCqEQ7JwbptK1oa2TNozH0fjs1Cr1Q603E+yJTNHPpkB+xdBNE2
 9KpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GshDeQuK
Subject: [Buildroot] [PATCH v2 1/4] package/python-dateutil: add host python
 package for dependencies
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A host package for build support needs the dateutil module and
so enable the dependency.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/python-dateutil/python-dateutil.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index b75f510bce..d45a047ba8 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -10,5 +10,7 @@ PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
 PYTHON_DATEUTIL_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_DATEUTIL_DEPENDENCIES = host-python-setuptools-scm host-python-six
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
