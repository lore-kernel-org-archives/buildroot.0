Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC49606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cfXZN94W;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=VncSn6ED
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28412405AB;
	Mon, 16 Nov 2026 10:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WI3CcBhX9B1o; Mon, 16 Nov 2026 10:05:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 37543405CB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794823526;
	b=OAvf8M4G6UAoxmpg7E1YBzS0AqTtqamuaLzoMHU3I+i9/mGrCIvrlaj3ckb6bj9pwt6k
	 7JQGQR3b2XF6Z75fblYJxEug9mtXxeyR3jUXcq/7gG5hbRGfPa83N4z7NIMuXAcGQJpry
	 4XEb96CAytKjg3IyhxvrH4FBU2jKCwNr461cXypNUehBSU7cVKbcyoJzCTGYJMmn9iLET
	 7PkoOpP1HcHSSSvGae3J2emoZltr/l1GIhGAyDuDaoKyNjxGZKagNu2DvovGzVqvnT9U4
	 2yu2qOdB0vW+CQu+TR4skBl2zGM+aeHsTstmeke+5Opb0cN36/PbljEU6Rmz77m/Ucg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794823526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=n9abT9V4QaJ4qrlohgFYQo+4iUm+pp2sBA7kGize0Ig=;
	b=MCh6Ht5lkR2ACeNVoejMLjPV+sMiXQ3QAxuhsbzrjQZIVZWIx0UZwp97Vm0+kRqk5cPP
	 Bb5z6rHOS+lWR3GVt8rNoR30fpkx0lIAN23LsrShiiNOoyqyTIuqtpcEZ+g9a9Ps1XJWM
	 Lr3CKO0PdPVgT507eQokt/7vgS5HWxrAW7m9nQhg/GzbJdDByEp2XlxdvQAce8jzfyUdB
	 q6rEV7Xlf3PjFWo9Ks7Hh9ejdvuaqhoP5iX2A/LDq5S3sZvTvIeos31lI9g3sgkoOTabj
	 TdSxDIqzFgLpxu3HHp07wu5zRy10r304QTzmDe9pW+zc9CYQoq8nkZ5IjRbRieyy93Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794823526;
	bh=n9abT9V4QaJ4qrlohgFYQo+4iUm+pp2sBA7kGize0Ig=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=cfXZN94Whn09RhJ++q3fEQCk750S5421OeYPelEruxTFJ6bDCjuvx06GIDfhGJ0/W
	 bB/e2XLPM+cKxMEdGfS5Rz3nEb7I3MlimxhGmTA8DKj9hUJ73IiKkhv/WGn0Jes9Nj
	 7iGbIEjan/OdoA9xVSDyDxDZq/mzHQh3qUmKmqtXf0OSb2Ku+cLiQ/QfRRnGPxxA2r
	 aueXhdbInnOEvdxA+EIcs7nEPop3FKNxPwWirHTidGdMBYX+fh3yae4bgQCqU5hy7h
	 NkbDv9BQczUzlD5iPVxCLUZSG96rUhiHvB2JIZgZUw+jdfz5OR3TC6fFJMktM9R/AV
	 1sfEGKwIv2QjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37543405CB;
	Mon, 16 Nov 2026 10:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E9F128C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1893E4009D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EC2wET2O9ZZM for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 10:05:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BE19F40012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=VncSn6ED
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE19F40012
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 10:05:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c5075fa7ed0so541773066b.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794823521; x=1795428321; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CxmFuQdKX/s5NM9BgIgP6XHW1sHbYvs52fF/WHFXkUo=;
 b=VncSn6EDPP2NXhBMSGFJKOSMk/1G/NWJkUp2U6OSWkACKV/ernNQ+DsnGfBDLfYHp7
 0qWlmte8Pt3hn2ZlEQralLkRZVPZlwl13khgd12DEHbWDc1J0mrSFa6OafoN0bO4B5ap
 CHFi4zll1so+w1JAcfYd0Fzqx+R4xbpJS6KX+8AImy4aEynYiu8dEzZRLSon36G1MtZr
 xmuqtynlFxHu9F5eHHNbjddB5yXecO9BpPdkyDLeZX4YOGAWmN59lyBKw7tqubxHAC2F
 4x6W0Xzy5bpbwsD2GcSMHXEKT7vJbuo/g68xi04aLfBGDWks8Eb9qe4uFmh9Z6LeuVGN
 dr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794823521; x=1795428321;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CxmFuQdKX/s5NM9BgIgP6XHW1sHbYvs52fF/WHFXkUo=;
 b=ok5zpXqEqqgBQNAnhko2VvrFkf7U8kyb9MV6rM9fkx2tEuMJEPCY99b15fsUH4gLJF
 wGZmRSRlfM+GApmbemFp4Od/Pp74yQy02Kdr52TvH+B1yDwlywFOakL9Zhbu876ckKAB
 AYa1MyZrjXjhVJsFVk9pt+/vVuLrexzwPqcu7SJev/2aIKE/LrsvPbed9nyqAjpMuWYo
 Zo8w2AB8vqhT8VOlospbrdmaOfdm1MHuTCSLa1OWz4VRPoq9EOZLBzF/V8979l2uUh6M
 DX62fFsHtXjWK1EG/xJw7p9ucD4sgD93Z9pSG8YR0gTgSUzH1ztPKJziCNzXyWTDigJb
 Qc7g==
