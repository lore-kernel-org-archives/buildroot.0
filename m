Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=imvTYYXn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gWQSDUx5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D09405F8;
	Sun, 25 Oct 2026 21:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JU1rapCwKep7; Sun, 25 Oct 2026 21:42:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A1EF405B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964546;
	b=ZsYBzUJIFhvVlIiGd0xqcHWV9lFzitMAWydhB7JI5qk9KWR2aF1pbQD8dUSKF4sLS0CZ
	 AeJSTA3flHuuCqFtodua0tA52Gk+8lHy4VnrG6SBYIeMm+aqTkbk+omiDzWq19BrkWc4G
	 tUTGtWrQcWEl+f+1UOijEPcFzK3+voe/WGJa6kmMmGd0pV8lJsrt2IunWT5DF+36v725R
	 TMhXGb2NYTEt5CBIzbXDmvNoU7lTRnZ8RHnTtUaAnS1CSnE4CyYewuvBDkMmjYCJSsKDE
	 1gIqjBh6OVEHhm7fkxXijDXEw3LdBdMi0DvCNJYfY6o3fnqfuf9SrXsprh0Um2N2t1Q==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964546;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yIvvKeTopI67wIFqdKtM7yDh8p/fTwmLkea644k3nhU=;
	b=oT1iTL3itJnhc56FZcBj0NaOaQc8KOcx76TZwpMV4vhu/Sw5KS0S0Vg8bDwdAYbOJHwQ
	 bpVms2J0TdGG3EUrXoGDFHoveppMsQ87amR83vpmdZCj8vwSMB3XIxBFDs4HB9qPuIkSR
	 dVTGQYwJhghRBDTFl9DcNuSg+TV8Lw9lJDUFgOOdPOm1rLHqIgH4jCKqxHosVGc1TVOK8
	 Cv+hGz8TSPGuTAV5YpxTXT/He6a64YE/yczgx9ZzFrDmJeKFcmXrdk3eSJMtnUEyngHs1
	 bfR/6gOIrFGnXN9N52m0qRdbqfNQa95G0VTG3jSSwnCeuNlGJxO1hwoCvE03iIyY17Q==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964546;
	bh=yIvvKeTopI67wIFqdKtM7yDh8p/fTwmLkea644k3nhU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imvTYYXnCSSZpfRVKb95i4jFJ405+BSL+sY48lW51IwpEGyFFZ7aowwpiGYasnveP
	 AGuTsBFzOOLKUx5SpPzCGYeQrMbJMvbSqwkklVyOEEY5vgI1kpljEshKEIBmAIXTi/
	 MXNrrxQeQzQbH0Tqfa0BEZaRmucDDC0wDA6CTMhfMkiaxGDtlKxORGL+o2dKbc0lEA
	 Sekew9jPwqWcn3GE0Ff0yZbY1ZdxAmUlRs9HP8wc2Gil5mQoFAxS17DIvvYe+cZJDZ
	 mB7Fl6AqMBL9vPYjZjyfIYSCmvLtT+l5Tg0K66IwJ+Kq6fzG9fh0NoOL90CLtYAcFO
	 waNISg6YF3R9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1EF405B2;
	Sun, 25 Oct 2026 21:42:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4EF356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF5360613
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxMN8xdmh3-r for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:42:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A078560612
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a2b"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792964543;
 b=pEvP/wz4ocfk/1GASDH4WOEbA2FGLkcoeyqpBe3uGmRwie56EWRxMsrCt5a6xymL8URh
 b4MxCEcNFqgp7CUFjVCnAE+jaQIOH0HsPuCBDOU5ILlRryzDy2xDb9jifOe0SBerksynR
 vku7Foqj3KqdM4WBcTQLsDLAGC6YCNSjVF68e8ge5aaRD6RNuJnjw+ZZSUa9fRo02Hvbv
 j/ynQr1zttEsUPP1OX61gfeqa8MnQfwnsWZ0jT8LtGGCiXZ/+HYvblE3/1X6AF4Zplt2s
 T8dPls/jKpk2iwoZSL9uoI1H/7o0x++P2RbEBja+ly54acNcpk7+ha/79/kenPf5fmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964543;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=W+wV0tddalh5DdhmCqQfMVNynE2cJAtGGG69FRkdr/U=;
 b=LqJhfoEv33oK421kFBKo1cFLkHNy2rjqGesZo9c0eiWnGfZJ7rPxYYzIpMxNU9nSdVDf
 lYhVT36g4NME0/9BJKB7DVqziHBP/l10FKRzrbULvNuTx3ojHsBHCbCahYFC91/SrRCj9
 PrBk4iu9BHJ5K9q53SFsz8CD8B3+BYZe2i9KLkrgENDRS2A0wydx+dadu8Pqgb9GQuwYt
 mLL9uj46IDLzbXQYewmUFh8Rmu4Iw1ttP5mNJZeq+mHJaGXEZ4WnEr9idmjJFdJZIxT+8
 WfjE2HDdc8F0OVguQPwaAG9O0yZmZV0GNQQTHQE42D4gu0Km2c5vLRFBHyWrl3CtL4A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gWQSDUx5; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::a2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gWQSDUx5
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A078560612
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:42:23 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-5eac4855401so1289773e0c.1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792964542; cv=none;
 d=google.com; s=arc-20260327;
 b=OezYf/951M4wGBnW13hdvaWr7mJu9m87gzypRLKVtqAvCBI4kNgm27mNJJZWZIfL+J
 87gwqkSb+z2EfGEi3UmZnqhrTCMEBUzMqtfy8ja9ZeJgVbq1JlOURYAhy/1Rv7tFtnNh
 kqZ/SwlrDogg8vcN8FYTy2cOh+taLFLJbtr/UX/2UMklHXP8YzTVuMKe8AMNfjMCgQ9f
 NbItWBE6UAwVYtjCd8zLkC2zCJ/gEWTYHeXISJIE9QEUyJsa+t8UTH03mEKOYZv4ptZN
 WMCZgu1uR24jfqIlNpjtfOh/WDhyOi59nOh28N9mtFHmcWUdX+EwSTg96QzjI7ynEQtw
 7Ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=W+wV0tddalh5DdhmCqQfMVNynE2cJAtGGG69FRkdr/U=;
 fh=w4WtnDTDhws6XHroLnIEF92Zusi+NEeh228TB9QlWA4=;
 b=cN+MerenfcOQAhhCP2RsYBQRdSGGpdsSYbN/KKgDOKKnEoxtm0eCaJ/d/UlHrh7TeA
 rtwIokQwxfx4W02bglWOQ6f9oshLHaa2YTetwk59w/Ra+F7Nb6Uo7Gp9INkHYa9ALYsO
 2BS6k30RULmFBgUaqT1C1FPh1wWeuCaacfgXgGvzzS1Tll6SMa7Osi7euhbwZd9Hstbv
 QG5lBaYaD4sJq0rijUYtQgfJxfH0wcaPcGq90P+inMhEkqZN55XQh1px8eA1PefMiybe
 0FUMj/t58wurTrzqBLOI2wcDb53YEGV+eMzJYocoYz04mkKgoOFjVLPRDa3YzKqgavvC
 J32g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792964542; x=1793569342; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=W+wV0tddalh5DdhmCqQfMVNynE2cJAtGGG69FRkdr/U=;
 b=gWQSDUx54Wg46pkShrO7UjFG6039i7/hmF3QHvRgAGvraOvlrxQRTGgl3ttOYw+kPD
 Ga2rOOMQgHBD339hvkwhpoyIwTL6t4CbcbTaQkEwOPNixvfgfp//ZYp0DxP6kYVUyfE9
 9yuIgWgHpg+EdsKwxLvpLHWdfQA0i8qdfZpwTn/Ek5J9i2QwKmyzZgH8VasRiKba58RE
 WrO1PKho0YSXC4ujMQIm8mMHv5lcnOI7NAepQLyF906qwQWjIccIkYSk7pWgqbF8brNJ
 krlzK4si6v4uC7DNU2xCPMHWfpwNbrH9AuflpCrstpzgESL8v143kCU2s6jvgjGRQnYA
 oPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792964542; x=1793569342;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W+wV0tddalh5DdhmCqQfMVNynE2cJAtGGG69FRkdr/U=;
 b=Te/S5SKMkNQRxP6NPdyz5h4dM2/Dlk5E8adXyOFCgjtL/AV14xu4ehFRbOf5eCC/ft
 f3zB+82j5fiy2dGSm6i7TS8cRqFdkL3w9ewyNPqYSeYmUCym/NvZNZPywca6l46vcx0J
 NAV9HTNgIHwNDq/4Qva8mXI2TjCUBayFXyUcRVCnrSLJlpk3XaEeVHkGjny0M/4UsFGy
 /MuzVQoUfSEJJODDebuFfqOYsoVZshYr0rxMe3tl/SYg4zELq0GIE9GOs033EMTDnoUp
 Y6fPaGMS3MiB5yjnzEosUyF+8V5G+GIMr0LAzUJAyBBEUqPYasEvLYJgoMlaAko/A3wv
 MXAw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbGKtViBItEeFeSlid/CHb0jEkuDesXoBRl5uuRLfZsaAxS7SOguXYhDFb7KBATQvsHOHQl1/lfbA=@buildroot.org
