Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ADE606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UKzNi2DF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flKYEPbs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3129460728;
	Mon, 19 Oct 2026 17:19:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IWhPXMfFRWe; Mon, 19 Oct 2026 17:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2FC866072F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430344;
	b=RKMO/uAKWsblFYFMuMP9Q2v6Ulb7zvvtLHFFukXSTYKmBeVHDaZZuEScFiqGM0dTZcP5
	 zVZP9FGrjLnud3Myv8qiLGGYG5mdO1tXB8SO5vvAjFQsqhUuC2zg0Ga36ce8RrV7A4Dg0
	 Zs/AfIrhafyNV85+fpMTaElolGWMcazNmMhZxdUimmPwGowdJLQSPOrGM2HqxfalK28R0
	 IihU7RT4JkjKGptVqKcMmlQCyr1HwEbqYIce/ogCiB+CXFSRZS2i7E5pM6eXXAGtqHTVV
	 SR8c9wqfIVky8ajbuhtXRNajw4eAUOVDyOYHfpDEl8GySwc/Y+olJzLuyehlsqoedKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cl7U7f6q0L04uZOBSlpbGCpki3nwp4D97D7edQupnHE=;
	b=e/XwXjlUjV4S84GUUfomcJNREUlDCD867Zf+FCBI+RLDhOej4QTS/4PNb/K1tcbz6it2
	 t96U1oBAgoj0hL0mtrJuE5bHzBg3Aa/7Tx/mtt//4llHZLhCFnQ2fzi2+0Sa5HwQH3p2E
	 TDHcdEVxX73J1whlDR3Ti7mAPJ/+LOjzBex5Pln+ugqvdsFQbY1KHZToIul2cEuzSz1Xn
	 1yx0xlUPsMLMl530sY40P2BG8/jVGPxrXcHbNlxu47AN/U0WQCoCDjAxDfO7/y2pT5yCA
	 ZNh0CkxAiGtANLN1dRaJ9AXv+uXOZ6gcZhauVHIfvdzbPcIOjeOv358wAJbMpoXTtdg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430344;
	bh=cl7U7f6q0L04uZOBSlpbGCpki3nwp4D97D7edQupnHE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UKzNi2DFU1sI8WW5FJ2cjsPZB/WeMz8TZRlFbzEkvdzvO8zvNHqlEabCANMTdSjLt
	 E9F9IbyvklnPxo+zOpjjxibXVYCJjV5ParzasXO84bidBekb++rLrLZ05sFhhQyota
	 3Y7j0RBRPOHa8aIUsHOABs2Vm9e7k/IYO2JO9HQxPOy91szUWxzG2d2C0RrQiTkxNk
	 Hva6gHU9b1VK4QkLw2VqNnmsKMV9kwxHNo7MRw4XJSYwfZ3ymTiOmdalySbtSTT5KA
	 krajM5qL52n/kxypqdyq3zoxuoZqKuojTYn36DUb8tqcHvPmxs7dzcF3WzaH6AIkIM
	 VqtNaDUkAn0zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC866072F;
	Mon, 19 Oct 2026 17:19:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C92071E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB5AE80BBD
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1j305mbXyea for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCC3A80C84
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430342;
 b=sWHYyt4AczAgAI7dBUygMn5J1ty1zN2s4tmEsnDuyjwjDAPg5yFbGlhlcf4lo053Of91
 fOl6tKsY1E0saW/sP7YQVoG+x9MP7A1azjU7Biic/hnyQuLlwNbrYDa3znZcthN6aAIzB
 6dNmmokcdNb1Frbx00pjE5cHnQfovKNorHRJcPdOzkVSSyDxp7zUZbCEwitUHXBU7LOTb
 EIe/sNVm1meWQHg5TRJUNr4slzt5JYzAPb2XrBeAu2se0cUNWNV4wfTQAeUhm1QxtMIFh
 fm3gcHikQv33A7gwqNiiukZQoKeTBfP+GY0bNKEoiAZ+zc7y4kmIpYZqaRtr/ZvTlYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430342;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=v+8UH/xHyv2aofpLIoo9A6zGiaoee69A7AFO5P59KR8=;
 b=ZXuuKo2MoJ5U0AOxhSe3+I7PeXuAWTC2O6X3gu6kFeoV/tg18Ze1DFaH0uPnbXPAmM/m
 GA0BVITqfNzuhLfmZq3jlT7Hv3FS06td6K9GUEfduGL6h9uDY8bNhalVR3z0kyl1P/yRY
 6b7BgHqGtT5+Dx1XSk6ktcDtLRqSFg9Ra9zEKUForfOra/9j6GPFfqpW2bj6f+z6FMYjV
 CShwvC6CmaCdmEWxU9ZFSDMiD4hMk74ANmZHSCIRLxXhvYyvbEx3aQfX3RZBN8aouo6vn
 Irh+3IEKzDvEhE0hkDrTDpcQXikfGTQHCaRASg9N/4IgGWy3u6qAf8VRSGRB6Fuej4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=flKYEPbs; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=flKYEPbs
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCC3A80C84
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:01 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-539a57a0b1fso789579b6e.2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430340; x=1793035140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v+8UH/xHyv2aofpLIoo9A6zGiaoee69A7AFO5P59KR8=;
 b=flKYEPbsFNFYqE+T08vfv63MMTqvsyg/qa4zI/j/SOj07WOHYhoBDobOW5HKytNefu
 NL9P+r0ekIjTWVx35T5c9o464zHF4hTec1P9eK+8+M62Q9+0aFwEXroAYhxSE/4wMZSZ
 922nR9LqLjHF0HzzUGHzWMSWoymsy+WfCRdlis/1F8Cka3IYF2ZkKbVfAIhq1b9rurxQ
 NAXFyVhs8+Jh1d+kDVM+qfwoEpcLnN/Q8fEmV5XPNIAWHeF5RAS40/QhcNONUAlSVH5Q
 1xb9LXR9aYn3vncqrft17kj2UPTmn6NDf/g+7pFsPpFj7VwOkavnvqMryUw5elgekMOD
 8Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430340; x=1793035140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v+8UH/xHyv2aofpLIoo9A6zGiaoee69A7AFO5P59KR8=;
 b=Zb5m+rV4N+LqGf3sI6J7xfqvvFeG0tiflcA1zkNWF6zGaVvs1Q5r6CqNyBP3f8/MT7
 UPsmWoPX5AxBKJfBHYUX8PWTcU65ezAVIoJCegybvd+WuI60qbdEdZQuy9KT9dwC+DeC
 iouBHGP/ue30YjECLvJWpfQcjFlJxMgd9CQAiiLC82nn1j05Od7tGvI2Upnl0IY9lm3s
 +gBUVgCnVTVc6t/nuaf0KEud3YoNRpfYC8rk2cuKuAzI2lYubuT4rOU/4tGDFPcFKLGw
 yJmk98JiYAIZyesraGV4N32Hr+WxMawiSkHtc+KIOS8a4EY4y/459l00MK5M4yv3uk4l
 4rpg==
