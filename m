Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B31D606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qIiYEKys;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=kOdh8fzi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44184081B;
	Wed, 25 Nov 2026 16:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BK85SpJ6GzWT; Wed, 25 Nov 2026 16:22:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CEC7940838
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623741;
	b=B/H4i/lC0Lyu8Iu6WrqMnRpXciTTUGfDmhuUvAaA25h+6LKT+MahJO9aqXeCATdc59Yy
	 oEjQsf5HLBtAIPAR+VLaSNNXHpNf7nC4187UvHdQHM+IoxE6bFwU8/QszH9HmQBG36rys
	 XS0sKbmxSxsC31IaUSllyDFx03ny44l7zecISySt3K+XsAvDnrczNRCHu3vVDrOiNazWi
	 LSYNdrP6oZSWMOAIN5Tg8HsKINbtExmkuHEGB3CZikH/70OHS11DAOgMxUbq6CFOy9NVk
	 uamE1FhWO22vuR7bwKRo3nPNCjI5iOuJ93PCfB7H9/d+4YB3gjk5/9CZiubBjRyJVEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=OIOuPvlektTjKOFSvE0vCkUr5ElLOeYWVTuDEbJTwh8=;
	b=Ms1y0PczDBe6dozRSjEY4QWS7nffhLaMJLnc48TgqLLSnF+AOix3461yeeEfg+oPD8wR
	 BMSUG0ONBIox7Q52M2EoNH/x8YHh6m6Ci3Fte8u5OYj7/Rex4ELzWjopz7yUqGOxxhJ8E
	 b85m/z+VqcDsEK2Luh12EYgQPVWIcZJeqCf8oU4bmPLUo6hDiiJsM/8NsDdSxtTg3dgoE
	 xo+OST5W0M8WCn4rNkjHaiklwogum+5zCJwoMRy0HqwKJ2hox/+fPg2dG0SLcRZab2ifG
	 OFcLBoCSjwS+ufYYGyby7ZLX9LDv1UgRiowLTyR880bna4F5C9sSIHr6jBkoAonwogw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623741;
	bh=OIOuPvlektTjKOFSvE0vCkUr5ElLOeYWVTuDEbJTwh8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qIiYEKysVcastf37S1xxqXwc1PDbLQvL2NCdRoOusel4Efi4LldAtyVBxXJKyaM2u
	 tfspAc9OYlRYy3Ke18wdLmmxVz7i+wxvwZg4KxYQBS55SE6C4EW1bkEsNqRkigt5mv
	 7fFOe+uzDFDxtxAaesegpwEqJXwtqLozbNBcUs54TUgh6jKao6Wxr7whZVRjJvUU/T
	 kiZPH4ZKNk66rpP2/S8XTFwl6MVGvLQ5ScjQERRkB9tMtH14NlqI+U7B1tK8Xo0Rcl
	 yqo0oWhtotmVAISYf73A2g45x053lvzYt+4jvEL4Tpqpt1nnhhg/H3F9DF24Yzk7Q6
	 yE77cpsbvfk9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEC7940838;
	Wed, 25 Nov 2026 16:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E2532D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E394480E36
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBEmhrWWeuTp for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:22:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DF22180E31
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::112a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kOdh8fzi
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF22180E31
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:22:18 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8b4c685c751so52853577b3.1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623737; x=1796228537;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=S9va1kHAy7/RT9bAEaf3ZGe3DvjolN3VHStPuNaIjUA=;
 b=kOdh8fziO+PbQQJ7UZonpaTdfk/Do6+FWr+7bz4jP/UiqE589ZbtaFic3w8Spege74
 9CbnvbhaXz5UouL0eAhityImSOzGd4mraWjyW8oW40VcJwpXPrE11HRqvNXsq6QVA2eO
 Pm7RR1kw6WOeNkoupA8Bvt0lx08GsekDULyFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623737; x=1796228537;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=S9va1kHAy7/RT9bAEaf3ZGe3DvjolN3VHStPuNaIjUA=;
 b=wAUt3K745Gq0prBs78HiUptL9iVaZrVcZXEe1/3QTxHuX4aan1NPDrRp8DG/0w4KV/
 Q+W6yD9CduFiH5iPehJ4PnUSlj3vCQK94HX4eNFCbmXIFY0p3wwdK2oqdeSzgz7IeoXU
 uzsHq1OeGMvYW2pasbQg/eO2DwMjdrTYoOApykO2R7qq2mxyBfrclLM54k8QbkI6MUXA
 RjccM/vaBAk4ka1/tvyolLJjdyrJenAF5z0eiJJ1Kx6SN2i1ZuDTvPuZSq2RxFrVYYjl
 /2VPxJiepyANxczyK8XnR96PQh9NJ4u3DUBxvMXfnFTQImnKhy6qCG75hAE2J9okzsXE
 HKgA==
