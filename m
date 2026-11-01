Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE09606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dUkL9Kqq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A949405E0;
	Sun,  1 Nov 2026 09:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPZ2Y-SMJA8x; Sun,  1 Nov 2026 09:41:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A9DC1405D0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793526066;
	b=tP2f2eZxaUlIY8jRPsEHtOW2dV9nSauGCVOryogekt8tAmM5IPPWfkk9Rdo0LeBc07rG
	 eIdoHE+buIAI/rI6YaAAQrqoehpvIG+FyihMiGzolVW3s2zDdZqsMfM5bkBdLrsKTKzb0
	 AXFZj+/D7j+VfPMeebp3eWe08t2ZekCEKJOVL0XAYItO6ApWcaozGEvWcmqpPM7qrrmno
	 z/6xhnVsegJSL+kVizop/DCOI8zPRHjPRllt2Mj/gZMsnKz4H6KMNECePVMuTtmBZVvgS
	 RdVxw6dT8BziUD/tZGiIopP+Q8F1oxfuAbXbHqaylEugqpHoQtOEvrj5cdsqKF9aqqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793526066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sqoi94c7K99nIDf/6SDeZSDTznje48wkDdf+YMdpaOE=;
	b=SOx+aiPZL8LT+CXHZPpesG2SIjeLMbmq2Y4d5Ach/lwKmhjA8niBlFkveKb4hVfOOnrk
	 MU8O0fBrPuKQJhn9tMulrDBgXssFIj3PkcCO7laysO3Mzrd4H5FichJ54ZhRj8LwqbN/Z
	 GE2b3HaYrpoRRpdHWSu7V7337k1GaGNR0yGPaGZGRdS6/qvLsloNf8KEKKVUcvyK/o6cu
	 3ARlSxfS6jnsbS9PcPSW3LbPJWG6FSxOGvu+mqti92hAi183iVDYKUjxhdKtSAfwqDBmK
	 n5z/U1Sixo2Gfbmu6zu7w4r16fdY3aeKPj+neMaUJGb0McWXFc3UmhMd4Tm9GFdA5Dg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793526066;
	bh=Sqoi94c7K99nIDf/6SDeZSDTznje48wkDdf+YMdpaOE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dUkL9KqqJyQhAykwuyXx1c3U/M9j9VDZ0BQQcicRo8ct+3wNU56IYppxg9wylGaDa
	 izRb2L0QuR522nGgCK7p8flucRBu3L4AXbP1p5SkcsWqGzS2GeHqqiffEfmncYsehk
	 QCKfKzZM4y4LxuoIz3qyaoPApdkPV+98CXH/TABPVDv7QTQWwA/0qP2zK+WIGuW2cY
	 lIPbpICUyuJaIEk5Hu8DVSu0tfy5mRForxTDRfZ+PieT9T6rN4Km7H0d/18w5d7m9f
	 VnJ39eoaVp6bbt8crNONaM+67BPEjlha9YFtght0JTR9DrhdTNGGHsZYd5RxxbOyL+
	 ZtBjW7PjHalUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DC1405D0;
	Sun,  1 Nov 2026 09:41:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D318EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 09:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23327605FA
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 09:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAsfMpBV3dFo for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 09:41:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 024E2605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793526064;
 b=KRMNjN+O1MKYe0zTS8Tyor+Ey8iuYeiHrmGAzrcsLa8kjdtoHTOSyfT22Iu4RannK/FH
 Ai73F5kkKTx+4uJvqBHNUV3JWjSffvitv+TLtKTTGf8N+8z+2ru+fHqm78JLBtuGvXIQm
 8PFEssrLLRE9HFdt+DggtrxdemO5blu9RbBVmogbQawZIvdJ0nWQvuqwrsIk94lwFMpVc
 DCXn8IttUaDYSix7Bw5Qwq+I/OKmiaPFCTXKfXyL9F9Tck1+pSH3vBklSFwM1dRWsz2YO
 KZl3wfLUPvKxzB42/azCvoRO3YkqdvPgPAFdp2Cdg9XuIN/+crr91jeGP9jcWDDzeUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793526064;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=4+PHFoO1I6ZXRTV78Jzc5tlcrg0ZGurH0YUfZTgka0g=;
 b=SXEku1sLrmmbG910aHRyQoE7ZQFF3+72qLQlws9/oRnIB8PLnr/oZoInsc3PxX6kbfB3
 0DT5Ihfm7cvLEfYDZM+RTHBW3WC89+0wFi1GHOD1i969BcCpVCiyju28oenvCEB49y6ul
 UHNW9JpbdVKI5BgpTiwBNmRcUrnUWr1LB/1hn5zotgYzRzdmb48c8SFZeRtTv4H1bOlBx
 1acsoJ/44PbMzD0B48JcePqb8ci9tGtmKEImOQPjjgBFWw52fHPQEhgND+wWQuJh4ZDbO
 rumCC6mDV6rpssP7KtSmDRUL51AZDmCQGezBRmbyHoxqeeARPS2eRv+Cu4KqSNeLYZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=gknHkHIE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 024E2605F3
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 09:41:03 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6afafc89b48so3323295a12.2
 for <buildroot@buildroot.org>; Sun, 01 Nov 2026 01:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793526061; x=1794130861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4+PHFoO1I6ZXRTV78Jzc5tlcrg0ZGurH0YUfZTgka0g=;
 b=ASbJO9+c3BfCbKkTMywyy2fp74jSqhuKsyqGmG4gmDGuzFuJCGulS8OcT1K+o5FCRG
 AYWpo/PrZbkQ9xOiPnEj2zRdTJzQh5XxOc/48sIv0ad5KqMugFxPcwW7RkL4xOsXRVwU
 WhOBnMDe0gvggBIhHBY003kXVnXolHPqJZ6pC2UocCMcQc0lnMecq+yaJE2aLeHDWouS
 5RtnJG1HZr5Z7umyD7JLqrJHs8elL0O9O9miLr92voXtb/hukhqfqVTHVR8aiYJsVwkc
 R1Y+8Qu2PLBL5YDSgrs8+Pp+NvdXyS34LoupPmdh3ffrQZAIcuoXgN13HwsR2ZGBQuVS
 AHbQ==
