Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6ACC47DA9
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 19:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 272508214C;
	Tue, 30 Jan 2024 19:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272508214C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxy1qQKw12pM; Tue, 30 Jan 2024 19:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC1982028;
	Tue, 30 Jan 2024 19:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BC1982028
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0B681BF2EB
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 19:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D63584179F
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 19:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D63584179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KU2abg37z3wr for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 19:54:03 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE0DA41747
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 19:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0DA41747
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33ae53eb5a8so2032087f8f.3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 11:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706644440; x=1707249240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HW7Rxyd4a/5DfdI8CM2ztyg5RHQii+cxdH8PtFcApYk=;
 b=sB5Wg4uvzdC6g86//V38yIEhgFLEhKEpz94FNI7jJYvmq8ooRioynLpXsEAig9nMdg
 tJb3EKKtP2eBtilSxasKMUJ0Tz7yM3wDzP72adNqd7Gn4qAm0Mrt7MurarQCC3SqZ848
 1vk+hJfNAFIJJUlbjGJCrEdu5fmtmni+Nzlxr1bvzj9T5FfgO44xGx0DB3ALTIdjt/PC
 3XkTI45iLn+qqan5gXks6Px3Z1YChQR5iWZEMResl86kIrxPYngTNK8hl5nMhkhTPrdh
 rrsstDcyitVVrGaU8Dl/bL/DeEVgCJnVK7BRstqHlMYBrdpgsIBYaRFxOyDwdQR4A61R
 +tGw==
X-Gm-Message-State: AOJu0YzVGDj5cDPCh0bRI+ZFD71ZY3BKXwkkEneKr0DGhAGfnu5VIggj
 UvykZ/Q22cJrIbpND1K37WQZNlFUBTKrPEb52Ne1JkmbBNwfoIUHE72WjoHJc9v5X7yi9BYn7Wn
 G
X-Google-Smtp-Source: AGHT+IHM0v4Vt1GcxfYXwYKSfOzwVmuiI9HBIu2D8rcI7229WX5pOqN6zj60+5074SIQh+EMu2siXg==
X-Received: by 2002:adf:fdd1:0:b0:33a:ef44:3e65 with SMTP id
 i17-20020adffdd1000000b0033aef443e65mr4454231wrs.28.1706644440596; 
 Tue, 30 Jan 2024 11:54:00 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 en6-20020a056000420600b0033ae5b637d4sm8897169wrb.35.2024.01.30.11.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 11:53:59 -0800 (PST)
Message-ID: <8d688c18-a40c-433b-a576-3424f7dc42d9@mind.be>
Date: Tue, 30 Jan 2024 20:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230901192719.102415-1-dalang@gmx.at>
 <20230901192719.102415-4-dalang@gmx.at>
 <1f2e43ba-7a94-48a2-be01-2e8e419fc036@mind.be>
 <18dad1bb-cfe6-476f-b8be-85ea98c84f3f@gmx.at>
In-Reply-To: <18dad1bb-cfe6-476f-b8be-85ea98c84f3f@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1706644440; x=1707249240; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HW7Rxyd4a/5DfdI8CM2ztyg5RHQii+cxdH8PtFcApYk=;
 b=KCvoeoioCLM2p7R/3TIL7lymmPQbFEerZEGJpE0y63w+TnphMGeaDTVl34Z2cdr6RD
 q96nrRgf5a9IQRr1eXSj1zmo/E2gBBkJehWYIRMZ0YaaS8BfZtsSmeKyg8yoNclRP/E1
 sFviscnff1rvjYI2Us3ixvYfbU2NFRegMIfPrGyN5d12Q5kdPiUsIqKlK67Xyk9ATJZi
 FPJ110lFY8hZVN5pOawj5ib151zQEJ+iu4aA6Xb4q1IBXEWY3kgtajBcUlKjrafwE941
 Na7F48j3j91sjMbAvB8T7BnVA+ziDOcinBV1Q61YDWemO1YVLUbDRKYjnZJFmlZBawQr
 r6Fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KCvoeoio
