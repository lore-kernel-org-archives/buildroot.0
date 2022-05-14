Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF6DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 14:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 390A9417A0;
	Sat, 14 May 2022 14:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHoCt-uKVTHg; Sat, 14 May 2022 14:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D271E41794;
	Sat, 14 May 2022 14:16:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27A321BF844
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 14:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1589D41794
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 14:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3HSlraF3XEm for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 14:16:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEBAC4177E
 for <buildroot@buildroot.org>; Sat, 14 May 2022 14:16:29 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t6so14804319wra.4
 for <buildroot@buildroot.org>; Sat, 14 May 2022 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PNJA5hP0w+oa5TFX5Xt5oIZEIRsxc1H1wGO4asSnCT4=;
 b=J31VWKyb5n0n55UBHVjJvyr+QgKPSVMrHwvDfkUkvVXTGOFc8cKAAXSnPqVZPqCm1e
 QpMrQHcr0F3PpypS1GgoATbKnwdyuEIJBdRer5FJ6TrsyqaklyfSY9VhimFv/hYabEa1
 Sqbq6SvB7Z6C4Md+i2Pm3iJNThpbaJbQUo63kyNad0FRtfXoPk4VvAES/6iA61l++a/M
 VBGGtrVfBGroGSCq/DUgl/oQ8qCRiU92/8YcJ85LmxI2f6H4VFbBaev2ux+QexW9no1/
 4r8vBJWn0rEuKOhuZYDb6JwzWb+ktjtLTm/AcCGBCGURHubN+tcWjkqRKkhWFsCKj6nJ
 KC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PNJA5hP0w+oa5TFX5Xt5oIZEIRsxc1H1wGO4asSnCT4=;
 b=EtJFHJkKNSowlzAMLvDEn+xrU68PfILqfwX9tJu7ZxNcc11ke6CsK6WFwN2/uQcArg
 kzO5o97Q6yCiaOGWNQ2IdIi+lffHrcwvbjClboGskqHDJOwNVHALT7m/zE4A7jPkyQJT
 +CrPwpnOLuuKC9VTmy1S38qgjiBL5HDjkSgkWA/yVsXD7jCzwDHa6K3lw5OxGCFSnqYC
 Tuob3rukKMjpQVaVl59MnoxSixMeHJ8T86wHgYYYl4OW6NqMJcThtT5+YdX2FA2pGxPl
 kacLlV7b15lFm2AtYS49fUSWA97H9nFNbHMHZPXa7dXdBDwxHxqy9vvctHpzJc6xZuZm
 gkFg==
X-Gm-Message-State: AOAM5325ouBH+2B3XCTgS7qU/nXQbPoaoqpMdya/PNlebmh5qclSrWe3
 2jRr3JBN/F/PeSf/PUXjmG0=
X-Google-Smtp-Source: ABdhPJzBzHzlvAZZ7ZqfK2khYaNaIvcAYKMLjO3cYqmaS1GO+9u7oPuPdhNGkO0NTulR3yxpgMjKxw==
X-Received: by 2002:a05:6000:156e:b0:20c:4fd5:f780 with SMTP id
 14-20020a056000156e00b0020c4fd5f780mr7806656wrz.561.1652537787679; 
 Sat, 14 May 2022 07:16:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a7bcc85000000b003942a244f33sm8218902wma.12.2022.05.14.07.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 07:16:27 -0700 (PDT)
Message-ID: <6b9b558c-cbb0-50e9-3775-a868ce87c9c7@gmail.com>
Date: Sat, 14 May 2022 16:16:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, buildroot@buildroot.org
References: <20220514055312.2038383-1-clg@kaod.org>
 <e2817957-ded6-1873-c027-c912af2e45e0@gmail.com>
 <29a0e27f-8af8-73ee-7fef-fcdac814587f@kaod.org>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <29a0e27f-8af8-73ee-7fef-fcdac814587f@kaod.org>
