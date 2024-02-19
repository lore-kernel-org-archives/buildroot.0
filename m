Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223FCC48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCAFD40359;
	Mon, 19 Feb 2024 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i47RGcGNpyxZ; Mon, 19 Feb 2024 21:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49D5240B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49D5240B8C;
	Mon, 19 Feb 2024 21:34:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C21711BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD5CF40B8C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soOHFiex_CmU for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DEEC40359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DEEC40359
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DEEC40359
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:34:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4125df3c40aso20298865e9.3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 13:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708378493; x=1708983293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LSafQsYbyCpytSv8q3g5cGXp3QRV38ILA/P8BvZHtnY=;
 b=HoU6mXU8Oq2rAdHtOiUmIpm0B+E4ZN6NbljHNmoaSe76mlIwBqSptGYIzw0afA2yTg
 jc6F8oMQTJ5PbTig4/p0fiovtVCOnoh5qT1O/W/4LKHJ72+00zgHwZvwCIkBy+3kuSJP
 z11W46XIqZlUfY2FY3QlnW+UPJUGGvQCogDuFRpsqWK7nu4FiK0ZDEB5NIUKdScoZnyz
 EF2E9OHDUvmyQMYolLi9L6iti1fSJAK7A9v5u+nVxhi5yL8uCK08T4meBFQxvcpd5dq4
 OECv7QQtf/mptzFucAzuNo8XLL5UQy7sYtIN9Zf0OaphI4Y5XTcSasswVc5snrEtUS6/
 7nDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU24PREzKToO/6d6Fxez90aPZaRioIs1KH5lfNvk1zzJzBCFv5XrdwT43E5aJI6BLpg+qv141mlCKqKrL2DsWbhJFkJmfh+1Q==
X-Gm-Message-State: AOJu0YwfWEHdBRsyHu/yKeYgTBo4qMUPc9FSV4QufbZQM9TKvLj7OjTt
 8K2BHcTq39RXN12W+tDvrjQk8jkdeYbAx7blQEjIHJ9LYfOgUkGR+dY4Y2nmWJQ=
X-Google-Smtp-Source: AGHT+IFZP75FIo1WsKXSiyyysfuUoq4oST3Tx7VNQ/9eqxwDoQ7Lv4MQoqh0ZmD1SWTAVaz1ouhiLg==
X-Received: by 2002:a05:600c:4f0d:b0:410:7428:1fb5 with SMTP id
 l13-20020a05600c4f0d00b0041074281fb5mr10208488wmq.27.1708378493279; 
 Mon, 19 Feb 2024 13:34:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b004105528c61fsm12643721wms.35.2024.02.19.13.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 13:34:53 -0800 (PST)
Message-ID: <63d28259-ff96-4450-bdc5-e1bc209d8e59@smile.fr>
Date: Mon, 19 Feb 2024 22:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
 <95a8a71f608575339cd61ba5ed09b93d8714c01c.camel@gmail.com>
 <20240219205157.5ukm426gmzbvn33f@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240219205157.5ukm426gmzbvn33f@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708378493; x=1708983293;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LSafQsYbyCpytSv8q3g5cGXp3QRV38ILA/P8BvZHtnY=;
 b=V5klAvAmR+/VknC1iO1TPwCO0roix+0sIqNSXjpz+dkPuL02Wp6DAaa5WBWGi4vzHP
 c59ahDVGV7qBDOeRKpVhMUo8+8t6cfatYn6B/YmvjN7ITkEEEKY+d9AdL/hRB19yYvXt
 iOv0zfkUT0CMPR8FWaToUQvQCJiBuzdB/6EcnGrwtKu0g/EowOP8B2TlKJGgRsNJ0SEp
 VsVU/B6gOrJ9+lpzyRrH0eMpL39NE+aeUv4/gBhZ6LFtMSDh6SG4yEdsj70E32APwh5t
 8L9nniQLPp4NSDF8NAaiEP7aH1LJxAMfLKxsFD4Z636lCK5smbnSnlPfERnduzcLR9ei
 3iVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=V5klAvAm
