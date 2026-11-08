Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BBF606A31C
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RsnAJ6QE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IvM6MjYg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC7460703;
	Sun,  8 Nov 2026 18:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hj2629v6FYA4; Sun,  8 Nov 2026 18:25:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C77AE606D0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794162326;
	b=h0HkhxQ/WO8OjHhr1ilY6lsnb+vl8y/RKYUe3G7IwxQj5qq1mE2sIaDVknks0Nl44fcc
	 X/WZwKdAlIehI9RPL4/9ULC9sLebTdzAa4trrwhUypRgO3vShjIZf+oM0qrYXAUq3uWDH
	 wsufzt+GoQfy/8OyNwgq8qlllX1LEbXrwOq0WLzN0TXEpNsffhcY0gfIVrmjH7kd38fI+
	 PBGIFJD229dnWXX9JqQNEMog68eB1ejNgmV7TZXKeKByjlx/kRqhdS7ZLsaH/IYoz41t9
	 ljsXNEGkx4reI26iV3JzytefaXmAIajY5nrNFryTchM6CVDr33GpDVkqNmN3SVGw4Tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794162326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FIiQ7HqW0a6aiNHwSUWwW85m4v+Uv3TOj92tHIxlUg0=;
	b=Q1vRjouzlbe0Q1Uhv/FGSCt9FIkPLIcJHy8nna6cmipG3CjtAJQS+oEkOOdybteoQTex
	 aY2uhC71FD5MaSPrQdGHBnoffCGcY8ppjV7uBxzBmh2UjMOUjqFCOZ4A+ggr/L2XXWpsn
	 GVxgYwvQQpoKSgFuUMsY2+aiU2kpcHN6HVMMH6S2zaW8+52UKGs4cl1iXHKJzhiNQr0Gn
	 Dxl4FA+0oHBhvs7DvJd7fRRQI/8c0NKnLZuctt9Nf6uS16YVFHE3Ku1I21byfdCENblMh
	 HqqZxu8xnMcX4AOBV1wArUZo4e30Nwe8F89fPbX/82BSfhYHLIX25W2YrTGfse5xJ7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IvM6MjYg;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794162326;
	bh=FIiQ7HqW0a6aiNHwSUWwW85m4v+Uv3TOj92tHIxlUg0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RsnAJ6QEZUGUZCfk8q1mmr+DASWhEjCzNMfhh0w9Yw3WssaCg6J2HggeOpaFMHizc
	 4vnNnPycRr8u524vzqAeUoaAcOZLL9B8d+Xl4N27lCP7eUgIJQSY3YYjvMr/2xvdHe
	 2Z5swyIm0DaqOOsdSzmXqqSdBHq3o4gE6f+AbxCajwgK0x1HAxCoGypageBJSF/4M6
	 L2V20p6Z8bRvtYDvx3/M1nqUW6sXvgWUxyxxdo0D7h3O/eDzMU6bewl6kxHrdQ6oSi
	 S4CVoTxND7WbYVX7+NW+j+jDZMmxzacE6NIMtHTZZGeKZbw84e7eFZLll4u+uvbQjg
	 q2ZPHSnFa2DyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77AE606D0;
	Sun,  8 Nov 2026 18:25:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79D162E5
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FB02605EF
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 18:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQP7P1KdD9-D for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 18:25:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C152606D0
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=IvM6MjYg
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C152606D0
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 18:25:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso31142266b.2
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 10:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794162321; x=1794767121; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b5beL5dGK5pAdobDN6YFILOt07S2GWajKsM78qxh0bM=;
 b=IvM6MjYgMCXZZi/gPO/dbdAF+TbU74EYL4xLogYbY8Pp3oXbE5kN1OeHktv7SWZKkE
 xo/7t/4Et/IDoDIpqOnc4YjPR69SbaWkL3iuPoHMxE9CpANAKHAWTx9UasD4mA9DZ0iM
 CKfW/udcexF1EMQCQ44D7vUW4yD8Dr0Z+OjVIvZ/UOV9uLLlEV6FBu1JuviY3+pPcMKr
 S+TZoXS6KbYmBbrhk7szqQ3mUNk1f/aGX3t1i5NROYVxZHQ//IZ7K3eRh/OuMi3XEh+I
 +GVtR96yTk9vhbolypbcQdizaJrdxoIvGWVpNYDA/i/4aO8/2NdZTR6yY5/0dK6yZZJd
 Xaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794162321; x=1794767121;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b5beL5dGK5pAdobDN6YFILOt07S2GWajKsM78qxh0bM=;
 b=p/fBi9g8OKHkckK7rUBZSo41FgJIaF0wOwzNRBPizwYCmxytcDhmm8fnnWt2WIEW27
 lSXaTQSqR4TIabC8OECOLymqWMO4P5QDE5KdPrePucZQexZj+7u7cqcazwxjDz2CsCBK
 UqAdkyYf1Wf1TFvWhs8uHYMLOtMMeE0aFQeKwFOBle02E9+0qgbq96nvhntnG5DljBy/
 F1cHRtHpO5ix7d7oGjPrgcvanhVhHaxxTyZx5YhA+HDH5YVfC2gB/P78OUVCWNnR46+t
 6qmBmjU9ETwrAaoAQ5lRp7Nry5JxFYD/3V7bNkwNXb+dHbRjXuijZqmsA7fEEbUWcUXf
 mQ0w==
