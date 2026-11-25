Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD1606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sxRDJ3SX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=EiYkDf0s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 887DB80DEA;
	Wed, 25 Nov 2026 08:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRBj6JZNj8iX; Wed, 25 Nov 2026 08:56:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9E91E80D81
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795596980;
	b=IE6lWviaFjrovuKbwg3mGF0zOG1NSCItizWgvu29y4sM0/AVQtU/iFyDoKDLamm0enVy
	 WJmfX4fkrnF58UPxwvoGy5ZxnWJOmct6aw5zQllFOK4xZupNm7HxZny/6fxDxDguNri4J
	 PENO1DDRp06Mqws98knSSbX4zK8YkoBYrQ95mam8GpzfFeqQS7lg0F6N/Eiv/5k4FelHn
	 b0lq9Nqm8uqUNCBjFTVLlMrzkZamPLCaA9iIYvfQjNFf8NzHlWuGx2tCwVriJJUGEbyU4
	 kHXl+9okt+bQlP3HmYtSFWIRroHw+2Q5sr+AJqgiU8huFY2VqLOTY9ByMbkafswZczA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795596980;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=NHAT2gfFxQJgXfzlIEmIoajZO30cypSeoyUP3rs3Ejo=;
	b=RkWXA2KqGXP4sbsw5/2hHB+TTBpVSMynCqzp1E7reY14r65wexSkthPoRL4EEx2mhRva
	 DpgY0PHwxM+Bdd9rWGrFPenytg6Tap7XtagmV/O1V6AE8Gd4LW9OanbjlxbZ8w3XWOMuZ
	 X/o4EOKX3rCKV3sb0UhUa1mILJCblwRSkZIf47r0lrKgv9ubHmrs4JbpUuvqVqFByB9QX
	 DyryQEx0Q0xtspManVPCUkUAyWZaaWjPG17Uzjgx1bqmQCLZTMyzP4mRltOvl6SLFPjoy
	 HiN5xYG7juCJ8qMYBFXLA77gRuHduAZKKAjZXTgnKjsZ/8na5W7SFWkUTj2ydFPzQDQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=EiYkDf0s;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795596980;
	bh=NHAT2gfFxQJgXfzlIEmIoajZO30cypSeoyUP3rs3Ejo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxRDJ3SXZpH+7bvvoneaj7oAmU+qzc3kw5u/TSUhIrxmYYv0u3DELlqsilcOpx64p
	 DiAKJQAwvLBfi6zMeoJDLxydEQDzxzuPDB3QCpCqH8N+PN0KcuC5D/rduyKByyWC+r
	 0b2hItHycjsHwgaN12ZEV7OKhphnuxWlNgdgRqk2PKat0J93yhhB7QvckR3r15iX7M
	 GrPN6WFf2CJB87+Vab5sZhaesLx+0rNFQupgpCpt6WJfIecHtRAufFuIR1XlTJcB5I
	 eoIcDcF1skyKncPN1VohSYwkv7UA0Eml1JG0bzs0NQ0B2I1V0pLsNuTD3dHbFvzGfw
	 dhTh0SLfLdecQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E91E80D81;
	Wed, 25 Nov 2026 08:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDAA92F5
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3C2280D81
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7lzzqzcM_b8 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 08:56:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E13180C4E
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::1134"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EiYkDf0s
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E13180C4E
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:56:18 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8b4d6981c67so35143907b3.1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 00:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795596977; x=1796201777;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FsoOJ1tEs/M0RBXmfs400d9ojORhFaKKdeyYvWO20Ng=;
 b=EiYkDf0sz8G1I5b2UF3kT4KragEILMuAvgnBy/zRk1pXrFX4EmuVIt38uZCJhjQusD
 9YLB99o0MKoQdPav0wZFcjjAahNAyKY+0ceUkm/DY4lKD4Qc6IRPDp/dzRAY9VFAmfRo
 CVdItIwSRh5zHMiMx5uHkSdYu7pQxhfMEghLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795596977; x=1796201777;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FsoOJ1tEs/M0RBXmfs400d9ojORhFaKKdeyYvWO20Ng=;
 b=RZRA6fc+wKdGcU+Sa8nm52mc/xRKJHetA9fvG7WW0U2hGyuMPh+dZS+F0Giph0/7TU
 UgsZCSTVuuR97WuGNUJa7Q5EjX/ImfuLaEB8wNs5sbWx3J2Jr29DzNqXix5NSGBUCBvw
 IM+y3ve1+0EQZs4HI33eXn9sYDrENRpyoWieux56n7ARqUestYFmZbsyind3hy/kIgHM
 6cgqLc4VZ04m27eC+hIFN3Y/nmKHpvxCH1P/A4/nuFBNVWdSeYKMqqbOl4LnH5LDfrYZ
 gtbJ4hpOLaMBkBMxBwaiz/e/S5h2rb3XSzmgod7oNvFBCOcdkwuQeEF0VHS0GtUbJOAK
 gXfQ==
