Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C683EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 13:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9D4A4180F;
	Wed, 21 Jun 2023 13:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D4A4180F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPNf3EQlJOum; Wed, 21 Jun 2023 13:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0365417FE;
	Wed, 21 Jun 2023 13:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0365417FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 612B81BF2B9
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 13:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BB20417FE
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 13:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB20417FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGbcxl5m-D_c for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 13:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C91094011A
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C91094011A
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 13:56:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so5185920e87.0
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 06:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687355800; x=1689947800;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=krLO8JFYnCYSOmEkkOn7pm+fA6cs1DhaPjIUmo/XHnc=;
 b=WBae7NGN1wHV4U4NSTV+Zkom0Dt5fXLaho+ErlCAUt8sNuXyfid0bDVBfIkHY7xbVH
 dhTRBO3nH8+llpS2sjXOhbkAjea2tnUZ/diXZSzGn1jqPrFk2QrVC2S9tmEgJCsrpEcG
 +sq4LkgN6a64wraJ6E3dGgE+mqHwTvNeKfcZTpb34o5v6kzdpVmYLK9Mf0/Db+aMRQJA
 GrpsKiMsW2AcpfEH6UWKe7mW2U75mUtXEM/2c5pnAGVrt40W4ibNdrdFDBrzFNVXoIG/
 IVktk1pPmN4YqUuFum243o8HsTCh4XLocTfKMKBgTu2tYaAkA6tdSlPQHQmB/eoOjnyx
 wt6A==
X-Gm-Message-State: AC+VfDy67l9NBiPSkT7Hrs+6FXVLZPxUZtLvqxmI7CmQGxKQqQOuli8m
 f8oyZ7WQy1SNXSgEvnvTgNkLRA==
X-Google-Smtp-Source: ACHHUZ7wXYM7OycJ4rSPPedFZsqlno2X9lrc5l1t5IQYO8cj7RTgoc+mLkAeES45+URZuGePk7SGBQ==
X-Received: by 2002:a05:6512:32a1:b0:4f8:6ed2:9fe1 with SMTP id
 q1-20020a05651232a100b004f86ed29fe1mr5860099lfe.11.1687355800392; 
 Wed, 21 Jun 2023 06:56:40 -0700 (PDT)
Received: from [10.5.2.165]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d4d8d000000b003048477729asm4529580wru.81.2023.06.21.06.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 06:56:40 -0700 (PDT)
Message-ID: <b698f502-2117-e0b0-7d0e-54e8ff1e6415@smile.fr>
Date: Wed, 21 Jun 2023 15:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605070859.1877231-1-james.hilliard1@gmail.com>
 <0fc72d11-35b2-b6a2-8028-89c3093567a5@mind.be>
 <1a3add30-eff5-9dfa-c4d9-3ca9122a6f08@smile.fr>
In-Reply-To: <1a3add30-eff5-9dfa-c4d9-3ca9122a6f08@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1687355800; x=1689947800;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=krLO8JFYnCYSOmEkkOn7pm+fA6cs1DhaPjIUmo/XHnc=;
 b=h4P1IflGb02XSN5NU2fcGac2Gid4801rZNNZp+I92FjlDxRi6N3QMUJuJg2oUVb6vv
 V1so+s4PxnI6mjJlU+a/DIAZZOoN56HQ0Ox841fkvaMYawwNY2j8TrxISmU6siawTU34
 efgXL8Tlmy8K0TaV7lyqnzmRflUazlIHZoueMXNzIXU91fLEkfZicF39SkCmMYAlfftv
 sIDOnoKz1a0Fmjik6EF/3NCHuQiGA/9EwjKqlXfQEOMpaU7YV3vgbnZgyiM/BVaFkA5g
 ERvnXe+/PVdtA35tU/xJzFWjpQ0y0DEaq703vUXtNJCVLNR2PwWnAiLL3O3JXi1UWRt9
 cbww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=h4P1IflG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 67.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAyMS8wNi8yMDIzIMOgIDExOjU3LCBSb21haW4gTmFvdXIgYSDDqWNy
