Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1266FEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 09:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B9482039;
	Thu, 20 Jul 2023 09:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B9482039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0Wg5Ng1fPWS; Thu, 20 Jul 2023 09:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7461D81FE5;
	Thu, 20 Jul 2023 09:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7461D81FE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5751B1BF5E9
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 09:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AAC7402F4
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 09:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AAC7402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaKCiwlaoMBe for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 09:05:03 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E900440116
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 09:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E900440116
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fd0f000f1cso3452265e9.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 02:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689843901; x=1690448701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/jf7h5/nHHyM02fz6z92CxH3iG5o5ACGtp3IZgP9LI=;
 b=ZABjZv1HhX9lc8h2NnFXLgzfKZ7VyvmTBJTtrsNLJY3yJwmVFcW6Drqd7Ef1zpUuws
 lcNvWj3exDitQ6GhV3bsYZ+oRHG7XvXg1Zm3Jvlyy4tkqMrZHg+qhlEOjxz0uRSxpQ47
 z4HlfoK2pQMu7bbvyLxTY0u+/z5ty4zufngqLzYREpHy6cflhmuRHBJd15zsVvwP/rAG
 CLO586e5BETBWXwuciBXt3TKHzNVcVUQ6oD825MVODti6N+SBGMl5sKmZiJn7G67GcJJ
 AKYaTasbzLD7idyizm2pFVcWJhirEkD9am9BQusuUvepfbprMyR13bqkpSdbRwUkq/d1
 jvYg==
X-Gm-Message-State: ABy/qLY9O0ceBRRny9Ekj9kDuyi7GNH/Q9qZ2eBC1GcE332PgEqnPdPZ
 C8KCSsXCMMl1mIO6yxEbNfAbag==
X-Google-Smtp-Source: APBJJlEq1c65XCfKGE1D1TxMxfaHItUSBqKg9N5HOnHP0sFqIOLXR5nCOMCTO7iqbPHaCsC5+t3j4w==
X-Received: by 2002:a7b:c408:0:b0:3fa:aeac:e978 with SMTP id
 k8-20020a7bc408000000b003faaeace978mr4337606wmi.0.1689843900568; 
 Thu, 20 Jul 2023 02:05:00 -0700 (PDT)
Received: from [10.5.2.165]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003fbd2a9e94asm653095wmc.31.2023.07.20.02.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 02:05:00 -0700 (PDT)
Message-ID: <8d36c185-9cad-b665-c5c5-a35269bc0358@smile.fr>
Date: Thu, 20 Jul 2023 11:04:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Julien Olivain <ju.o@free.fr>
References: <20230530200728.12239-1-ju.o@free.fr> <ZHicLZXBbEKasztN@debian>
 <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
 <fc5db520f19d5bcdca9faba0b9be88fd@free.fr>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <fc5db520f19d5bcdca9faba0b9be88fd@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689843901; x=1690448701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/jf7h5/nHHyM02fz6z92CxH3iG5o5ACGtp3IZgP9LI=;
 b=GIXhfy/9Qz6FSPmuHFfXRkxmu+psW5Q6YTd3x7NnJ+fOrZ2QcowX5b0Ux2O0EcFTv1
 CpFiX/AOmoX5OjVQ2SOUEJ9ugk1Ec+ASt/TGroWVPNuNlpM8E6TKuDRpmpW14nBUOBEj
 tv9I8f1m1Rw2mEd84Q5ZH4/jLp6efXWVijk8yonssVcIhQrObMsn/oNXd0f/ZaA3NDlH
 W/yBkktvOknm97EsF18qUOFneH5+os9IvQSE9p5YjlLjmwFFk3qm2vgkUOQf2jt5sfnx
 Rxoy+hg6F63mwfErWKdLYRjKh9tMmqB7PVtzuKpxeq8VCvnQdcLpIH3g+7MZaVtBfSfY
 +OkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=GIXhfy/9