X-Gm-Message-State: APuU4Z80b+RYZfZ4kL8zpOwGEe6a+KKQDvHNkGlGhw4UFQ1uIudIn8AU
 VuFkQh+vNivCAG/YID4lIk2vkLXY4yETNDFIquIWlQ1BgVEm+nA5ZzybNaiy1UoFnBmA2oOWJXR
 EyGvi4607lQdGpev/Hz0dArlJv0/jprrD0RWbHjkZuVjP7TIrVSS6KwY=
X-Gm-Gg: AZFdTZca1TcoS7SGk9m86Kc0Zo4t8jd0dOH5/0RsbXbPi/Gp5BFVPeW7rud7ama5q7e
 sIOC0JQjVGFbb6e8h1pwnNVXo4aJin3YfStCb+fg4xautNFUgrw2lJDiEpcUE8cbYSOONnJjgwl
 /WDuZzN8Mhz5Z+/M/H9jhU0IJVz97Z5w2LXPS8gGwM6Slur51epXqdcurNAXPjwhC27LqM3aab1
 5vrNrBS8f52MgKBVpX3TREZbLoFGZa2bGGbG8PNTWA/yrY3SwW5qMMd3UirKmuS1Qv/4l5I6VAz
 frHPBa4pE4zCAS/HOdUQP9S3mQMQvkAVVUww7zxfv+evbjb3brj9X1YtwOrg5D82OLJqnF2KUWi
 LXazabk3Jhm9/tTBeTC0YdpoBXF9GYGLwShu/koARy41NTRMulcC0Zt1DhCZZ9OafuQ==
X-Received: by 2002:a05:690c:4443:b0:8b4:d66a:2018 with SMTP id
 00721157ae682-8b520521dd3mr78597107b3.68.1795596977011; Wed, 25 Nov 2026
 00:56:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
 <20261027144159.1097876-2-dario.binacchi@amarulasolutions.com>
 <auDQxqNkGAR3F3JJ@windsurf>
 <CABGWkvq6-B8ETC79RY3pXJX2SY0-FB9o7cGdgQ6MkNrGeZLT0g@mail.gmail.com>
 <auM5okwWBVvAlvXJ@windsurf>
In-Reply-To: <auM5okwWBVvAlvXJ@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 09:56:05 +0100
X-Gm-Features: Aa3M54q9KD7fhDNC4Ke58Zs3y6mnkJOoRKwYe7x3nEPqJu3BPKuSABmd4RVEn1A
Message-ID: <CABGWkvr8wv3nB=3sBNNYzH2dEQZqZoxL515R16eJ-iW-LXm0Bg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 2/2] package/drogon: fix build with LibreSSL
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKR2VudGxlIHBpbmcgb24gdGhpcyBwYXRjaC4KClRoZSBmaXggaGFzIGJlZW4g
bWVyZ2VkIHVwc3RyZWFtIHVuY2hhbmdlZCBbMV0sIGFuZCB0aGUgcGF0Y2ggc3RpbGwKYXBwbGll
cyBjbGVhbmx5IG9uIHRvcCBvZiBjdXJyZW50IG1hc3Rlci4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vYW4tdGFvL3RyYW50b3IvY29tbWl0L2E3N2NjMzY1MWQ1OTUwZjJmOGFlY2VhYjgwZjc0ZjMx
ODcwZjQwMTcKClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCk9uIFRodSwgT2N0IDI5LCAyMDI2
IGF0IDE6MTnigK9QTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDI5LCAyMDI2IGF0IDEwOjU4OjA5QU0gKzAxMDAs
IERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+Cj4gPiBUaGUgZml4IGhhcyBub3cgYmVlbiBtZXJnZWQg
dXBzdHJlYW0sIHVuY2hhbmdlZDoKPiA+IFs1XWh0dHBzOi8vZ2l0aHViLmNvbS9hbi10YW8vdHJh
bnRvci9jb21taXQvCj4gPiBhNzdjYzM2NTFkNTk1MGYyZjhhZWNlYWI4MGY3NGYzMTg3MGY0MDE3
Cj4gPgo+ID4gSSBzZW50IGEgdjIgdGhhdCBwb2ludHMgdG8gdGhlIHVwc3RyZWFtIGNvbW1pdC4K
Pgo+IEV4Y2VsbGVudCwgdGhhbmtzIGEgbG90IQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0t
IApEYXJpbyBCaW5hY2NoaQpTZW5pb3IgRW1iZWRkZWQgU29mdHdhcmUgRW5naW5lZXIKTS4gKzM5
IDMyOCAwNjI1MjQ2CmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCuKAleKAleKA
leKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQpBbWFydWxhIFNvbHV0aW9ucyBT
UkwKIFZpYSBGZWxpY2UgQ2F2YWxsb3R0aSAyNUQsIDQxMDEyIENhcnBpLCBNTywgSVQKaW5mb0Bh
bWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
