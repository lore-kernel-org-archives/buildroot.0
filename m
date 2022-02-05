Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35508C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D74E260A79;
	Sat,  5 Feb 2022 23:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ltzsz3MxoiW; Sat,  5 Feb 2022 23:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8EA60804;
	Sat,  5 Feb 2022 23:17:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B515D1BF863
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A372481422
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCpvZP1FDNsi for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:17:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9CDC8141E
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:17:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a28so19700257lfl.7
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6juMNj6spFdh3QbomWTWUQ/aNgXw+RWBrTgpUlZIM4g=;
 b=W/wBxwQkCyQdaI8cDn30V0U0sGqpdTvRAx0E84DVONRZDpxI8n49ol8uyQPba3g6oW
 ++KxwbxSansrMvtj2hCCtWiY0K/vY34xzYCMWUiS2AxnHp9V9AaXddGbF2F4qGfK4qal
 bLHM/LoEkU4XCYubXC0hhdEOFhqhbNwc/CHwNXw4GynPT7KMNsvHCHuXH7Lt2IYc7MEj
 AOWVGQkPCOTujlE18tyrwB/RipATLsHcyTFrKT22Qt9HYdzaz855UiAVj3bjqLkUh3KK
 wippPNipoLpBYRKMWQaDHQ+qtH336yrKixxbbglYHBi68QZoTNcfE+4DqifF06m0lA/Z
 5HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6juMNj6spFdh3QbomWTWUQ/aNgXw+RWBrTgpUlZIM4g=;
 b=4opfffPsj+j05BcmsGUPjVm1P1CktajrIxRcZcmCTlfSO62khHj0gziTlD62TMBc4Y
 3DhVZgGt552UtZlZN7C2D4vgBJCchQDhezbFFYgOOKuuxyAC4xNmbjMm7MoGGxVtDVRv
 CFAgKuEbpSgE1Qqaome2nrjhOmvJl7HGrv7RNJ1iKsYJSlGKKZlc0JS9CExWH5o1Ep84
 3EP8I0YZtzqCS8dk/0UqG9y6YgAsrC0bZVOkPaowKqO6Q3MQeX0k38BCS2/EeYBTj382
 Ob48SytU2MzFehxxFTne/CBmCQnoktaxw5+BdMK3P44duenPsI/w5RLgUziNJYfYO/3P
 xfIw==
X-Gm-Message-State: AOAM533+IL/XL3u3/MpCESTneel4QRkTd8gutw+hrTWsmj1rlH91GJqa
 fRYt4RsZ8QWY4Fm6Y1QjUc5q4zbTNnQ=
X-Google-Smtp-Source: ABdhPJxAVbvae4Q1ElSKdD3Y+bNNwunkPaGw920qVaUX2//JqrRXJhYAvPVXcTtefJAbEF5o43XMaw==
X-Received: by 2002:a05:6512:e9c:: with SMTP id
 bi28mr2828441lfb.498.1644103027549; 
 Sat, 05 Feb 2022 15:17:07 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.31])
 by smtp.gmail.com with ESMTPSA id o17sm883456lfl.16.2022.02.05.15.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:17:07 -0800 (PST)
