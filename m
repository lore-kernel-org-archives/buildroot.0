Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F947606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MrmheIWw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768F081511;
	Fri, 23 Oct 2026 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTKS-hFDQxB3; Fri, 23 Oct 2026 18:43:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80A4B81586
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792780994;
	b=Ica+UJtcr4KolR8Fs6eM0mvlp7atEblUujqspz2IKzpmskBM1BNWsvPp2cTuBFekkg17
	 RrPm6OVMbSkDxotC2H0ndA9A4NrQjExf1Tvf+GoZtJUCHpU58ALI10SyswV9er/CA+goH
	 kl4wpVOacsX5yFCZ1uKj5w6nf1zVbPuks3xNu6TID70ZopsaDYuN1KfW0dzjzESvpZ1AD
	 W1FY3H+49AScp6GLLVBKucgRBfogwiz6sbVHVEcHwuO/pvFsghRO+h2AoSYGRY+fEDjMD
	 PI3jnv4dzuFhVWurXTSO8hsR2xj2201JT/sQXjSX+EX924H2bfma2GY9gkV8QAE3knA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792780994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iz5sz5FL2WelgvGiL1tq0vT+RF/bpiXmyoW9dJpLgig=;
	b=l0m84BoZ5p/0znJ7dwYhtu0AEFumZN3d8fimadNk9T3BTM/jsVYqwq5iY11msj4Arn6W
	 pyYAPHcz6T4aqE9uIlayPUSh5/O8RkETPB130nbZ366yrjq3HAoJt3Rdpi6Y0rlFX2YPg
	 rGC6EKhx51lsMRK8Daj+Q/hWwiuqRvinX6j9WNaAOal3YvBu7okhkmnBKVgVvOFjjekcS
	 FFhETQ3KvPuUnvS67mQZ0NCKpbTaVjptuHw6KAv7HLq84wJoRK0Wt7MJzXIiHysVOXibD
	 //ZD+s2sfuiO+Dk1xhYcdsPnmtgc+wtuR+k9zx9F9Ce8/JijSVspKtT8bHaE6E1USfQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792780994;
	bh=iz5sz5FL2WelgvGiL1tq0vT+RF/bpiXmyoW9dJpLgig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MrmheIWwQEAzlVVs1o2u5PHA/D2fb+q6pzStxT7b9ZJCt+5Q4dX2UfnUMGC/XebQy
	 4TIfnwmoNC/iMwNBkDnS0OjwnuF8jhwon75f9ZL8lRdPaQDzReh9UnnCgOs2RXUlVj
	 wCgx1sU9/2o208PniTeYzsFcmU613LQnl63uP0q3SRs3EsBjCvrSnwQ0vJL3XZfaGt
	 epekRWejOP+IdRrUCPBHK31tRbriB+k5B6uj4g/aT0HCXM55idVdMZtsJXh1UthkUq
	 lfgq/agI2ZOCti4FHhdsc3dU69vJRmt9mPIZlp0msok0QQEarQ7SiYwq6cEeZhRmQd
	 x1TqPLykdHegA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A4B81586;
	Fri, 23 Oct 2026 18:43:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54B6379F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A9E64023E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlxiGA5hO-ON for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0BDB540059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792780991;
 b=JXjIUku+hgLigBET2GVX/86y48nmeUrKWxGjiqLMMiHouFojoZH8h5YAD09e1VQ4x80h
 R8V/BZNN1UX1XPu0Gudu00XuFpMMkhDoMTcpCcgDpAvfYIPT5O/HXCMEApzttL+dsVsIB
 zYVktGyKLjpFtrJbybTTPvwB22ToaxYSE7g545xq83qUgAT/joSML53S7646rTO4qLEWR
 3Ihwui19ZEP6uZX3ItYYyKYPTBAq8vuX4eLJscEFOrGPWSLZMxm7BPtzHIxKvwuY2fZzT
 pBlpwyBFogPP9KS/coKJx6tHSvynAAxFWSDdOQJRnYkKK1ww1fozeUrcxsaY8Q8w08g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792780991;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=zeJY/pwfBP4pKWFrI3l3wA/WTM5y30pFB5uzzRQG7HY=;
 b=btQzVyvhKqDBQxYVXmNp42vB6i0ljh+NgMISnAR/UOqqDwrY7TJCJkHMfRHDgBFXRCKd
 Ail/OjHWImoR3qpcU8LVPfP4j/hl3ooNpY+du93uxfOoSjnK/zHXsJffu53IKi9e4hxej
 dhC7C2TCSPl/4LxGPy/jHzf0hpOO0f26gnrmVbzQCcJK4hM02C4Vhs9tY4RPpu8m8cdPO
 0xcc8n+NviLDhgfxCI5q/3qkqRtn312athaI84O8jGGbMcStxDfwU0c7Yr2pHqr0tpmeQ
 mBJWmbyVGagBy2DzID2hMxbBu7vz4Hvmpf8+KUVJjbDjGKGx/dfgf+tx6G2yui6y0Pw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Wli9BhiM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BDB540059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:43:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c46822eefb6so159690266b.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792780988; x=1793385788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zeJY/pwfBP4pKWFrI3l3wA/WTM5y30pFB5uzzRQG7HY=;
 b=O4Rwh89bmw9OHa6tSOXZGif6+J0UwGniGQ03xoRGkAbt+D4WqnAbwdlbTZqaZjUStN
 J6ApxAdHkKEt6IgMtjDWbb65Mvv5LWZ/XyglxNqw5htUQgSp/HccSJpmhd9jqdvrAFa8
 volxENM+JgQoRp7jGNNNeAEJm75YQdPEWNiqzlzrNBikAnsTCxh8saWKZcRmAwpR1pBd
 GNPGAk1zHg0w7RrmoC2B1Xyb8VXM2Y+lyCnQAa5dI5PBVZKLvphmhU8jAooFhf9OGFUm
 bWduU4gXbgv+TXgaT/sp7cy9kQdT08a25zEU4xgfogrNN3knzhDet70MluqEwewn+yeB
 QOBQ==