Subject: Re: [Buildroot] [PATCH 1/3] boot/edk2: bump to version
 edk2-stable202305
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKTGUgMjAvMDcvMjAyMyDDoCAwMDowMSwgSnVsaWVuIE9saXZhaW4gYSDDqWNy
aXTCoDoKPiBIaSBSb21haW4sIEFsbCwKPiAKPiBPbiAxOC8wNy8yMDIzIDIzOjU3LCBSb21haW4g
TmFvdXIgd3JvdGU6Cj4+IEhlbGxvIEp1bGllbiwgVmluY2VudCwgQWxsLAo+Pgo+PiBMZSAwMS8w
Ni8yMDIzIMOgIDE1OjI1LCBWaW5jZW50IFN0ZWhsw6kgYSDDqWNyaXTCoDoKPj4+IE9uIFR1ZSwg
TWF5IDMwLCAyMDIzIGF0IDEwOjA3OjI2UE0gKzAyMDAsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+
Pj4+IEZvciBjaGFuZ2UgbG9nIHNpbmNlIHZlcnNpb24gZWRrMi1zdGFibGUyMDIyMDgsIHNlZToK
Pj4+PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRr
Mi1zdGFibGUyMDIyMTEKPj4+PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9y
ZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDIzMDIKPj4+PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS90
aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDIzMDUKPj4+Pgo+Pj4+IFRo
ZSBtYWluIG1vdGl2YXRpb24gb2YgdGhpcyBidW1wIGlzIHRoZSBSSVNDLVYgUUVNVSBWaXJ0IHN1
cHBvcnQKPj4+PiBpbnRyb2R1Y2VkIGluIGVkazItc3RhYmxlMjAyMzAyIChub3QgeWV0IHN1cHBv
cnRlZCBpbiBCdWlsZHJvb3QpLgo+Pj4+Cj4+Pj4gQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxs
YS5pbz4KPj4+PiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4+Pj4gLS0t
Cj4+Pj4gUGF0Y2ggc2VyaWVzIHRlc3RlZCBvbiBicmFuY2ggbWFzdGVyIGF0IGNvbW1pdCBjNzY1
YWM5IHdpdGggY29tbWFuZHM6Cj4+Pj4KPj4+PiDCoMKgwqAgdXRpbHMvZG9ja2VyLXJ1biBtYWtl
IGNoZWNrLXBhY2thZ2UKPj4+PiDCoMKgwqAgLi4uCj4+Pj4gwqDCoMKgIDAgd2FybmluZ3MgZ2Vu
ZXJhdGVkCj4+Pj4KPj4+PiDCoMKgwqAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4+Pj4g
wqDCoMKgwqDCoMKgwqAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4+Pj4gwqDCoMKgwqDCoMKg
wqAgdGVzdHMuYm9vdC50ZXN0X2VkazIKPj4+PiDCoMKgwqAgLi4uCj4+Pj4gwqDCoMKgIE9LCj4+
Pj4KPj4+PiDCoMKgwqAgbWFrZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPj4+PiDCoMKg
wqAgbWFrZQo+Pj4+IMKgwqDCoCAuLi4KPj4+PiDCoMKgwqAgb3V0cHV0L2ltYWdlcy9zdGFydC1x
ZW11LnNoCj4+Pj4gwqDCoMKgIC4uLgo+Pj4+IMKgwqDCoCBidWlsZHJvb3QgbG9naW46Cj4+Pgo+
Pj4gSGkgSnVsaWVuLAo+Pj4KPj4+IFRoYW5rcyBmb3IgdGhvc2UgcGF0Y2hlcyEKPj4+Cj4+PiBJ
IGRpZCB0ZXN0IHRoZSBmb2xsb3dpbmcgb24gbXkgc2lkZSB3aXRob3V0IGlzc3VlOgo+Pj4KPj4+
IMKgIHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+Pj4gwqAgdGVzdHMuYm9vdC50ZXN0X2Vk
azIuVGVzdEVkazIKPj4+IMKgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViQUFyY2g2NEVG
SQo+Pj4gwqAgdGVzdHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJYODY2NEVGSQo+Pj4gwqAgdGVz
dHMuYm9vdC50ZXN0X2dydWIuVGVzdEdydWJpMzg2RUZJCj4+PiDCoCB0ZXN0cy5mcy50ZXN0X2lz
bzk2NjAuVGVzdElzbzk2NjBHcnViMkVGSQo+Pj4gwqAgdGVzdHMuZnMudGVzdF9pc285NjYwLlRl
c3RJc285NjYwR3J1YjJIeWJyaWQKPj4KPj4gVGhhbmtzIGZvciB0ZXN0aW5nIGJ1dCBzb21lIHRl
c3QgaW4gZ2l0bGFiLWNpIGRvZXNuJ3QgYm9vdCBzaW5jZSB0aGlzIHBhdGNoIGhhcwo+PiBiZWVu
IGFwcGxpZWQ6Cj4+Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvNDY2NDg0NTg2NQo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9qb2JzLzQ2NjQ4NDU4NjEKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vam9icy80NjY0ODQ1Nzc3Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTc3Mwo+Pgo+PiAiU3lzdGVtRXJy
b3I6IFN5c3RlbSBkb2VzIG5vdCBib290Igo+Pgo+PiBJIHJlcHJvZHVjZWQgbG9jYWxseSB3aXRo
ICJ0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1Ylg4NjY0RUZJIiB0aGVuIEkKPj4gcmV2ZXJ0
ZWQgdGhpcyBjb21taXQgdG8gYm9vdCBjb3JyZWN0bHkuCj4+Cj4+IFRoZXJlIGlzIG5vIHVzZWZ1
bCBsb2csIHRoZSBpbWFnZSBqdXN0IGhhbmcuCj4+Cj4+IENhbiB5b3UgaGF2ZSBhIGxvb2s/Cj4g
Cj4gQmVmb3JlIHNlbmRpbmcgdGhpcyBwYXRjaCwgSSBpbml0aWFsbHkgc3VjY2Vzc2Z1bGx5IHJh
biB0aG9zZSB0ZXN0cwo+IHVzaW5nIGEgcWVtdSBhdCB2OC4wLjAgKDIwMjMtMDQtMTkpLCBzYW1l
IGFzIEJ1aWxkcm9vdCBob3N0LXFlbXUgYXQKPiB0aGF0IHRpbWUuCj4gCj4gSSBub3cgcmVwcm9k
dWNlIHRob3NlIGlzc3VlcyB3aXRoIHRoZSBCdWlsZHJvb3QgZG9ja2VyIGltYWdlIHVzaW5nCj4g
dXRpbHMvZG9ja2VyLXJ1biwgd2hpY2ggaW5jbHVkZXMgcWVtdSB2NS4yLjAgKDIwMjAtMTItMDgp
Lgo+IAo+IEFmdGVyIGJpc2VjdGluZywgSSBmb3VuZCB0aGF0IHFlbXUgY29tbWl0Ogo+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2NvbW1pdC82YTNhYTAxNGM1NDUzNWQw
YWM2NzUxNmIxMGVhMTc3NzhiYmFmZmZkCj4gZml4ZXMgdGhvc2UgaXNzdWVzLiBJdCdzIGluY2x1
ZGVkIGluIFFFbXUgdjcuMi4xICgyMDIzLTA0LTA1KS4gV2hlbgo+IHVzaW5nIGEgUUVtdSB2ZXJz
aW9uIGluY2x1ZGluZyB0aGlzIGNvbW1pdCwgdGhlIHRlc3Qgd29ya3MuCj4gCj4gVXBkYXRpbmcg
c3VwcG9ydC9kb2NrZXIvRG9ja2VyZmlsZSB0byB1c2UKPiAiRlJPTSBkZWJpYW46Ym9va3dvcm0t
MjAyMzA3MDMiIGFsc28gZml4ZXMgdGhvc2UgdGVzdHMsIGFzIGl0IGluY2x1ZGVzCj4gcWVtdS1z
eXN0ZW0teDg2XzY0IHY3LjIuMiAoMjAyMy0wNC0yMykuCj4gCj4gSSBiZWxpZXZlIGVkazItc3Rh
YmxlMjAyMzA1IGlzIGNvcnJlY3QgYW5kIHRoZSBpc3N1ZSBpcyBtb3JlIG9uIHRoZQo+IHFlbXUg
NS4yLjAgc2lkZSwgaW5jbHVkZWQgaW4gdGhlIEJ1aWxkcm9vdCBEb2NrZXIgaW1hZ2UuCgpJJ20g
YWdyZWUgd2l0aCB5b3UsIGl0J3MgYSBxZW11IGlzc3VlLgoKSXQgcmVtaW5kcyBtZSBhIHByZXZp
b3VzIGlzc3VlIGJldHdlZW4gcWVtdSAyLjggYW5kIHRoZSBCdWlsZHJvb3QncyB0ZXN0c3VpdGUK
VGVzdFViaSBbMV0uCgo+IAo+IEknbSBub3Qgc3VyZSBpZiBpdCdzIHRoZSByaWdodCB0aW1lIHRv
IHVwZGF0ZSB0aGUgQnVpbGRyb290IERvY2tlcgo+IGltYWdlIGZyb20gRGViaWFuIDExIHRvIDEy
LiBJIGFsc28gZGlkIG5vdCB0ZXN0ZWQgd2hhdCBvdGhlciBpc3N1ZXMKPiBzdWNoIGFuIHVwZGF0
ZSB3b3VsZCBpbnRyb2R1Y2UuCgpVcGRhdGluZyB0aGUgQnVpbGRyb290IERvY2tlciBpbWFnZSBh
bmQgUWVtdSBtYXkgcmVxdWlyZXMgc29tZSBjYXJlZnVsIHRlc3RpbmcsCnNlZSBhZ2FpbiBbMV0g
OikKClsxXQpodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWQ4
NDQ3YzM4ZjUzZjk4ZTFkZjRhMjA5ZTlmNzBlNTRmOGI2MGYzNmUKCj4gCj4gU28gdGhlIG9wdGlv
bnMgSSBzZWUgcmlnaHQgbm93IGFyZToKPiAKPiAxLiBkaXNhYmxlIHRoZSB0ZXN0IHVudGlsIHRo
ZSBCdWlsZHJvb3QgRG9ja2VyIGltYWdlIGlzCj4gdXBkYXRlZCwKClRoZSBwcm9ibGVtIGlzIHRo
YXQgdGhlIHRlc3RzdWl0ZSBkb2Vzbid0IGNoZWNrIHdoaWNoIFFlbXUgdmVyc2lvbiBpcyB1c2Vk
IGZvcgp0ZXN0aW5nLiBCdWlsZGluZyBob3N0LXFlbXUgYmVmb3JlIGVhY2ggdGVzdHMgd2lsbCBp
bmNyZWFzZSB0aGUgYnVpbGQgdGltZS4uLgoKV2UgbWF5IGFkZCBhIG5ldyBqb2IgaW4gdGhlIGdp
dGxhYi1jaSB0byBidWlsZCBob3N0LXFlbXUgaW4gYSBqb2IgYW5kIHVzZSBpdCBhcwpidWlsZCBh
cnRlZmFjdHMgZm9yIGVhY2ggdGVzdCBqb2JzLiBCdXQgd2Ugd2lsbCBub3QgdXNlIHRoZSBzYW1l
IFFlbXUgdmVyc2lvbgp0aGFuIHRoZSBvbmUgcHJvdmlkZWQgYnkgb3VyIGRvY2tlciBpbWFnZSAo
dXNlZCBieSB1dGlscy9kb2NrZXItcnVuIHNjcmlwdCkuCgo+IAo+IDIuIG9yIGRpcmVjdGx5IHVw
ZGF0ZSB0aGUgRG9ja2VyIGltYWdlIHNvb24sCgpUaGlzIGlzIHRoZSAybmQgUWVtdSA1LjIueCBp
c3N1ZS4uLiBTbyBpdCBtYXkgYmUgYSBnb29kIG1vdGl2YXRpb24gdG8gdXBkYXRlLgoKaHR0cHM6
Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0zN2UyM2UwZGQ3MTg3YmIy
N2FiYjMyOWY0ZmJiMjljNTljMzFjNjcyCgo+IAo+IDMuIG9yIHdlIGNvdWxkIGV2ZW50dWFsbHkg
aW52ZXN0aWdhdGUgdG8gcGF0Y2ggZWRrMiB0byBhdm9pZAo+IHRyaWdnZXJpbmcgdGhpcyBpc3N1
ZS4KCldlIGhhdmUgYSB3b3JrYXJvdW5kIHVzaW5nICItZndfY2ZnCm5hbWU9b3B0L29yZy50aWFu
b2NvcmUvWC1DcHVocC1CdWdjaGVjay1PdmVycmlkZSxzdHJpbmc9eWVzIgoKU2VlOgpodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIzLUp1bHkvNjcwODE5Lmh0
bWwKCj4gCj4gQW55IGNvbW1lbnRzIG9yIHN1Z2dlc3Rpb25zPwoKVGhhbmtzIGZvciB5b3VyIGhl
bHAhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGll
bi4KPiAKPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4KPj4+Cj4+PiBGZWVs
IGZyZWUgdG8gYWRkIChvciBub3QpOgo+Pj4KPj4+IMKgIFRlc3RlZC1ieTogVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+Pgo+Pgo+Pgo+Pj4KPj4+IEJlc3QgcmVnYXJk
cywKPj4+IFZpbmNlbnQuCj4+Pgo+Pj4+IC0tLQo+Pj4+IMKgYm9vdC9lZGsyL2VkazIuaGFzaCB8
IDIgKy0KPj4+PiDCoGJvb3QvZWRrMi9lZGsyLm1rwqDCoCB8IDIgKy0KPj4+PiDCoDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAt
LWdpdCBhL2Jvb3QvZWRrMi9lZGsyLmhhc2ggYi9ib290L2VkazIvZWRrMi5oYXNoCj4+Pj4gaW5k
ZXggOTRlZTIyZGRjNC4uMzRkNGIxMGUyOSAxMDA2NDQKPj4+PiAtLS0gYS9ib290L2VkazIvZWRr
Mi5oYXNoCj4+Pj4gKysrIGIvYm9vdC9lZGsyL2VkazIuaGFzaAo+Pj4+IEBAIC0xLDMgKzEsMyBA
QAo+Pj4+IMKgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPj4+PiAtc2hhMjU2wqAgYzEwNTIwZjI2OTU1
N2Q1NjZlMzVmZTgxMDQxNDFhYTI4NjVmOTA4NWFkMmIzYTMwYWFlOGE3ZTc4YTNjYTVhYcKgCj4+
Pj4gZWRrMi1lZGsyLXN0YWJsZTIwMjIwOC1icjEudGFyLmd6Cj4+Pj4gK3NoYTI1NsKgIGNhNTUz
NTE5MTNlNjI1OGViZDhjMDgxMDZmMzY5YWM3MTA3M2Q5Y2ZhYTgwNDI3ZmM1ZjEzMWIwNmQ4MDg5
NDDCoAo+Pj4+IGVkazItZWRrMi1zdGFibGUyMDIzMDUtYnIxLnRhci5nego+Pj4+IMKgc2hhMjU2
wqAgNTBjZTIwYzljZmRiMGUxOWVlMzRmZTBhNTFmYzBhZmU5NjFmNzQzNjk3YjA2ODM1OWFiMmY4
NjJiNDk0ZGY4MMKgCj4+Pj4gTGljZW5zZS50eHQKPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9lZGsy
L2VkazIubWsgYi9ib290L2VkazIvZWRrMi5tawo+Pj4+IGluZGV4IGZiNmI5YTMyODAuLjM5OWJk
MzQ2ZWYgMTAwNjQ0Cj4+Pj4gLS0tIGEvYm9vdC9lZGsyL2VkazIubWsKPj4+PiArKysgYi9ib290
L2VkazIvZWRrMi5tawo+Pj4+IEBAIC00LDcgKzQsNyBAQAo+Pj4+IMKgIwo+Pj4+IMKgCj4+Pj4g
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+Pgo+Pj4+IC1FREsyX1ZFUlNJT04gPSBlZGsyLXN0
YWJsZTIwMjIwOAo+Pj4+ICtFREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjMwNQo+Pj4+IMKg
RURLMl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyCj4+Pj4gwqBFREsy
X1NJVEVfTUVUSE9EID0gZ2l0Cj4+Pj4gwqBFREsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0
ZW50Cj4+Pj4gLS0gCj4+Pj4gMi40MC4xCj4+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+PiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
