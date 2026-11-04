Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF2606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kXx+O7lJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=hyLgfD1D
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B13405F9;
	Wed,  4 Nov 2026 08:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsAFKE4z3Itk; Wed,  4 Nov 2026 08:40:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 687E540684
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793781613;
	b=oX/O5CqETF+qT0HvX/t64Dkxy+8fuC+bZdkXuHMUVjhVv1bEcXGHr3IJr8333acLog4t
	 mvNkAFtVtbl9G2OBxv19FRANM8JPvCRrWTBNrkulS4y3x/YvrtpdNERMAhILcmC+iWH6M
	 0RqrqzZVh/IJPYWUdDHNGXFcVXcROr9OV2alV5ZduDFdVug8QY7f0/hLUlaRHLFnBHc1q
	 85J6F5hoQxKcRkOWoIB29LHHUwc10Uk1mB2tZeTHKdNIuep2ZpTazt8YPfhEOymSH+K6x
	 80xttHINeyCvN73zuCVicaT/aoyfFBJffhI+KMBOgtCEg6i1aQ5Gj4LaUiFRPIUgs6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793781613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dLB6Z74Xm//kevDasQmlPtOL13aLFgK7SPE1iub7dyY=;
	b=F8mjS50xegD6yPnWHFAA+k0me5JDQtoXaKkvk32nA0TQ6R22sdAzQnAir86tYHHbgtia
	 ybH6lccKqwEosN62qljNcLQZat+r0jqAdYBPyPC6Koz7sFN6FIjpvoF/sc7z0jjrESc6j
	 YjC7KwBGvIjvlj1cH9kjkMfiLcxLEj/EJ9ZgtpfpAdO7gs8jJj1LTpnkkNNvdj/yilbDK
	 w1dcDVF0Rj10C3WmY/7YesMGTsxgLMfldXZWJS55r0FhQ4Ppjn9XkNbXirZd1MQR7MAzn
	 nadIRdxoAX3MpYGp1ZsR1FcGhxDhklX7kbLTxkbZSp0Qc27LBol1it5G0cu+TksShuQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793781613;
	bh=dLB6Z74Xm//kevDasQmlPtOL13aLFgK7SPE1iub7dyY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kXx+O7lJVkDxTElsLQJRKTjL819qQTNxXSMzRkTaOg5PGA46TMoKJXYKhK2lPYqMa
	 4EqHp1lDwPoKKG/d23aTaSCRuaxXpDeGPj4k3qWF2rwMeHKnzvdvuyPrLSEEEhgmJe
	 wOXYsUhlf6DvxLTFAGiBLm3nBjotsVRW2I9tBetV9rcoscCTelmdF3Y48ZKn47NqN/
	 7Mx1rrtyFlsrDunsylljF+TAqQbCz0xOIUVCln7av1ffqwp3OFVfOtTvAkfuqVwhlv
	 C4eERrye5p860mUwRMZIZl9muCE0iEeU0NdwV3kyJ7lcEPClH5tU9c1D0zXEa4X0e0
	 IOlVufqHKUacQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687E540684;
	Wed,  4 Nov 2026 08:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00AD0932
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 08:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA8974004D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 08:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7ybA_C1T8Ra for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 08:40:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C0271402B0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793781611;
 b=jCwKiqo5qYfqbFCR0C/fOwx2QsVFZcRPvWDFwt9hIPwAfQsBVfLkWCRvS2qQsqI4OjIX
 mSYwTr/o7+Z0tYLA3UgOob0XM8RDOnWJZY/a65c9GRDTdxtDKu1cMBElKzQJK4Fr/KOZz
 ebkeQuclDwM7Nyd25OWXkOB0z8iyMVexRob5Aarha/7X7z2+Lidh/KAcl9LJdHYw8Z96O
 7yPe+EpAuoc0hMN/2LgXDfCPWrEpBI0gS8xPJ0c868ZpIjhSRr5HdXn54jApPU0S9Yv2k
 1rReyZBWYMAJtmrAu14nKim6FUd32N0y+HHIU+cZTGDT+Z0iZtVROXhH9NrZhpur4PQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793781611;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=7LKevnlFR5DzWEiTF+u52HvZu2rn9conetdVVWCbQzo=;
 b=MYMSV05RaZtX6UrGX7myr7SaIE+hzYkHlOE44ALjN8Wj+CuqV1mva+qyAPsu2345gakX
 0xYAy319N7hRyVHJcQp/KTevi9KpjsMSq2yXMvpxh7XI1DBPSH8qxZXFneXuoGJkR0kbz
 SCATE3ug1GXh0AfsjhxUih6zVWzG3KH2ayPopMAR2Ktom4KCvLGxj2l1LYjiErUyTWDH1
 rMVH9NGjmvX7waEwHtt2NFRy8WF0/zoOiSiddLzNORpzST+olWKSkqNhFneuhPfdI4LxH
 KYOCm0fiNNb+FfA6QhXLzaro3xIUg27w0ZI+HlR2ZQTK+MF5s93+LImIgb1e+4gHb7Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=hyLgfD1D; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=hyLgfD1D
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0271402B0
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 08:40:09 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c4322d310e7so66879666b.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 00:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793781608; x=1794386408; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7LKevnlFR5DzWEiTF+u52HvZu2rn9conetdVVWCbQzo=;
 b=hyLgfD1DmBrbc9ARDSvBng7MHJIzCZKUvLat5pDQleJkGHr1vgML+sheIIjxft2d9O
 45lm8mcLjklVmgeOq68z2VAcGRLPmoyoJtQyXbjNV8NtMQ2EtR/Ty/k2Ag5WyXsCnAy5
 J/Y8lSCE78FTxVigpFKNs6fR5WBZg4c/llyDM9Mspvm273hRt1ZnC2caNIatKTbA9cK2
 04HbZ6IDR5GOhQrlSv1aEop/BuOZT3E+qsltoWLh8s8cfyhN9CVB0z4Mn+2PiTkQfUcP
 KjOOxHkdFNI1Uyl5+ElyBqP2SniAjUy/hMac/OFox++Ek+mgGOoRj96pbspCPQxzV+jf
 zi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793781608; x=1794386408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7LKevnlFR5DzWEiTF+u52HvZu2rn9conetdVVWCbQzo=;
 b=lPwYN1K9j6adItDHPuI6kMAveaFaNVFBFDfhLQpd5lmMlI0b3VkWms2CXLyYquKwBk
 AxyJYh23UIjasqY7uJdlzuuze9io11FO9KIH2JL2e4hnUt4fe4aCiQWG+ep6RISsm8kd
 L2HPXi25Fz2T8vi8fOilEZvg1rysGLFfTMxEXQ6DkMMY3IpILNIjBcEsMGkBgxMIlGL4
 32SpBTeLa0xzYUIMfK3No2R2Rs2ppcqMAQO8pU/z6tpN3tOu6noECQJrAJd/ni3cc0/f
 sXIBs1iWca08QS4cBkgDuG3KobFErBB+HuuO8JP/+5QWxPBYHePv6IYlEx2Kfsxg7YWU
 QW4Q==
