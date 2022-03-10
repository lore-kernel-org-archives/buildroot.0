Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D30C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F4D41911;
	Thu, 10 Mar 2022 20:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i9edMCENO_Ik; Thu, 10 Mar 2022 20:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F6EC410B3;
	Thu, 10 Mar 2022 20:30:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629431BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50E614099D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEs_-WiLOp6Z for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:29:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E228F40998
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:29:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g3so8535118edu.1
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CuAFj3uwpXAAkJauc9fPtOEKXmD+e1BZ+MgVBI6iKQw=;
 b=TsN/eZoCF1tQu7Dj5FLhSxscO02hS29sJbSMbJ/yGU3jp3R0xn1tpWgWiuDNdNk8I/
 BmNTL7i21g27kNhKnAEgYFELJ0TwRzXAEh33xTMvMX1gNCEBP4a70IL2aKMsfXVZwiTM
 anfopor0qbcCTNMVtfglFEmJfF8uPwMq0b96nbMktz6Cvh9ZMxP0UVrcz2T39YGsIDro
 DMepuSRFBYKMTO5KVfIxvtOADMgPxEMLEYQO9WwAN3VzlfTgOHa7CdafVIh9MlGcwfJs
 L9XOomKShlZmEhReKVh41nc8XOtbkwm9OHiOZ5wgTOY1KBub4p5x+jeppYvPNjQsegmy
 Ahbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CuAFj3uwpXAAkJauc9fPtOEKXmD+e1BZ+MgVBI6iKQw=;
 b=P9+RuQ5CyJZoO90R343Q1UB9qQoj/XQvok0T3hxiHGso9NA6RDmkWX2L8cS1tv40Qh
 83qCC7Mw8sRfSRqk6x50fj5GOMgZw8VRfJxbb7x1DD/SeNOgI9eDlDVjqOmhe6tc2ZpY
 UDxYP0JDjf+7joNeTqniLIobD+aAq0DYMkvAYXkbbNomUOKM/qyd8sLkZ0sLkF8EIzXy
 UHomXuNx6+rsYpLCj21wK6e+D9Q02T1Sim5j66QdEbq8UJX7r3B47TI9ibKIkWq0jTzI
 mH2k8f/VeCdFmcLWGMgTAsdjk1/zqEi807eHQf4smzVRB/+orNGxaKBdOWK9Nvf6iPd0
 bxhg==
X-Gm-Message-State: AOAM532B8aqbzysl+CxtRy9xjNf58I3/4ch9UyjFznI8iUZAB1asVdmu
 tYlMubfjxyc4U/ztCXvHJhYLhg==
X-Google-Smtp-Source: ABdhPJzoQZlRO/5ReoOUF0LfqMkFtk/NJzrXmjswp7ZXhZrCQzclicaf/wGWxtBvhdMSxF4h+Acldw==
X-Received: by 2002:a05:6402:168a:b0:3fb:600e:4cc3 with SMTP id
 a10-20020a056402168a00b003fb600e4cc3mr6199799edv.32.1646944189942; 
 Thu, 10 Mar 2022 12:29:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a17090617d200b006db07a16cf5sm2167844eje.77.2022.03.10.12.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:29:49 -0800 (PST)
Message-ID: <2a7d0213-14a4-e930-aabf-0d79ecd2b075@mind.be>
Date: Thu, 10 Mar 2022 21:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220308183527.17639-1-zajec5@gmail.com>
 <20220309220800.GF23050@scaer>
 <95291ce8-0b8d-9bfc-8a5c-db6d640d2255@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <95291ce8-0b8d-9bfc-8a5c-db6d640d2255@gmail.com>
