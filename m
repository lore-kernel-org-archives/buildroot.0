Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 21:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4CD8415B1;
	Fri, 14 Jan 2022 21:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QYGeNFdh5eM; Fri, 14 Jan 2022 21:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E60EE409AC;
	Fri, 14 Jan 2022 21:54:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA5341BF36A
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A206B60B29
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 21:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tV6HF3SnaiB for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 21:54:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78D2160879
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 21:54:45 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id x7so34517133lfu.8
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 13:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vgwszxj49OaJc6WNgFtw1M7I9EwTLe7oj/N9bDWbgt0=;
 b=MhJcH8RGJ6W6kbq8ELe/4ZKX627ja4YEbtinz61+kLnw64BVnMvdbTY5QZe6W5HPt0
 bgAtXRMGtO/Nz9CWTRyOO9ZW4Qlu/rIUsPq7FUZeaRgz21UvKA3s8RbOVrOXkRH0ygbr
 DKnS870utEKzx7/xLFct1w9Uq2Bx8EgrR2oksHUpsqQVjMWFz5XIyGkNlRqjqev1+3Hm
 L2njwt2oqgefSR5uMbk7Ij/YM06aM9ZZmnyyCNEAQqLI5rjuhmT/Ho7WY0J6Kflv6+wO
 4q19Ot/g7fNNqVDH0wgb1so0267rIONHNpdqtyAFRdD4UCq7EE64sdp51/ACdILccjYX
 fRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vgwszxj49OaJc6WNgFtw1M7I9EwTLe7oj/N9bDWbgt0=;
 b=OjqJ42JpCDXI5UDvDGn2DKj2+pPQqhRE/4mMpGVmmaDYX8fNqU7xeEBbCoAs3oeKmN
 A0xKwYuNjzhYYRXdUGlmC2URrkO5JSQcKX/0oUQ6n8YKByGlDC7N5FuN/PR9A0HxsV5D
 gTYb5y3Rlr3kvez+9qK1MbiS1USEqLSpbhvqDG3M+LTwO2ZvwrZw+E4RAF6rFdn6EeyW
 nYf4xw9bFA4CYcg1ron2QEqtkpt0Dia7k98ZXcTGiJqEtnJI7L4gEh7LIbBj/4B3LQTR
 hiicsgSMt737pkPsDosrijTwWaPa5RyCQ+xJYItMWLlDV4mGEaceQK9uU2b8dkDrWKW4
 rdnQ==
X-Gm-Message-State: AOAM530x0t5M/2NlZ2qocQXG5JOSCmZCOslVp3KebLsza3QQTLfMLpYz
 nN2kAil36qQJYUG8PDfcIbsUThOX/PJXXgMDNOQ=
X-Google-Smtp-Source: ABdhPJyC4atOv2xfEuJhmbtU7VwXyZCaBfqZomI+vI+SQhbuQ4qkKkcexUJpvFyqCfoQFjCdCjwn+1CPVCUjfKWjfAU=
X-Received: by 2002:a05:6512:c6:: with SMTP id
 c6mr8201048lfp.591.1642197283326; 
 Fri, 14 Jan 2022 13:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20220114211525.2697606-1-heiko.thiery@gmail.com>
 <ABAA5853-8D34-4E82-983C-00062B2C7FCB@benettiengineering.com>
