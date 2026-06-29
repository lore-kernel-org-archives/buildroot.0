Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D1FC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A31860F29;
	Mon, 29 Jun 2026 20:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaItWPW7kD2S; Mon, 29 Jun 2026 20:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C422608AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782763562;
	bh=KuJ+9yOfQQavhldgk8GfENBVQuuI/+a0lZ77ixx559M=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dRA39dB40XPjBzNbh6ecdxY1SZCuCt3fnTl67Cfh9j/+nUyOJwNXPg/NTynMgTybd
	 C5ZNKfHgO/ZnLIdwQpyF4ZKtAX0L3uF6zAUuCmuskiqr9jfvnU8oPVLk0LMKLoxDuj
	 ebGsF0yBH68Q9WiuT+8O5qactC+eGJBoCP39ghXA+RRCdXutNaflvOTJthHukbS911
	 R/1y21hJM4w8gfB8rcNzUJ6UeGop1yRu6cplcQfe87PawP0xNq4yk9RTwlODnNcQ9C
	 XY6cE9bqLnhzyZv6w3SO1rnniwumXiQV2hrkgYzFZoVeknrZQq1bAOFAXP7+byJzCM
	 dN6vuyoQccaFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C422608AF;
	Mon, 29 Jun 2026 20:06:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF092F3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2045E608AF
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vq3AIr7bl2Nj for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 20:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AD4E060899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD4E060899
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD4E060899
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:05:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4938d60c035so21458415e9.0
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 13:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782763557; x=1783368357;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dvAfPHQyUmBImL9Yj1kqAS+BpTpKRUbbktst68GKxJE=;
 b=iV3vtcc/ykx0OSdzmmXqkvPRLO+bfVzBcr6XYWvgEJxR6WfBIPYxoRsC9kHZR+ffok
 3C8wk8LInvXRSSY+plQpZ//lYVJS3cp4EG+Hk2RGmUjC/VZmRrUIrkpDr6/dXDB87Qbb
 AbDcK+zG+bSqjYN0RoZtA2wEcQedx2L11EqoFYvdfCWn6dMNixjJSZvxhysZgqNILRie
 GXCGJh+ELHAuxn6PnvVS/etajtu+zR56ubrh64ph+XdraHdxxIEet/INMD8JYKJNt92O
 lXKZZ0G8xzJ2rXx8pbbVKZHchvVpbC3L5qnxMul386c2e/KxYzEhfD0HBlNkBRXgoPbQ
 tKsw==
X-Forwarded-Encrypted: i=1;
 AFNElJ86NX/tYAfPGaHI6Dml3E3bzMbO4663c69qHIKRwIhMj1VXlDYOt03a5VJi4IGuxZQWEIQbfN4wxaQ=@buildroot.org
X-Gm-Message-State: AOJu0YztLaSCwus5kXXWaDT94hGUsud+irZQnd1sraCS4zEn5KuwjNzl
 0UYSZq9/8HbGALsP9ulT5e7fD62J++8Jk1j5+94jWN+Qwax+PRY9XqAbvWGWUmS27zg=
X-Gm-Gg: AfdE7cndWwkQOIHCnUkqQIdIIuu8aE5vbOd3P7YfrRoKV2cl1C8HFzTOt634l1Eq+JA
 GS+mOeoFuPX87XRdZfSNXGv9KA48LuJWqPAMvJ44n58VUziRRyygt8zuL4/+sl7SDKGSLf6+cR+
 Atfr/6LKYexcwgxHLURf6zB0m1wniEAEuV57vkJJPNtl5q2g+v4OPcwK1FxShPxh8VRmFNVFjlI
 ZoZurfFh5H5UktjrHXBrjJeAXvxbJ2YPnwXiJN11T3f7mpXqUIqQFshpT+K1eCMklbv+8hAwiGk
 7msF1MtEYWLgxQ96+WJbtP4q/JEDe1WTAJ+F0I32a9QhWzrHSwylUJhfJZkfwhJcbhhO2gfprZH
 PlX7Wiar6BRtyMqkpW/MeXuWfe8kWHUn4RGs9qeaZCBt5/OavlIsoRRAQIozlV2RWI+V3iWF6ee
 ozBYzkjn6bNHCBZFJZqzz/uLYV5q20sIK/HlpKH9dhtNLUtij5GzLGLgqV6PCbdYvZz49HXFPBO
 zK7mVLjPysXlhIxKNzs7AuUvYwLy5VeNvZk7Mis2NPNcVIDfH2a5JA=
X-Received: by 2002:a05:600c:609b:b0:490:bc46:1a58 with SMTP id
 5b1f17b1804b1-493b82afbf7mr15884925e9.18.1782763557223; 
 Mon, 29 Jun 2026 13:05:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563d194bbsm676226f8f.3.2026.06.29.13.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 13:05:56 -0700 (PDT)