X-Gm-Message-State: APuU4Z8SM93wjzTNndazeehqBXrpaqGFiHA7Ao9v4nCXHQp9c+okBpvZ
 8GmbaAP3rwI35tYj46WyoFh814+55/YQ5m4DTZrL4Kfu6No9TyccdNXIMVRTow==
X-Gm-Gg: AYBFou1feHpNew6pHKVpAMon9i29kJSH4jGQnMwueckJanYXuMjY+B5uYdS1OPyrC0M
 A2JvKOBo0mkcVaA0O3JOVFT75//0rlHnjXNjSGkQGlFRsigEq+eJqNvueVwobP4n6I68/gupjaE
 Pi3pOUS7Sjn4wvSK0Nhu4ufirL8hS9AwupLarvcl2hjaeGyl7/D8td4gpwSp6Jtm+xEORRuvuGJ
 iMBsf06TjTdcv9klBNoXJHxsdWchMMZMEjrgB8RUEhgVT5lXUIkGknosyPCCud29IrgWJdsPG3n
 zk55pW0XrZ4tkHM/B3fNbX9609cofcAL9kOJS7CmOIi7LCFGIw+9VZRmIm2GB/QdYXY2f+aRJPQ
 a8P64TDbdcI04I+SpJmMWAUA+v03fSeBPp/u2fX4961iBqeaBPGRUXVcASczmZuob401o9tHdDb
 EnRUcS38bcQTTdebKYhKOWauw459nt+VV4MjFstGA42ROdtmQB5bdLK5XQp9frXG9yCyU0+zuge
 d67Q609Fp1blXsB6kmmecCrjHuD8vqM5SbrL+5TAlsxu7yNnPqsYRZhu52D4lbLpd8C37hwJRYQ
 KYazH1gKaEA8C5gJd/CndJ0s5VUK/+8xzzaTOLN6RHmKT6tilpVWlsfha2V6WTJEWReSkCrUUlO
 g9OFwp0L7
X-Received: by 2002:a17:907:9805:b0:c41:5a0e:3356 with SMTP id
 a640c23a62f3a-c4d6d792b4amr146241666b.41.1794162320754; 
 Sun, 08 Nov 2026 10:25:20 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d69f9443bsm79679666b.30.2026.11.08.10.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 10:25:19 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Nov 2026 19:25:19 +0100