X-Gm-Message-State: APuU4Z+BcxK9ORJaOxRVhT4mp10uCbw4wr13E1gIwRLDkqhpxs1WeB9a
 9Et9YMrGjx85wAEF/EvhNlwxlBKhQqNJxRB79szUx/TY+tG+hE4Cfz7H1AiU4g==
X-Gm-Gg: AYBFou3CnrJecJQdnXh1R84x/koYZgcE3xQ01yB9AIrDtyWtgiO/NdmzQiKcdMJsm+p
 ZuYZnaKaxHYxfBDWpr2WErOBLFUMuiwRDsfyPfQUEQsDu/+/Q+YaLScxIO+rliB2c3lpfkMAX/N
 fvmdYaozynMtHQeL//7wCxnhu9RTdmjelsjP69Bv3rCX4CNPLY3yelolRCYYFAoNNRZ7cUnskzN
 rydNZO3zJNE9cLXSNoorx/yo69pQiVCQF12lAMtEdVwrdHCkfJYe4V6DPwDa4TlWup3gJ7c/RC8
 pBsShpJ+xBDWp6P+tTFDzeuMEkQoj6PQwjDeSzv4Q4QnTkn9hcti1XACBeOpFy7Ayd/3uamqdaG
 Sg/mL/vvOO7+DwOJYpEbK09knkv03ynXebibGpx5FB/QJJN+ZhDpzrmNs7KveTup/Ok+011nHN1
 5Y1Xh9DgkHApFZqe8dyPIpR4docWZ/HB5SU+/OUbrtRSlxp8ReP5E7yUdHZZyHHczHPVVLdRtvO
 ElhnF3mEAPKCfwA84fi5CrMAJrPEHmqvn/Q30HAMoT4MALTtxgA45J0gNtOGwonwTyxTv+sVFJe
 7mMYB46najlJ9PwrgavDgby/9ghwfsHBn4RvBAouZeMDTCdElUphonbzutLTiJFFiF0tYLf/OEl
 CcO3Wv/UU
X-Received: by 2002:a17:907:d92:b0:c2e:5efe:f1cb with SMTP id
 a640c23a62f3a-c4ca7a4bb1cmr1359059466b.8.1793781607683; 
 Wed, 04 Nov 2026 00:40:07 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e44218esm46315066b.38.2026.11.04.00.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 00:40:07 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Nov 2026 09:40:06 +0100
Message-Id: <20261104084006.1431-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/open62541: fix OpenSSL build without
 CHACHA
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the 1.5 series, the OpenSSL security policies of open62541
(EccNistP256 ChaChaPoly, EccCurve25519, EccCurve448) unconditionally
use ChaCha20-Poly1305, so the build fails when libopenssl is built with
BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA disabled:

plugins/crypto/openssl/securitypolicy_common.c:2630:36: error: implicit declaration of function 'EVP_chacha20_poly1305'; did you mean 'SN_chacha20_poly1305'? [-Wimplicit-function-declaration]

Select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA, as other packages
using ChaCha20 do. libopenssl is already forced by
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL, so no condition is needed.

ECX (X25519, X448) is not needed to build: without it, the default
server configuration only logs that the EccCurve25519/EccCurve448
policies could not be added.

This issue has been present since commit 84ab6812ac66
("package/open62541: bump to version 1.5.10"), which updated from
1.3.15, which didn't use ChaCha20-Poly1305. It therefore only affects
master.

Fixes:
https://autobuild.buildroot.org/results/f33c46fda88dae2c217082e35593c20208af0111

Fixes: 84ab6812ac661e0f4aaf0a2ab00b54ea8f50ae40 ("package/open62541: bump to version 1.5.10")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/open62541/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 024067f6bb..08081f1673 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
 
 endchoice
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
