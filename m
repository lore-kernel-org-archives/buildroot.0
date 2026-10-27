Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65D606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TFo0R71m
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AC940586;
	Tue, 27 Oct 2026 21:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyhUUwiAePdW; Tue, 27 Oct 2026 21:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED0CC40478
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793135001;
	b=ctr5vnT+wlJ0Ygv4xxDOnAHXSZ9dYaMbIlcH8zyKAoJSLeXMaXrpt4htPtIK9NXF2l4a
	 zwelFZKC9jDguUWCLk25WNhxen/w/6sGNVSI6B2NVfwnSLC3Yl+YfqI4LxK4KM21c6e7V
	 5wv1lojtr55J5nCdWthKsl7jd6yqln+WjqmoByYR0ivHkztLlr3ZqQ5TfYuE8bCrub9qS
	 tG4g9pJpXK5eYXzjuNDCAGyZuH5lrQrKbUBvIVWAeEQVZrfxFLJigtN7ET6FFmm6bLv6J
	 XgO7RzUGvs9LJ9lathrXcFWUKzQKc68+YyfgvJ97bi2FNnvSWSPMDfN02sC/vU3x/hA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793135001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yD5gmTwoF91JORnsZinVIeDZcy5rAQ85q3WRD4tUrAw=;
	b=acZn280WyUqieIwKvW/Gl5hge9lmAkAHggQkyTEbb2cpeiVBD0deickjWtwLC0cIL7cU
	 2fl+RJtrsyKBTMYOcxURVoQlaHKoY/2lFr8Gku0NsXvZVT/AHo2Dj/nAYtlhHu6tXEUtC
	 mFrqDOKUixMJmVGdeT0iy3S06qay+32C2n6vi1Vah6vJT/Uqket+x72zT5BJn1WNq/vE/
	 LynPTcc1r2OzuupmQ5X0FNo90+yKTQCCwZQfe69dq6crSJTkrt14/Cct+vvmecTFTfWm5
	 Jnf23AGMA950bNA1UgyaVDMj5hAy8aSX5db2OJRpekRVmOGHHQ7yAbQfqzkRcsrx/Fg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793135001;
	bh=yD5gmTwoF91JORnsZinVIeDZcy5rAQ85q3WRD4tUrAw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=TFo0R71mg1aZNypO0iwil2kzbF9kTTYfPmtxHQJfB5Q4tmbdaNTCBLMGzBXKGmGse
	 SLlZhV1BvhntaL9TsE53t301Ir+hKS0vXkJ2NOIOBJ0LxP4Sb9j6aDMpTzyXk25lG9
	 +eqGygUcFe+Q3B3OiwPmaISAj0lEYznK5g6GAytZt7BM7/BxAgAhDVYyrUb1B5tHUi
	 vizmmaCgGFJgs+0EFEQCNkCxGeipo2cn/Ydhwi2WwwZSGiBAtMHg/IH1Dr+gQDdqSe
	 3CBeL3Axjiv4i9RgE0pDkJQMoJgv0UIWBiOQHVcnJKASZg9QHPu7i9V8GG5dQpQ6Xp
	 gOBQslc8riXvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0CC40478;
	Tue, 27 Oct 2026 21:03:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D8D7235
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F14E40478
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wshwb78bEbsg for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 21:03:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0CB994046D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793134999;
 b=d06gyDNgAxCPy6CYqlkEizJHheP8yMCR+ylFbUCwTG8aaOr06jyHRml7A5S2LkSbalcv
 HbgcdVSN1w7WkA3AM28+5jr2EpP4+PgVhpbDCB8Jpi+60bW2J1f0waqoMy6b7g/EvnKid
 B+FJzNopPw5Y9dzrHFOtqRc7WcZSgJZsC5SdQDnw+BrObM/+fbiCECT7GbOOY8a5BwM0r
 4ixxFkZApzyzRuSBqS5JygxEs08duF0hyTTrXPn6Uo2jbVtOfhBfmqzH3QWyBk3QOpbFr
 BTWUweD1e0fOi84Youn8lYY93maIuOvBC2zSM/nOmVgQwVWMmcch8rDP4Ae5s2pSQcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793134999;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Lh3oDbydn9MncUStISzZYWgWpxDcoUn2v4/gTNui3oQ=;
 b=Tj1KyQb3S+gzMbrFtGWAhhuUVKD3EAwguO6c1b1C1O3qewT7L56QHUMLMzEn9uQavNG3
 QnmsvOPNl8xT+csxmMGLKhF2Q9NVvIRKcSb0u/fD2MX4jtNNCXSV2OSLYYbfOHdGCqR3K
 WmYgZdTfHyQq7BAZVL0SSF3A+XwB1+0GRUYddep5MhSI89z1diJluxvQ93sHGBj84h8GA
 NVWIyM3smuZMPXe/7k2881AsiVz2/BlqB+DRtMuiEsoU69a2ve5nrhlTaH+Ojnp0kmvUp
 itBlRGJDTjQGjbyWceh9FlBP1ryHQXb5GU/bPw2SP0uIGg/MO7hqih4tHrgvLpJPpSg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=IHshqVP4; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CB994046D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 21:03:18 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6aa8d04fcddso636493a12.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 14:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793134997; x=1793739797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lh3oDbydn9MncUStISzZYWgWpxDcoUn2v4/gTNui3oQ=;
 b=fAATjyP2UYFPToWbvtadhyOMO1be2KqB12QCajGgKmZOATzLraa78ptOmFDKbHhbyv
 MbFrMYy5zp+ZlzOZM+GXdOtSxiLMlkHmy4Bh/v/wrag9K7I0hZxP66N/q4C5JNx8AmIY
 sJcoMseeqKxrJEfhE2WTRwmsYS6n6b7XrVtZCdRMTsoe2EavnS0RN5wISytk1iAXf2dt
 UOOHiXSNIjh0QxKxBKK/W1tc9OBbsEryPeXJpYpfO41fFNGXfQmTX/AGFtaSN8ECg4Xp
 yLGfbGwcSDBv/X5KHTkNMQE6YDTQSwUydjCVCE5ttcbPDeX6Q9Mw0AAUsiaXYHK3PiG3
 U4aw==
