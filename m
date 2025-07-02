Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5D8C83013
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 08:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C0C846EF;
	Wed,  2 Jul 2025 08:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzN_f1zfmqG8; Wed,  2 Jul 2025 08:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 969E7843F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 969E7843F3;
	Wed,  2 Jul 2025 08:05:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C2A7128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7183060705
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:05:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N76hExDomKb for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 08:05:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 76F0C608E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76F0C608E4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76F0C608E4
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 08:05:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso3216404f8f.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 01:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751443534; x=1752048334;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J470W0nUfVXzWJhww+WXWrXVb66USCmA5iB8xVfJEmM=;
 b=WJ0lVMTN88MRjBaoh12k9HGS8CylHJ6r3HqglXDN3kgg46l/TrM/E0aFgweG9rkgqu
 gwgUCTXFRNVvtQHqT4mni2weXd0CaKs+B18Z+Dde6/fjhPyAbU/1E0xh5mF8KDqrBTTu
 EQUknIWrYY8xPP4fhGPm8zC9KlslDduDpxHbziBjXKDz9/bcTB7nrpR9zHWThuBm0xc9
 tNvQ/+/GP6INNiByX+EHyqyX9meWc5hxoqQ4/hVDfzKjg+eYvJfuSscmTcIq8moF1JMv
 HaafLIMw8xNw1Wq7fOixwsYsczkU/rXKXetHE4F9pu/OCV/UJpjHq2adeF5Ydaf5o97U
 Vr3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTL+NYg8sqG35LAYlWNwG9oznrJ4AyQli2JFF+5dNQw5xPxIdRby1KwUQMMoQVhrfE6wIJdcY0PwI=@buildroot.org
X-Gm-Message-State: AOJu0YwD6CDv5bPGYG3V/Mauj0oaGNQyzh8gPVJvm7AGq15kZhDcJivg
 C8nwidV367/Y6xw0K6uNdryyp9lizdfm4pM8OiSHVdhwHxzGMfP+Je0T04uVLjRb13g=
X-Gm-Gg: ASbGncu8UlPePvzhoHDH6kHZrteTPQ/EtA9O6y1c6UirFpAqUDW0RUjzSW6JXo1mKe2
 3HPaTpqZfHbeh7LkDdk7h1A7zfzjRKg1aN5ZOW95g7GQAkcIVVNXEYGqg6mFUCi/NBH/crK3mZw
 3ijnP+ZAR0nI5LAMYg2XYAZhPmHHEypVHy2cpbnXoOZQkCBMSXTmuy2yLjC6YyWQCIaSls4QP23
 hhmqViSmFVWIAUGjc/y5ls8HGMWfV6XOXg/UQkIk9riBYs68FeaN5mAJDwSIWx2aa/ZlSbo99q2
 SUYTRLu6JBrHxedUaRZP4AUBrig0Q2CM7hEGxnu/SWlqQ1SLTnnZts+mOODipxsE93Fs6fxNZnM
 guenTj2ogoFaRW9bfsMuDOL159xs5oCxXB+KB1LpwvTKgVUjYnxBP
X-Google-Smtp-Source: AGHT+IEIgKs21MYEOtdhLczgi26gn+HfPBs1kMZsn03XFQdn6oqE5qOHlkRda7dKcR3N1iOADdURQQ==
X-Received: by 2002:a05:6000:250d:b0:3a4:f8fa:8a3a with SMTP id
 ffacd0b85a97d-3b1fe7abc37mr1324237f8f.18.1751443534143; 
 Wed, 02 Jul 2025 01:05:34 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fab6esm15657988f8f.31.2025.07.02.01.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 01:05:33 -0700 (PDT)
Message-ID: <e485565e-ed2e-4a66-b3cc-7a715b3494a8@smile.fr>
Date: Wed, 2 Jul 2025 10:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Shirokov <shirokovalexs@gmail.com>, buildroot@buildroot.org
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
 <20250627125524.242475-1-shirokovalexs@gmail.com>
Content-Language: en-US
In-Reply-To: <20250627125524.242475-1-shirokovalexs@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751443534; x=1752048334; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J470W0nUfVXzWJhww+WXWrXVb66USCmA5iB8xVfJEmM=;
 b=kBTXKzv0aPfJEQCCB4P50X4+I8ctxViB5CZJsq8MNXr1p28TK9fk2/60rgnA3tGeHt
 /WXYKjPBince81BVs4XI+HlobEE/73R5l47Vdnfgrh7fAwvk5E7jx04BAByywVitCzXa
 30Uw6zPoL8h89kp0cu5aDYnRBDiuKU89ZVRM8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=kBTXKzv0
