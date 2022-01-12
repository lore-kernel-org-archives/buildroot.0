Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF768C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 15:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D50F84B3F;
	Wed, 12 Jan 2022 15:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nnnxnb7dZ3Uw; Wed, 12 Jan 2022 15:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8AD384B35;
	Wed, 12 Jan 2022 15:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 740851BF5E6
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 15:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60AB76FBB8
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 15:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ea-lDMCsb2X for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 15:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8702C6FB7A
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 15:09:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 30so11266229edv.3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 07:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=my6WuZUXBdbV/oIzEK6hV1RdOjlP3rgniN2+oxpWI+Q=;
 b=Kei4wIRWxrsIHrZI9YFGD31veYpp5zpCtRjJ4w+eUWRvq0GCuZtmCfHZWe1t5S7sfJ
 9sBFVhh+fS4dtKGzxvf0tTcS6wzPr17L9ztrSGw+AxrrKDhEXcO0xyyr6yREpx9rgvmo
 gzkD9VkY0ZESZ3XWADqu7eSue+HJ2xR2tUortTvYiSKMa7WYRGysUg4vfJe4DeNOmzUR
 mlZY2bTvKLQXIeIuBKWNcTlvyqLxY/Sw/vGpXcUCtiPhGSQzhJPzXRSiUN5w7EU4XaKh
 khjb13O4Qq8zAdsGXaODClumRKQtqGL69YDyMvpbVBw8HlgaEmQY6LrhWXqGyXUJlkTV
 B4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=my6WuZUXBdbV/oIzEK6hV1RdOjlP3rgniN2+oxpWI+Q=;
 b=TthTDQUGubXrapdw6Y6IPh5cFKb95fTxGhTfTNnPoppDkNrppecdOC9U4VJeRnhlmN
 LhFatgdNr5LV5O4E9GyEesn29IP6EGux9QhVvCWzFd7rIRnEOW2QUXzGffoY5NPTeIzY
 WUocJtFaTj7YoUZ9C/wUrQ8t3nvlmyy0vIAQ4gNpgZvR7UKs9rKlYOX1ws5nscFNasJQ
 Z3r9SAFNK5XIRk915z5ofSSsp2RUx4FTkA2u31xyfTtF+CU6IVWX+M7wNeldf2i4f/yv
 uMEuQOMmWrbpC3eakQlKmpTFuHPbOcSTK6UPuwwO+I9Bz7NUDQDbOcdoqPt8H6ouH7KU
 sxBQ==
X-Gm-Message-State: AOAM532sHe7AdWuddxmLuykBAG9RhfrGcd0dZej4mipMKYyE9KEsthUt
 Oo9CXHmvIE7PYfKULTvYUe+3n/8SmkdT3q5yaCw6tg==
X-Google-Smtp-Source: ABdhPJyxJUa8FqiNbHREQc/qZz4B8PTDceT8y0O7ILS2+ppJfn/pXuc9rfhTCYls96PTkjEfqyZK1t6V52D3ZP1q3+Y=
X-Received: by 2002:a17:906:318a:: with SMTP id
 10mr157150ejy.154.1642000142702; 
 Wed, 12 Jan 2022 07:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
 <20220105214129.2f5fffae@windsurf>
 <CAJPV9MpzSPFyj-AMO+_iCNZ-PVp+DcKaH1yrMHvO2TawoUPa1g@mail.gmail.com>
 <20220112155103.7e6c11c0@windsurf>