X-Gm-Message-State: AFq9FYL9D8OQPGtvOErlhjCgIjrudpma/vAqxu8trfIlq8flZOEdVPyw
 TgmSR+aYysQVZ94ItJZWvQ9LgtAegU9TQxZ28a/HVAnc5+WMDz2830RZfW2Blg==
X-Gm-Gg: AYBFou2dzt8GDsTqCOCg6dGQpr7Di2X3kOktGexaJ1zD4CfI3CToU5N3V7pL4766ziD
 t+B1Okbo4Qa7EA86KswVn6NKIFL7gDHT+WZobYX1E5/Nhff/tOk48aiAPajwlAog/X2VM/M3hsi
 mWVKnwSY9tx46fh9qz6mGNkBNG9YTKSZjcJ3O14FDrDxgVPny2+krxRXq3qGTRzPAO63vfQKfoi
 IZwHDrfZF1djZub1rDSLDEourcgq6xYrCDCVyRlgYkGkXDXrxj6g9NtDQNorXfoAt7N62lroZ7f
 ltqUshDjpQbyaMm4xkx81o2DR2cUqnHQoxFeknFfVyeFqvShJdE0jiGhQNoFMx5KDN3Sa/U9d+/
 YCJ7MP9hdDy18LDWIeMig/blrTThH9/vBmANjKhJ2LjVPy9VE7Wp1Gic5oaPk8AElT+uSGrZ/w3
 p/XsjCDL9Hc1tQsuBzTTugQQ9jaw62ek3NW1vEp+pUE+wXLX+4MUP6iZiXQFHXBJFK2RPF+atzy
 vpia952R5ahvuwUEhQ7qzmpq0jb2dv0kFQr/FoNJ2ECr00YbfSBVMg9SmO8dkoMZ0oApfE3FJcV
 ubHR/uc5rtOI3xR1BYwzYrimJBgkp/9xbbTaAPgXb8bml8jVfjKxvlGDktcqu7ovZHeUy2HT0Kx
 P8SgsAqXL2i4aKNyVnv9Bx8biKEBPVGAOUGAsvLr/zg==
X-Received: by 2002:a05:6808:1784:b0:4b9:e5fa:8a13 with SMTP id
 5614622812f47-53cce84d5a2mr8203899b6e.24.1792430340313; 
 Mon, 19 Oct 2026 10:19:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:18:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:43 -0600
Message-ID: <20261019171854.734871-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.148.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 8c4142b76b..d45c91abee 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  1acee1cb23e9a402c5d8afc54cf5078a  fastapi-0.146.0.tar.gz
-sha256  e96047fc353ff43f7fda069c3578a7d94902a762d9aca2e065f7f801abd91a49  fastapi-0.146.0.tar.gz
+md5  252e224309e54dcf795e8ffee564823a  fastapi-0.148.0.tar.gz
+sha256  06ee16c50e429daf993a58ecbb5306d284c4c1ee8135380af39a5e1cfa715187  fastapi-0.148.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 6301b61742..4ef5141a5e 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.146.0
+PYTHON_FASTAPI_VERSION = 0.148.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/5b/f3b4277844c3ce66c16f62670cd2a26236489aa97115d04182171ce714a9
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/72/da/e962004c32f34fb630e8393456cadcd08d4300b6fa0099ec0ae5052b8418
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