X-Gm-Message-State: APuU4Z/rYf3NvdayU2fVvzY2ODy1Mh6f/1OjIMLEvxXHFy/NENxC5ErN
 a2bsNT0QmciS3Ts51RKRVtorgjX9alhRD3SjTkRG9UOklwMcakmUp1YB22KXRv/FJMJS91U09RL
 6Km1StVDda1CgfqZlYZJdRjzXXniNbvAUyhwz0tgL2vO1z1YVJjJlAj4=
X-Gm-Gg: AZFdTZdYeTD5GHjr12XpKFBapAP0I/pgTLSdSMYT6/au69UdEyBhpErUY6sz+W1XC+M
 uEujkyMLR697/5MeK8rHIUo0Su6+EtMOuUyX0nDLRIQVLPM945uWeXfhLTJOVBzoICjVo/hvPtm
 DByxTNGjhrft5NlCukz8qR1iRCz7oEwg/3ukxgx50xw183SfkKS9AYM1Rs+DBi1VSA/2TEu3Oo9
 aQU5+7VEs9Fm+WqP8y5SoQFFPJ0vdZ2ceI+y7GllZjzzkgG9VExAmKxXr8WOURBjsI5CyUGuFaL
 kDz9SxMHgaYId9aB84TEkB+DAEF0FY4GBnJCbRs2Q3r0u1mfy6uOe+8VZ1TNjNFVF9LVDTQ6VCa
 juSZrzSg2h62n9rY6WSEky6Szv68q092IRtEWq/c6goLg5Ex+8zsIpvgSx+hQMeTDiA==
X-Received: by 2002:a05:690c:c4e9:b0:8b4:d26a:aa7f with SMTP id
 00721157ae682-8b520435e46mr66661507b3.34.1795623737439; Wed, 25 Nov 2026
 08:22:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
 <20261125161404.859000-2-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261125161404.859000-2-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:22:06 +0100