X-Gm-Message-State: AFq9FYIkHqbV5Mlilt3sCzn5EnaePrO7QcXV5fKKa0Wo0seZsK+sRX7T
 rggs/VVbiyJPsDBRzLgmB8PMyp1LWjvOcpL1k6fYVmigce4qfSzZOYY/TSxCpQ==
X-Gm-Gg: AYBFou0o3mlVvOXoACTFWlTwA7R082I1XNtON9WtmkIDjhLE+/7xEQ2bmymECGv5sSG
 Ri8SXj/OYkYBwPwajIDZcPmMj+yVzqt8mhTUy0XdZSYt+XJ+D4xxY7sBPwZ7S/ObJJ9m1uS+rfw
 58IcvHiDCeqIeKuaBS45UQdePmTnUdlHMy0dBmiNwwkoXbfdCndzyMa4hxFEO6xyvfj+7eCceKT
 j34mia6dY9dl9EDAtxQOGqoV70uG4Psa9m4L1u1rZZ/4WK7p81VYJddn5xQu+kzD75ArgKg2BL1
 GHGjM1hHUXY+h0NeoXZlB9YCxQ+NKaKbuR/tUbEH9m8aXaz/G9H3dBQmM50slVDO2La9f1sFxCJ
 9t0sJEX5yPQfVcvPH32yXKXvGo02FB19ziSUnscr+x2eU4G84SMm+14ECF+EFlPDklU+xfSvNE2
 0Jrwd7gOAbBSZPXh7GpGicPDyXZPjeG/dm8uv8fU4QEn4bYfWmjE0M/vI/6UwvTAp5WRj5+2Udy
 ihp9dDcIPE0IjkgbVDPUCDZqhhEaqHK2zgab1H/vQzzMUuN8jQK0w2ebbC+MSNLEfFZ4rVi0lKM
 emFocK5i4U4aFb/xvGVfML5FQYN2+G6poR3gEiPdiMKKi/8gZOlcUSXXWkTBFDbvpiZ4SZwbD0S
 857CsVMxAhvP6FoiT+O0kcDQp/EshdQ==
X-Received: by 2002:a17:907:86a1:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c4ca7ac0df2mr562353966b.35.1793526061225; 
 Sun, 01 Nov 2026 01:41:01 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabc19167sm264836866b.10.2026.11.01.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2026 01:41:00 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 10:41:00 +0100
Message-Id: <20261101094100.1906969-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-autobahn: drop stale C++
 dependency of compress option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS depends on BR2_INSTALL_LIBSTDCPP
because python-snappy used to select snappy, a C++ library. Since
commit a8c315b62c0c ("package/python-snappy: bump version to 0.7.2"),
python-snappy uses python-cramjam instead and no longer needs C++, so
drop this dependency.

python-autobahn itself still needs C++ for python-ujson and Rust for
python-cryptography, which also covers the Rust dependency of
python-snappy -> python-cramjam.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-autobahn/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
index b32463d1b1..440e18d2da 100644
--- a/package/python-autobahn/Config.in
+++ b/package/python-autobahn/Config.in
@@ -20,7 +20,6 @@ if BR2_PACKAGE_PYTHON_AUTOBAHN
 
 config BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
 	bool "Non-standard WebSocket compression support"
-	depends on BR2_INSTALL_LIBSTDCPP # python-snappy -> snappy
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_SNAPPY # runtime
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