Subject: Re: [Buildroot] [next, v5,
 1/3] package/uutils-coreutils: new package
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkxlIDI3LzA2LzIwMjUgw6AgMTQ6NTUsIEFsZXhhbmRlciBTaGlyb2tvdiBhIMOpY3JpdMKgOgo+
IEhpIEVsIE1laGRpLCBhbGwKPgo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldywgZWZmb3J0cywg
YW5kIHZhbHVhYmxlIGNvbW1lbnRzLgo+Cj4gSSBsaWtlIHRoZSBpbXByb3ZlbWVudCB3aXRoIHJl
YWRpbmcgYGZlYXRfY29tbW9uX2NvcmVgIGZyb20gQ2FyZ28udG9tbC4gSG93ZXZlciwKPiBpdCBz
ZWVtcyB0aGF0IHRoZSBtb2RpZmljYXRpb24gbmVlZHMgdG8gZ28gZGVlcGVyLiBUaGlzIGlzIGV4
YWN0bHkgd2hhdCBJIHdhbnRlZAo+IHRvIGRpc2N1c3Mgd2l0aCBvdGhlciBkZXZlbG9wZXJzLiBI
ZXJlIGFyZSBteSBjb25jZXJuczoKCkhpLAoKVGhhbmtzIGFnYWluIGZvciB0aGUgZGV0YWlsZWQg
cmVwbHkgYW5kIGZvciBvcGVuaW5nIHRoaXMgaW50ZXJlc3RpbmcKZGlzY3Vzc2lvbi4KCj4gMS4g
RHVyaW5nIG1pZ3JhdGlvbiwgaXTigJlzIHZlcnkgZGVzaXJhYmxlIHRvIHJlcGxhY2UgdXRpbGl0
ZXMgaW4gc21hbGwgcGllY2VzIC0KPiB1cGRhdGUgMi0zIGFwcHMsIHByZXBhcmUgdGhlIGltYWdl
LCBydW4gdGVzdHMsIGFuYWx5emUsIHRoZW4gcmVwZWF0LiBUaGlzIGtpbmQKPiBvZiBtaWdyYXRp
b24gcHJvdmlkZXMgYmV0dGVyIGNvbnRyb2wgb3ZlciB0aGUgcHJvY2Vzcy4gVG8gZG8gdGhpcywg
d2UgbmVlZCBhCj4gbWVjaGFuaXNtIHRvIGVuYWJsZS9kaXNhYmxlIGEgc2luZ2xlIGFwcCwgbm90
IGFsbCBhcHBzLiBJ4oCZdmUgYWxyZWFkeSBlbmNvdW50ZXJlZAo+IHRoZSBuZWVkIGZvciBzdWNo
IGZ1bmN0aW9uYWxpdHkgaW4gcHJhY3RpY2UuCgphZ3JlZQoKPiAyLiBOb3QgYWxsIHV0aWxpdGll
cyBhcmUgbmVlZGVkLCBlc3BlY2lhbGx5IG9uIHByb2R1Y3Rpb24gZGV2aWNlcy4gRm9yIGV4YW1w
bGUsCj4gYGNwYCwgYG12YCwgYW5kIGBjYXRgIGFyZSBjb21tb24sIHdoaWxlIGBkaXJjb2xvcnNg
LCBgZmFjdG9yYCwgYW5kIGBubGAgYXJlCj4gcmFyZSAoYXQgbGVhc3QgaW4gbXkgZXhwZXJpZW5j
ZSkuIFNvLCBoYXZpbmcgYSBtZWNoYW5pc20gdG8gaW5jbHVkZSBvbmx5IHRoZQo+IG5lZWRlZCBh
cHBzIHNlZW1zIHZlcnkgZGVzaXJhYmxlLiBJIGhhdmVu4oCZdCBmYWNlZCB0aGlzIGlzc3VlIHll
dCwgYnV0IGl0IGxvb2tzCj4gbGlrZWx5LgoKWWVzLCBub3QgYWxsIHRvb2xzIGFyZSBuZWVkZWQg
b24gcHJvZHVjdGlvbgpkZXZpY2VzLiBUaGUgcHJvamVjdCBpdHNlbGYgdXNlcyBmZWF0dXJlIGdy
b3VwcyBpbiBDYXJnby50b21sIGxpa2UKYGZlYXRfY29tbW9uX2NvcmVgLCBidXQgaXQncyBub3Qg
aWRlYWwgZm9yIGJ1aWxkaW5nIG9ubHkgYSBtaW5pbWFsIHNldApvZiBzcGVjaWZpYyB0b29scy4g
U28gSSBkbyBhZ3JlZSB3aXRoIHRoZSBuZWVkIGZvciBiZXR0ZXIgZ3JhbnVsYXJpdHkuClVuZm9y
dHVuYXRlbHksIHRoaXMgaXMgbm90IGhhbmRsZWQgd2VsbCB5ZXQgaW4gdXBzdHJlYW0gdXV0aWxz
LWNvcmV1dGlscy4KCj4gMy4gVXNpbmcgYGZlYXRfY29tbW9uX2NvcmVgIGNvdWxkIGltcGxpY2l0
bHkgY2hhbmdlIHRoZSBzZXQgb2YgYXBwcyB3aGVuCj4gbW9kaWZ5aW5nIHBhY2thZ2UgdmVyc2lv
bnMsIHdoaWNoIHdvdWxkIGJlIHVuZXhwZWN0ZWQuIEkgaGF2ZW7igJl0IGVuY291bnRlcmVkCj4g
dGhpcyBteXNlbGYsIHNvIGl04oCZcyBvbmx5IGEgdGhlb3JldGljYWwgcHJvYmxlbS4KCkluIGZh
Y3QsIHRoaXMgd2FzIHRoZSBtYWluIG1vdGl2YXRpb24gYmVoaW5kIG15IHByb3Bvc2FsLiBUaGUK
bGlzdCBvZiB1dGlsaXRpZXMgeW91IGRlZmluZSBpbiAnUFJPR1MnIGxvb2tlZCB2ZXJ5IHNpbWls
YXIgdG8KJ2ZlYXRfY29tbW9uX2NvcmUnLCBzbyBJIHRob3VnaHQgdGhleSB3ZXJlIG1lYW50IHRv
IG1hdGNoLiBJZiB0aGUgcHJvamVjdAphZGRzIG5ldyB0b29scyB0byB0aGlzIGxpc3QsIGl0IHNl
ZW1zIGJldHRlciB0byBwdWxsIHRoZSBjaGFuZ2UKYXV0b21hdGljYWxseSB0aGFuIG1hbnVhbGx5
IHVwZGF0aW5nICdQUk9HUycgZXZlcnkgdGltZS4KCj4gU28sIGl0IHNlZW1zIHRoYXQgZm9yIGEg
bm9uLW11bHRpY2FsbCBidWlsZCwgaXTigJlzIHZlcnkgbGlrZWx5IG5lY2Vzc2FyeSB0byBoYXZl
Cj4gYSBtZWNoYW5pc20gdG8gY29uZmlndXJlIHRoZSBsaXN0IG9mIHV0aWxpdGVzIHZpYSBDb25m
aWcuaW4uCj4KPiBTb21lIHRob3VnaHRzIGFib3V0IHBvc3NpYmxlIHNvbHV0aW9uczoKPgo+IFRo
b3VnaHQgIzE6Cj4KPiBUbyBhZGRyZXNzIHRoZSBwcm9ibGVtLCBJIGNhbiBhZGQgbW9yZSBwYXJh
bWV0ZXJzIHRvIHRoZSBDb25maWcuaW4gZmlsZS4gQnV0Cj4gdGhpcyBhcHByb2FjaCBoYXMgc2V2
ZXJhbCBkcmF3YmFja3M6Cj4KPiAtIGluY3JlYXNlcyB0aGUgZmluYWwgQnVpbGRyb290IGNvbmZp
ZyBieSBhZGRpbmcgNTAtNzAgcGFyYW1ldGVycwo+IC0gaW5jcmVhc2VzIGNvbXBsZXhpdHkgb2Yg
Q29uZmlnLmluIGFuZCBtYWtlZmlsZXMKPiAtIGluY3JlYXNlcyBjb21taXQgc2l6ZXMKPgo+IFN1
cmUsIHBsYXlpbmcgd2l0aCBkZWZhdWx0cyBpcyBwb3NzaWJsZSwgYnV0IGl0IGRvZXNu4oCZdCBz
b2x2ZSB0aGUgY29yZSBwcm9ibGVtCj4gb2YgZ3JhbnVsYXJpdHkuCgpJIGFsc28gY29uc2lkZXJl
ZCB1c2luZyAnQ29uZmlnLmluJywgYnV0IG5vdCB0byBjb250cm9sIGVhY2ggaW5kaXZpZHVhbAp0
b29sLiBJIHdhcyB0aGlua2luZyBtb3JlIGFib3V0IGxldHRpbmcgdGhlIHVzZXIgY2hvb3NlIGJl
dHdlZW4gc3VwcG9ydGVkCmZlYXR1cmUgc2V0cyBkZWZpbmVkIGJ5IHV1dGlscywgbGlrZSAnZmVh
dF9jb21tb25fY29yZScsICd1bml4JywgZXRjLgpIb3dldmVyLCBzZWxlY3RpbmcgdG9vbHMgb25l
LWJ5LW9uZSBmZWVscyBsaWtlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZQptYW5hZ2VkIHVwc3Ry
ZWFtIGluIHRoZSBwcm9qZWN0LCBub3QgaW4gQnVpbGRyb290LgoKPiBUaG91Z2h0ICMyOgo+Cj4g
Rm9yIG1lLCB0aGUgaWRlYWwgc29sdXRpb24gd291bGQgYmUgYSBCdXN5Qm94LWxpa2UgY29uZmln
LiBIb3dldmVyLCB1dXRpbHMKPiBkb2VzbuKAmXQgc3VwcG9ydCB0aGlzIGZ1bmN0aW9uYWxpdHku
IEkgY2FuIHN0YXJ0IGRpc2N1c3NpbmcgaXQgd2l0aCB0aGUgdXV0aWxzCj4gZGV2ZWxvcGVycywg
YnV0IGl0IHdvdWxkIGNhdXNlIGEgc2lnbmlmaWNhbnQgZGVsYXkgLSBhbmQgSeKAmW0gbm90IHN1
cmUgaXQgd291bGQKPiBzdWNjZWVkLgoKSSBjb21wbGV0ZWx5IGFncmVlLiBBIEJ1c3lCb3gtc3R5
bGUgY29uZmlnIHdvdWxkIGJlIHRoZSBwZXJmZWN0IGxvbmctdGVybQpzb2x1dGlvbi4gQnV0IGFz
IHlvdSBtZW50aW9uZWQsIHRoaXMgaXMgc29tZXRoaW5nIHRvIGRpc2N1c3Mgd2l0aCB0aGUKdXV0
aWxzIGRldmVsb3BlcnMuIEl0IGRvZXNu4oCZdCBleGlzdCB5ZXQuCgo+IFRob3VnaHQgIzM6Cj4K
PiBTaW5jZSB3ZSBoYXZlIG1rIGZpbGVzLCB3ZSBjYW4gY29uZmlndXJlIHRoZSB1dGlsaXRlcyBs
aXN0cyBpbiBzZXBhcmF0ZSBtayBmaWxlcwo+IGFjdGluZyBhcyBjb25maWdzLiBUaGVuLCB3ZSBj
YW4gc3BlY2lmeSB0aGUgZXhhY3QgZmlsZSAob3ZlciBDb25maWcuaW4pIGFuZAo+IGluY2x1ZGUg
aXQgaW4gdXV0aWxzLWNvcmV1dGlscy5tayBkdXJpbmcgdGhlIGJ1aWxkLiBPdmVyYWxsLCB0aGlz
IHNob3VsZCBzb2x2ZQo+IHRoZSBjb3JlIGdyYW51bGFyaXR5IHByb2JsZW0gYW5kIHNlZW1zIHRl
Y2huaWNhbGx5IGZlYXNpYmxlLiBIb3dldmVyLCBJ4oCZbSBub3QKPiBzdXJlIGhvdyB3ZWxsIGl0
IGFsaWducyB3aXRoIEJ1aWxkcm9vdOKAmXMgYXBwcm9hY2hlcy4KCkkgcGVyc29uYWxseSBkb27i
gJl0IHRoaW5rIGFkZGluZyBleHRlcm5hbCAnLm1rJyBmaWxlcyB0byBkZWZpbmUgbGlzdHMgb2Yg
CnRvb2xzIGlzIHRoZSByaWdodCBkaXJlY3Rpb24gaW4gQnVpbGRyb290LgoKPiBUaG91Z2h0ICM0
Ogo+Cj4gSnVzdCBwcm9jZWVkIHN0ZXAtYnktc3RlcC4gTGV04oCZcyBlbmFibGUgaXQgYW5kIG1l
cmdlLCBhcyBpdCBsb29rcyBnb29kIGVub3VnaCB0bwo+IHN0YXJ0LiBMYXRlciwgd2UgY2FuIGlt
cHJvdmUgdGhlIGNvbmZpZ3VyYXRpb24gbWVjaGFuaXNtIGRlbGl2ZXJpbmcgdGhvc2UKPiBjaGFu
Z2VzIGluIHNlcGFyYXRlIHBhdGNoZXMuCgpUaGF04oCZcyBmYWlyLiBNeSBtYWluIGNvbmNlcm4g
d2FzIG9ubHkgYWJvdXQgaGFyZGNvZGluZyB0aGUgdXRpbGl0eSBsaXN0IGluCnRoZSAnLm1rJyBm
aWxlLiBGcm9tIGEgbWFpbnRlbmFuY2UgcGVyc3BlY3RpdmUsIHRoaXMgY2FuIGJlIHRpbWUtY29u
c3VtaW5nCmZvciBjb250cmlidXRvcnMsIGVzcGVjaWFsbHkgd2hlbiB1cGRhdGluZyB2ZXJzaW9u
cy4gQnV0IEkgdGVzdGVkIHlvdXIKcGF0Y2ggYW5kIGl0IHdvcmtzIGZpbmUsIHNvIG5vIHByb2Js
ZW0gZm9yIG1lIGlmIG1haW50YWluZXJzIHByZWZlciB0byBnbwp3aXRoIHRoaXMgYXBwcm9hY2gu
Cgo+IFRoYW5rIHlvdS4gUGxlYXNlIGZlZWwgZnJlZSB0byBzaGFyZSBhbnkgdGhvdWdodHMgYW5k
IGlkZWFzLiBUaGV54oCZcmUgbXVjaAo+IGFwcHJlY2lhdGVkLgoKRmluYWxseSwgSSBqdXN0IHdh
bnRlZCB0byBzaGFyZSBhIHBlcnNvbmFsIHBvaW50OiBmb3IgYSBub3JtYWwgQnVpbGRyb290CnVz
ZXIsIGVuYWJsaW5nIG9yIGRpc2FibGluZyBhIHRvb2wgc2hvdWxkIG5vdCBiZSBkb25lIGJ5CmVk
aXRpbmcgYW4gJ21rJyBmaWxlLiBUaGF04oCZcyB3aHkgSSBhc3N1bWVkIHRoYXQgeW91ciAnUFJP
R1MnIGxpc3QKd2FzIG5vdCBtZWFudCB0byBiZSBjaGFuZ2VkIGJ5IHVzZXJzIGRpcmVjdGx5LiBT
byBJIHRob3VnaHQgYWJvdXQgdXNpbmcKYSBzdGF0aWMgdXBzdHJlYW0gbGlzdCBsaWtlICdmZWF0
X2NvbW1vbl9jb3JlJy4gQW5kIGlmIHdlIHdhbnQgcHJvcGVyCnBlci10b29sIHNlbGVjdGlvbiwg
dGhlbiB1cHN0cmVhbSB1dXRpbHMtY29yZXV0aWxzIG11c3QgZmlyc3Qgc3VwcG9ydAp0aGlzIGtp
bmQgb2YgY29uZmlndXJhYmlsaXR5IOKAlCBvdGhlcndpc2Ugd2UgY2FuJ3QgaW1wbGVtZW50IGl0
IGNsZWFubHkKaW4gQnVpbGRyb290LiBNYXliZSBpdCBjYW4gYmUgZG9uZSBhbHNvIGJ5IGEgcG9z
dCBpbWFnZSBzY3JpcHQsIG5vdApjbGVhbiwgYnV0IEkgdGhpbmsgdGhhdCBpdCBpcyBiZXR0ZXIg
dGhhbiBlZGl0aW5nIHRoZSAnbWsnIGZpbGUuCgo+IFBTOiBTb3JyeSBmb3IgdGhlIGxvbmcgbWVz
c2FnZS4KClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGRpc2N1c3Npb24gYW5kIHlvdXIgZWZmb3J0IG9u
IHRoZSBwYWNrYWdlLgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVzcG9uc2UKCkJlc3QgcmVnYXJkcywK
RWwgTWVoZGkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