X-Gm-Message-State: AFq9FYLPumcOG+m4v7+vTae+myjtA5B54l25gUwuGGZFEkGKGq/9svZ9
 R675JYb7hm0Hu3+w+7ZK9oyiHSlFIN4X7jBztKeQUC5fJHf+6l1sawNKkZBazg==
X-Gm-Gg: AYBFou1xx73UBpyP9qElH+ZcZc+3GQ2nqVcDN8XPYiAxeUEB/SBLLmis5xJBqSAz8GN
 bq4LNxSHiJtgK6BJ5i7dU5N/ZzbPgqbnV4iexZr8x1LLfdo0xqFN3x+JAlOJRLCVPSgv65vKaiO
 +J4CmX9Fgj08JQd2lA9nWmIrTL+FZXllHM6t4TlvA2hGsFTFdHJ7Aqgfo74wiYi2wmiyndNMpwx
 FK08xer1EqOkuxdoZIxdD3TqXcCzrxHf/c8LhIJ+pGViVFEt8zjcV3TQiQaltkItcZ/pfXShUxk
 K/Mwvk2zg5PqmztPaHE4bU4UeUTdBqcJynGtq5TDCg+UqVlfMm0EhrYvbvSz5Halc7h7hr6weEu
 FHL+XGDTSulmvjaiC19q1eQemzOlE4Qtjq9zmGf1WzQEep1Ey4WF3/rPumvI0g6a+uKzhlwTg1z
 iqZyI6ltP0W6matbinhbCigGH3LEu4L2oazhqhCd7jwOW2jYTXkzYpvT6wVb1sh39G1mWDxE9Bc
 SAyw6FEAtE4kMVqs4X4asMUk5wNC9eCGJXy9cPEWvFoX7m2JczaG/RgASTTf+iue7yvUuUBgbSu
 de5vc+qwQV2IznR5S2riGjPMmZPcMdOc4sGOfcO6hcgmSoA1Vyw5RjUX
X-Received: by 2002:a17:906:4fc9:b0:c42:102f:15e8 with SMTP id
 a640c23a62f3a-c46a8f53ea9mr440546166b.14.1792780987266; 
 Fri, 23 Oct 2026 11:43:07 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46b8824718sm31622066b.12.2026.10.23.11.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:43:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 20:43:05 +0200
Message-Id: <20261023184306.2419659-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/bluez5_utils{,
 -headers}: bump to version 5.87
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Thomas Perale <thomas.perale@mind.be>,
 Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides bug fixes in GATT, BAP, BASS, AVRCP, PBAP and MCP, this release
adds support for libical 4.0 [1]: libical 4 no longer pulls
libicalvcal into the libical.pc link flags, so obexd needs to use
libicalvcal.pc to link.

ChangeLog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog?h=5.87

[1] https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=e60d07255327db3fc4e3a28d7fcc792cd42c34d0

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 71027b45ba..c4b230f367 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.86
+BLUEZ5_UTILS_HEADERS_VERSION = 5.87
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index fdfb7edb3a..ca00a01207 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  99f144540c6070591e4c53bcb977eb42664c62b7b36cb35a29cf72ded339621d  bluez-5.86.tar.xz
+sha256  26bdcf2cebd7310c6f598850606b037ef0c515fe6608ebc54d22c50c4c32b35f  bluez-5.87.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 38fe9a523f..0d86fd1dcd 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.86
+BLUEZ5_UTILS_VERSION = 5.87
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