X-Gm-Message-State: AFq9FYLvr2exeLWm7gXQH2avVS7eOGnXY2MTV3/5b8guzR3FbXN+iRTk
 QM6HlUUtioV0hBfcTQhMJPp4amFdmhD76I3Stb3wdXSRa97oOwYxOmWSySByPQ==
X-Gm-Gg: AYBFou0DKjhgQyCpPEII1j4YXlZ82e0WypTFsDEW17XSP+K0+ngBEd3eEctCNd3LiTh
 piwF6psHmqPHAuQ58oMeyexQz3NN/j9n4+E8nkqtcFgO1paT0aIgRrEvlLqcHyzX5X9XBRUnY9D
 8RcbGp+7ht3rhfuZ6bDHrdfOhyNTw7cGSPlIWKwDJFxxOPdc0guqcLUtHhYmtS++QKFoWbo71OC
 li0EiduLBdf+r1b8o6xYSiGbyzw/SrQ+Zjt6hA9sirYKO8l+MSqj7M1AMbr3hEsj7VEkncWOMUf
 yToh6EMBdk3Xa891irdq8IVkA+F24mxkqDOV7UIa+6InYs0NhtkN0b0GqgQc528Pm3p5qKyPGWH
 IlUBqLak6OLM+/M1czkT4/BndGfPHUbxZAMVumxljz7Efqttl5Z+Dnfd/ii4BkGrOi3vTEzuIDb
 JUDqsMFABc9B3CXfE1oJg+T4MAncKzrnu4ZfBD77nzh8UXZ7TWdPF/c+fOqbyeohbjAckasH5fX
 5xK5DpGUQbHATs7k4y+5t3hx0aQuQBAG4oZ9LMqdusia+vIvGKfN/bOFTougmh96N1aBJOG4vMj
 UPYI0MwUC9G+RZqPAB20Z2RCU1qyCRlaFuM=
X-Received: by 2002:a05:6402:7c1:b0:6b4:1a6:97ea with SMTP id
 4fb4d7f45d1cf-6b47bcb10femr2531532a12.12.1793134996690; 
 Tue, 27 Oct 2026 14:03:16 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4964601f2sm541777a12.37.2026.10.27.14.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 14:03:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 22:03:14 +0100
Message-Id: <20261027210314.2194629-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cryptopp: download from GitHub releases
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
Cc: Julian Scheel <julian@jusst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cryptopp.com has been unreachable for about two weeks, so the download
fails:

Connecting to cryptopp.com (cryptopp.com)|93.127.197.30|:443... failed: Connection timed out.
Connecting to cryptopp.com (cryptopp.com)|2a02:4780:10:23e8::1|:443... failed: Network is unreachable.

The same cryptopp890.zip is attached to the upstream GitHub release
(same sha512 as in our hash file), so download it from there.

This is not caused by a Buildroot commit: the package has downloaded
from cryptopp.com since it was added, and all maintenance branches use
the same version and URL, so this should be backported to all of them.

Fixes:
https://autobuild.buildroot.org/results/a50d355d113cb177dd21d71755bdf29732e58d7d

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index a538f8c17d..0ceae41628 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -6,7 +6,7 @@
 
 CRYPTOPP_VERSION = 8.9.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
-CRYPTOPP_SITE = https://cryptopp.com
+CRYPTOPP_SITE = https://github.com/weidai11/cryptopp/releases/download/CRYPTOPP_$(subst .,_,$(CRYPTOPP_VERSION))
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_CPE_ID_VENDOR = cryptopp
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
