Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17F7C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F5183F83;
	Mon, 15 Aug 2022 14:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F5183F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppuYdOD4Ygop; Mon, 15 Aug 2022 14:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B8CE81D11;
	Mon, 15 Aug 2022 14:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B8CE81D11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93C1A1BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7ABDF40447
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ABDF40447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9Tb3YgoBa28 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:57:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88E154029B
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88E154029B
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:57:15 +0000 (UTC)
Received: from smtpclient.apple ([151.47.103.2])
 by Aruba Outgoing Smtp  with ESMTPA
 id NbWioZWhT34GkNbWjontTX; Mon, 15 Aug 2022 16:57:14 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 15 Aug 2022 16:57:11 +0200
Message-Id: <22FAC844-6A4C-4E12-A36B-27D3819B9432@benettiengineering.com>
References: <20220815145332.GC2854108@scaer>
In-Reply-To: <20220815145332.GC2854108@scaer>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: iPhone Mail (19G71)
X-CMAE-Envelope: MS4xfCYkZkSppbKy9d2jTQrsi6XeTYjkdb5ZY69Xi9TVhWEx+4uoRTXUHncIWaECge/xBGlNImgaAIn0zYBP/NWP5NXjd8ngN2E6CCl64N0YnXjByMCljcr8
 7w9TEdfxNbYiE7rbhV7gWXEwZblPiHTuD/nKgwQ7E/i44cIaej4f6yySZW87SsZJZfzm3isDwhA7VhEfpr/l0S3cjrqfyZ3edu8m2LZm690m9vSNbJ7TJ0Yk
 EwoGms0ReT3kOXngy3dVRl+AX/IqL+4Ho9iqP/h34IIOpsUK1zJe5k3VWI3io+X6WaKNne6DLAyJs2m2825ceP+UGZzQB2lPu5Tw98ZKYtw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660575434; bh=1D5Dd4rF1sqEYS1LXWZnkbM92kYMVUaJbPNC1/FbwnA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=lKfOtTYA0tN1i03qP2dDZEwUmxbKbOAOQLPwamz0/CmHf9Bw7vlrzTS8o2XF+NeAx
 EDRCkXBE0YnqQUqTBEZhk2r/TZwummvYAZR8SbPaZma8n9mu2G/mZADJztz/l/dWX4
 MrKL/+lo+fd+Lhz5JYDCIE9VnXBBMUJmkHqTsPjexamXfFr1SDO/QBnnwtOsPJ7C2d
 m1Wmtq1Cz54jBHQsBGBNImInsTCn+ko8FxLHwIrT3guw+360vb0j2rtv+zlvVsiYi7
 uoYbFRb6ikOBHwO8JSGdQQRU+/RpUltJ2mbo7FxsSeyaWPyrCsEKw8GK+kZJmDEIT5
 fthEIR33k/L0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lKfOtTYA
Subject: Re: [Buildroot] [PATCH 1/1] board/pine64/pinecube: new board
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
Cc: buildroot@buildroot.org, Jagan Teki <jagan@amarulasolutions.com>,
 Jan Havran <havran.jan@email.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCj4gSWwgZ2lvcm5vIDE1IGFnbyAyMDIyLCBhbGxlIG9yZSAxNjo1MywgWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGhhIHNjcml0dG86Cj4gCj4g77u/R2l1
