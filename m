Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D9606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 22:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BXB5UWNc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIXgBdBl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40F4D606D9;
	Wed, 25 Nov 2026 22:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJk9FpCda15b; Wed, 25 Nov 2026 22:36:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3C6F36070E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795646160;
	b=IIF1mMT8sfmbKZPR3q8kO9YozniczC5dyJ7SKp0wuxomO5P0wjxAw/A1oEHGzY6fX308
	 6C7kJ7MbwFyynfuol+cTt/jIgCLj+cCu8jgvBZ7nJoITUD9oCLx2sTtkQYhxEctCQIZ7M
	 OlJYW//y2mVniKJs1cyJ55rT9KVSDikULjx/ool5nymPaXtiuBpdEFzJnPinp7K83VbB1
	 qZ29lG1VHAsLdTnx/ZwRX9a3sC3fBH4Kc1pHszJSDI3vGnGb+lVUdkJqxXnHYp4dcyEJC
	 qRBatjohZTOeyhHwYfWfzdfm7AN95AyWRj0sZCpX7D8lzZnaaZSl+rNoS58zo+wwNMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795646160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sx4ECUvcJFGNLq31JkfaOJ9wQaWDrd+gCINe+MI2MAQ=;
	b=oNK4xVdbfIHu+10D99PYG7xHtNsq9e1tAz/Q2TMIHEr9JSDPyCJT2wk/xo2+ffnKhpLt
	 CXahGUiY3W4in1cD/p7qbM9jir0z0TxfXPKOV062h6o/FL23Xk8zFbw17mH2/Lpda6wY7
	 XNSD9VJnFuATSr99nq7B5UJVqH4Xga7zMMHUXuV96cYBYVqgAbPjXel7n4TJX2R8f4wmh
	 Ae71sg8Q6N94LqRl3vU3y+MqL339w+wdiv1BiXCyDSp6rsHH/9tpUq6R5wZnm/Wz2wZq0
	 OY7YU83Dkvkr5rbOeGxwR76Ydpb98ILYXe2HqjlfPCAsUgH6FNP2OGXR/IZiCPM9z+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIXgBdBl;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795646160;
	bh=sx4ECUvcJFGNLq31JkfaOJ9wQaWDrd+gCINe+MI2MAQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXB5UWNcwBnSXCmhbHU+BC3CkiJGnbQ59HsUIjfiKU7zI66MQtDgefawE92x95cvx
	 s3Jl4pLQ/Wxz9MMZ4LWveNC5zm7HR6BOigOAFbVL3ZEcJIjF/xciFDRHfmd0+RRjPv
	 /XPCy8xWH2bSfC0GG1l50rhdfsPhduNO63pKNZ8gcnTgNExzXWqmnUJxTPuAc8tDdx
	 BthFmoguKi5gIllQxgjFbayK+6ER4LDfi0N2KzamjkTB4wl6KTQXCY0N0XJovm+mio
	 N+AdOa7sF1KS7t2SXPLW6a6ItcVZxkjsIMI4G1pkCzqVMeYwZOjz+L7riNn+nLuQ+D
	 Tx/b4Q1gZm+vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C6F36070E;
	Wed, 25 Nov 2026 22:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 794A226D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 22:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B3306070E
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 22:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSqB00NpkTfd for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 22:35:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8249B606D9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=AIXgBdBl
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8249B606D9
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 22:35:58 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso34418305e9.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795646156; x=1796250956; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hGC+DgW1Q75ML9fyZoThU9NkyUPPeEz57JkJ9W2LZMg=;
 b=AIXgBdBltwC1LcXQxI5dsyTbk7DH+quezbnm7KNES7fMb09fq5eBRmrRenPox4uf5a
 rvp9QBlTy6F6djoDI1C4YTZkiTwEjEtY+/x9HkT6UG/kJaqbXhOKJogCRKBfIzsMBazc
 5URVMY0pOv6S1LfOzOUdTHp8+AkLazSVhe88mPCZTLUORaI2gw508sxZQCkRW3gEEEsd
 VRhgYqUsMGK9SyyNO63EjnZiQLK6Fp7xdf33nJq9bEns/AKNSv55z6HMuKmPzVzSk174
 GCj6zft730E3mRp6mivcbkIDCFqXpseWyay4+IoJQ8Ztk4KAG3Jg2hEcXs5ywOL2H17Z
 P+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795646156; x=1796250956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hGC+DgW1Q75ML9fyZoThU9NkyUPPeEz57JkJ9W2LZMg=;
 b=yGdtdo6MtJOZUsptlsmdEggZNmILgCzj4RO+zKM+pHrrhmHC99SWKWv0PDCJ3f7q7E
 X0twhuEAQJOGMTdTm0E1TCGlWc8P6dSugCEn3UKyAqFYZMSKaqElcczytTFn8daktZv/
 +3KotDIh8eZa/IkG+X7Rk1Lpd+BfdYyTiSUPjBvQ4LVygxS3l0kWqjksgXJpFdEBa7Mi
 2JKv8tkP6JRIlcdT1JA6XJmC/JOT2sZE3jjwl1azUQRiQ0zEccP/ejh/MyMdfG9AesKG
 RSVyD2C8PI1fmKoJ9JsQpVJT1n45sZOLnxkCXgCGIMlH0uXRru6xyPAxgSTaAWt1428L
 7BMQ==