Message-ID: <54d39db2-d11d-ffc6-1966-c721b26d1a5c@gmail.com>
Date: Sun, 6 Feb 2022 02:17:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220205215558.30751-1-kuzminov.sergey81@gmail.com>
 <033373DF-6707-4295-8A12-D4ABE072608F@benettiengineering.com>
 <4b114bca-d4ee-9ff9-931c-bd7501eb2e32@gmail.com>
 <ad2e127a-4662-b535-f32d-73aeee583280@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <ad2e127a-4662-b535-f32d-73aeee583280@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] configs/orangepi_zero_defconfig: switch
 to extlinux
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MDYuMDIuMjAyMiAwMjoxMywgR2l1bGlvIEJlbmV0dGkg0L/QuNGI0LXRgjoKPiBIaSBTZXJnZXks
Cj4gCj4gT24gMDYvMDIvMjIgMDA6MDQsIFNlcmdleSBLdXptaW5vdiB3cm90ZToKPj4gSGkgR2l1
bGlvLAo+Pgo+PiAwNi4wMi4yMDIyIDAxOjE4LCBHaXVsaW8gQmVuZXR0aToKPj4+IEhpIFNlcmdl
eSwKPj4+Cj4+PiBiZWxvdyBJIGdpdmUgeW91IGEgYmV0dGVyIGV4YW1wbGUgb2YgY29tbWl0IGxv
ZywKPj4+IGFuZCB0aGUgZGVhbGluZyB3aXRoIFYxLT5WMiBzZXJpZXMuCj4+Pgo+Pj4+IElsIGdp
b3JubyA1IGZlYiAyMDIyLCBhbGxlIG9yZSAyMjo1NiwgU2VyZ2V5IEt1em1pbm92IAo+Pj4+IDxr
dXptaW5vdi5zZXJnZXk4MUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4+Pj4KPj4+PiDvu79DaGFu
Z2VzOgo+Pj4+IHYxOgo+Pj4KPj4+IFBsZWFzZSBSZW1vdmUgdGhpcyBsaW5lIF5eXgo+Pj4KPj4+
PiAtIEV4Y2x1ZGUgRkFUIHBhcnRpdGlvbiwgaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBmb3IgVS1C
b290Lgo+Pj4+IC0gU3dpdGNoIHRoZSByb290ZnMgcGFydGl0aW9uIGZyb20gTUJSIHRvIEdQVCBm
b3IgcGFydGl0aW9uLXV1aWQgdG8gCj4+Pj4gd29yay4KPj4+PiAtIFN3aXRjaCB0byBleHRsaW51
eCwgdGhpcyBpcyBjb252ZW5pZW50IGZvciBkZWJ1Z2dpbmcuCj4+Pj4gLSBDcmVhdGUgY29tbW9u
IHNjZW5hcmlvcyBmb3IgbXVsdGlwbGUgYm9hcmRzIHRvIGNyZWF0ZSBhbiBTRCBpbWFnZTogCj4+
Pj4gYm9hcmQvb3JhbmdlcGkvY29tbW9uLgo+Pj4+Cj4+Pj4gdjI6Cj4+PiBSZW1vdmUgdGhpcyBe
Xl4gbGluZQo+Pj4+IC0gRml4IHR5cG8gaW4gZmlyc3QgbGluZSBvZiBjaGFuZ2VzIChzL2hlL2l0
KS4KPj4+IFRoaXMgdG9vIF5eXgo+Pj4+IC0gQWRkIEJSMl9UQVJHRVRfR0VORVJJQ19SRU1PVU5U
X1JPT1RGU19SVz15Lgo+Pj4gSGVyZSB3ZSBuZWVkIGFuIGV4cGxhbmF0aW9uIG9mIHRoZSByZWFz
b24gd2h5LCB3aGF0IHRoaXMgaW1wbGllcy4KPj4+PiAtIEV4Y2x1ZGUgb25lIGJvb3Qgb3B0aW9u
IGZyb20gZXh0bGludXguY29uZi4KPj4+IFRoaXMgXl5eIHRvbwo+Pj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogU2VyZ2V5IEt1em1pbm92IDxrdXptaW5vdi5zZXJnZXk4MUBnbWFpbC5jb20+Cj4+PiDi
gJQtCj4+PiBWMS0+VjI6Cj4+PiAqIGltcHJvdmVkIGNvbW1pdCBsb2cKPj4+ICogcmVtb3ZlZCBj
b21tZW50ZWQgbGluZSBpbiBleHRsaW51eC5jb25mCj4+PiAqIHJlbW92ZWQgb25lIGJvb3Qgb3B0
aW9uIGZyb20gZXh0bGludXguY29uZgo+Pj4+IC0tLQo+Pj4KPj4+IFNvIGFzIHlvdSBjYW4gc2Vl
LCBjb21taXQgbG9nIGRvZXNu4oCZdCBtZW50aW9uIHRoZSBwYXRjaCB2ZXJzaW9uLCAKPj4+IHdo
aWxlIGFmdGVyIHRoZSAzIGRhc2hlcyB5b3UKPj4+IGNhbiB3cml0ZSBpbiBnZW5lcmFsIHdoYXRl
dmVyIHlvdSB3YW50IGJlY2F1c2UgaXQgd29u4oCZdCBiZSBwYXJ0IG9mIAo+Pj4gY29tbWl0IGxv
ZyBhbmQgaXTigJlzIHVzdWFsbHkgdXNlZAo+Pj4gdG8gcmVwb3J0IFYxLT5WMiB2ZXJzaW9uIGV0
Yy4KPj4KPj4gQ2hhbmdlczoKPj4gKiBFeGNsdWRlIEZBVCBwYXJ0aXRpb24sIGl0IGlzIG5vIGxv
bmdlciBuZWVkZWQgZm9yIFUtQm9vdC4KPj4gKiBTd2l0Y2ggdGhlIHJvb3RmcyBwYXJ0aXRpb24g
ZnJvbSBNQlIgdG8gR1BUIGZvciBwYXJ0aXRpb24tdXVpZCB0byB3b3JrLgo+PiAqIFN3aXRjaCB0
byBleHRsaW51eCwgdGhpcyBpcyBjb252ZW5pZW50IGZvciBkZWJ1Z2dpbmcuCj4+ICogQ3JlYXRl
IGNvbW1vbiBzY2VuYXJpb3MgZm9yIG11bHRpcGxlIGJvYXJkcyB0byBjcmVhdGUgYW4gU0QgaW1h
Z2U6Cj4+IGJvYXJkL29yYW5nZXBpL2NvbW1vbi4KPj4gKiBBZGQgQlIyX1RBUkdFVF9HRU5FUklD
X1JFTU9VTlRfUk9PVEZTX1JXPXksIHJlbW91bnQgcm9vdCBmaWxlc3lzdGVtCj4+IHJlYWQtd3Jp
dGUgZHVyaW5nIGJvb3QuCj4+Cj4+IC0tLQo+PiBWMS0+VjI6Cj4+ICogaW1wcm92ZWQgY29tbWl0
IGxvZwo+PiAqIHJlbW92ZWQgY29tbWVudGVkIGxpbmUgaW4gZXh0bGludXguY29uZgo+PiAqIHJl
bW92ZWQgb25lIGJvb3Qgb3B0aW9uIGZyb20gZXh0bGludXguY29uZgo+Pgo+PiBWMi0+VjM6Cj4+
ICogaW1wcm92ZWQgY29tbWl0IGxvZwo+Pgo+PiBUaGF0J3MgcmlnaHQ/Cj4gCj4gWWVzLCB0aGlz
IHdvcmtzIGZvciBtZSBub3cKPiAKPj4KPj4+PiArKysgYi9ib2FyZC9vcmFuZ2VwaS9jb21tb24v
Z2VuaW1hZ2UuY2ZnCj4+Pj4gQEAgLTAsMCArMSwyMyBAQAo+Pj4+ICtpbWFnZSBzZGNhcmQuaW1n
IHsKPj4+PiArwqDCoMKgIHBhcnRpdGlvbiB1LWJvb3Qgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBp
bi1wYXJ0aXRpb24tdGFibGUgPSBmYWxzZQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpbWFnZSA9ICJ1
LWJvb3Qtc3VueGktd2l0aC1zcGwuYmluIgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBvZmZzZXQgPSA4
Swo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzaXplID0gMTAwMEsgIyAxTUIgLSA4S0Iob2Zmc2V0KSAt
IDE2S0IoR1BUKQo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgIGhkaW1hZ2Ugewo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb24tdGFibGUtdHlwZSA9IGdwdAo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBncHQtbG9jYXRpb24gPSAxMDA4SyAjIDFNQiAtIDE2S0IoR1BUKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBncHQtbm8tYmFja3VwID0gdHJ1ZQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCAj
IEFmdGVyIHdyaXRpbmcgdGhlIGltYWdlIHRvIHRoZSBTRCBjYXJkLAo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCAjIGJhY2t1cCBHUFQgZGF0YSBzdHJ1Y3R1cmVzIGF0IHRoZSBlbmQgb2YgdGhlIGRpc2s6
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgICMgZ2Rpc2sgL2Rldi9tbWNibGswIHRoZW4gcHJlc3MgdGhl
IGJ1dHRvbnM6IHgsIGUsIHcsIHkKPj4+Cj4+PiBXaHkgZG9u4oCZdCB5b3UgbWFrZSB0aGlzIHBh
cnQgXl5eIGF1dG9tYXRpYyB3aXRoIGEgc2NyaXB0IG9yIHlvdSAKPj4+IHNpbXBseSB1c2UgZ2Vu
aW1hZ2UgaXRzZWxmPwo+Pj4KPj4+IFdoYXQgaXTigJlzIGV4cGVjdGVkIGFzIGJvYXJkIGRlZmNv
bmZpZyBpcyBzb21ldGhpbmcgdGhhdCB5b3UgYnVybiBhIAo+Pj4gc2RjYXJkIHdpdGggdGhlIHNk
Y2FyZC5pbWcgZmlsZSBhbmQgdGhhdOKAmXMgaXQuIFNvIGhlcmUgeW91IG5lZWQgdG8gCj4+PiBt
YWtlIGl0IGF1dG9tYXRpYy4KPj4+Cj4+PiBTbyB3ZSB3YWl0IGZvciBWMyB3aXRoIHRoZSBjb21t
aXQgbG9nIGZvcm0geW91IHJlYWQgYWJvdmUgYW5kIAo+Pj4gcmVxdWVzdGVkIGNoYW5nZXMuCj4+
Cj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGNyZWF0ZSBhbiBz
ZGNhcmQuaW1nIGltYWdlCj4+IHdpdGggdGhlIGNvcnJlY3QgR1BUIHN0cnVjdHVyZS4gVGhlIHNl
Y29uZCBjb3B5IG9mIHRoZSBHUFQgbXVzdCBiZSBhdAo+PiB0aGUgZW5kIG9mIHRoZSBkaXNrLCBh
bmQgdGhlIHNpemUgb2Ygc2RjYXJkLmltZyB3aWxsIG5vdCBtYXRjaCB0aGUgU0QKPj4gY2FyZC4g
V2lsbCB3b3JrIGFuZCBzbywgd2l0aCBvbmUgY29weSBvZiBHUFQuIEJ1dCB0aGUgZGlzayB1dGls
aXRpZXMgbWF5Cj4+IGlzc3VlIGEgd2FybmluZyBhYm91dCB0aGUgYWJzZW5jZSBvZiBhIHNlY29u
ZCBjb3B5IG9mIHRoZSBHUFQuIFlvdSBjYW4KPj4gY29ycmVjdCB0aGUgc2l0dWF0aW9uIG9ubHkg
YWZ0ZXIgd3JpdGluZyBzZGNhcmQuaW1nIHRvIHRoZSBTRCBjYXJkLCBvcgo+PiBkdXJpbmcgdGhl
IGZpcnN0IGxvYWRpbmcgb2YgdGhlIGJvYXJkIGluIGEgc2VwYXJhdGUgc2NyaXB0LiBUaGlzIGlz
IG91dAo+PiBvZiBzY29wZSBmb3IgdGhpcyBwYXRjaC4KPiAKPiBPaywgc28gcGxlYXNlIHJlbW92
ZSB0aG9zZSAzIGNvbW1lbnRlZCBsaW5lcyBzaW5jZSBJIHRoaW5rIHRoZSBib2FyZCAKPiBhY3R1
YWxseSB3b3JrcyB3aXRob3V0IHRob3NlIGFkZGl0aW9uYWwgY29tbWFuZHMsIGNvcnJlY3Q/CgpZ
ZXMuCgo+IAo+IE90aGVyd2lzZSwgaXQgdGhpcyBkb2Vzbid0IHdvcmsgb24gdGFyZ2V0IHdpdGhv
dXQgZ2Rpc2sgY29tbWFuZHMsIHlvdSAKPiBuZWVkIHRvIGFkZCBhIHBvc3QtaW1hZ2Uuc2ggc2Ny
aXB0IHRvIGxhdW5jaCB0aG9zZSBjb21tYW5kcy4KPiAKPiBUaGFuayB5b3UhCj4gQmVzdCByZWdh
cmRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