X-Gm-Message-State: APuU4Z8b9k608vxW8da4c5QE6LJ4FrDSY5JToj2/zpGrIIVah/PZkpGf
 udYIOWwgXHpUNaWnZAmQXkrL6/FZfieD6V0qUU9Y2aNa+lGKeKDwOo2TGccifw==
X-Gm-Gg: AYBFou33zBL/14OsAGA5s1QETx1Ri3TZuiPBi1COz6mR+ZnLMwtUXvJDskDBO7QDA4M
 +YonYTaGso1zUFJck96eJmUafAP/aIEXwQzJAtJka71oMTXVJ3529IWbaCywTZf2NnktIPAOovk
 aBTN97V1Xy5T3vM1sEfEQBfEg+163P3snkpP2fEFYPGifTuSd/H01Nz7znLfNBhYZsW4Ciqj/LQ
 HYGC9wGZf9yjlWS2O723vS67ATvGDxNcNAi22mOP0ncmhxTJjUZ3YB8uocZ4/6NgMhU8SoYo9jE
 OsCwQUEAvTv/de+1jYnpOILJO1Gr+VwFQGs6qE78LMaw4Zfyb9lqQx0Spv22BN0aQebvKaVi8Td
 StSGteSrwZ7CzWYyM9wPeRUTFeAekvOv7aR3L9gFFfhqLCI2PJy33ZjmmxJrHQv04+Z1iTdqEjX
 YfoduaBmlQVDKytj+R/XmwhOwi/U9UL26L+ZtIOyB1phyweSArrMwBr98ZJGuyTSveYpGGt7o12
 eQ0ZHTO+rgNTjPuUg8dfii5xYDHgPwBAWtsRplwql+qVnDCcP2mA2DPABQguPDbz5+YFq10X0Rl
 6JqNHhzniJ1rVUbJXj7CAVztz2mOqMwVLPJxSkHhTfXtRhmpwZbQB7RT/W5Z76m6QKDhLEVG1zl
 H/IASUq0y
X-Received: by 2002:a17:907:96a3:b0:c1c:4a80:30c4 with SMTP id
 a640c23a62f3a-c50962eeff0mr741516266b.11.1794823520854; 
 Mon, 16 Nov 2026 02:05:20 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b2369asm393506166b.25.2026.11.16.02.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 02:05:20 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 11:05:19 +0100
Message-Id: <20261116100519.2527325-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/trousers: needs DES support in
 libopenssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
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

trousers uses the DES ciphers of OpenSSL in its symmetric encryption
code, so the build fails when libopenssl is built without DES:

  crypto/openssl/symmetric.c:172:64: error: implicit declaration of function 'EVP_des_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]
  crypto/openssl/symmetric.c:175:64: error: implicit declaration of function 'EVP_des_ofb'; did you mean 'EVP_sm4_ofb'? [-Wimplicit-function-declaration]

Select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES when libopenssl is used, as
other packages using DES already do.

This issue has been present since commit a83d41867c8d
("package/libopenssl: add option to enable some features"), which made
it possible to build libopenssl without DES. It therefore affects
2021.08 and later, including all maintained branches (2025.02.x,
2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x).

Fixes:
https://autobuild.buildroot.org/results/d21a2d2d300b2ef317f11f74ed727f73fbfaa527

Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359 ("package/libopenssl: add option to enable some features")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/trousers/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trousers/Config.in b/package/trousers/Config.in
index 998df98398..1eee555cfc 100644
--- a/package/trousers/Config.in
+++ b/package/trousers/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TROUSERS
 	# doesn't build properly in static only configurations
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The open-source TCG Software Stack (TSS).
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
