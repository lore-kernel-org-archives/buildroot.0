Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165C606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l+69zJkt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=kVkr8/SV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2060280FAF;
	Tue, 10 Nov 2026 21:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sAlXxt0x-jT; Tue, 10 Nov 2026 21:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D76E81457
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794346932;
	b=O55bOdiW6xGW3RgcjSh94CacT0qrHzLIFrp2MfGnJWdlOkH8l2jV0c6QJD65vSLemXk1
	 bYc9apQA5MJtY8x2SZpIxRwIJ8iboDZ9VGc9xZcJyGBL2rTux0l4/GdP/ubyLLxz/Jl+H
	 e/7ohyv8xKTxXStxw2mW8WT7dcRktaNrQJH+JmRyeCIAFX29378QoDlA/GLe2UHSiKt9O
	 xVYxpPD4zfkHeXVQevUeKBGxVl8TL7mGayxrU4rxc0pal0HehaAIs/XJ5rcjWLAZuHqx4
	 bXEqxpw32bjY5LIDT+fgUcZCiqXfKn+HeX4Di4Q1H93rSv1YPKUyg/swrMdnKqoB5zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794346932;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=mGXGw8aAFG3CRz2Ap29R/qke/JrZg1PLbefh1fwhsKs=;
	b=CALvPRIl9DLGSyAYM+2ty5XCQNnyEjjHMG69S5JpjtOOpwibT6YLWVGFoInWlHEEPKPM
	 GGwBcv2tUG8t+KsgfodHL1hDXdaLLOUPTrmPnAfwUGn9BV2xoUeCE9I+U53RlbohCaRnR
	 eAM7uMF0LogJmMB972ejE8c2LridwPJpU8KOLZG0J8NGXcs8dHYGAb46aR67ZM8VyTdWC
	 B3wT2uZxcvE3HygHxAlyJeAiynz4d2VIwQ7EhJfMVgMuWucGViZ25ItTghe4Gz4bajUh+
	 J5jEel/3LXbBoHdgd5L+H+kFavKEhTrRwbzPar+E/bjhWSrTUuSaEowR7Bs/G+F/6CQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794346932;
	bh=mGXGw8aAFG3CRz2Ap29R/qke/JrZg1PLbefh1fwhsKs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+69zJktn9AZw4K2eJgfmtMnzTrpfAcLAqLZLV8soNXnu804AzcANma4St+sg1w/G
	 3eLdxTRRGtALPsBV3Xuxs700cHPi0sbgIVzPXnaam30l5ApFWbum8aK3oLXDPF2SGS
	 e6a4VRhcIICSpH5DKcSnUsUejAJEREqIiYny9WxiEukmxyQcx2yhBRUAIWJfPkBp62
	 SjyVdaEqXbGZICs57ZQpRTiLK31XO80mwP/h8CSSStw9m2EIi45ccZo730urm0LdiY
	 XxG/17A3ncIkWrxWxlQacgI/1TUpHTFlFLKVV0X3iQYShVoZrx+qyYPdrMeY4i5oxz
	 Un6zh3RJZ1TWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D76E81457;
	Tue, 10 Nov 2026 21:42:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6917731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6B6340A5A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U85W1Sei32xz for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:42:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B163640A48
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=kVkr8/SV
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B163640A48
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:42:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c49c32650adso195148366b.0
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 13:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794346925; x=1794951725; darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=e3/safspH77+NFc4g/Y+NZaZBS28WoaKWHL0QKHH6Hs=;
 b=kVkr8/SVRwJv8hOqn3NT84a9+NVqX0S/zSl1Hxi4pGaaOgJv702de07re4BCMgpypm
 pznFAJfY5ykJFQnoBmWTrqzusEUolP3xJPjV4IfWEQ5PlkDSa1rhkbV2wFSddnIVa30y
 9E29117xZjRH3M92JXoFTht3H+mYld1oy29/5ECr1drRsx0yFDULxSJCxiGrlLDUCgmi
 awu85igL8KoBZlDYaZj/G74YfDP80TbWFopwauJVKgkbiRD1su+ZvDVAaskhZPj7C5SS
 v7sY4HAuHwyC3rieQs8QiKVHzxvut5zp0k/Ch9oxUigRMj1G2Y7rNUroq4bGoEbdM6MJ
 ctoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794346925; x=1794951725;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=e3/safspH77+NFc4g/Y+NZaZBS28WoaKWHL0QKHH6Hs=;
 b=y2JUW3f6YN2PNtfK0VDOJeTcnJBCXLDeA8ho2KmeoVpso8eepZ35fn8I96VNBH4qeR
 h2UnNlnTDdXDKfyUI9THZSyL3mX72Qm/fhI0kxt/93QRGUVI9yEzgbDeNBWKdvKTlI2J
 kPCIu0bq/dXnBPKwoG+FSCd8tfKRCJwvNE/3C8cLodEasFqmy32wOYezycrBccfjQmRr
 0M9EzSkbcrvA/iu0mooBygt7E0BrsU6Ragv4X7OF/08eQQsKg6BN+wQpFQG5e9ovNoIb
 V75AQ6Ux404R1ZLrZdzMX6mNFYEmTICbM65k0JR7kj0lzwkSSUsWw8dc0KMnJ+2Xsns6
 G2xg==
