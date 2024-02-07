Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0750FC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13B6829AF;
	Wed,  7 Feb 2024 08:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zxy8J3QYW83K; Wed,  7 Feb 2024 08:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD20583521
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD20583521;
	Wed,  7 Feb 2024 08:45:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 815231BF836
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C943421DA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHp8SGTMEiCD for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF416421DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF416421DE
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF416421DE
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:45:08 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51168572090so205236e87.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 00:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707295506; x=1707900306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R9VGJ8YEJNSgbk4AFxLbgbuwRnm+l4eMhUdaPDyEsVI=;
 b=OtvzATa26TqHzsYR2b5qZpg38YEt1+nseGYFqNms5b7iP7na680G6dsvYU1dbqmBpi
 z54HgrseGAA3+i95pXm9zLAPJusRLbgT6nfCuBL+nCZJ5lMzulzk5ra//ntgEf36212G
 ziKgxVgY2AMN/6oR3uq4kQ4SEaVup8OdbIPTn3CDM8GoWdrTpxeAVo2z1X23SLZm02sO
 Vbzei/PCSHK0dwW1uqj66M+fVPJTKJTCnvDxLHwSv6gP8P5BTwHAwuNW2TKNslMB0A+L
 rfFOoQHDfkFs09d0P5CrAg8AVE1taZNFGF46iCHv0+XEnyJavz5i1vU8pFPNerMSp6Rj
 Ghfg==
X-Gm-Message-State: AOJu0Yy0Re6rnHA6HEbB8MxUY6SCJnlY/Wgy03L6XcAB20UACsEPKRM/
 9eqEg8Cc35i0JoSo/RUBBebk5b3Jx0TNxpGQPHDxxiLmjit9ux2Ypo3NGyzAdtpIrS5UT7sBRxp
 o7I8=
X-Google-Smtp-Source: AGHT+IF+B0Dz5ymeLxvE0NoL8Eft6XXJVCNP3VGN9Bti//1tPqCP0l8zejYzuJZyevVcG+5vHfyB1A==
X-Received: by 2002:a05:6512:31c7:b0:511:4e64:fe09 with SMTP id
 j7-20020a05651231c700b005114e64fe09mr3963681lfe.43.1707295506401; 
 Wed, 07 Feb 2024 00:45:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsB7/s5J/AtSqsnUk8/0sSU47+GHOf5qGkjSxKc6vFG0yegI9tKMaDDy31oy/Penr5OdAXUZazuzmXgAKrDTn6zq9nSbn/6Q6C
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n30-20020a05600c501e00b004101bdae3a0sm54935wmr.38.2024.02.07.00.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 00:45:06 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 09:45:03 +0100
Message-ID: <20240207084503.11109-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207084503.11109-1-romain.naour@smile.fr>
References: <20240207084503.11109-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707295506; x=1707900306;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R9VGJ8YEJNSgbk4AFxLbgbuwRnm+l4eMhUdaPDyEsVI=;
 b=pmdd1TIA9c99C9Joonl6RpJ3+0ssNWcDkJG/dVcfvhoUAHlfS6aJjDwuTgOyNq+vji
 MT9Ke726m/ZTovvIipuHTqigsaX7OVp0unROhYp5rTZAcp+2JqfpmAb+nrY53macRPli
 jslens2D5xbpW9Npl/7CfKdUvofMLltrWpbnLglhQCCj8rpHY/Apsf0snUJ/60xQCJAT
 CHn/IV5mEkN3T4m4Qgek2lrZkou4jvgd8nzihW2ltOAxg+J/Xcxim+3w1BG4kn4D2WMs
 y+QEW5wBSSvyvSsE8pAHDF0bi/cmwRmZNzKvmnJzIbLw4DRXPO3VZq8xDT6HKndabInI
 ERvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pmdd1TIA
Subject: [Buildroot] [PATCH v2 2/2] package/python-bitstring: add missing
 runtime dependency
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-bitstring require python-bitarray and python-zlib at runtime
since 4.1.0 release [1][2].

python-zlib is now needed for the "Experimental support for two 8-bit
float types" [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/6114047821

[1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.0
[2] https://github.com/scott-griffiths/bitstring/commit/70c8af4d8bef557bc7d96f809d37e2c241587dd0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
v2: fix commit log about python-bitstring release (Marcus Hoffmann)
    reproduce the issue on gitlab-ci and update the Fixes tag url.
---
 package/python-bitstring/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-bitstring/Config.in b/package/python-bitstring/Config.in
index 93d7682577..82d0bb29c6 100644
--- a/package/python-bitstring/Config.in
+++ b/package/python-bitstring/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_BITSTRING
 	bool "python-bitstring"
+	select BR2_PACKAGE_PYTHON_BITARRAY # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Simple construction, analysis and modification of binary data.
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