In-Reply-To: <20220112155103.7e6c11c0@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 12 Jan 2022 17:08:26 +0200
Message-ID: <CAJPV9MpjN_fPn04Z6crTsogUL2-UWjgBr2P-A9Uz-QYqYd_aGw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKYW4gMTIsIDIwMjIgYXQgNDo1MSBQTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gT24gV2VkLCAxMiBK
YW4gMjAyMiAxNjoxNToxNiArMDIwMAo+IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5l
bkB1bmlraWUuY29tPiB3cm90ZToKPgo+ID4gPiBXaGF0IGFyZSB5b3UgImZpeGluZyI/IFlvdSdy
ZSByZXBsYWNpbmcgYSBwcmxpbWl0KCkgY2FsbCBieSBieQo+ID4gPiBzZXRybGltaXQoKSwgYnV0
IHdoeT8gV2hhdCBwcm9ibGVtIGRvZXMgaXQgc29sdmU/IFdoeSBpcyBpdCBjb3JyZWN0IHRvCj4g
PiA+IGRvIHRoYXQ/Cj4gPgo+ID4gICAgIFRoZSBwcm9ibGVtIGlzIHNob3duIGZyb20gYXMgdGhp
czoKPiA+Cj4gPiAvaG9tZS9wZWtrYXJpL2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJj
L2J1aWxkL21pbmlqYWlsLWxpbnV4LXYxNy9saWJtaW5pamFpbC5jOgo+ID4gSW4gZnVuY3Rpb24g
4oCYc2V0X3JsaW1pdHNfb3JfZGll4oCZOgo+ID4gL2hvbWUvcGVra2FyaS9ici10ZXN0LXBrZy9i
b290bGluLWFybXY1LXVjbGliYy9idWlsZC9taW5pamFpbC1saW51eC12MTcvbGlibWluaWphaWwu
YzoxOTExOjc6Cj4gPiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCY
cHJsaW1pdOKAmTsgZGlkIHlvdSBtZWFuCj4gPiDigJhzZXRybGltaXTigJk/IFstV2Vycm9yPWlt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ID4gMTkxMSB8ICAgaWYgKHBybGltaXQoai0+
aW5pdHBpZCwgai0+cmxpbWl0c1tpXS50eXBlLCAmbGltaXQsIE5VTEwpKQo+ID4gICAgICB8ICAg
ICAgIF5+fn5+fn4KPiA+ICAgICAgfCAgICAgICBzZXRybGltaXQKPiA+Cj4gPiAgICAgU28gSSBm
b2xsb3dlZCB0aGUgc3VnZ2VzdGlvbiwgbm8gbW9yZSwgbm8gbGVzcy4KPgo+IFlvdSBzaG91bGRu
J3QgYmxpbmRseSBmb2xsb3cgY29tcGlsZXIgc3VnZ2VzdGlvbnMgOi0pCj4KPiBwcmxpbWl0KCkg
ZXhpc3RzIGluIG11c2wuIFdhcyA8c3lzL3Jlc291cmNlLmg+IGluY2x1ZGVkLCBhcyBzdWdnZXN0
ZWQKPiBieSB0aGUgcHJsaW1pdCgpIG1hbiBwYWdlID8KCiAgICBJdCBpczoKCiQgY2F0IGxpYm1p
bmlqYWlsLmMKWy4uLl0KI2luY2x1ZGUgPHN5cy9yZXNvdXJjZS5oPgpbLi4uXQoKPiA+ID4gPiAr
LXN0YXRpY19hc3NlcnQoRkRfU0VUU0laRSA+PSBNQVhfUFJFU0VSVkVEX0ZEUyAqIDIgLSAxLAo+
ID4gPiA+ICstICAgICAgICAgICJJZiB0cnVlLCBlbnN1cmVfbm9fZmRfY29uZmxpY3Qgd2lsbCBh
bHdheXMgZmluZCBhbiB1bnVzZWQgZmQuIik7Cj4gPiA+Cj4gPiA+IFlvdSdyZSBub3QgZml4aW5n
IHRoZSBzdGF0aWNfYXNzZXJ0KCkgaGVyZSBidXQgc2ltcGx5IGRyb3BwaW5nIGl0LiBXaHk/Cj4g
PiA+IFdoZW4gZG9lcyBpdCBmYWlsPyBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggaXQ/IFdoeSBp
cyBpdCBzYWZlIHRvIGRyb3AKPiA+ID4gaXQ/Cj4gPgo+ID4gICAgIEl0IGZhaWxzIGxpa2UgdGhp
czoKPiA+Cj4gPiAvaG9tZS9wZWtrYXJpL2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJj
L2J1aWxkL21pbmlqYWlsLWxpbnV4LXYxNy9saWJtaW5pamFpbC5jOjI2MjM6MTU6Cj4gPiBlcnJv
cjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBvciDigJguLi7igJkgYmVmb3JlIG51
bWVyaWMKPiA+IGNvbnN0YW50Cj4gPiAyNjIzIHwgc3RhdGljX2Fzc2VydChGRF9TRVRTSVpFID49
IE1BWF9QUkVTRVJWRURfRkRTICogMiAtIDEsCj4gPiAgICAgIHwgICAgICAgICAgICAgICBefn5+
fn5+fn5+Cj4gPiAvaG9tZS9wZWtrYXJpL2JyLXRlc3QtcGtnL2Jvb3RsaW4tYXJtdjUtdWNsaWJj
L2J1aWxkL21pbmlqYWlsLWxpbnV4LXYxNy9saWJtaW5pamFpbC5jOjI2MjQ6ODoKPiA+IGVycm9y
OiBleHBlY3RlZCBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzIG9yIOKAmC4uLuKAmSBiZWZvcmUgc3Ry
aW5nIGNvbnN0YW50Cj4gPiAyNjI0IHwgICAgICAgICJJZiB0cnVlLCBlbnN1cmVfbm9fZmRfY29u
ZmxpY3Qgd2lsbCBhbHdheXMgZmluZCBhbiB1bnVzZWQgZmQuIik7Cj4gPiAgICAgIHwgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+ID4KPiA+ICAgICBTbyBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBwbGF0
Zm9ybSBtYXkKPiA+IGRlZmluZSBzdGF0aWNfYXNzZXJ0IGluIGEgZGlmZmVyZW50IG1hbm5lciwg
YW5kIEkKPiA+IGZpbmQgbm8gdHJhY2VzIG9mIHRoZSBwdXJwb3NlIG9mIHRoYXQgaXNvbGF0ZWQg
YXNzZXJ0LAo+ID4gc28gdGhlIGVhc2llciB3YXkgdG8gZ2V0IGFyb3VuZCB0aGlzIHdhcyByZW1v
dmluZyBpdC4KPgo+IFdlbGwsIHRoZSBhc3NlcnQgaXMgdGhlcmUgZm9yIGEgcmVhc29uLCBzbyB3
ZSBuZWVkIHRvIHVuZGVyc3RhbmQgd2hhdAo+IGl0IGlzIHZlcmlmeWluZywgYW5kIHdoZXRoZXIg
aXQgaXMgc2FmZSB0byBkcm9wIGl0Lgo+Cj4gQWZ0ZXIgY2hlY2tpbmcsIEZEX1NFVFNJWkUgc2Vl
bXMgdG8gYmUgZGVmaW5lZCB0byAxMDI0IGJ5IGdsaWJjLCBtdXNsCj4gYW5kIHVjbGliYy1uZywg
YW5kIE1BWF9QUkVTRVJWRURfRkRTIGlzIGRlZmluZWQgYXMgMTI4IGJ5IHRoZSBtaW5pamFpbAo+
IGNvZGUuCj4KPiBDYW4geW91IHRyeSB1c2luZyBfU3RhdGljX2Fzc2VydCgpIGluc3RlYWQsIHdo
aWNoIGlzIHBhcnQgb2YgdGhlIEMxMQo+IHN0YW5kYXJkPwoKICAgIEknbGwgZG8uCgogICAgVGhh
bmtzIQoKICAgIEpvc8OpLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
