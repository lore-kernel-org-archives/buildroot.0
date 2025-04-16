Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1FCC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB3F6101C;
	Wed, 16 Apr 2025 21:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrMIefB36kMm; Wed, 16 Apr 2025 21:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB8160B0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FB8160B0F;
	Wed, 16 Apr 2025 21:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F68B11B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456DE4088F
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4r-XP9r_eIX for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:18:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E929440E5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E929440E5E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E929440E5E
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:18:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1FD9B1C0083; Wed, 16 Apr 2025 23:18:31 +0200 (CEST)
Message-ID: <0f873cea-76fb-435f-8a96-99b2d1ba7c03@rnout.be>
Date: Wed, 16 Apr 2025 23:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250328162509.923423-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20250328162509.923423-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dC3Qao9WsCjlMvgNvosnos1GZSXMSRTBdVPpxBd5OMk=;
 b=gW7nNb4kZXg70ppN+gT+byG8XpiXOKzcsXXS2uGjq9lSqaQ7/qymdqdd1Ja/TWondEG1vj
 ZYpPl/61J+FBNJnAx0VMoFusd/EqiXf9wHtDBIgMoX2JFcwh+vUYTSh3nKVgKu9Y5WIJyy
 oqKYCfDvWLddDU6G4yk+xqqz2h944yvct4kHbPyKmv/lIqIlZk9xS/r8gmLJ0EAgHnhd4D
 Ee/7L2BegPDf881mRFXUjkG/aNRQ5RGmabLmxPD5X7H3n4XGSsq0g+zpTX4KIcXDUWi13I
 kfoBbu66d+GDQcf2E3m2Zy2FSAPDsXMWoOUhmWc6+7WBZpFMepDwFAPPg4BvNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libopenh264: security bump to
 version 2.5.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI4LzAzLzIwMjUgMTc6MjUsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPiBGaXhlcyB0aGUg
