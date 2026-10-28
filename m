Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1B606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=McG+Qv0w
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F125810F9;
	Wed, 28 Oct 2026 15:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0fhdgxEaPHM; Wed, 28 Oct 2026 15:32:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5C89B810FC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793201557;
	b=fHNYiW+IpuojL4GGiARfIH7BCuNZEpACBFT5eienmMuqsP+ybD1S7Guv7xR++QGe1On0
	 3ttcIozriUqcZzsaIL6RsiIpRYhIP5JB9QuUvlqRA9Hh7THHo7124gqPMoW8ftNWIbinb
	 dubQziTfjtaZSRl1cAyk86LORhWp0FrAuCfHc280QjF/sXLl37dgOmYcwcLIQ4SdeALxA
	 eB4ZB22jUgl+JM85DFol6SyQVg9Z4jCRqzLqvMY3A1SOisy/zuIHz6Syc+6wcAlPAYzWg
	 MJS8Qfk7mtR+MSqlsv+VJat4UwMfZxajr5POV06jGB1bieiTs5fP4XSv71DS4I0xLtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793201557;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=s0QHIEwMX8ykRiCY6JbmzUj3Wirx5JU4nIBBWLWGdvY=;
	b=WdR2UFTA4yfKh/jY+UkgQPJa7PVwx3vct6baGfBtAaXWub8WOt1z7Gtj+1ZNorTmSoBr
	 ondg2lQ39Wb4Rm3iRo+R4/44xZiGaBrXJwJoErZPXbdW5f/Fe+1vD8E8tnBeo18GxsQ8u
	 A97Ji8Kr4L9/pRqMVLcEB7z34qBPgmiL6gB+UjjsM3CoZ+RVVnh+HKX00qKz0bSN6PVcG
	 iRr9OrQDdiW5WK5eB03mgQfSQEMb1QJJPK5noS7kwsveY6Is4P43mO/e61dsZukbYmjBq
	 SmPZ1trEG2NIWCCJmaFIUqpZDn1CKfROjHg2X4Nkw3QXu83W/rdiXZfTdDcOPg0Plyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793201557;
	bh=s0QHIEwMX8ykRiCY6JbmzUj3Wirx5JU4nIBBWLWGdvY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=McG+Qv0wNL1/xnMrYNhMyH+PuDe0NokV2Q7HRBSTpekkETBvhldBvItuN3tYLcX/d
	 NpGbNBa+Hulizhm9E99zTSjHGYr2qywNui/IY6IRNUDWGtGsugLEJaOCgBNS2k6eps
	 LFFISpxFaniZHwX6fVblFVDFsBqobpdFggpWUJkUmas4oSBdAaYp898K+mgcjHuD3W
	 qN3nUiH2qr0Srig7m9D80aqxodiliqGtCfwDvfzrFawd6KPLaeTTVNzSlPcJ80jXiE
	 AtOkqocQSOh2qKSvflnZf+vA/FawUd9xSzBVFXZn+LCQehAJ37s4WdfvL8lfOi60NO
	 bZ7GOOzgdXoTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C89B810FC;
	Wed, 28 Oct 2026 15:32:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B6CA356
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3185B4072F
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3QhthFrLaSa for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 342D7406EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793201555;
 b=OUee18eKNPvBnp3iIhq5dsqvT3K2iFPB7iOfztqIX3uUK/jyuwMSYG2AWxwygJ9+9xeE
 Ay4ZsWogBDuH5+PkDpcuEG3c/EW5+mHCb8n13tVQY55+1n5W7lxRLvrDBpfdajAlcmjY5
 eSdJcXvx4w2S/UkIlnm/IYrVoojtjdrASXHvvgI+LjO9+1dOG+f5pehcq234T2OS1HL4b
 hkRQPsQMh1dNk7t8kZGgPRRBOHT32FuQPZZYLc8xb93Pz+JUUZCBf94c7ceqHcctDT8uz
 teFBcIP/eKXyRgAgqJIsyAJCDLoGuF8//H6g0R4GHWZBjULZw6+OT7Wk7DV2/8HffZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793201555;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=izp7u4bTQi8Bmqx1KpEmmlDbmgZDw3jOR/oCWOWg3Xw=;
 b=GsF/QuFAfzTB2UIY+asevIbdXMr/cZ+ewm/DJe3jOtt484l9v98R1K3ceYPqHfCVLjdL
 TTno0jU+vgRGj1Gb1usyIJOl8+coeG9ZXuuUzZALbzq4PslIGMvOazhydLT0xHgrBDogf
 3+tUSU8qQEooSv5XMD1SKyT3MfrihFliYC82zstxX07e2sd8tqd8DqyM29BMJXyDT8WdD
 juXahMyhxtVxFTgbfV4Jxb10CeSMUeny4f7ajL52g0bH7Ktgr37KBP83q2abQ6o8uJy5T
 PhLjjJTqMMSoKg0Lg0qZczuoQCNWwGFCbOJwSdXpmiit5cMooAT4JTnwBi2UDEHD5Jw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Gu9dnRvg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 342D7406EE
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:32:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so696179f8f.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 08:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793201552; x=1793806352;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=izp7u4bTQi8Bmqx1KpEmmlDbmgZDw3jOR/oCWOWg3Xw=;
 b=NcKOrKnsEAH5EQ/B70NVHCrgoHaHt++zFR3iNXsarGZZEP7Hvk5zSKN9plWhQ2DQwa
 PbGmLAqe0tues3ywd8wNFkbIiQUJ3hQ/uVVi5zo77Zdb6QXyaznvDuz+PlEanLMC9ver
 eHcJuxqC8xVG4/3Kl86ZXhZSmEVLQr7lrC+qIxTydJrSWdpJaQAEBAq37Su/+w4pHlQp
 XCSNlV/Js4ZS2DJ8n7zaZYvWDyBr6tl5gq2coy8Lz6URsEKwjrraWzfT9nlfU7ZNslYt
 zEFhNdrAqxtfItNaVN6RVMIRABKuUT7P3ogVqfbhageF8Olgvn4m36XonbSeMx+/s8dN
 vLJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzrIcE7L5P9iDUnZL/8KNjetSofBQflKs1JpV4136HLH3odROwVwcHe7G6e+AgYuqTlOLmgIQscWU8=@buildroot.org