aXTCoDoKPiBIZWxsbyBKYW1lcywgQXJub3V0LCBBbGwsCj4gCj4gTGUgMTgvMDYvMjAyMyDDoCAx
NTowMiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+Pgo+
Pgo+PiBPbiAwNS8wNi8yMDIzIDA5OjA4LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4+IExpY2Vu
c2UgaGFzaCBjaGFuZ2VkIGR1ZSB0byBuYW1lIHJlbW92YWw6Cj4+PiBodHRwczovL2dpdGh1Yi5j
b20vcHlwYS9zZXR1cHRvb2xzL2NvbW1pdC81OTU3ZDU4MjY2ZTQ3OWYxMjRiMzFmMzBlNDMyMmU3
OThmZGYzODZiCj4gCj4gU2luY2UgdGhpcyBjb21taXQsIG9uZSBvZiB0aGUgcHl0aG9uIHRlc3Qg
ZmFpbCAoVGVzdFB5dGhvblB5M0dwaW96ZXJvIFsxXSk6Cj4gCj4gICBGaWxlCj4gIi9idWlsZHMv
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvdGVzdC1vdXRwdXQvVGVzdFB5dGhvblB5M0dwaW96ZXJv
L2hvc3QvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9wa2dfcmVzb3VyY2VzL19faW5pdF9f
LnB5IiwKPiBsaW5lIDg2OCwgaW4gX3Jlc29sdmVfZGlzdAo+ICAgICByYWlzZSBEaXN0cmlidXRp
b25Ob3RGb3VuZChyZXEsIHJlcXVpcmVycykKPiBwa2dfcmVzb3VyY2VzLkRpc3RyaWJ1dGlvbk5v
dEZvdW5kOiBUaGUgJ2NvbG9yemVybycgZGlzdHJpYnV0aW9uIHdhcyBub3QgZm91bmQKPiBhbmQg
aXMgcmVxdWlyZWQgYnkgdGhlIGFwcGxpY2F0aW9uCj4gCj4gQnV0IGlmIHlvdSBsb29rIGNsb3Nl
ciBpbiB0aGUgYnVpbGQgbG9nLCB5b3Ugd2lsbCBub3RpY2UgbmV3IHNldHVwdG9vbCB3YXJuaW5n
Ogo+IAo+IFsuLi5dc3lzcm9vdC91c3IvbGliL3B5dGhvbjMuMTEvZGlzdHV0aWxzL2NtZC5weTo2
MjoKPiBTZXR1cHRvb2xzRGVwcmVjYXRpb25XYXJuaW5nOiBzZXR1cC5weSBpbnN0YWxsIGlzIGRl
cHJlY2F0ZWQuCj4gISEKPiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICAgICAgICAgUGxlYXNl
IGF2b2lkIHJ1bm5pbmcgYGBzZXR1cC5weWBgIGRpcmVjdGx5Lgo+ICAgICAgICAgSW5zdGVhZCwg
dXNlIHB5cGEvYnVpbGQsIHB5cGEvaW5zdGFsbGVyLCBweXBhL2J1aWxkIG9yCj4gICAgICAgICBv
dGhlciBzdGFuZGFyZHMtYmFzZWQgdG9vbHMuCj4gCj4gICAgICAgICBTZWUgaHR0cHM6Ly9ibG9n
LmdhbnNzbGUuaW8vYXJ0aWNsZXMvMjAyMS8xMC9zZXR1cC1weS1kZXByZWNhdGVkLmh0bWwKPiBm
b3IgZGV0YWlscy4KPiAKPiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IAo+IFNvLCBpdCBtZWFu
cyB0aGF0IHRoZSBwYWNrYWdlIGluZnJhc3RydWN0dXJlIGZvciBweXRob24gdXNlIGEgZGVwcmVj
YXRlZCBpbnN0YWxsCj4gbWV0aG9kLiBJJ20gbm90IHN1cmUgd2h5IHRoaXMgaXNzdWUgYXBwZWFy
IG9ubHkgd2l0aCBweXRob24tcGlvemVybyBidXQgaXQgc2VlbXMKPiB0aGF0IHdlIG5lZWQgdG8g
dXBkYXRlIHRoZSBweXRob24gaW5mcmFzdHJ1Y3R1cmUuCj4gCj4gQ2FuIHlvdSBoYXZlIGEgbG9v
az8KPiAKPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
am9icy80NTA1OTc3OTA2Cj4gWzJdCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vYmxvYi8yMDIzLjA1LngvcGFja2FnZS9wa2ctcHl0aG9uLm1rI0wxOTUKClN3
aXRjaGluZyB0byBzZXR1cC5jZmcgc2VlbXMgdG8gd29ya2Fyb3VuZCB0aGlzIHNwZWNpZmljIGlz
c3VlOgoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
LzIwMjMwNjIxMTM0NTE4LjMwNDY4OS0xLXJvbWFpbi5uYW91ckBzbWlsZS5mci8KCkJ1dCB3ZSBo
YXZlIHN0aWxsIGRlcHJlY2F0aW9uIHdhcm5pbmdzLgoKVGhvdWdodHM/CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Pgo+PiDC
oEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4+Cj4+IMKgUmVnYXJkcywKPj4gwqBBcm5vdXQK
Pj4KPj4+IC0tLQo+Pj4gwqAgcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0
b29scy5oYXNoIHwgNiArKystLS0KPj4+IMKgIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0
aG9uLXNldHVwdG9vbHMubWvCoMKgIHwgNCArKy0tCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoCj4+PiBiL3BhY2thZ2Uv
cHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+Pj4gaW5kZXggNzZhZDFi
YTFjZS4uYmUxMzA2MzcyOCAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9v
bHMvcHl0aG9uLXNldHVwdG9vbHMuaGFzaAo+Pj4gKysrIGIvcGFja2FnZS9weXRob24tc2V0dXB0
b29scy9weXRob24tc2V0dXB0b29scy5oYXNoCj4+PiBAQCAtMSw0ICsxLDQgQEAKPj4+IMKgICMg
RnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvc2V0dXB0b29scy9qc29uCj4+PiAtbWQ1wqAgMWZk
OGJkMDRiMGJlZDk1YWQ2YzgxZjAzYjFjMDgwYmPCoCBzZXR1cHRvb2xzLTY1LjYuMy50YXIuZ3oK
Pj4+IC1zaGEyNTbCoCBhNzYyMDc1N2JmOTg0YjU4ZGVhZjMyZmM4YTQ1NzdhOWJiYzA4NTBjZjky
YzIwZTFjZTQxYzM4YzE5ZTVmYjc1wqAKPj4+IHNldHVwdG9vbHMtNjUuNi4zLnRhci5nego+Pj4g
LXNoYTI1NsKgIGRiM2YwMjQ2YjFmOTI3OGYxNTg0NWI5OWZlYzQ3OGI4YjUwNmViNzY0ODc5OTM3
MjJmOGM2ZTI1NDI4NWZhZjjCoAo+Pj4gTElDRU5TRQo+Pj4gK21kNcKgIDYyOGFiMWFlN2QxNDE4
NWU1ZTUzNjc0MGVhMzFiNWNlwqAgc2V0dXB0b29scy02Ny44LjAudGFyLmd6Cj4+PiArc2hhMjU2
wqAgNjI2NDIzNThhZGM3N2ZmYTg3MjMzYmM0ZDIzNTRjNGIyNjgyZDIxNDA0OGY1MDA5NjRkYmU3
NjBjY2VkZjEwMsKgCj4+PiBzZXR1cHRvb2xzLTY3LjguMC50YXIuZ3oKPj4+ICtzaGEyNTbCoCA4
NmRhMGYwMWFlYWU0NjM0OGEzYzNkNDY1MTk1ZGMxY2VjY2RlNzlmNzllODc3NjlhNjRiOGRhMDRi
MmE0NzQxwqAKPj4+IExJQ0VOU0UKPj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZXR1
cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4+PiBiL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9v
bHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPj4+IGluZGV4IDIyNmVmMmI0NzkuLjZkMTAxNzJjZGMg
MTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRv
b2xzLm1rCj4+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRv
b2xzLm1rCj4+PiBAQCAtNCw5ICs0LDkgQEAKPj4+IMKgICMKPj4+IMKgCj4+PiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+Pj4gwqAgLVBZVEhPTl9TRVRVUFRPT0xTX1ZFUlNJT04gPSA2NS42LjMK
Pj4+ICtQWVRIT05fU0VUVVBUT09MU19WRVJTSU9OID0gNjcuOC4wCj4+PiDCoCBQWVRIT05fU0VU
VVBUT09MU19TT1VSQ0UgPSBzZXR1cHRvb2xzLSQoUFlUSE9OX1NFVFVQVE9PTFNfVkVSU0lPTiku
dGFyLmd6Cj4+PiAtUFlUSE9OX1NFVFVQVE9PTFNfU0lURSA9Cj4+PiBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvYjYvMjEvY2I5YThkMGIyYzg1OTdjODNmY2U4ZTljMDI4
ODRiY2UzZDQ5NTFlNDFlODA3ZmMzNTc5MWM2YjIzZDlhCj4+PiArUFlUSE9OX1NFVFVQVE9PTFNf
U0lURSA9Cj4+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMDMvMjAv
NjMwNzgzNTcxZTc2ZTVmYTVmM2U5ZjI5Mzk4Y2EzYWNlMzc3MjA3YjgxOTZiNTRlMGZmZGYwOWYx
MmMxCj4+PiDCoCBQWVRIT05fU0VUVVBUT09MU19MSUNFTlNFID0gTUlUCj4+PiDCoCBQWVRIT05f
U0VUVVBUT09MU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+Pj4gwqAgUFlUSE9OX1NFVFVQVE9P
TFNfQ1BFX0lEX1ZFTkRPUiA9IHB5dGhvbgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