Subject: Re: [Buildroot] [PATCH v4 14/20] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCkxlIDE5LzAyLzIwMjQgw6AgMjE6NTEsIEFuZHJlYXMgRGFubmVuYmVy
ZyBhIMOpY3JpdMKgOgo+IE9uIFNhdCwgRmViIDE3LCAyMDI0IGF0IDA5OjQ0OjI5UE0gKzAxMDAs
IEFsZXhhbmRlciBTdmVyZGxpbiB3cm90ZToKPj4gSGkgRGFyaW8sCj4+Cj4+IE9uIFNhdCwgMjAy
NC0wMi0xNyBhdCAxNzowMiArMDEwMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+PiBBcyBleHBs
YWluZWQgaW4gWzFdLCBhZGRpbmcgc3VwcG9ydCBmb3IgQU02MnggTFAgU0sgaW4gVS1Cb290LCBy
ZXF1aXJlcwo+Pj4gYmlubWFuIGZvciBidWlsZGluZyBib290bG9hZGVyIGltYWdlcy4gVGhlIEJJ
Tk1BTl9JTkRJUlMgZW52aXJvbm1lbnQKPj4+IHZhcmlhYmxlIGlzIHVzZWQgdG8gcHJvdmlkZSBh
IHNwYWNlLXNlcGFyYXRlZCBsaXN0IG9mIGRpcmVjdG9yaWVzIHRvCj4+PiBzZWFyY2ggZm9yIGJp
bmFyeSBibG9icy4KPj4+Cj4+PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L3Vib290L3BhdGNoLzIwMjMxMDMwMTEwMTM4LjEzNDc2MDMtMy1uLXlhZGF2QHRpLmNvbS8K
Pj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPj4+Cj4+PiAtLS0KPj4+Cj4+PiBubyBjaGFuZ2VzIHNpbmNlIHYxOgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPj4+IC0tLQo+Pj4gwqBib290L3Vib290L3Vib290Lm1rIHwgMyAr
Ky0KPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9ib290L3Vib290L3Vib290Lm1rIGIvYm9vdC91Ym9vdC91Ym9v
dC5tawo+Pj4gaW5kZXggZGRhNjA2YTg4MDU5Li5jZjcwZjg2YTQxMzIgMTAwNjQ0Cj4+PiAtLS0g
YS9ib290L3Vib290L3Vib290Lm1rCj4+PiArKysgYi9ib290L3Vib290L3Vib290Lm1rCj4+PiBA
QCAtMTg5LDcgKzE4OSw4IEBAIGVuZGlmCj4+PiDCoGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19USV9LM19ETSkseSkKPj4+IMKgVUJPT1RfVElfSzNfRE1fU09DTkFNRSA9ICQoY2FsbCBx
c3RyaXAsJChCUjJfVEFSR0VUX1VCT09UX1RJX0szX0RNX1NPQ05BTUUpKQo+Pj4gwqBVQk9PVF9E
RVBFTkRFTkNJRVMgKz0gdGktazMtYm9vdC1maXJtd2FyZQo+Pj4gLVVCT09UX01BS0VfT1BUUyAr
PSBETT0kKEJJTkFSSUVTX0RJUikvdGktZG0vJChVQk9PVF9USV9LM19ETV9TT0NOQU1FKS9pcGNf
ZWNob190ZXN0Yl9tY3UxXzBfcmVsZWFzZV9zdHJpcC54ZXI1Zgo+Pj4gK1VCT09UX01BS0VfT1BU
UyArPSBETT0kKEJJTkFSSUVTX0RJUikvdGktZG0vJChVQk9PVF9USV9LM19ETV9TT0NOQU1FKS9p
cGNfZWNob190ZXN0Yl9tY3UxXzBfcmVsZWFzZV9zdHJpcC54ZXI1ZiBcCj4+Cj4+IElzIHRoZSBh
Ym92ZSBhY3R1YWxseSBzdGlsbCByZXF1aXJlZCB3aXRoIGJpbm1hbj8KPj4gVGhlIG5hbWVzIGFy
ZSBoYXJkY29kZWQgaW4gVS1Cb290IGluIGFyY2gvYXJtL2R0cy9rMy1hbTYyNS1zay1iaW5tYW4u
ZHRzaQo+Pgo+Pj4gKwlCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNfRElSKQo+Pgo+PiBUaGlzIHNl
ZW1zIHRvIGJlIHRoZSBvbmx5IHJlcXVpcmVkIHBhcnQuCj4gCj4gQ29ycmVjdC4gJ0RNPScgaXMg
bm8gbG9uZ2VyIHVzZWQsIGFsc28gc2VlIHRoZSBvZmZpY2lhbCBVLUJvb3QgYnVpbGQKPiBpbnN0
cnVjdGlvbnMgZm9yIFRJIHBsYXRmb3JtcyBpbiB0aGUgU0RLIGRvY3VtZW50YXRpb24gWzFdICh0
ZWNobmljYWxseQo+IHNwZWFraW5nIHRoaXMgZG9jdW1lbnRhdGlvbiBpcyBmb3IgdGhlIFUtQm9v
dCB2ZW5kb3IgdHJlZSwgYnV0IHRoZSBzYW1lCj4gcHJpbmNpcGxlIGFwcGxpZXMgdG8gdXBzdHJl
YW0gVS1Cb290IGJ1aWxkcykuCj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJlYXMgRGFubmVuYmVyZyA8
ZGFubmVuYmVyZ0B0aS5jb20+Cj4gCj4gWzFdIGh0dHBzOi8vc29mdHdhcmUtZGwudGkuY29tL3By
b2Nlc3Nvci1zZGstbGludXgvZXNkL0FNNjJYLzA5XzAxXzAwXzA4L2V4cG9ydHMvZG9jcy9saW51
eC9Gb3VuZGF0aW9uYWxfQ29tcG9uZW50cy9VLUJvb3QvVUctR2VuZXJhbC1JbmZvLmh0bWwKCkl0
IG1lYW5zIHRoYXQgd2UgY2FuIHJlbW92ZSBCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0RN
IGFuZApVQk9PVF9USV9LM19ETV9TT0NOQU1FIHRvby4KCm1ldGEtdGkgc3RpbGwgdXNlIERNPSBi
dXQgcHJvYmFibHkgdG8gc3VwcG9ydCB1LWJvb3QtdGktc3RhZ2luZ18yMDIzLjA0IHRoYXQgaXMK
c3RpbGwgYXZhaWxhYmxlIFsxXS4KClRoZSB1LWJvb3QgZG9jdW1lbnRhdGlvbiBhbHNvIGNvbnRh
aW5zIGEgc2ltaWxhciBub3RlIFsyXS4KCkluIHRoZSBlbmQgd2Ugb25seSBuZWVkIGFuIG9wdGlv
biB0byBzZWxlY3Qgd2hpY2ggU29DIHR5cGUgd2Ugd2FudCB0byB1c2UKKEdQLEhTLEhTLUZTKS4K
ClsxXQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtdGkvdHJlZS9tZXRhLXRpLWJz
cC9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LXRpLmluYz9oPWNpY2QubWFzdGVyLjIwMjQwMjEz
MDEwMCNuNTIKClsyXQpodHRwczovL2dpdGxhYi5jb20vdS1ib290L3UtYm9vdC8tL2Jsb2IvbWFz
dGVyL2RvYy9ib2FyZC90aS9rMy5yc3Q/cmVmX3R5cGU9aGVhZHMmcGxhaW49MSNMMzcyCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiAKPiAKPj4KPj4+IMKgZW5kaWYKPj4+IMKgCj4+PiDCoGlm
ZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU0JJKSx5KQo+Pgo+PiAtLSAKPj4gQWxl
eGFuZGVyIFN2ZXJkbGluLgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