Subject: Re: [Buildroot] [PATCH V2] package/lzma-alone: new package
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wMy8yMDIyIDE1OjEyLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gOS4wMy4y
MDIyIDIzOjA4LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+PiBPbiAyMDIyLTAzLTA4IDE5OjM1ICsw
MTAwLCBSYWZhxYIgTWnFgmVja2kgc3Bha2UgdGh1c2x5Ogo+Pj4gRnJvbTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4KPj4+IFRoaXMgbmV3IHBhY2thZ2UgcHJvdmlkZXMg
Imx6bWFfYWxvbmUiIGhvc3QgYmluYXJ5IGJhc2VkIG9uIHRoZSBvcmlnaW5hbAo+Pj4gTFpNQSBT
REsuIEl0IHByb3ZpZGVzIGZldyBleHRyYSBvcHRpb25zIHdoZW4gY29tcGFyZWQgdG8gdGhlIExa
TUEgVXRpbHMKPj4+IC8gWFogVXRpbHMgcHJvamVjdCAibHptYSIgYmluYXJ5IChhbHJlYWR5IHBh
Y2thZ2VkIGFzIHRoZSAibHptYSIpLgo+Pj4KPj4+IFRoaXMgcGFja2FnaW5nIHNjaGVtYSAoTFpN
QSBTREsgd2l0aCBsem1hIC0+IGx6bWFfYWxvbmUgcmVuYW1lKSBmb2xsb3dzCj4+PiBEZWJpYW4n
cyBzb2x1dGlvbi4gUGxlYXNlIG5vdGUgdGhhdCBEZWJpYW4gYWxzbyB1c2VzIExaTUEgU0RLIGZv
ciB0aGUKPj4+IGJhc2UgImx6bWEiIHRvb2wgd2hpY2ggbWF5IGJlIGNvbnNpZGVyZWQgZm9yIEJ1
aWxkcm9vdCB0b28gLSBhcyBhbgo+Pj4gaW5kZXBlbmRlbnQgY2hhbmdlLiBTaW1pbGFyIHBhY2th
Z2luZyBpcyBhbHNvIHVzZWQgYnkgVWJ1bnR1ICYgQXJjaC4KPj4+Cj4+PiBsem1hX2Fsb25lIGlz
IGEgcmVxdWlyZW1lbnQgZm9yIHByZXBhcmluZyBmaXJtd2FyZSBpbWFnZXMgZm9yIHNvbWUKPj4+
IEJyb2FkY29tIGJhc2VkIGhvbWUgcm91dGVycyB3aXRoIGEgcGlja3kgQ0ZFIGJvb3Rsb2FkZXIu
IEl0IGhhcyBsaW1pdGVkCj4+PiBMWk1BIHN1cHBvcnQgYW5kIGJ1aWxkaW5nIGNvbXBhdGlibGUg
aW1hZ2VzIHJlcXVpcmVzIHNwZWNpZnlpbmcKPj4+IGRpY3Rpb25hcnkgc2l6ZSBhbmQgbGMvbHAv
cGIgTFpNQSB2YWx1ZXMgbWFudWFsbHkuCj4+Pgo+Pj4gVmVyc2lvbiA5LjIyIGlzIHVzZWQgYXMg
aXQncyB0aGUgbGFzdCByZWxlYXNlIHVzaW5nIC50YXIuYnoyIGZvcm1hdC4KPj4KPj4gV2UgY291
bGQgaW50cm9kdWNlIGEgaG9zdCB2YXJpYW50IG9mIHA3emlwLCBzbyB0aGF0IHdlIGNvdWxkCj4+
IGF1dG9tYXRpY2FsbHkgYWRkIHRoYXQgdG8gRk9PX0VYVFJBQ1RfREVQRU5ERU5DSUVTIGlmIHRo
ZSBob3N0IGRvZXMgbm90Cj4+IGFscmVhZHkgaGF2ZSA3emEgKG9yIDd6ciksIGxpa2Ugd2UgZG8g
Zm9yIGx6aXAgYXJjaGl2ZXMgZm9yIGV4YW1wbGUuCj4gCj4gSSBjYW4gc2VlIDd6IGZvcm1hdCBz
dXBwb3J0IGlzIG5vIGxlc3MgbWVzc3kgdGhhbiBMWk1BIHRvb2xzLgo+IAo+IEl0IHNlZW1zIHRo
YXQgNy1aaXAgcHJvamVjdCBkaWRuJ3QgcHJvdmlkZSBjb21tYW5kLWxpbmUgdG9vbCBpbml0aWFs
bHkKPiBhbmQgdGhhdCByZXN1bHRlZCBpbiBkZXZlbG9waW5nIHA3emlwLiBJdCBzZWVtcyBpdCBo
YXMgY2hhbmdlZCB0aG91Z2guCj4gCj4gU28gd2UgaGF2ZSB0d28gcHJvamVjdHM6Cj4gCj4gMS4g
cDd6aXAKPiAqIFByb3ZpZGVzICI3eiIgYW5kICI3emEiCj4gKiBMYXN0IHVwZGF0ZWQgaW4gMjAx
Ngo+ICogU3VmZmVycyBmcm9tIHNlY3VyaXR5IGlzc3Vlcwo+ICogUmVxdWlyZXMgcGF0Y2hpbmcg
KDExIERlYmlhbiBwYXRjaGVzLCAyIGZvciBDVkVzKQoKICBMYXN0IGNvbW1pdCBpbiB0aGUgZm9y
ayB0aGF0IHdlIHVzZSBpbiBwYWNrYWdlL3A3emlwIFsxXSBpcyBmcm9tIERlY2VtYmVyICcyMSwg
CnNvIG5vdCB0aGF0IGJhZCBJIHRoaW5rLgoKICBSZWdhcmRzLAogIEFybm91dAoKWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9qaW5mZWloYW41Ny9wN3ppcAoKCj4gCj4gMi4gNy1aaXAKPiAqIFByb3Zp
ZGVzICI3enIiIChkb2N1bWVudGVkIGFzICI3emEiKQo+ICogTGFzdCB1cGRhdGVkIGluIDIwMjEK
PiAqIE1lc3N5IHNvdXJjZQo+ICogRG9lc24ndCBldmVuIGNvbXBpbGUgb24gc29tZSBzeXN0ZW1z
Ogo+IC4uLy4uLy4uL0MvVXRpbC83ei83ek1haW4uYzozNjM6NTogZXJyb3I6IGluaXRpYWxpemVy
IGVsZW1lbnQgaXMgbm90IGNvbnN0YW50Cj4gIMKgwqDCoMKgIChjb25zdCBVSW50NjQpNjAgKiA2
MCAqIDI0ICogKDg5ICsgMzY1ICogKGtVbml4VGltZVN0YXJ0WWVhciAtIAo+IGtGaWxlVGltZVN0
YXJ0WWVhcikpOwo+ICDCoMKgwqDCoCBeCj4gCj4gV2hpY2ggb25lIG9mIGFib3ZlIHdlIHNob3Vs
ZCB0cnkgdG8gcGFja2FnZT8KPiAKPiAKPj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAK
PiBIdWdlIHRoYW5rcyBmb3IgeW91ciBoZWxwLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