Message-Id: <20261108182519.2825196-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/scripts/gen-bootlin-toolchains: powerpc
 toolchains are not soft-float
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All Bootlin powerpc toolchains are built for hard-float, but nothing
prevents selecting them together with BR2_POWERPC_SOFT_FLOAT. In that
case, the toolchain wrapper adds -msoft-float to every compilation,
which is ABI-incompatible with the prebuilt C/C++ libraries. With
-msoft-float, GCC also doesn't provide the __ieee128 type, so any C++
code including the libstdc++ headers fails to build, e.g. acpitool on
powerpc64le-power8:

  .../include/c++/16.2.0/ext/numeric_traits.h:220:38: error: '__ieee128' was not declared in this scope; did you mean '__int128'?
    220 |     struct __numeric_traits_floating<__ieee128>
        |                                      ^~~~~~~~~

Like for the MIPS toolchains, add !BR2_POWERPC_SOFT_FLOAT to the
conditions of all powerpc variants, and regenerate Config.in.options
accordingly.

This issue has been present since commit 184d47a7adb8
("support/scripts/gen-bootlin-toolchains: add new script to support
Bootlin toolchains"), which added the powerpc variants without
excluding soft-float, while doing so for MIPS. It therefore affects
2020.11 and later, including all maintained branches.

Fixes:
https://autobuild.buildroot.org/results/7515d590795b0002603c5ba2f55ac37f31afb488

Fixes: 184d47a7adb8f58a036b1dcaa72d09219a65feb2 ("support/scripts/gen-bootlin-toolchains: add new script to support Bootlin toolchains")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/scripts/gen-bootlin-toolchains        | 14 +++---
 .../Config.in.options                         | 46 ++++++++++++++++---
 2 files changed, 46 insertions(+), 14 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ee64a86902..84e7e53feb 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -126,33 +126,33 @@ arches = {
     },
     'powerpc-440fp': {
         # Not sure it could be used by other powerpc variants?
-        'conditions': ['BR2_powerpc', 'BR2_powerpc_440fp'],
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_440fp', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc',
     },
     'powerpc-e300c3': {
         # Not sure it could be used by other powerpc variants?
-        'conditions': ['BR2_powerpc', 'BR2_powerpc_e300c3'],
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_e300c3', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc',
     },
     'powerpc-e500mc': {
         # Not sure it could be used by other powerpc variants?
-        'conditions': ['BR2_powerpc', 'BR2_powerpc_e500mc'],
+        'conditions': ['BR2_powerpc', 'BR2_powerpc_e500mc', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc',
     },
     'powerpc64-e5500': {
-        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e5500'],
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e5500', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64',
     },
     'powerpc64-e6500': {
-        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e6500'],
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_e6500', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64',
     },
     'powerpc64-power8': {
-        'conditions': ['BR2_powerpc64', 'BR2_powerpc_power8'],
+        'conditions': ['BR2_powerpc64', 'BR2_powerpc_power8', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64',
     },
     'powerpc64le-power8': {
-        'conditions': ['BR2_powerpc64le', 'BR2_powerpc_power8'],
+        'conditions': ['BR2_powerpc64le', 'BR2_powerpc_power8', '!BR2_POWERPC_SOFT_FLOAT'],
         'prefix': 'powerpc64le',
     },
     'riscv32-ilp32d': {
diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 81cb3f0a05..27d19be2f5 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -23,13 +23,13 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_or1k
-	default y if BR2_powerpc && BR2_powerpc_440fp
-	default y if BR2_powerpc && BR2_powerpc_e300c3
-	default y if BR2_powerpc && BR2_powerpc_e500mc
-	default y if BR2_powerpc64 && BR2_powerpc_e5500
-	default y if BR2_powerpc64 && BR2_powerpc_e6500
-	default y if BR2_powerpc64 && BR2_powerpc_power8
-	default y if BR2_powerpc64le && BR2_powerpc_power8
+	default y if BR2_powerpc && BR2_powerpc_440fp && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc && BR2_powerpc_e300c3 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc && BR2_powerpc_e500mc && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64 && BR2_powerpc_e5500 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64 && BR2_powerpc_e6500 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64 && BR2_powerpc_power8 && !BR2_POWERPC_SOFT_FLOAT
+	default y if BR2_powerpc64le && BR2_powerpc_power8 && !BR2_POWERPC_SOFT_FLOAT
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && BR2_USE_MMU
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D && BR2_USE_MMU
 	default y if BR2_s390x && BR2_s390x_z13
@@ -2757,6 +2757,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_BLEEDING_EDGE
 	bool "powerpc-440fp glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2781,6 +2782,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_GLIBC_STABLE
 	bool "powerpc-440fp glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2804,6 +2806,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_BLEEDING_EDGE
 	bool "powerpc-440fp musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2827,6 +2830,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_MUSL_STABLE
 	bool "powerpc-440fp musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2849,6 +2853,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_BLEEDING_EDGE
 	bool "powerpc-440fp uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -2874,6 +2879,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_440FP_UCLIBC_STABLE
 	bool "powerpc-440fp uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_440fp
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -2898,6 +2904,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_BLEEDING_EDGE
 	bool "powerpc-e300c3 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2922,6 +2929,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_GLIBC_STABLE
 	bool "powerpc-e300c3 glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2945,6 +2953,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_BLEEDING_EDGE
 	bool "powerpc-e300c3 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -2968,6 +2977,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_MUSL_STABLE
 	bool "powerpc-e300c3 musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -2990,6 +3000,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_BLEEDING_EDGE
 	bool "powerpc-e300c3 uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -3015,6 +3026,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E300C3_UCLIBC_STABLE
 	bool "powerpc-e300c3 uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e300c3
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3039,6 +3051,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_BLEEDING_EDGE
 	bool "powerpc-e500mc glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3063,6 +3076,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_GLIBC_STABLE
 	bool "powerpc-e500mc glibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3086,6 +3100,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_BLEEDING_EDGE
 	bool "powerpc-e500mc musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3109,6 +3124,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_MUSL_STABLE
 	bool "powerpc-e500mc musl stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3131,6 +3147,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_BLEEDING_EDGE
 	bool "powerpc-e500mc uclibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -3156,6 +3173,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC_E500MC_UCLIBC_STABLE
 	bool "powerpc-e500mc uclibc stable 2026.08-1"
 	depends on BR2_powerpc
 	depends on BR2_powerpc_e500mc
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
@@ -3180,6 +3198,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-e5500 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3204,6 +3223,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E5500_GLIBC_STABLE
 	bool "powerpc64-e5500 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e5500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3227,6 +3247,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-e6500 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3251,6 +3272,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_GLIBC_STABLE
 	bool "powerpc64-e6500 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3274,6 +3296,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_BLEEDING_EDGE
 	bool "powerpc64-e6500 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3298,6 +3321,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_E6500_MUSL_STABLE
 	bool "powerpc64-e6500 musl stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_e6500
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3321,6 +3345,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_BLEEDING_EDGE
 	bool "powerpc64-power8 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3345,6 +3370,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_GLIBC_STABLE
 	bool "powerpc64-power8 glibc stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3368,6 +3394,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_BLEEDING_EDGE
 	bool "powerpc64-power8 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3392,6 +3419,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64_POWER8_MUSL_STABLE
 	bool "powerpc64-power8 musl stable 2026.08-1"
 	depends on BR2_powerpc64
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3415,6 +3443,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_BLEEDING_EDGE
 	bool "powerpc64le-power8 glibc bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3439,6 +3468,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_GLIBC_STABLE
 	bool "powerpc64le-power8 glibc stable 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -3462,6 +3492,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_BLEEDING_EDGE
 	bool "powerpc64le-power8 musl bleeding-edge 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
@@ -3486,6 +3517,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_POWERPC64LE_POWER8_MUSL_STABLE
 	bool "powerpc64le-power8 musl stable 2026.08-1"
 	depends on BR2_powerpc64le
 	depends on BR2_powerpc_power8
+	depends on !BR2_POWERPC_SOFT_FLOAT
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