Subject: Re: [Buildroot] [PATCH] configs/qemu_ppc64le_powernv8: use linux
 kernel 5.17.7 and binutils 2.36.1
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxNC8wNS8yMDIyIMOgIDE1OjQ2LCBDw6lkcmljIExlIEdvYXRlciBhIMOpY3Jp
dMKgOgo+IE9uIDUvMTQvMjIgMTQ6MzYsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8sCj4+
Cj4+IExlIDE0LzA1LzIwMjIgw6AgMDc6NTMsIEPDqWRyaWMgTGUgR29hdGVyIGEgw6ljcml0wqA6
Cj4+PiBwcGM2NCBvciBwb3dlcm52IExpbnV4IGRlZmNvbmZpZyBmYWlsIHRvIGJ1aWxkIHdpdGgg
Z2NjIDExIGFuZC9vcgo+Pj4gYmludXRpbHMgMi4zNyBbMV0gOgo+Pj4KPj4+IMKgwqAgQ0PCoMKg
wqDCoMKgIGtlcm5lbC9rZXhlY19maWxlLm8KPj4+IMKgwqAgQ2Fubm90IGZpbmQgc3ltYm9sIGZv
ciBzZWN0aW9uIDEwOiAudGV4dC51bmxpa2VseS4KPj4+IMKgwqAga2VybmVsL2tleGVjX2ZpbGUu
bzogZmFpbGVkCj4+Pgo+Pj4gUGF0Y2hlcyBoYXZlIGJlZW4gc2VudCB1cHN0cmVhbSBhbmQgc2hv
dWxkIHJlYWNoIExpbnV4IDUuMTguIFVudGlsCj4+PiB0aGVuLCBidW1wIGtlcm5lbCB2ZXJzaW9u
IHRvIHRoZSBsYXRlc3Qgc3VwcG9ydGVkIGluIGJ1aWxkcm9vdCBhbmQKPj4+IGxpbWl0IGJpbnV0
aWxzIHRvIDIuMzYuMSB3aGljaCBkb2Vzbid0IHJhaXNlIHRoZSBpc3N1ZS4KPj4+Cj4+PiBbMV0g
aHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1ZXMvMzg4Cj4+Cj4+IFRoaXMg
YWxzbyBmaXhlcyBxZW11IHBwYzY0IGRlZmNvbmZpZ3MgdGVzdCBpbiBnaXRsYWI6Cj4+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjQ0NTc5Mzg5MQo+
PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzI0NDU3
OTM4OTIKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9i
cy8yNDQ1NzkzODkzCj4gCj4geWVzIHBzZXJpZXMgc2hvdWxkIGJlIGltcGFjdGVkIGFsc28uCj4g
Cj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9y
Zz4KPj4+IC0tLQo+Pj4gwqAgY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmln
IHwgNSArKystLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJu
djhfZGVmY29uZmlnCj4+PiBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZp
Zwo+Pj4gaW5kZXggYTc4NDY5NWRkZjA2Li44ZGU0Y2Y1MTg5YjUgMTAwNjQ0Cj4+PiAtLS0gYS9j
b25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKPj4+ICsrKyBiL2NvbmZpZ3Mv
cWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwo+Pj4gQEAgLTMsNiArMyw3IEBAIEJSMl9w
b3dlcnBjNjRsZT15Cj4+PiDCoCBCUjJfcG93ZXJwY19wb3dlcjg9eQo+Pj4gwqAgwqAgIyBTeXN0
ZW0KPj4+ICtCUjJfQklOVVRJTFNfVkVSU0lPTl8yXzM2X1g9eQo+Pgo+PiBIYXZlIHlvdSBjb25z
aWRlcmVkIGFkZGluZyB0aGUgcGF0Y2ggaW4gYm9hcmQvcWVtdS9wcGM2NC0qL3BhdGNoZXMvbGlu
dXggaW5zdGVhZAo+PiBvZiBkb3duZ3JhZGluZyBiaW51dGlscyB2ZXJzaW9uPwo+IAo+IHllcywg
SSB0cmllZCBidXQgdGhlIHNlY29uZCBwYXRjaCBmYWlsZWQgdG8gYXBwbHkuIEkgY2FuIGJhY2tw
b3J0Cj4gaWYgdGhpcyBpcyBhIHByZWZlcnJlZCBvcHRpb24sIGFuZCBzZW5kIGEgdjIuCgpJdCBm
YWlsIHRvIGFwcGx5IG9uIHRoZSBrZXJuZWwgNS4xNSBvciB0aGUgNS4xNz8KSSBndWVzcyB5b3Ug
dHJpZWQgdG8gYmFja3BvcnQgdGhlIHBhdGNoIG9uIHRoZSA1LjE3IGFuZCB5b3UgaGFkIHNvbWUg
Y29uZmxpY3RzLgpTaW5jZSBJdCdzIG5vdCBhIGVhc3kgYmFja3BvcnQsIEknbSBvayB0byBmaXgg
dGhlIGJpbnV0aWxzIHZlcnNpb24gZm9yIHBwYzY0CmRlZmNvbmZpZ3MgdW50aWwgaXQncyBmaXhl
ZCBpbiB1cGNvbWluZyBrZXJuZWxzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gVGhhbmtz
LAo+IAo+IEMuCj4gCj4gCj4+IE90aGVyIHBwYzY0IGRlZmNvbmZpZyBkb2Vzbid0IHNlZW1zIHRv
IHRyaWdnZXIgdGhpcyBpc3N1ZToKPj4gZnJlZXNjYWxlX3QxMDQwZDRyZGJfZGVmY29uZmlnOkJS
Ml9wb3dlcnBjNjQ9eQo+PiBmcmVlc2NhbGVfdDIwODBfcWRzX3JkYl9kZWZjb25maWc6QlIyX3Bv
d2VycGM2ND15Cj4+IHFlbXVfcHBjNjRfZTU1MDBfZGVmY29uZmlnOkJSMl9wb3dlcnBjNjQ9eQo+
Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJvbWFpbgo+Pgo+Pgo+Pj4gwqAgQlIyX1RBUkdFVF9HRU5F
UklDX0dFVFRZX1BPUlQ9Imh2YzAiCj4+PiDCoCBCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCj4+PiDC
oCBAQCAtMTUsMTIgKzE2LDEyIEBAIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJk
L3FlbXUvcG9zdC1pbWFnZS5zaCIKPj4+IMKgIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0i
JChCUjJfREVGQ09ORklHKSIKPj4+IMKgIMKgICMgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5l
bAo+Pj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNT15Cj4+PiAr
QlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzE3PXkKPj4+IMKgIMKgICMg
S2VybmVsCj4+PiDCoCBCUjJfTElOVVhfS0VSTkVMPXkKPj4+IMKgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT049eQo+Pj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFM
VUU9IjUuMTUuMTgiCj4+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
NS4xNy43Igo+Pj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9InBvd2VybnYiCj4+PiDC
oCBCUjJfTElOVVhfS0VSTkVMX1ZNTElOVVg9eQo+Pj4gwqAgCj4+Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