X-Gm-Message-State: AFq9FYJftvOufBAaC91c5ybVigpBbO0kLRWMS0Z1M4Ub+9r/xvWg/GRM
 qHcaPBR/Zq5YTT2LF6ugHdLMeKa6ryIePZMvXQC5s8PYyYsmJCiEnsDzv1m+t6tYZjg=
X-Gm-Gg: AYBFou0CgukfSFOAR1MFKQInztuzrE5wgYC3xROuzHxbfKiQZdHEVdykDWs9qV91nS4
 x3TCOtEIiStPjN28wIJJl5nXdebVZY4lnpGiDgwd5zmjxMrZ166G9xuUUBO6c8pOPLS1CLrZQcv
 bNi3Jfb3LA9GFl7Y86i9+ATtwb0Ho9bTOYE+YFyoCrpW1FQQ5fYAbE0kmWqAEFAH/F7hdrulmv+
 ULv+6Dn/OyQFnIWGhDLNhW0MMR9f1XIuMcdDf4xnIkNWb+gcsuzha0foORnPT9Co/jrfTnkV2qf
 D+djeDOr1QqSalGbpD5uJZ7lqTnsqqUJsEejZCuSEJKd6t0ItzFtv/htDCVRSUZ3+gbIAv2LDVS
 MAsiDFBy4AxO6tJkHxeztDLUI/9Ha+Dd85TIDqUvr97q1eePCfqsus0PD0mnxvXOnZC9TxNFJeE
 DMsWM30KrccjGa/TOx3+WBC2c8zIvNAaoXIT52/zHOyItT9NMwMaUhpTCs+dwk4tzV+41NlHdft
 PwTrkNHMtGaGOB72fJ4J5WzT2mm1d2qc4lu8B/wxbjcX6Rmq4cIqmTZQYfJFyWVygJvgCVIdTnG
 Bx9e/EWr3dJzeLtJ0HYiGqZvRtGK+93OkgKjlUkucNCXeJHEQO8cHTbRt0g=
