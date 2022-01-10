Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA11FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 17:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722BA40304;
	Mon, 10 Jan 2022 17:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhlfTkXF8pNq; Mon, 10 Jan 2022 17:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DF6402F7;
	Mon, 10 Jan 2022 17:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A496D1BF355
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9153A404FE
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 17:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMNBU7bN-q1g for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 17:37:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CC4840018
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 17:37:54 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r9so26439208wrg.0
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 09:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwuHAKKB+idSFgOdcjS6TwEs+udy7HV+c/YXOIBg8lc=;
 b=jGI1O00MMSWdBAHw8UAtADr9YGfjMYVsTiWbmYpLJ5h3x0pfA2+nPRFS9d3iamOoPZ
 6ykcDlC9vbyUfCXtj6w49xEIdfOc1jk9e19+FvcmQbYpszPxIb+xWhLsbLYbJyCF5dTy
 Jgkhq0NeIbvNrWjBQQ2HWlMEBCtKFzn8QVsIJtzrlor5DNwl8ASia2eem2aCGdgS3wnc
 lto5xLsnsFMjy7N758qUZtUHS456XeVfGG9JOU3c96mH5JTg+hoRG71CDn70ND2NvAsY
 nYkNXFEKDva6fWenWhJXE9j7Zt7jPRqEncXewM/GzL9f3c2xZ//svVKJlG5VX+41qE80
 ZByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xwuHAKKB+idSFgOdcjS6TwEs+udy7HV+c/YXOIBg8lc=;
 b=Fkbgynl0MEDbfWYJyAf2H/5oLom94lQcvuIZpgOnUBXvBuw+SOXVuUMfJ9bvVEF5eP
 Dg4Mhdl+26SwGjvSB24lKrTtSS2IU2fvXnblg4BmMQhz1dgiLLj6qwVlQ0y+JSKJXr7A
 YFJO7t/JpEogAxMZl1+TN9kuaiCenUZmC+Zv6Cc/Q9jl8QGEaeXdVczcsUgi341KjQ+t
 8mXNTJGSjQzPAZGugItactuAClDdgGZQOpBLAfhEfl5bSN+KicI4iz1gr2VJhHAcLFxJ
 SWvcyc4qn3bfieBGrb9mkSPDshofYqQgb7yAwm9Fvv9xhhzs2FapPEjADBsZKYi8iD9Y
 pRqw==
X-Gm-Message-State: AOAM530QqoI0IJBI34a5mBL1E+6HfUTfd5rYo4Z5u5rjrtCJk9u4SplF
 MbMwcUui4Gc+bRp1IOXk2KLY0bKxsDM=
X-Google-Smtp-Source: ABdhPJyjDF5Ke918J45RoMsA/G4YOmBW5OhwQeb/+Y6rSWlEW3ka+vAehf1HvfkURcxO6TX80kXpug==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr577041wru.640.1641836272470;
 Mon, 10 Jan 2022 09:37:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id h4sm7215376wrf.93.2022.01.10.09.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:37:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 18:36:40 +0100
Message-Id: <20220110173640.1748895-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: disable neon if needed
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
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

In file included from aria_simd.cpp:18:0:
/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/lib/gcc/arm-none-linux-gnueabi/4.8.3/include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
 #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h
  ^

Fixes:
 - http://autobuild.buildroot.org/results/e4fd947c118174a4fad62cbed18816f02d39ec25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/cryptopp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 5e6eb9644d..4353e35e0a 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -47,6 +47,10 @@ ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
 CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
 endif
 
+ifneq ($(BR2_ARM_CPU_HAS_NEON),y)
+CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ARM_NEON
+endif
+
 CRYPTOPP_MAKE_OPTS = \
 	$(TARGET_CONFIGURE_OPTS) \
 	CXXFLAGS="$(CRYPTOPP_CXXFLAGS)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