X-Gm-Features: Aa3M54r-z6_T7o3sdnqc-crnQVwyvhC4HJGP-IsoWbyZ6k9b31jJnYNXM86uAk8
Message-ID: <CABGWkvoyHPrYFhp_U0GMeWYQ+vhd-Qo4Onink7yoUSrA+npa9A@mail.gmail.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com, Michael Fischer <mf@go-sys.de>
Subject: Re: [Buildroot] [PATCH v7 1/5] package/sdl3: disable m68k builds
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWljaGFlbCwKCmFkZGluZyB5b3UgaW4gQ2MgYXMgdGhlIHNkbDMgbWFpbnRhaW5lciBpbiBE
RVZFTE9QRVJTLCBJIG1pc3NlZCB5b3UKd2hlbiBzZW5kaW5nIHRoZSBzZXJpZXMuIFRoaXMgcGF0
Y2ggZGlzYWJsZXMgc2RsMyBvbiBtNjhrLgoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKT24g
V2VkLCBOb3YgMjUsIDIwMjYgYXQgNToxNOKAr1BNIERhcmlvIEJpbmFjY2hpCjxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBTRExfYWxpZ25tZW50X3Rlc3Qg
aGFzIGEgc3RhdGljIGFzc2VydGlvbiB0byBlbnN1cmUgdGhhdCBpdHMgc2l6ZSBpcwo+IDIgKiBz
aXplb2Yodm9pZCAqKSwgYXMgU0RMIHJlbGllcyBvbiB0aGlzIGxheW91dCBmb3IgaXRzIEFCSS4K
Pgo+IFRlc3RpbmcgdGhlIFNETDMgcGFja2FnZSBieSBydW5uaW5nOgo+Cj4gICAkIHV0aWxzL3Rl
c3QtcGtnIC1wIHNkbDMgLVQgYm9vdGxpbi1tNjhrLTY4MDQwLXVjbGliYwo+Cj4gcmFpc2VkIHRo
ZSBmb2xsb3dpbmcgZXJyb3I6Cj4KPiAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBzcmMvbGlibS9r
X3Npbi5jOjE6Cj4gICBpbmNsdWRlL1NETDMvU0RMX3N0ZGluYy5oOjIzMDo0MjogZXJyb3I6IHN0
YXRpYyBhc3NlcnRpb24gZmFpbGVkOiAic2l6ZW9mKFNETF9hbGlnbm1lbnRfdGVzdCkgPT0gKDIg
KiBzaXplb2Yodm9pZCAqKSkiCj4gICAgIDIzMCB8ICNkZWZpbmUgU0RMX0NPTVBJTEVfVElNRV9B
U1NFUlQobmFtZSwgeCkgX1N0YXRpY19hc3NlcnQoeCwgI3gpCj4gICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPiAgIGluY2x1
ZGUvU0RMMy9TRExfc3RkaW5jLmg6MTE4NzoxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
J1NETF9DT01QSUxFX1RJTUVfQVNTRVJUJwo+ICAgIDExODcgfCBTRExfQ09NUElMRV9USU1FX0FT
U0VSVChzdHJ1Y3RfYWxpZ25tZW50LCBzaXplb2YoU0RMX2FsaWdubWVudF90ZXN0KSA9PSAoMiAq
IHNpemVvZih2b2lkICopKSk7Cj4KPiBTaW5jZSB0aGUgbTY4ayBBQkkgcmVzdWx0cyBpbiBhIGRp
ZmZlcmVudCBzdHJ1Y3R1cmUgc2l6ZSwgZGlzYWJsZSBtNjhrCj4gYnVpbGRzLgo+Cj4gRml4ZXM6
IDJkZDEzZTMyOGYxMSAoInBhY2thZ2Uvc2RsMzogbmV3IHBhY2thZ2UiKQo+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiAtLS0KPiAgcGFja2FnZS9zZGwzL0NvbmZpZy5pbiB8IDggKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2RsMy9Db25m
aWcuaW4gYi9wYWNrYWdlL3NkbDMvQ29uZmlnLmluCj4gaW5kZXggN2JjZTRjZWFiYTljLi5mNWJh
OGI2YTAxNmIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zZGwzL0NvbmZpZy5pbgo+ICsrKyBiL3Bh
Y2thZ2Uvc2RsMy9Db25maWcuaW4KPiBAQCAtMSw1ICsxLDEyIEBACj4gK2NvbmZpZyBCUjJfUEFD
S0FHRV9TREwzX0FSQ0hfU1VQUE9SVFMKPiArICAgICAgIGJvb2wKPiArICAgICAgIGRlZmF1bHQg
eQo+ICsgICAgICAgIyBJbnZhbGlkIHNpemUgb2YgdGhlIFNETF9hbGlnbm1lbnRfdGVzdCBzdHJ1
Y3Qgb24gbTY4awo+ICsgICAgICAgZGVwZW5kcyBvbiAhQlIyX202OGsKPiArCj4gIGNvbmZpZyBC
UjJfUEFDS0FHRV9TREwzCj4gICAgICAgICBib29sICJzZGwzIgo+ICsgICAgICAgZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9TREwzX0FSQ0hfU1VQUE9SVFMKPiAgICAgICAgIGRlcGVuZHMgb24gIUJS
Ml9TVEFUSUNfTElCUwo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCj4gICAgICAg
ICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiBAQCAtNzgsNCArODUsNSBA
QCBjb21tZW50ICJPcGVuR0wgRVMgc3VwcG9ydCBuZWVkcyBhbiBPcGVuR0wgRVMgcHJvdmlkZXIi
Cj4gIGVuZGlmCj4KPiAgY29tbWVudCAic2RsMyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWlj
IGxpYnJhcnksIHRocmVhZHMsIHdjaGFyIgo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9TREwzX0FSQ0hfU1VQUE9SVFMKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJT
IHx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8ICFCUjJfVVNFX1dDSEFSCj4gLS0KPiAy
LjQzLjAKPgoKCi0tIApEYXJpbyBCaW5hY2NoaQpTZW5pb3IgRW1iZWRkZWQgU29mdHdhcmUgRW5n
aW5lZXIKTS4gKzM5IDMyOCAwNjI1MjQ2CmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tCuKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAleKAlQpBbWFydWxh
IFNvbHV0aW9ucyBTUkwKIFZpYSBGZWxpY2UgQ2F2YWxsb3R0aSAyNUQsIDQxMDEyIENhcnBpLCBN
TywgSVQKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
