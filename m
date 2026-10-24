Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF2606A31B
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A/cvziwH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=ep6bMlqQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAFB2812B3;
	Sat, 24 Oct 2026 07:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfB8U8hkzT8k; Sat, 24 Oct 2026 07:56:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6CCE8169E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792828596;
	b=BmBjMSK3krcPE//pSp/nfOq0ijwLQqBSbsCYUlQu89tbScswjCJhEtYisOPM5yF+zYDL
	 eaeWWgGyFuPoXcRgh1d5sGszU2MCFPifkfyX1y7scAfzuqzZqEKR9g8Z0sEFo+tv2ApUa
	 FPo1Eo31HQY5MrV/WjYTdJ9IE6iee5OBhKxKGhgwBY+9aNe+T1ej3lqfeNqXBviIWkD0T
	 baLPNIRUpyCCgtzH4r3XIBGCOiCqXN+Xta/T1rOr/CIBF+CMruxLXy79QngcRUKmL84We
	 e4V9gu874mqptUkFcIf+Fh+GUOOxTrNCD+dqXmSdI5U33DEb7+bCmSIAh/VLSeK6NrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792828596;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=U2lbXimy5Wc/8KmARJnuSEZr8myde7QxgDdtGCbmjik=;
	b=Ic0IsjmjCwB7LDclpIwS95fOFg1DJdu5xTavaVQSCXocJbiHrBlbzkOM3mB2a1167xqK
	 n9DEn8IvTOpUAMTpVMeea/Qk4MtdxGjZ6jyShFSwkRpKVDwQNELlhtUjtWZYsxR1VNcbb
	 PwBi/dRZRg8ZaI//f9IgStnmGpBZdaVes/UPmfa5pSGthT3PlWT6E/YXHLz+w1rXFaGw5
	 SQHU3LQHIMceMtuJkkrpDYZUSPDU7+7E9cbb1ssv0UyOVxbOJCx5/vSzwOIPhWgN1doSX
	 dKyC5g0Z8ZlfqtY3BDEq8KdGa9b6JwhBqpP9iJB1Db4v/2V2nTMNvRbvakBg1GxGYNw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792828595;
	bh=U2lbXimy5Wc/8KmARJnuSEZr8myde7QxgDdtGCbmjik=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A/cvziwHlawq/YzAvrUi0lWiQBAE5rExYnvA8KnOlkExzWS5Ve1fp9DAUWUXDtvlT
	 VAKimt4OHPFA6CDMJXZsuo+ERJEhGiNY0xFgGhNCbTTw+ugkqDXO/bDppwK72Q5gmv
	 hw+PImnc9YKnpDj2HrPyL4a+GHrrJMwOcM/1jI1zbizKYX8w8uDz+kwRcktoYLhNz+
	 /7sq/5HYqWunh/e2gKLFUsFj3pLN6h46tfpqatj2IgFzoahlvfbH5iTzh6H5HLZDP0
	 JUEBWgSYROgBPunO+TVfb2xnHzUqo5kraoUtBFGXyfvNGVX68ZDiiJa5PIZf9xoB99
	 MZ/f2Mx2rEtCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6CCE8169E;
	Sat, 24 Oct 2026 07:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0568765
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B634E60A4B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPnA6Y2r_IJt for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 07:56:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E2ED560A59
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792828593;
 b=N3DNHGxbMovuZiojQDIpInsxVTWTjFUesgG8pNwcTZcVMo8LXq4AKE4JN4v8k8Yh3RnI
 KjBg2IZyCYSGyGh4z0NfMdV67WjhxKDyYd7l6tvGSEAJYxt4h4G6hUnVEHK1KGXVxbN64
 Rw9bfNRjjefPAS5ntalhPjQGUMZ4uY3ycXPXcKxzZE1Rz8pcd4ohKDgs7fp26M3Y3N5Bj
 cnMkWMR1xM8Pe/6mzDcYc99bCga2GDqRicJkcBHu1xKORTd20gGZ69r1K5eSTWKUm+7eL
 aWcUGBgHlASpF3NSV67Mpqc5ogwpY+Fp9yuXEoXnsv2+fh1x6TOWxXIUuHomEwS132g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792828593;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nQC2ghfiNyzEZtwyZCw8vPSQmzyL3RgyozmLhmJYYo8=;
 b=oH6abpwlnkEDbwR/KrHGEjv/1JqW/Dx2y8uMm8ZxV52Nj7chT89+tOfx657b9JbEO17J
 zP/vvUswJ5EKnaNkaP4J8tRDMC2vtoT9l2z/vPTnANZaq8B2l9t4eCVRfcRFze0MpYd/8
 2jI2WjmkTSsuF6BEtJ0wzlB6XIvGtnHSL4clw5pDIKBPLQ2YTsun0/NxZivpSJq89XJaR
 rN8mmrV7oERTdR1HB5xV5PVZaiq8Fm5uUlFmPG/NPk/LC8R695w4+LcPU6rxQdfDqQ+Fy
 9Nxkbxcj6YeamhhO/OIHC41O5KFyxFdcQEhiKOU2aWoNcmGhZ2RPHYanKIq5e/YtZWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=ep6bMlqQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ep6bMlqQ
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2ED560A59
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:56:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b2232d8ef5so2594576a12.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 00:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792828591; x=1793433391; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nQC2ghfiNyzEZtwyZCw8vPSQmzyL3RgyozmLhmJYYo8=;
 b=ep6bMlqQ4FOapGXqBN5rD30/r9epe5EDRaALOF+Ov9ymJtAL313B3d8ME+uMsgdgGt
 29WNH2GwdAwQtdfya1OvuZCEXWWwn2faElM028D6EcNb46n4FovLasQVvD6KnicPTelN
 VKC6nV23ySBEAy9lEJGPU6BIJySyOcVgJeZ40Rk1RDNwX407ig2Aj+vCq+MBZnuS8uDU
 oCpbhtO8tH5eyS1IuQulC4caomtPiU8c6/MvxCSQVNzCG5qFltSLRD8rst1ASq5c9Nz1
 /G7tcMZUj6mhNHFsl8QTQRFxtufOVIkT5gTPxYn2+Cd7Tg/i/RL8sxOelMlle0/7DRmH
 8u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792828591; x=1793433391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nQC2ghfiNyzEZtwyZCw8vPSQmzyL3RgyozmLhmJYYo8=;
 b=Tj4iGHvcBTWZLchbYmJEr7YMgwbwkDl71Vn0A1/r5YmAI3undP6UkRvpeGGY5oQaBn
 jENhAhq0L9kMD38KEpic2b9LAm/Zik8Bk52cg6ubLfwskBarKKrFsahD/ibJmIlTxXl1
 JnfhCErRYPGtwwy3s2mpH8tvM1KMEDDnWEbpxqno1d+dfgTrlmEievw1q6R5HLeBvvip
 cQzmsiRDegXH2JCIWdnUReLtevYL00Oi0o1XCDUzIP2ZQYBUuSEV4o7tOQb3UyrN4DGu
 AssXTgRJYCi9np5sIqrhvZ9sZrPmHEHmXUJsN+6ubAlyNoO7FBUNK7Znj1FaYYDaAJY/
 0wig==