X-Gm-Message-State: APuU4Z8F3kHiGT3KioNd0ARwYosDLfe99sj9PtqtwnQaAxvt2LPxuQAY
 HWwt1OE4U+WMDP1HWuhGDgkIJk8La0BqS41I5iO6ndtZ7Y7hhiiNLVmRC2ER4isEfXi682APE58
 uM5EGYgj8BAudyTjklTfKeNRACmW5HIE=
X-Gm-Gg: AYBFou22O0Kp30txYIHiet8BxpQDvGrU7hp5AaUt2nkxQnfhvAXLId5pIwTyVbE1oL0
 YjMF2YHv3er0qHf2/4WV54yK8qZE6Q8TmfM7ZLTspBgIdkWAhShWGDA4oyWfRhBdIU8fBsobJ/u
 /GBpVXfsRR4rgd/xHvtvC+/Uufz7DykAAPrFmvIVVon2o4aBRFh+odn62X2naNEFeWlZG5L3TAc
 nKbODG/DiybXOFjdAY2JY5vkNV1GFlzRspQypRsH1DpoRt3wFrH1oPMSoYGPpsxqGRevqwwdeA4
 6Fu12sppoXqHwo1FvaNvm0BrgjNna3G7uDB0S/ZePVTz+Z7WQpyceg+wTvlfh9far/uDze0b0wU
 3Kz9/HCd1uqJiC0K65lr/8AD7JS4ZcdCu+ymj2Q==
X-Received: by 2002:a17:907:d78b:b0:c40:80eb:c543 with SMTP id
 a640c23a62f3a-c5066983d05mr33558766b.4.1794346925204; Tue, 10 Nov 2026
 13:42:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110105623.702862-1-yegorslists@googlemail.com>
 <874idovc2y.fsf@dell.be.48ers.dk>
In-Reply-To: <874idovc2y.fsf@dell.be.48ers.dk>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 10 Nov 2026 22:42:28 +0100
X-Gm-Features: AclHuK-LzBRwCaTY_erkncrzqOYWMZp8HbII5jpz1tazCCmH_yfp8LA23zCuSbo
Message-ID: <CAGm1_kteJW7+sSRg1m43k=Tn5r_ARZGAUZLwf8M6gQrXJU8s4g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/libaec: security bump to version
 1.1.8
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUGV0ZXIsCgpPbiBUdWUsIE5vdiAxMCwgMjAyNiBhdCA2OjE54oCvUE0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJZZWdvciIgPT0gWWVn
b3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBG
aXhlcyBzZXZlcmFsIG1lbW9yeSBzYWZldHkgaXNzdWVzIGluIHRoZSBkZWNvZGVyIGFuZCB0aGUg
U1pJUAo+ICA+IGNvbXBhdGliaWxpdHkgbGF5ZXIsIGFtb25nIHRoZW0gaGVhcCBidWZmZXIgb3Zl
cmZsb3dzIGluCj4gID4gU1pfQnVmZnRvQnVmZkNvbXByZXNzIHdpdGggbmVnYXRpdmUgcGFyYW1l
dGVycyBhbmQgd2hlbiBkZWNvZGluZyBpcwo+ICA+IHJlc3VtZWQgYWZ0ZXIgQUVDX0RBVEFfRVJS
T1IsIGFuZCBhbiBvdXQtb2YtYm91bmRzIHJlYWQgZm9yIHZlcnkgbG9uZwo+ICA+IGZ1bmRhbWVu
dGFsIHNlcXVlbmNlcy4gTm8gQ1ZFIGhhcyBiZWVuIGFzc2lnbmVkLgo+Cj4gID4gRm9yIG1vcmUg
ZGV0YWlscywgc2VlIHRoZSBjaGFuZ2Vsb2c6Cj4gID4gaHR0cHM6Ly9naXRodWIuY29tL0RldXRz
Y2hlcy1LbGltYXJlY2hlbnplbnRydW0vbGliYWVjL2Jsb2IvdjEuMS44L0NIQU5HRUxPRy5tZAo+
Cj4gID4gQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy01LTUKPiAgPiBTaWduZWQtb2Zm
LWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4KPiBDb21t
aXR0ZWQsIHRoYW5rcy4KPgo+IE5vdGljZTogTXkgdGFyIGNvbXBsYWlucyBhYm91dCBzb21lIHVu
a25vd24gZXh0ZW5zaW9uIGhlYWRlcnM6Cj4KPiB0YXI6IElnbm9yaW5nIHVua25vd24gZXh0ZW5k
ZWQgaGVhZGVyIGtleXdvcmQgJ0xJQkFSQ0hJVkUueGF0dHIuY29tLmFwcGxlLnByb3ZlbmFuY2Un
Cj4gdGFyOiBJZ25vcmluZyB1bmtub3duIGV4dGVuZGVkIGhlYWRlciBrZXl3b3JkICdMSUJBUkNI
SVZFLnhhdHRyLmNvbS5hcHBsZS5wcm92ZW5hbmNlJwo+IHRhcjogSWdub3JpbmcgdW5rbm93biBl
eHRlbmRlZCBoZWFkZXIga2V5d29yZCAnTElCQVJDSElWRS54YXR0ci5jb20uYXBwbGUucHJvdmVu
YW5jZScKCkdvb2QgY2F0Y2guIEkgb3BlbmVkIGEgcmVsYXRlZCBpc3N1ZToKaHR0cHM6Ly9naXRo
dWIuY29tL0RldXRzY2hlcy1LbGltYXJlY2hlbnplbnRydW0vbGliYWVjL2lzc3Vlcy82OQoKWWVn
b3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