X-Gm-Message-State: AFq9FYJvbaV/0ncZq0+3+JRm81q0RQp/QoLEqgqd/gKe+zL3DTr77pOU
 dbPiNT/QFcaoVhmjZxN80wtgFAjXmitGdRjUh4jgAiTh1d/OtVx7Iyjv1Q0Pd++JjAM4Vx57hki
 ww+2mcwsM1hvgTnL+zLVgrKRvGIRE/Lo=
X-Gm-Gg: AYBFou0qFS4lFFd2MCO9tvDeWAA6WBOFZJ4LIebqubt8kokZDocBbjUevS1cQf+NdX6
 bm+bif2/LfS4xlliNan7jDj9OdiPD3fqU7/ND7RHrbU3W3KhTQ4DiWBTGUbwkh9kg/vagfx5+Kz
 3ouI0nZJ7PIMiv19Vni2glrqEySpPeok0kQVbGJbimOaDsgwG5X6RGV0c4GjqHjMKOb6O9L0VZw
 yCWLgLNcrYjIzUUm82MBMhir4hGgUN7nvEebLCd/0JlSHUyHIU8wTFD32Spsx19HOg51xd74lNr
 oIRvx7RXZUCiV9UtxxhB76H5VN520UdhkTB4EwjWWXfvpnEar7ej9dxecLQcjXjFWxyZ5QHFLuO
 AhiPGLMUOcx2bF6MUmoKfMb8YZGGTTggJHjwPN/eEAqbvvfHkpls/GWj3471k7wsfvuaejexqda
 mStUIub6NGyNaiq6VYNwRjUhqJ40ghpxhBqMjqpLOUMdr7favRGS8+gg9FQUob6A3+G/thRLXeM
 uZLQYFGmsdoxuJZJ2bNNCkj7QwOFg==