Zm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlOgo+Cj4gQ1ZFLTIwMjUtMjcwOTE6IE9wZW5IMjY0IERl
Y29kaW5nIEZ1bmN0aW9ucyBIZWFwIE92ZXJmbG93IFZ1bG5lcmFiaWxpdHkKPgo+IEEgdnVsbmVy
YWJpbGl0eSBpbiB0aGUgZGVjb2RpbmcgZnVuY3Rpb25zIG9mIE9wZW5IMjY0IGNvZGVjIGxpYnJh
cnkgY291bGQKPiBhbGxvdyBhIHJlbW90ZSwgdW5hdXRoZW50aWNhdGVkIGF0dGFja2VyIHRvIHRy
aWdnZXIgYSBoZWFwIG92ZXJmbG93Lgo+Cj4gVGhpcyB2dWxuZXJhYmlsaXR5IGlzIGR1ZSB0byBh
IHJhY2UgY29uZGl0aW9uIGJldHdlZW4gYSBTZXF1ZW5jZSBQYXJhbWV0ZXIKPiBTZXQgKFNQUykg
bWVtb3J5IGFsbG9jYXRpb24gYW5kIGEgc3Vic2VxdWVudCBub24gSW5zdGFudGFuZW91cyBEZWNv
ZGVyCj4gUmVmcmVzaCAobm9uLUlEUikgTmV0d29yayBBYnN0cmFjdGlvbiBMYXllciAoTkFMKSB1
bml0IG1lbW9yeSB1c2FnZS4gIEFuCj4gYXR0YWNrZXIgY291bGQgZXhwbG9pdCB0aGlzIHZ1bG5l
cmFiaWxpdHkgYnkgY3JhZnRpbmcgYSBtYWxpY2lvdXMgYml0c3RyZWFtCj4gYW5kIHRyaWNraW5n
IGEgdmljdGltIHVzZXIgaW50byBwcm9jZXNzaW5nIGFuIGFyYml0cmFyeSB2aWRlbyBjb250YWlu
aW5nIHRoZQo+IG1hbGljaW91cyBiaXRzdHJlYW0uICBBbiBleHBsb2l0IGNvdWxkIGFsbG93IHRo
ZSBhdHRhY2tlciB0byBjYXVzZSBhbgo+IHVuZXhwZWN0ZWQgY3Jhc2ggaW4gdGhlIHZpY3RpbSdz
IHVzZXIgZGVjb2RpbmcgY2xpZW50IGFuZCwgcG9zc2libHksIHBlcmZvcm0KPiBhcmJpdHJhcnkg
Y29tbWFuZHMgb24gdGhlIHZpY3RpbSdzIGhvc3QgYnkgYWJ1c2luZyB0aGUgaGVhcCBvdmVyZmxv
dy4KPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaXNjby9vcGVuaDI2NC9zZWN1cml0eS9hZHZpc29y
aWVzL0dIU0EtbTk5cS01ajd4LTdtOXgKPiBodHRwczovL2dpdGh1Yi5jb20vY2lzY28vb3Blbmgy
NjQvcmVsZWFzZXMvdGFnLzIuNS4xCj4KPiBUaGUgdXBzdHJlYW0gdGFnIG5vdyBoYXMgbm8gJ3Yn
IHByZWZpeCwgc28gZHJvcCBpdCBmcm9tIF9TSVRFLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKIMKgQXBwbGllZCB0byAyMDI1LjAyLngs
IHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDCoEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbGlib3Bl
bmgyNjQvbGlib3BlbmgyNjQuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2UvbGlib3BlbmgyNjQvbGli
b3BlbmgyNjQubWsgICB8IDQgKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuaDI2NC9s
aWJvcGVuaDI2NC5oYXNoIGIvcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5oYXNoCj4g
aW5kZXggNmViNzhlMjAwOS4uMjMwYjMzYzU3ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm9w
ZW5oMjY0L2xpYm9wZW5oMjY0Lmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYm9wZW5oMjY0L2xpYm9w
ZW5oMjY0Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4g
LXNoYTI1NiAgOGZmYmU5NDRlNzQwNDNkMGQzZmI1M2Q0YTJhMTRjOTRkZTcxZjU4ZGJlYTZhMDZk
MGRjOTIzNjk1NDI5NThlYSAgbGlib3BlbmgyNjQtMi40LjEudGFyLmd6Cj4gK3NoYTI1NiAgYTFi
NWM4OGJmYjMxYzRkMjI1MTgzNWU1N2E3ZGY5OWY5MTE4MTk1NWNlYTZlYzNkZGQ0YWI4MmFhNTRh
ZTlmMSAgbGlib3BlbmgyNjQtMi41LjEudGFyLmd6Cj4gICBzaGEyNTYgIGRkNWMxYzk2Njg1MTI1
MzBmYTVhOTZlNGMyOWFjNDAzM2Q3MGE3ZWViMGVlZDdhNDJmZGRiNmRkNzk0ZWJkYmIgIExJQ0VO
U0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tayBiL3Bh
Y2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQubWsKPiBpbmRleCBlMzcxZTRjZGMwLi5mOWE1
MGU0YzYxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQubWsK
PiArKysgYi9wYWNrYWdlL2xpYm9wZW5oMjY0L2xpYm9wZW5oMjY0Lm1rCj4gQEAgLTQsOCArNCw4
IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUxJQk9QRU5IMjY0
X1ZFUlNJT04gPSAyLjQuMQo+IC1MSUJPUEVOSDI2NF9TSVRFID0gJChjYWxsIGdpdGh1YixjaXNj
byxvcGVuaDI2NCx2JChMSUJPUEVOSDI2NF9WRVJTSU9OKSkKPiArTElCT1BFTkgyNjRfVkVSU0lP
TiA9IDIuNS4xCj4gK0xJQk9QRU5IMjY0X1NJVEUgPSAkKGNhbGwgZ2l0aHViLGNpc2NvLG9wZW5o
MjY0LCQoTElCT1BFTkgyNjRfVkVSU0lPTikpCj4gICBMSUJPUEVOSDI2NF9MSUNFTlNFID0gQlNE
LTItQ2xhdXNlCj4gICBMSUJPUEVOSDI2NF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICAgTElC
T1BFTkgyNjRfQ1BFX0lEX1ZFTkRPUiA9IGNpc2NvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