Subject: Re: [Buildroot] [PATCH v4 4/6] support/scripts/cve.py: switch to
 NVD API v2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBEYW5pZWwsCgpPbiAyOC8wMS8yMDI0IDIwOjQwLCBEYW5pZWwgTGFuZyB3cm90ZToKPiBI
aSBBcm5vdXQsCj4gCj4gT24gMTIuMDEuMjQgMjA6MzksIEFybm91dCBWYW5kZWNhcHBlbGxlIHdy
b3RlOgo+PiAgwqBIaSBEYW5pZWwsCj4+Cj4+ICDCoEknbSBmaW5hbGx5IGdldHRpbmcgYXJvdW5k
IHRvIHRoaXMgcGF0Y2ggc2VyaWVzLi4uIEkgaGF2ZSBvbmUgbGl0dGxlIHF1ZXN0aW9uIChhbmQg
YSBsb3Qgb2YgbGl0dGxlIGNoYW5nZXMgdGhhdCBJJ20gZG9pbmcgd2hpbGUgYXBwbHlpbmcpLgo+
IAo+IEFzIEkgbWVudGlvbmVkIGluIG15IGxhc3QgZW1haWwgdG8gVGhvbWFzIFswXSwgSSBoYXZl
IHNpbmNlIG1vdmVkIGF3YXkgZnJvbSB0aGUgZGF0YWJhc2UgYXBwcm9hY2ggYmFjayB0byBqc29u
IGZpbGVzLgoKICBPaCwgSSB3YXNuJ3QgYXdhcmUgb2YgdGhhdC4gQnV0IG5vdyB5b3UgbWVudGlv
biBpdCwgSSB2YWd1ZWx5IHJlbWVtYmVyIHNvbWVvbmUgCnN1Z2dlc3RlZCB0byB1c2UganNvbiBm
aWxlcyBpbnN0ZWFkIG9mIHNxbGl0ZSwgaW5kZWVkLgoKPiBBZGRpdGlvbmFsbHkgSSB0b3llZCB3
aXRoIHRoZSBpZGVhIG9mIHVzaW5nIEdpdExhYiBmb3IgZmV0Y2hpbmcgYW5kIG9wdGltaXppbmcg
dGhlIGRhdGEgYmVjYXVzZSBwYXNzaW5nIGl0IG9uIHRvIGJ1aWxkcm9vdCB1c2Vycy4KCiAgSSB0
aGluayBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHVzZSBCUjJfUFJJTUFSWV9TSVRFIHRvIHN0b3Jl
IGEgY2FjaGVkIHZlcnNpb24uIApIb3dldmVyLCBpZiB3ZSBkbyB0aGF0LCBpdCBzaG91bGQgaGF2
ZSBhIGhhc2ggYW5kIGV2ZXJ5dGhpbmcsIHNvIGl0J3MgcGVyaGFwcyAKbm90IHN1cGVyIHByYWN0
aWNhbC4uLgoKPiBBIHF1aWNrIHByb3ZlIG9mIGNvbmNlcHQgY2FuIGJlIGZvdW5kIGZvdW5kIGhl
cmUgWzFdLgoKICBJJ2xsIHRha2UgYSBsb29rIGF0IGl0IHNvbWUgdGltZSA6LSkKCj4gCj4+Cj4+
IE9uIDAxLzA5LzIwMjMgMjE6MjcsIERhbmllbCBMYW5nIHdyb3RlOgo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZm9yIGNvbmZpZyBpbiB2dWxbJ2N2ZSddLmdldCgnY29uZmlndXJhdGlvbnMn
LCAoKSk6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBub2RlIGluIGNv
bmZpZ1snbm9kZXMnXToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmb3IgY3BlX21hdGNoIGluIG5vZGVbJ2NwZU1hdGNoJ106Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBub3QgY3BlX21hdGNoWyd2dWxuZXJh
YmxlJ106Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnRpbnVlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtYXRjaF9kYXRhID0gc2VsZi5leHRyYWN0X2NwZV9tYXRjaF9kYXRhKGNw
ZV9tYXRjaCkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIG5vdCBtYXRjaF9kYXRhOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3BlX21hdGNoZXMuYXBwZW5kKG1hdGNoX2Rh
dGEpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25maWd1cmF0aW9ucy5hcHBlbmQoW3Z1bFsnY3ZlJ11bJ2lkJ10sIG1hdGNoX2RhdGFbMF1dKQo+
Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGN1cnNvciA9IHNlbGYuZGJfY29ubmVjdGlvbi5jdXJz
b3IoKQo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgICMgRHJvcCBhbGwgQ1ZFcyB0aGF0IGFyZSBy
ZWplY3RlZCwgc3RhdHVzIG1pZ2h0IGhhdmUgY2hhbmdlZAo+Pj4gK8KgwqDCoMKgwqDCoMKgIGN1
cnNvci5leGVjdXRlbWFueSgnREVMRVRFIEZST00gY3ZlcyBXSEVSRSBpZCA9ID8nLCBjdmVfaWRz
X2Ryb3BwZWQpCj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgIyBEZWxldGUgY29uZmlndXJhdGlv
biBtYXBwaW5nIGZvciBpbmNsdWRlZCBDVkVzLCBvdGhlcndpc2Ugd2UgY2FuJ3QgZGV0ZWN0Cj4+
PiArwqDCoMKgwqDCoMKgwqAgIyB1cHN0cmVhbSBkcm9wcGluZyBjb25maWd1cmF0aW9ucy4KPj4+
ICvCoMKgwqDCoMKgwqDCoCBjdXJzb3IuZXhlY3V0ZW1hbnkoJ0RFTEVURSBGUk9NIGNvbmZpZ3Vy
YXRpb25zIFdIRVJFIGN2ZV9pZCA9ID8nLCBjdmVfaWRzX2NoYW5nZWQpCj4+PiArwqDCoMKgwqDC
oMKgwqAgY3Vyc29yLmV4ZWN1dGVtYW55KCdJTlNFUlQgT1IgUkVQTEFDRSBJTlRPIGN2ZXMgVkFM
VUVTICg/LCA/LCA/LCA/LCA/KScsIGN2ZXMpCj4+PiArwqDCoMKgwqDCoMKgwqAgY3Vyc29yLmV4
ZWN1dGVtYW55KCdJTlNFUlQgT1IgUkVQTEFDRSBJTlRPIGNwZV9tYXRjaGVzIFZBTFVFUyAoPywg
PywgPywgPywgPywgPyknLCBjcGVfbWF0Y2hlcykKPj4+ICvCoMKgwqDCoMKgwqDCoCBjdXJzb3Iu
ZXhlY3V0ZW1hbnkoJ0lOU0VSVCBPUiBSRVBMQUNFIElOVE8gY29uZmlndXJhdGlvbnMgVkFMVUVT
ICg/LCA/KScsIGNvbmZpZ3VyYXRpb25zKQo+Pgo+PiAgwqBBRkFJVSwgdGhlIGNvbmZpZ3VyYXRp
b25zIHRhYmxlIGlzIHRoZXJlIHRvIG1ha2UgYW4gTS1OIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIENW
RXMgYW5kIENQRV9tYXRjaGVzLiBIb3dldmVyLCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMg
aXMgbmVlZGVkIG9yIGV2ZW4gcG9zc2libGUgLSBpLmUuLCBpdCBuZWNlc3NhcmlseSBoYXMgdG8g
YmUgYSAxLU4gcmVsYXRpb25zaGlwLiBJbmRlZWQsIHRoZSBjb2RlIGFib3ZlIGFsd2F5cyBjcmVh
dGVzIGJvdGggYSBDUEVfbWF0Y2ggbGluZSBhbmQgYSBjb25maWd1cmF0aW9uIGxpbmU7IHRoZSBJ
RCBvZiB0aGUgQ1BFX21hdGNoIGxpbmUgaXMgVU5JUVVFLCBzbyB0aGUgc2FtZSBtYXRjaCBsaW5l
IGNhbm5vdCBiZSByZXVzZWQgZm9yIGFub3RoZXIgQ1ZFLgo+IAo+IExvb2tpbmcgYXQgdGhlIGRh
dGFiYXNlIHdoZW4gSSBsYXN0IHJhbiB0aGlzIHZlcnNpb24gaW4gU2VwdGVtYmVyIG9mIDIwMjMs
IHRoZSBjb3VudHMgaW4gdGhlIHRocmVlIHRhYmxlcyBsb29rZWQgbGlrZSB0aGlzOgo+IC0gY3Zl
czogMjExMDY2IHJvd3MKPiAtIGN2ZV9tYXRjaGVzOiAzOTgxNzggcm93cwo+IC0gY29uZmlndXJh
dGlvbnM6IDE5NzE0NTkgcm93cwo+IAo+IFNvIGl0IHNlZW1zIHRoYXQgdGhlIHNhbWUgY3ZlX21h
dGNoZXMgSUQgaXMgdXNlZCBmb3IgbXVsdGlwbGUgY3Zlcy4KCiAgUmlnaHQhIEknbSBub3Qgc3Vy
ZSB0aG91Z2ggaWYgdGhlIGFkZGl0aW9uYWwgY29uZmlndXJhdGlvbnMgdGFibGUgcmVhbGx5IHNh
dmVzIApzcGFjZSAtIHNpbmNlIHdlIG9ubHkgc2F2ZSBhIHN1YnNldCBvZiB0aGUgY3JpdGVyaWEs
IGl0J3MgcG9zc2libGUgdGhhdCAKZHVwbGljYXRpbmcgdGhlIGNwZV9tYXRjaGVzIGRvZXNuJ3Qg
dGFrZSAobXVjaCkgbW9yZSBzcGFjZSB0aGFuIHRoZSBhZGRpdGlvbmFsIApjb25maWd1cmF0aW9u
cyB0YWJsZS4gVW5mb3J0dW5hdGVseSBJIGRpZG4ndCBpbXBsZW1lbnQgaXQgbGlrZSB0aGF0IChJ
IAppbmNvcnJlY3RseSBvdmVyd3JpdGUgdGhlIGNwZV9tYXRjaCdzIENWRUlEIHdoZW4gdGhlIHNh
bWUgb25lIG9jY3VycyBzZXZlcmFsIAp0aW1lcyksIHNvIEkgZG9uJ3QgaGF2ZSB0aGUgbnVtYmVy
cyB0byBiZSBzdXJlLgoKICBBbnl3YXksIGFzIHlvdSBzYXk6IGlmIHdlIGdvIGZvciBzdG9yaW5n
IEpTT04gZmlsZXMgYWZ0ZXIgYWxsLCB0aGUgcG9pbnQgaXMgCnByb2JhYmx5IG1vb3QuCgogIFJl
Z2FyZHMsCiAgQXJub3V0CgoKPiAKPj4KPj4gIMKgU28sIEkgdGhpbmsgdGhpcyBjb25maWd1cmF0
aW9ucyB0YWJsZSBpcyBlbnRpcmVseSByZWR1bmRhbnQsIGFuZCBpbnN0ZWFkIHRoZSBjcGVfbWF0
Y2hlcyB0YWJsZSBzaG91bGQganVzdCBjb250YWluIGEgcmVmZXJlbmNlIHRvIHRoZSBDVkUgSUQu
Cj4+Cj4+ICDCoChEb24ndCBjaGFuZ2UgYW5kIHJlc2VuZCB0aGlzIHBhdGNoLCBJJ3ZlIG1hZGUg
YSB3aG9sZSBsb3Qgb2YgY2hhbmdlcyBteXNlbGYgYW5kIEkgY2FuIHJlbW92ZSB0aGlzIGNvbmZp
Z3VyYXRpb25zIHRhYmxlIHRvby4pCj4+Cj4+ICDCoFJlZ2FyZHMsCj4+ICDCoEFybm91dAo+IAo+
IFJlZ2FyZHMsCj4gRGFuaWVsCj4gCj4gWzBdOiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
cGlwZXJtYWlsL2J1aWxkcm9vdC8yMDIzLURlY2VtYmVyLzY4MTg4OC5odG1sCj4gWzFdOiBodHRw
czovL2dpdGxhYi5jb20vZGFuaWVsbGFuZy9udmQtdjIuMC8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