Message-ID: <ed58ac7d-1ce4-4a1b-947a-406c3310d838@smile.fr>
Date: Mon, 29 Jun 2026 22:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20260625084439.133977-1-fiona.klute@gmx.de>
Content-Language: fr, en-US
In-Reply-To: <20260625084439.133977-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782763557; x=1783368357; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dvAfPHQyUmBImL9Yj1kqAS+BpTpKRUbbktst68GKxJE=;
 b=Ih6xB0+HfcipC/1g/MOQ10d3Cpww0I2nZjeqH8OL+rEYtcKNmy9vYkxYSoaThNkwNM
 5krEacf4faTL2fgypWUDiEnhwf36McbJ/SHdNlZnVBlnVg3t4h2X2MHu5f2UY/PKSv3m
 7lhfnzqFGyUxTJcrKC+VYaiZ2c5ICECms54YE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Ih6xB0+H
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: TestIptablesNft: add
 test for iptables with nftables backend
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDI1LzA2LzIwMjYgw6AgMTA6NDQsIEZpb25hIEtsdXRlIGEg
w6ljcml0wqA6Cj4gVGhlIG5ldyB0ZXN0IGluaGVyaXRzIGZyb20gVGVzdElwdGFibGVzLCB3aXRo
IG9ubHkgbWluaW1hbCBjaGFuZ2VzIHRvCj4gdXNlIHRoZSBuZnRhYmxlcyBiYWNrZW5kIGluc3Rl
YWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4K
PiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9pcHRhYmxlcy5weSB8
IDE0ICsrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfaXB0YWJsZXMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X2lwdGFibGVzLnB5Cj4gaW5kZXggOTE4ZmE0ZmIyOS4uYzM3YzYxNWUwNiAxMDA2NDQKPiAtLS0g
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2lwdGFibGVzLnB5Cj4gKysrIGIv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9pcHRhYmxlcy5weQo+IEBAIC0yNCw2
ICsyNCw3IEBAIGNsYXNzIFRlc3RJcHRhYmxlcyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAg
ICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU9fR1pJUD15Cj4gICAgICAgICAgIyBCUjJfVEFS
R0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+ICAgICAgICAgICIiIgo+ICsgICAgaXB0YWJsZXNf
YmFja2VuZCA9ICIobGVnYWN5KSIKCkFwcGxpZWQgdG8gbWFzdGVyLiBUaGFua3MuCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKPiAgCj4gICAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gICAgICAgICAg
aW1nID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8u
Z3oiKQo+IEBAIC00MSw3ICs0Miw3IEBAIGNsYXNzIFRlc3RJcHRhYmxlcyhpbmZyYS5iYXNldGVz
dC5CUlRlc3QpOgo+ICAgICAgICAgIGNtZCA9ICJpcHRhYmxlcyAtLXZlcnNpb24iCj4gICAgICAg
ICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihjbWQpCj4gICAgICAgICAg
c2VsZi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDApCj4gLSAgICAgICAgc2VsZi5hc3NlcnRUcnVl
KG91dHB1dFswXS5lbmRzd2l0aCgiKGxlZ2FjeSkiKSkKPiArICAgICAgICBzZWxmLmFzc2VydFRy
dWUob3V0cHV0WzBdLmVuZHN3aXRoKHNlbGYuaXB0YWJsZXNfYmFja2VuZCkpCj4gIAo+ICAgICAg
ICAgICMgV2UgZGVsZXRlIGFsbCBydWxlcyBpbiBhbGwgY2hhaW5zLiBXZSBhbHNvIHNldCBkZWZh
dWx0Cj4gICAgICAgICAgIyBwb2xpY2llcyB0byBBQ0NFUFQgZm9yIElOUFVUIGFuZCBPVVRQVVQg
Y2hhaW5zLiBUaGlzIHNob3VsZAo+IEBAIC05NSwzICs5NiwxNCBAQCBjbGFzcyBUZXN0SXB0YWJs
ZXMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICAjIFNpbmNlIHdlIGRlbGV0ZWQg
dGhlIHJ1bGUsIHRoZSBwaW5nIHRlc3QgY29tbWFuZCB3aGljaCB3YXMKPiAgICAgICAgICAjIHN1
cHBvc2VkIHRvIGZhaWwgZWFybGllciBpcyBub3cgc3VwcG9zZWQgdG8gc3VjY2VlZC4KPiAgICAg
ICAgICBzZWxmLmFzc2VydFJ1bk9rKHBpbmdfdGVzdF9jbWQpCj4gKwo+ICsKPiArY2xhc3MgVGVz
dElwdGFibGVzTmZ0KFRlc3RJcHRhYmxlcyk6Cj4gKyAgICAjIEJ1aWxkIGlwdGFibGVzIHdpdGgg
bmZ0YWJsZXMgYmFja2VuZCwgYW5kIHJ1biB0aGUgc2FtZSB0ZXN0Cj4gKyAgICAjIHByb2NlZHVy
ZSBhcyBhYm92ZQo+ICsgICAgY29uZmlnID0gVGVzdElwdGFibGVzLmNvbmZpZyArIFwKPiArICAg
ICAgICAiIiIKPiArICAgICAgICBCUjJfUEFDS0FHRV9JUFRBQkxFU19ORlRBQkxFUz15Cj4gKyAg
ICAgICAgQlIyX1BBQ0tBR0VfSVBUQUJMRVNfTkZUQUJMRVNfREVGQVVMVD15Cj4gKyAgICAgICAg
IiIiCj4gKyAgICBpcHRhYmxlc19iYWNrZW5kID0gIihuZl90YWJsZXMpIgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