X-Received: by 2002:a05:6122:3906:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5ec2322ad95mr1373047e0c.5.1792964542240; Sun, 25 Oct 2026
 14:42:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025211113.561701-1-bernd@kuhls.net>
 <e091b4f0-2d85-4ab8-a8e3-ced01ced3268@gmx.de>
In-Reply-To: <e091b4f0-2d85-4ab8-a8e3-ced01ced3268@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 15:42:11 -0600
X-Gm-Features: AclHuK9pX2uoKkW_Cz3wSatvt_te5XAQRGIMtV5eq3Yhf1s4xpgdV3XcSO4Vy9s
Message-ID: <CADvTj4pOrSow0sP_t-Dr7_POZDiZwCY2kqwWj=U6-YShqgWsFQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: fix
 build with setuptools 84.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMzozNOKAr1BNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0
ZUBnbXguZGU+IHdyb3RlOgo+Cj4gQW0gMjUuMTAuMjYgdW0gMjI6MTEgc2NocmllYiBCZXJuZCBL
dWhsczoKPiA+IEJ1aWxkcm9vdCBjb21taXQgMjAyNzk1NGRiN2Y1ZjQyZWQ5NzZlYTJmNDY1NWUw
Y2QyMjRjN2VlNyBidW1wZWQKPiA+IHB5dGhvbi1zZXR1cHRvb2xzIGZyb20gODAuOS4wIHRvIDg0
LjIuMSBjYXVzaW5nIGEgYnVpbGQgZXJyb3Igd2l0aCB0aGlzCj4gPiBwYWNrYWdlOgo+ID4KPiA+
IEVSUk9SIFVubWV0IGRlcGVuZGVuY2llcwo+ID4gICAoY2hlY2tlZCBhZ2FpbnN0IC9ob21lL2F1
dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMzgvb3V0cHV0LTEvaG9zdC9iaW4vcHl0aG9uMyk6
Cj4gPiAgICAgIHNldHVwdG9vbHM8ODQuMSw+PTY4Cj4gPiAgICAgICAgICB3YW50ZWQ6IDw4NC4x
LD49NjgKPiA+ICAgICAgICAgIGZvdW5kOiA4NC4yLjEKPiA+Cj4gPiBGaXhlczoKPiA+IGh0dHBz
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8wMzYvMDM2NDRkZDY5NTVmNGY4Y2Nl
ZTJiMGZlMTRmNDUwMGYwMzMyYzJiZC8KPiA+Cj4gPiBGaXhlczogMjAyNzk1NGRiN2Y1ZjQyZWQ5
NzZlYTJmNDY1NWUwY2QyMjRjN2VlNwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZEBrdWhscy5uZXQ+Cj4gPiAtLS0KPiA+ICAgLi4uMS1jaG9yZS1hbGxvdy1zZXR1cHRv
b2xzLTg0LjItYnVpbGRzLnBhdGNoIHwgMjYgKysrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9weXRob24tY2hhcnNldC1ub3JtYWxpemVyLzAwMDEtY2hvcmUtYWxsb3ctc2V0dXB0b29s
cy04NC4yLWJ1aWxkcy5wYXRjaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1j
aGFyc2V0LW5vcm1hbGl6ZXIvMDAwMS1jaG9yZS1hbGxvdy1zZXR1cHRvb2xzLTg0LjItYnVpbGRz
LnBhdGNoIGIvcGFja2FnZS9weXRob24tY2hhcnNldC1ub3JtYWxpemVyLzAwMDEtY2hvcmUtYWxs
b3ctc2V0dXB0b29scy04NC4yLWJ1aWxkcy5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAuLjY3OTY5YmY0OTkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLWNoYXJzZXQtbm9ybWFsaXplci8wMDAxLWNob3JlLWFsbG93LXNl
dHVwdG9vbHMtODQuMi1idWlsZHMucGF0Y2gKPiA+IEBAIC0wLDAgKzEsMjYgQEAKPiA+ICtGcm9t
IGU4MzY3OTNlY2IwYmI3OWI4N2ExNGUzNjkzNzA1OTFlODdhOGJjOTcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCj4gPiArRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiA+ICtE
YXRlOiBTdW4sIDI1IE9jdCAyMDI2IDIyOjA3OjAwICswMTAwCj4gPiArU3ViamVjdDogW1BBVENI
XSBjaG9yZTogYWxsb3cgc2V0dXB0b29scyA4NC4yIGJ1aWxkcwo+ID4gKwo+ID4gK1Vwc3RyZWFt
OiBodHRwczovL2dpdGh1Yi5jb20vamF3YWgvY2hhcnNldF9ub3JtYWxpemVyL3B1bGwvODI4Cj4g
PiArCj4gPiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiA+
ICstLS0KPiA+ICsgcHlwcm9qZWN0LnRvbWwgfCAyICstCj4gPiArIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gKwo+ID4gK2RpZmYgLS1naXQgYS9weXBy
b2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCj4gPiAraW5kZXggYjgwOTA5Yi4uYWFlMzE4NSAx
MDA2NDQKPiA+ICstLS0gYS9weXByb2plY3QudG9tbAo+ID4gKysrKyBiL3B5cHJvamVjdC50b21s
Cj4gPiArQEAgLTEsNSArMSw1IEBACj4gPiArIFtidWlsZC1zeXN0ZW1dCj4gPiArLXJlcXVpcmVz
ID0gWyJzZXR1cHRvb2xzPj02OCw8ODQuMSJdCj4gPiArK3JlcXVpcmVzID0gWyJzZXR1cHRvb2xz
Pj02OCw8ODQuMyJdCj4KPiBJJ3ZlIGp1c3Qgc2VudCBhbiBhbHRlcm5hdGl2ZSBCdWlsZHJvb3Qg
cGF0Y2ggdG8gZGlzYWJsZSB0aGUgZGVwZW5kZW5jeQo+IGNoZWNrLiBJbmNyZWFzaW5nIHRoZSBs
aW1pdCBvbmx5IG1ha2VzIGl0IGxpa2VseSB3ZSdsbCBnZXQgdGhlIHNhbWUKPiBwcm9ibGVtIHdp
dGggdGhlIG5leHQgc2V0dXB0b29scyB1cGRhdGUuIEhhdmluZyB0aGF0IGFyYml0cmFyeSB1cHBl
cgo+IGJvdW5kIGlzIHRoZSByZWFsIHByb2JsZW0sIGJ1dCBJIGhhdmUgbXkgZG91YnRzIGEgcGF0
Y2ggdG8gcmVtb3ZlIGl0Cj4gd291bGQgYmUgYWNjZXB0ZWQgdXBzdHJlYW0uIDotKAoKWWVhaCwg
d2hlbmV2ZXIgcGFja2FnZXMgcHJlZW1wdGl2ZWx5IGJvdW5kIHRoZSB1cHBlciB2ZXJzaW9uIEkK
cHJlZmVyIHRvIGp1c3QgZGlzYWJsZSB0aGUgY2hlY2sgZm9yIHRoaXMgcmVhc29uLCBBRkFJVSB0
aGlzIHBhdHRlcm4gaXMKdXNlZCBpbiBhIG51bWJlciBvZiBweXRob24gcHJvamVjdHMgYmVjYXVz
ZSBzb21lIGJ1aWxkIGZyb250ZW5kcyhpLmUuIHBpcCkKYWxsb3cgYnVpbGQgdGltZSBkZXBlbmRl
bmNpZXMgc2NvcGVkIHRvIHNwZWNpZmljIHBhY2thZ2UgYnVpbGRzIHdoaWNoCmlzbid0IHNvbWV0
aGluZyB0aGF0J3MgcmVhbGx5IGFsbCB0aGF0IGZlYXNpYmxlIGZvciBidWlsZHJvb3QuCgo+Cj4g
QmVzdCByZWdhcmRzLAo+IEZpb25hCj4KPiA+ICsgYnVpbGQtYmFja2VuZCA9ICJiYWNrZW5kIgo+
ID4gKyBiYWNrZW5kLXBhdGggPSBbIl9idWlsZF9ob29rIl0KPiA+ICsKPiA+ICstLQo+ID4gKzIu
NDcuMwo+ID4gKwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
