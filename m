Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F48E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 21:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F0C4008D;
	Tue, 14 Jan 2025 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdhBEf8EKhGz; Tue, 14 Jan 2025 21:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB3594071C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3594071C;
	Tue, 14 Jan 2025 21:42:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6CDB89
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59AFE40E23
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykOokF6dfj2M for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 21:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 687884051B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 687884051B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 687884051B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 21:42:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so43190365e9.3
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 13:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736890958; x=1737495758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dlk/aYKk/Ip9SNWg8oWS+YjoGMdAP1+of2o/fT+MdM=;
 b=NIn9Y67yUTEwZTRwKJOgs+qBX5p9ziPjt6HixpMHy/WHRBUB9yf8KZ9MVjBJuQnIr1
 x67dPBg0T3J37dZnF2pTcdvK6wntiNBpvct3xa1/3ZdOogG+uBYMvo0M//VmCSFVQKWd
 xuWbCFnF/+UPv3eddZ5i2uyDREtAl59TFn4vONJRmuTGXmdjUGB7JrbWL62cXGFs05JB
 DHMRjh68qI9Gkp4HK7fAaJx5J9GP8HY8gpqD//tY7skkihXoPhUQKBCOjVFOr2CdDHQP
 QFVGgfWMrofiRc4nzlO2Lzg4YTpA120KHxCazJ7mzOSdYrqiYrdz0nDIziTqakKdC2l1
 chgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR4dslcdaecDyosKeyLDcxAiwGwBkMFBaAOtol3+xdMxG7h5PWseQquARUP1U9KS1QidMFc9nqmLQ=@buildroot.org
X-Gm-Message-State: AOJu0YyM6YJ36vUFBeCApYjsybbHUxLKyMcQPYr5+gdpV7+N1tm4qDy0
 DXPcJQo9VpB1vXvbd2J3T6zgarBETeTUVYSen/I0Ag6MwoixgruBHxZtqQHUvvJJX3szY18p1//
 9
X-Gm-Gg: ASbGncspR4Ny0RqPNlKkRYUHG2vtan+N11pmcTjSfwN1Gyzc7wGw8qDoS43WVG7Ucnl
 kdOd99IDYVSAKoH9aEhZCF0GTFbg/ZqEBOrZ3Ro4d7VtGiVzNXPmIq5b9RTkDF80/zHDTxMxOEg
 tuGb6Z6gQiGI9+/1fmfvEoC9P3Fk+SiWY/0Wtu9OfIrfJPEhipD0xnVmsbMlrNN42STgdz2WyA2
 G37gUWAAll0pL89EJPdZm80EcMuw/LG8+ls8idGosuoPKOO3F6hNL8+EYIo8r3rptbuoEu+7UdT
 t1slQxihKTBZyxPbRujTCnYOuo4UdIVByxgrp4W4sEans3zlnHKuq1NbOjyezaIgxBPcMWd5f3+
 RDbUU88WMX5ULezcL
X-Google-Smtp-Source: AGHT+IETi+PeYok3HLTZxkGm6mHsIIGk/hKKwkYLEkCHRq/DFTqnr9JBFs3+ojkPH+SDWXbJqES7LA==
X-Received: by 2002:a05:600c:1386:b0:434:f8e5:1bb with SMTP id
 5b1f17b1804b1-436e26aeb43mr257722515e9.12.1736890958073; 
 Tue, 14 Jan 2025 13:42:38 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d050sm16220698f8f.15.2025.01.14.13.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 13:42:37 -0800 (PST)
Message-ID: <7cf74222-01c9-48ac-a965-aeeb0bd6ce08@smile.fr>
Date: Tue, 14 Jan 2025 22:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250113212414.137066-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20250113212414.137066-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736890958; x=1737495758; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5dlk/aYKk/Ip9SNWg8oWS+YjoGMdAP1+of2o/fT+MdM=;
 b=tL6y3maMEjcZwg6YOxXBPC0adlNxUfjP7vqDkJGgM0/6obXCGlNZiiPjaT6haM3bdt
 Or54wYerBtigYR7XDhhbII/pTk5KdT7OS50JZM6chpf81y/HR8FKsR2exNhiDBGeGExk
 M8ybqTNnnokvh+JlItgcjvq4CbZgj6Eo4MexA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=tL6y3maM