bGlvLCBKYW4sIEFsbCwKPiAKPiBPbiAyMDIyLTA4LTE0IDEzOjU2ICswMjAwLCBHaXVsaW8gQmVu
ZXR0aSBzcGFrZSB0aHVzbHk6Cj4+IE9uIDE0LzA4LzIyIDExOjIyLCBKYW4gSGF2cmFuIHdyb3Rl
Ogo+Pj4+PiArKysgYi9jb25maWdzL3BpbmVjdWJlX2RlZmNvbmZpZwo+Pj4+PiArQlIyX0FSTV9G
UFVfTkVPTl9WRlBWND15Cj4+Pj4gVGhpcyBeXl4gc2hvdWxkIGJlIHJlbW92ZWQgc2luY2UgTkVP
TiBkb2Vzbid0IHN1cHBvcnQgY29tcGxldGUgRlBVCj4+Pj4gc3RhbmRhcmQgQVBJLCBzbyBpdCdz
IGJldHRlciB0byBrZWVwIHRoZSBkZWZhdWx0IGZvciBCUjJfY29ydGV4X2E3Cj4+PiBJIHdpbGwg
Zml4IGV2ZXJ5dGhpbmcgYW5kIHBvc3QgVjIsIGJ1dCBvbmUgdGhpbmcgSSBkbyBub3QgdW5kZXJz
dGFuZCBtdWNoIGlzCj4+PiB0aGlzIG9uZS4KPj4gSGVyZSB0aGVyZSBpcyBhIHZlcnkgZ29vZCBl
eHBsYW5hdGlvbiBvbiB3aHkgbm90IGFkZGluZyBieSBkZWZhdWx0Cj4+IEJSMl9BUk1fRlBVX05F
T05fVkZQVjQ6Cj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRy
b290LzIwMjItSmFudWFyeS82MzQ3MjguaHRtbAo+IAo+IEkgZXZlbiB0aW5rIHRoYXQsIHVsdGlt
YXRlbHksIHdlIHNob3VsZCBqdXN0IHJlbW92ZSBGUFUgb3B0aW9ucyB0aGF0Cj4gYWxzbyBlbmFi
bGUgTkVPTiwgbGlrZSBCUjJfQVJNX0ZQVV9ORU9OX1ZGUFY0LCBiZWNhdXNlIHRoZXkgZG8gbm90
IG1ha2UKPiBzZW5zZS4KCkkgd2FzIHdvbmRlcmluZyBpZiBzZW5kaW5nIGEgcGF0Y2hzZXQgZm9y
IHRoaXMsIHNvIEnigJltIGdvaW5nIHRvLgoKVGhhbmsgeW91CkJlc3QgcmVnYXJkcwpHaXVsaW8K
Cj4gCj4gVXNpbmcgTkVPTiBmb3IgZmxvYXRpbmctcG9pbnQgYXJpdGhtZXRpY3Mgc2hvdWxkIHBy
b2JhYmx5IGxlZnQgdG8gYQo+IHBlci1wYWNha2dlIHNldHRpbmcsIHdoZXJlIGFuZCB3aGVuIHQg
bWFrZXMgc2Vuc2UgZm9yIHRoYXQgcGFja2FnZSAoZS5nLgo+IG1hdGgtaW50ZW5zaXZlIHBhY2th
Z2VzIHRoYXQgY2FuIGNvcGUgd2l0aCBpbmNvcnJlY3QgcmVzdWx0cyAobGlrZQo+IHJlYWwtdGlt
ZSBhdWRpbyBzdHVmZiB0aGF0IGZhdm91ciBhbiBvY2Nhc2lvbmFsIGdsaXRjaCByYXRoZXIgdGhh
biBhCj4gcGFja2V0IGxvc3MpLgo+IAo+IFstLVNOSVAtLV0KPj4gQnV0IHllcywgaWYgVkZQVjQg
aXMgc3VwcG9ydGVkIHRoZW4geWVzLCBpdCBtYWtlcyBzZW5zZSB0byBlbmFibGUgaXQKPj4gaW5z
dGVhZCBvZiBrZWVwaW5nIHRoZSBkZWZhdWx0LiBTbyBzaW5jZSB0aGlzIGJvYXJkIGlzIFMzIGJh
c2VkIGFuZAo+PiBpdCBzdXBwb3J0cyBWRlBWNCB0aGVuIHlvdSBjYW4gZW5hYmxlOgo+PiBCUjJf
QVJNX0ZQVV9WRlBWNAo+PiAKPj4gYW5kIHNhbWUgY2FuIGdvIHdpdGggSDMgYmFzZWQgYm9hcmRz
IEkgdGhpbmsuCj4+IAo+PiBAWWFubiwgd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgZW5hYmxpbmcg
VkZQVjQgb24gYm9hcmRzIHdpdGggU29Dcwo+PiB0aGF0IHN1cHBvcnQgVkZQVjQ/IChub3QgTkVP
Ti9WRlBWNCBvZiBjb3Vyc2UpCj4gCj4gVXN1YWxseSwgZGVmY29uZmlncyBhcmUgdmVyeSBsaW1p
dGVkLCBhbmQgd2hhdCB3ZSBndWFyYW50ZWUgaXMgdmVyeQo+IGJhc2ljOiBhIGJvb3Rpbmcga2Vy
bmVsIHdpdGggYmFzaWMgZHJpdmVycywgYW5kIGJ1c3lib3gnIGxvZ2luIGFuZAo+IHNoZWxsLiBU
aGF0IGRvZXMgbm90IHVzZSBtdWNoIGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucywgc28gdGhh
dCB3b3VsZAo+IG5vdCBiZW5lZml0IG11Y2ggZnJvbSB1c2luZyBhICJiZXR0ZXIiIEZQVS4KPiAK
PiBJIHByZXZpb3VzbHkgcmVqZWN0ZWQgdGhlIGJpZyBzZXJpZXMgdGhhdCBidWxrLWNvbnZlcnRl
ZCBhbGwgZGVmY29uZmlncwo+IGluIG9uZSBnbywgYmVjYXVzZSB0aGF0IHdhcyBub3QgdGVzdGVk
IG9uIHJlYWwgaGFyZHdhcmUuCj4gCj4gQnV0IGZvciBhIGRlZmNvbmZpZyB0aGF0IHdhcyBhY3R1
YWxseSB0ZXN0ZWQgYWdhaW5zdCByZWFsIGhhcmR3YXJlLCBJCj4gdGhpbmsgaXQgaXMgT0sgdGhh
dCBpdCB1c2VzIGEgImJldHRlciIgRlBVLiBTbywgaWYgdGhlIHBpbmVjdWJlIGhhcyBhCj4gVkZQ
djQsIEJSMl9BUk1fRlBVX1ZGUFY0IG9yIEJSMl9BUk1fRlBVX1ZGUFY0X0QxNiBpcyBPSy4KPiAK
PiBBbHNvIG50ZSB0aGF0IEJSMl9BUk1fRlBVX1ZGUFY0IHdpbGwgbWFrZSB1c2Ugb2YgYWxsIHRo
ZSAzMiBmbGFvdGluZwo+IHBvaW50IHJlZ2lzdGVycywgaS5lLiB0aGUgZnVsbCByYW5nZSwgd2hp
bGUgQlIyX0FSTV9GUFVfVkZQVjRfRDE2IHdpbGwKPiBvbmx5IG1ha2UgdXNlIG9mIDE2IHJlZ2lz
dGVycy4gTm90IGFsbCBWRlB2NCBpbXBsZW1lbnRhdGlvbiBoYXZlIDMyCj4gcmVnaXN0ZXJzLCBz
byBjYXJlZnVsbHkgZW5hYmxlIHRoZSBhcHByb3ByaWF0ZSBvbmUgKF9EMTYgaXMgc2FmZSB0byB1
c2UKPiBpbiBlaXRoZXIgY2FzZSwgdGhvdWdoKS4KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9S
SU4uCj4gCj4gLS0gCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