X-Gm-Message-State: AFq9FYLmeVBuTUirhj483V+BAveNt1obr/amGBJYng5ZGIGHW6gm97eg
 ej/PAYz3/JoAa8xA0yfeeWyKHR5YxLBzd8Wfye7a6TN1mPSGzLE9EowxyYMwQQ==
X-Gm-Gg: AYBFou1UoLcOZ62KsS0aEgxZQp3gMx9PazXvTnmljnBuwEHZKnU+yLWhu57hS6jw1dA
 onjEJG4RwJI2/lDKKZbKtf8z8HhwTAVBBVUxGYtkTr6qO9YBU0GqYBOO+hgp4I/f+XZnu8L7KTH
 75sF3hNJ2qpntZA48qdsebAhevUhSfbezZOHH9ddo1CFgzA+buCB9Lrc8XQbi0jrqILNGK3pnLo
 Tk9G/WKi3TSzBTaWmc3Uu/o+dl05zGN808Jps0g40PuNNgZ29Nwy2mZYSEBJYis2qg2HyAaNeVQ
 SI3phGd2JU+/zultwgpsjupLozOfK1R6NvJSYE5GicWWL6MgTXfOBr+bo0peKvdHo/YfkgYc1Ur
 th7DejF+ciJrTCkpG8ROsSRdQfvJZtLnpjw/j4LlC4lIMaGNgjhxnfPb/Lb27RDhLJrLMF4tJmB
 Gp/NI3Vjx7WCiLcUrEfeBcxWUIpUEKY8DjxuI2fHN3URv00RvRekLl+sjuyH2LStPvvMnKBlCO0
 RXM0f5ryxwUIRil2VZ9Cj2x7WjnaPI+bsMV/qdHUnEXW9v7LgZqivMxVfsSCCBIs4kuVZehv1lD
 BiWL2wJow2jVugFpQI8RoT7ofN6xA0gSojA=
X-Received: by 2002:aa7:c405:0:b0:6b1:c930:652a with SMTP id
 4fb4d7f45d1cf-6b442fcbaf4mr1242129a12.7.1792828590764; 
 Sat, 24 Oct 2026 00:56:30 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445984ca4sm708564a12.26.2026.10.24.00.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 00:56:30 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 09:56:28 +0200
Message-Id: <20261024075628.3205436-3-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024075628.3205436-1-yegorslists@googlemail.com>
References: <20261024075628.3205436-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/jimtcl: fix optional openssl and
 zlib dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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

Since jimtcl 0.83, the "full" configuration is the default, so jimtcl
automatically enables ssl support in the aio extension and the zlib
extension when openssl and zlib are found. As these dependencies are
not declared, the result depends on whether openssl and zlib happen to
be built before jimtcl.

Add them to the dependencies when they are enabled (with host-pkgconf,
which jimtcl uses to find them), and otherwise pass --disable-ssl and
--without-ext=zlib.

This issue has been present since commit 283821fc31c4 ("package/jimtcl:
bump to version 0.83"), as jimtcl 0.83 made its optional features
enabled by default. It therefore affects 2025.11 and later.

Fixes: 283821fc31c4890f141111cbc5994e36703c91eb ("package/jimtcl: bump to version 0.83")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/jimtcl/jimtcl.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 5e09e776ad..e81b2a250d 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -24,6 +24,20 @@ define JIMTCL_LINK_TCLSH
 endef
 endif
 
+# jimtcl automatically enables ssl support in the aio extension and
+# the zlib extension when the libraries are found
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+JIMTCL_DEPENDENCIES += host-pkgconf openssl
+else
+JIMTCL_CONF_OPTS += --disable-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+JIMTCL_DEPENDENCIES += host-pkgconf zlib
+else
+JIMTCL_CONF_OPTS += --without-ext=zlib
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 define JIMTCL_INSTALL_LIB
 	$(INSTALL) -m 0644 -D $(@D)/libjim.a $(1)/usr/lib/libjim.a
@@ -55,6 +69,7 @@ define JIMTCL_CONFIGURE_CMDS
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		$(JIMTCL_SHARED) \
+		$(JIMTCL_CONF_OPTS) \
 	)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