Subject: Re: [Buildroot] [PATCH 1/1] Config.in: introduce the BR2_BROKEN
 hidden symbol
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxMy8wMS8yMDI1IMOgIDIyOjI0LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IENvbW1pdCBbMV0KPiAidG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5h
bC90b29sY2hhaW4tZXh0ZXJuYWwtc3lub3BzeXMtYXJjOiBtYXJrCj4gYXMgYnJva2VuIiBkaXNh
YmxlZCBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX1NZTk9QU1lTX0FSQyBieSBhZGRpbmcgYQo+IGRl
cGVuZHMgb24gQlIyX0JST0tFTi4gVGhpcyBzeW1ib2wgZG9lcyBub3QgZXhpc3QgYW5kIGdlbmVy
YXRlcwo+IGNoZWNrLXN5bWJvbCBmYWlsdXJlcywgc2VlIFsyXS4KPiAKPiBUaGlzIGNvbW1pdCBm
aXhlcyB0aGlzIGlzc3VlIGJ5IGludHJvZHVjaW5nIHRoZSBCUjJfQlJPS0VOIGhpZGRlbiBzeW1i
b2wKPiB0aGF0IHdpbGwgYmUgdXNlZCB0byB0cmFjayB0aG9zZSBrbm93biB0byBiZSBicm9rZW4g
ZmVhdHVyZXMuIFRoaXMKPiBzeW1ib2wgd2lsbCBoZWxwIHRvIHRyYWNrIGZlYXR1cmVzIHRoYXQg
d2VyZSBicm9rZW4gZm9yIHRvbyBsb25nIGFuZAo+IHJlbW92ZSB0aGVtLgo+IAo+IEZpeGVzOiBb
Ml0KPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
Y29tbWl0LzExYThjZGQyYmJiZDBlZjRhZGY2MDBlNDc5MmQ3NWY2ZjIxMjJlYzgKPiBbMl0gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy84ODQwNDc2NTEx
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KCkxhc3Qg
dGltZSBCUjJfQlJPS0VOIHdhcyB1c2VkIHdhcyBmb3IgQmxhY2tmaW4gcmVtb3ZhbCwgb25lIG9y
IHR3byBwYWNrYWdlcyBhbmQKdGhlbiBhdnIzMiByZW1vdmFsIDopCgpIb3BlZnVsbHkgaXQncyBy
YXJlbHkgdXNlZC4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWls
ZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiBQYXRjaCB0ZXN0ZWQgaW46Cj4g
aHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8xNjIzMzk1
MTE1Cj4gLS0tCj4gIENvbmZpZy5pbiB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluIGIvQ29uZmlnLmluCj4g
aW5kZXggMjQ3YTllOGVmMS4uMjhkMzRjODcyMSAxMDA2NDQKPiAtLS0gYS9Db25maWcuaW4KPiAr
KysgYi9Db25maWcuaW4KPiBAQCAtNiw2ICs2LDE1IEBAIGNvbmZpZyBCUjJfSEFWRV9ET1RfQ09O
RklHCj4gIAlib29sCj4gIAlkZWZhdWx0IHkKPiAgCj4gKyMgSGlkZGVuIHN5bWJvbCBrZXB0IHRv
IGZhbHNlLCB0byB0ZW1wb3JhcmlseSBtYXJrIGEgY29uZmlndXJhdGlvbgo+ICsjIGtub3duIHRv
IGJlIGJyb2tlbiAoYnkgZGVwZW5kaW5nIG9uIGl0KS4gSWRlYWxseSwgd2UgZG9uJ3Qgd2FudCB0
bwo+ICsjIGtlZXAgYnJva2VuIHBhcnRzIGZvciB0b28gbG9uZy4gVGhlIGludGVuZGVkIHVzZSBv
ZiB0aGlzIHN5bWJvbCBpcwo+ICsjIHRvIGdpdmUgc29tZSB0aW1lIHRvIGEgZGV2ZWxvcGVyIHRv
IGZpeCB0aGUgZmVhdHVyZS4gRmVhdHVyZXMgbWFya2VkCj4gKyMgYXMgYnJva2VuIHdpbGwgYmUg
cmVtb3ZlZCBpZiB0aGV5IGFyZSBub3QgZml4ZWQgaW4gYSByZWFzb25hYmxlCj4gKyMgYW1vdW50
IG9mIHRpbWUuCj4gK2NvbmZpZyBCUjJfQlJPS0VOCj4gKwlib29sCj4gKwo+ICBjb25maWcgQlIy
X1ZFUlNJT04KPiAgCXN0cmluZwo+ICAJb3B0aW9uIGVudj0iQlIyX1ZFUlNJT05fRlVMTCIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