X-Received: by 2002:a05:6000:4912:b0:48e:c0:9441 with SMTP id
 ffacd0b85a97d-48e5d5988bemr6846727f8f.29.1793201552374; 
 Wed, 28 Oct 2026 08:32:32 -0700 (PDT)
Received: from [192.168.178.32] ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb902sm30613227f8f.24.2026.10.28.08.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 08:32:32 -0700 (PDT)
Message-ID: <1e23b3f3-a08d-4522-8c5d-052344c5481f@mind.be>
Date: Wed, 28 Oct 2026 16:32:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
 <20261005154047.413898-1-raphael.melotte@mind.be>
 <20261005154047.413898-2-raphael.melotte@mind.be>
 <PH1P110MB1603E1DEDF7E2669F93110409F6FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PH1P110MB1603E1DEDF7E2669F93110409F6FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 1.28.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmluY2VudCwKCk9uIDEwLzI4LzI2IDI6MDQgUE0sIFZpbmNlbnQgRmF6aW8gd3JvdGU6Cj4g
Cj4gSSBzYXcgdGhhdCAyLjAgd2FzIHJlbGVhc2VkIHJlY2VudGx5IGFuZCBJIHdvbmRlciBpZiB0
aGF0J3MgYSBiZXR0ZXIgb3B0aW9uIGZvciBtYXN0ZXI/Cj4gCj4gSSBhc2sgYmVjYXVzZSB3ZSdy
ZSBsb29raW5nIGF0IFB5dGhvbiAzLjE1IHN1cHBvcnQgaW4gQnVpbGRyb290IGFuZCBpdCBsb29r
cyBsaWtlIFB5TXVQREYgYWRkZWQgc3VwcG9ydCBpbiAyLjAgKGJ1aWxkcm9vdHMgcHltdXBkZiB0
ZXN0cyBmYWlsIG9uIDMuMTUgZHVlIHRvIGJ1aWxkIGlzc3VlcykuCj4gCj4gR2l2ZW4gdGhlIG1h
am9yIHZlcnNpb24gbnVtYmVyIGNoYW5nZSwgSSBpbWFnaW5lIGNvbXBhdGliaWxpdHkgbWF5IGJl
IGJyb2tlbiBidXQgaXQgbWF5IGJlIGlkZWFsIGZvciBpbmNsdXNpb24gaW4gbWFzdGVyIHdpdGgg
c2VjdXJpdHkgZml4ZXMgcG9ydGVkIHRvIExUUyBicmFuY2hlcz8KSSBjYW4gYnVtcCBweXRob24t
cHltdXBkZiB0byAyLjAgYW5kIHNlbmQgYSBuZXcgc2VyaWVzIHllcy4KRGVzcGl0ZSB0aGUgbWFq
b3IgdmVyc2lvbiBudW1iZXIgY2hhbmdlLCB0aGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUgYW55IApt
YWpvciBicmVha2luZyBjaGFuZ2UgKGV4Y2VwdCB0aGF0IHNvbWUgb2xkZXIgcHl0aG9uIHZlcnNp
b25zIGFyZSBubyAKbG9uZ2VyIHN1cHBvcnRlZCkuCgpJIGhhdmVuJ3QgdHJpZWQgdG8gYnVpbGQg
cHl0aG9uLXB5bXVwZGYgMi4wIHdpdGggcHl0aG9uIDMuMTUgeWV0IHRob3VnaCwgCkkndmUgbm8g
aWRlYSBpZiBpdCBidWlsZHMgeWV0LgoKRm9yIHRoZSBMVFMgYnJhbmNoZXMgeWVzLCBpbmRpdmlk
dWFsIHBhdGNoZXMgd291bGQgYmUgYmV0dGVyLiBJIHN0aWxsIApoYXZlIHRvIGNoZWNrIHdoaWNo
IG9uZXMgYW5kIGlmIHRoZXkgYXBwbHkuCgoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