X-Gm-Message-State: APuU4Z9mgQJhL4kPmXKRRnNpwTY+zMnG1GAI1kgJmCRwdm0pqn0KMwaz
 63woT9P5ElG/qNVGPAj0GJu4XKm8AYRxCv8QIIitGeDJUr16/SuJrvVxPQNXFg==
X-Gm-Gg: AZFdTZdSpL9kZyhEsYXblMuitNvxJiDYVzfBnWXK2tijuZUyyHzAWdvOSCHCwy2Lfh/
 ybqyUB8yotcEEyD3l/wcgKC6Dqr2ZsKlOeUbIbRomjyOKfYjc2RF3XO3etXuweT/AXJ8LS5H2B9
 H8UolYrB0+4uJxyZiRTt2aUL+XzWDQITUhtq6cwqF79FjCCE9KJE+K4BqeNgGYxtrMLXPo86o0R
 z7jMvMho3pWcgGbtnBaMwFiD+kPdWG7B/i9woE/DuJUsRLJHLy3IWK2u8lWhb2q6mG7DuqgfpxS
 6JaMaAfjMzzP2jWEU6omlKjxhLQhvRd+CUvYO8Nz8gXdNlcKJwB+Xdn+sJnxbcaRT8Toq3v1RnN
 bs34MYU8sXzW1OuhzU8PfxRYoogZtFIx5WtXaERZV/JApKcud2Tx8vUOiqvCdZJ4lT7wkInMZJI
 vZccQW/bLxDYtJlQ6pZvcbbGFMvGzrGOE0UahjHcOfra+zTtwrumcKyeEggZTfdXriohglPcEro
 rP000NGoXh6YDappSz39271x23JlamkXIJmmqnwj9zRhFSwcoNPPD9kwGbttktqVU4gQPB0rM3n
 Chk4BHshLgAg/Cxzj6pV/8x5kA+wzp+MoDYbv/Cq1H0hryMa+rg=
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id
 5b1f17b1804b1-4bb8881ae90mr399692555e9.32.1795646156003; 
 Wed, 25 Nov 2026 14:35:56 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe75sm42194222f8f.24.2026.11.25.14.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 14:35:55 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 25 Nov 2026 23:35:53 +0100
Message-ID: <20261125223554.3326338-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/sunxi-tools: install
 fel-sdboot.sunxi
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some boards have neither a FEL button nor FEL pads (e.g. the NanoPi NEO
Air). Once their eMMC holds a bootable system, the boot ROM always
boots it. Then, without a serial console, the only way to enter FEL
mode is a micro SD card with fel-sdboot.sunxi: the boot ROM boots the
micro SD card first, and this small stub only jumps to its FEL entry
point.

sunxi-tools provides it prebuilt, in bin/fel-sdboot.sunxi. Install it
with the host tools, in the images directory, next to the bootloader to
load over USB, so that a board readme can tell how to write it to a
micro SD card:

  dd if=output/images/fel-sdboot.sunxi of=/dev/sdX bs=1024 seek=8

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sunxi-tools/sunxi-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 97863efc13..6c12f7ad8b 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -40,6 +40,8 @@ define HOST_SUNXI_TOOLS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
 		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" -C $(@D) install-tools install-misc
+	$(INSTALL) -D -m 0644 $(@D)/bin/fel-sdboot.sunxi \
+		$(BINARIES_DIR)/fel-sdboot.sunxi
 endef
 
 define SUNXI_TOOLS_BUILD_CMDS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