In-Reply-To: <ABAA5853-8D34-4E82-983C-00062B2C7FCB@benettiengineering.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 14 Jan 2022 22:54:32 +0100
Message-ID: <CAEyMn7bAgLz4pQOdO03AC=iS9Fzw_UJhgJ8FybXC5gDgiWaxQg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKQW0gRnIuLCAxNC4gSmFuLiAyMDIyIHVtIDIyOjM3IFVociBzY2hyaWViIEdp
dWxpbyBCZW5ldHRpCjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPjoKPgo+
IEhpIEhlaWtvLAo+Cj4gPiBJbCBnaW9ybm8gMTQgZ2VuIDIwMjIsIGFsbGUgb3JlIDIyOjE3LCBI
ZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gPgo+ID4g
77u/VGhlIEJMIGkuTVg4TSBNaW5pIGlzIGEgYmFzZWJvYXJkIHRoYXQgaW5jbHVkZXMgdGhlIFNv
TSBTTCBpLk1YOE0gTWluaS4KPiA+Cj4gPiBodHRwczovL3d3dy5rb250cm9uLmNvbS9wcm9kdWt0
ZS9iYXNlYm9hcmQtYmwtaS5teDhtLW1pbmkvcDE1ODU0OQo+ID4KPiA+IENjOiBGcmllZGVyIFNj
aHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IHYyOgo+ID4g
LSBzd2l0Y2ggdG8gZXh0bGludXgKPiA+IC0gZGlyZWN0bHkgY2FsbCBnZW5pbWFnZS5zaAo+ID4g
IC0gcmVtb3ZlIHBvc3QtaW1hZ2Uuc2gKPiA+IC0gcmVtb3ZlIEJSMl9QQUNLQUdFX0hPU1RfVUJP
T1RfVE9PTFNfQk9PVF9TQ1JJUFQKPiA+IC0gYWRkIEJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBf
RElSTkFNRQo+ID4KPiA+Cj4gPiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKwo+ID4gYm9hcmQva29udHJvbi9ibC1pbXg4bW0vZXh0bGludXguY29u
ZiAgICAgICAgIHwgICA0ICsKPiA+IGJvYXJkL2tvbnRyb24vYmwtaW14OG1tL2dlbmltYWdlLmNm
ZyAgICAgICAgICB8ICAxOCArKwo+ID4gLi4ubS1rb250cm9uLW44MDF4LXMtY29udmVydC1vcHRp
b25zLXRvLnBhdGNoIHwgIDI4ICsrCj4gPiAuLi5tLWtvbnRyb24tbjgwMXgtcy1hZGQtY29tbW9u
LWJvYXJkLXUucGF0Y2ggfCAzMDIgKysrKysrKysrKysrKysrKysrCj4gPiBib2FyZC9rb250cm9u
L2JsLWlteDhtbS9wb3N0LWJ1aWxkLnNoICAgICAgICAgfCAgIDcgKwo+ID4gYm9hcmQva29udHJv
bi9ibC1pbXg4bW0vcmVhZG1lLnR4dCAgICAgICAgICAgIHwgIDg1ICsrKysrCj4gPiBjb25maWdz
L2tvbnRyb25fYmxfaW14OG1tX2RlZmNvbmZpZyAgICAgICAgICAgfCAgNTkgKysrKwo+ID4gOCBm
aWxlcyBjaGFuZ2VkLCA1MDUgaW5zZXJ0aW9ucygrKQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGJv
YXJkL2tvbnRyb24vYmwtaW14OG1tL2V4dGxpbnV4LmNvbmYKPiA+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBib2FyZC9rb250cm9uL2JsLWlteDhtbS9nZW5pbWFnZS5jZmcKPiA+IGNyZWF0ZSBtb2RlIDEw
MDY0NCBib2FyZC9rb250cm9uL2JsLWlteDhtbS9wYXRjaGVzL3Vib290LzAwMDEtaW14LWlteDht
bS1pbXg4bW0ta29udHJvbi1uODAxeC1zLWNvbnZlcnQtb3B0aW9ucy10by5wYXRjaAo+ID4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2tvbnRyb24vYmwtaW14OG1tL3BhdGNoZXMvdWJvb3QvMDAw
Mi1pbXgtaW14OG1tLWlteDhtbS1rb250cm9uLW44MDF4LXMtYWRkLWNvbW1vbi1ib2FyZC11LnBh
dGNoCj4gPiBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQva29udHJvbi9ibC1pbXg4bW0vcG9zdC1i
dWlsZC5zaAo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2tvbnRyb24vYmwtaW14OG1tL3Jl
YWRtZS50eHQKPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL2tvbnRyb25fYmxfaW14OG1t
X2RlZmNvbmZpZwo+ID4KPiA+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+
ID4gaW5kZXggYzBiZmRlNjlkYS4uOTNjNTc2MDQ4OSAxMDA2NDQKPiA+IC0tLSBhL0RFVkVMT1BF
UlMKPiA+ICsrKyBiL0RFVkVMT1BFUlMKPiA+IEBAIC0xMTc5LDcgKzExNzksOSBAQCBGOiAgICBw
YWNrYWdlL3B5dGhvbi1zaXAvCj4gPiBGOiAgICBwYWNrYWdlL3VoZC8KPiA+Cj4gPiBOOiAgICBI
ZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Cj4gPiArRjogICAgYm9hcmQva29u
dHJvbi9ibC1pbXg4bW0vCj4gPiBGOiAgICBib2FyZC9rb250cm9uL3BpdHgtaW14OG0vCj4gPiAr
RjogICAgY29uZmlncy9rb250cm9uX2JsX2lteDhtbV9kZWZjb25maWcKPiA+IEY6ICAgIGNvbmZp
Z3Mva29udHJvbl9waXR4X2lteDhtX2RlZmNvbmZpZwo+ID4gRjogICAgcGFja2FnZS9hbHRlcmEt
c3RhcGwvCj4gPiBGOiAgICBwYWNrYWdlL2lwbWl0b29sLwo+ID4gZGlmZiAtLWdpdCBhL2JvYXJk
L2tvbnRyb24vYmwtaW14OG1tL2V4dGxpbnV4LmNvbmYgYi9ib2FyZC9rb250cm9uL2JsLWlteDht
bS9leHRsaW51eC5jb25mCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAw
MDAwMC4uZDM4ZjdmODFiNwo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYm9hcmQva29udHJv
bi9ibC1pbXg4bW0vZXh0bGludXguY29uZgo+ID4gQEAgLTAsMCArMSw0IEBACj4gPiArbGFiZWwg
YnVpbGRyb290Cj4gPiArICBrZXJuZWwgL2Jvb3QvSW1hZ2UKPiA+ICsgIGRldmljZXRyZWUgL2Jv
b3QvZnJlZXNjYWxlL2lteDhtbS1rb250cm9uLW44MDF4LXMuZHRiCj4gPiArICBhcHBlbmQgcm9v
dD1QQVJUVVVJRD0lUEFSVFVVSUQlIHJvb3R3YWl0IHJ3Cj4gPiBkaWZmIC0tZ2l0IGEvYm9hcmQv
a29udHJvbi9ibC1pbXg4bW0vZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQva29udHJvbi9ibC1pbXg4bW0v
Z2VuaW1hZ2UuY2ZnCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAw
MC4uNmMwZWY2OTU5MQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYm9hcmQva29udHJvbi9i
bC1pbXg4bW0vZ2VuaW1hZ2UuY2ZnCj4gPiBAQCAtMCwwICsxLDE4IEBACj4gPiAraW1hZ2Ugc2Rj
YXJkLmltZyB7Cj4gPiArICAgIGhkaW1hZ2Ugewo+ID4gKyAgICAgICAgcGFydGl0aW9uLXRhYmxl
LXR5cGUgPSAiZ3B0Igo+ID4gKyAgICAgICAgZ3B0LWxvY2F0aW9uID0gMTZLCj4gPiArICAgIH0K
PiA+ICsKPiA+ICsgICAgcGFydGl0aW9uIGlteC1ib290IHsKPiA+ICsgICAgICAgIGluLXBhcnRp
dGlvbi10YWJsZSA9ICJubyIKPiA+ICsgICAgICAgIGltYWdlID0gImZsYXNoLmJpbiIKPiA+ICsg
ICAgICAgIG9mZnNldCA9IDMzawo+Cj4gSeKAmXZlIG1pc3NlZCBWMSBwYXRjaCwgaGVyZSBeXl4g
cGxlYXNlIHVzZSBjYXBpdG9sIEsgbGV0dGVyLgo+IEkgc3RpbGwgaGF2ZSB0byB3cml0ZSB0aGUg
bGludGVyIGZvciBnZW5pbWFnZS5jZmcgZmlsZXMgOi0vCgpJbmRlZWQgLi4gbWlzc2VkIHRoYXQu
IEkgd2lsbCB3YWl0IGZvciBzb21lIG1vcmUgY29tbWVudHMgYW5kIGRvIGEgdjMKd2l0aCB0aGF0
IGZpeGVkIGxhdGVyLgoKW3NuaXBdCgo+ID4gKysmaTJjMSB7Cj4gPiArKyAgICB1LWJvb3QsZG0t
c3BsOwo+ID4gKysgICAgdS1ib290LGRtLXByZS1yZWxvYzsKPiA+ICsrfTsKPiA+ICsrCj4gPiAr
KyZpMmMyIHsKPiA+ICsrICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICsrICAgIHUtYm9vdCxkbS1z
cGw7Cj4gPiArKyAgICB1LWJvb3QsZG0tcHJlLXJlbG9jOwo+ID4gKyt9Owo+Cj4gSSBkb27igJl0
IGtub3cgdGhlIGhhcmR3YXJlIG9mIHRoZSBib2FyZCBhbmQgaXTigJlzIGEgYml0IG9mZi10b3Bp
YywKPiBidXQgZG8geW91IHJlYWxseSBuZWVkIDIgaTJjIGNoYW5uZWxzIGJlZm9yZSByZWxvY2F0
aW5nIHVib290PwoKR29vZCBjYXRjaC4KCkBGcmllZGVyOiBjYW4geW91IHNheSBzb21ldGhpbmcg
dG8gdGhhdD8KCi0tIApIZWlrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
