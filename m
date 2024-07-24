Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C3C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 10:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E63181455;
	Wed, 24 Jul 2024 10:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J72_NdkNny3X; Wed, 24 Jul 2024 10:58:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD06813F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD06813F3;
	Wed, 24 Jul 2024 10:58:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0AF31BF284
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 10:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EADD0608B8
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 10:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8XPBrjde3Yv for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 10:58:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E00760637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E00760637
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E00760637
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 10:58:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.120]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvrB-1s5BYa0SPV-00qH4X; Wed, 24
 Jul 2024 12:58:01 +0200
Message-ID: <475db7e5-b2e8-40e9-9547-73b545a33509@gmx.de>
Date: Wed, 24 Jul 2024 12:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jos=C3=A9_Mendes?= <jp.baltazar.mendes@gmail.com>,
 buildroot@buildroot.org
References: <CAFAK9+cph-594kM4jz+4zYV3zTkQZa22o9OwQpsaFBrCrL598g@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CAFAK9+cph-594kM4jz+4zYV3zTkQZa22o9OwQpsaFBrCrL598g@mail.gmail.com>
X-Provags-ID: V03:K1:HsiWeu8gSqRe1ZWNE+poEvtbIbwfi+Rb5NXBQxvGLDtHylFI9T6
 Hm9DK4StOViKVV/pNOh1KbSgyMfS78R6IY3q3Y6z6rmm0QwiyAqI04rf3FzR0eExVi2opjW
 xoQWXbkxgUjf67gnu/tNfinNzkBbWKaMelT+Is2P3rt0XKF8qpjq9doBSuoD05pyL53N2aT
 RJtlb+LSZ4jKTR3XoAhMg==
UI-OutboundReport: notjunk:1;M01:P0:ocxzl0L7QuA=;WxTRe0RV1Xh5GeLGzZJt2BCooSQ
 yqwYPPNpV7RZav/Brs6RDaIt1BjbOgjMEhuwlQ/JWL3rKj+L3vQ67yeRlaiLls2+ZR+OMP4rN
 Y2JePIge1o9XiD0lkkMOxe0owWy0UM+0LHzxpZZbp0sqro8drYJZX4/2GchKCDp+C/nMkPa3P
 kr84tcAC6pPkrzsUynLKVhZNrwVt3/jO2JkF8IWYuMZbeQDuTtSgyM162BMmZV02Jq8+m+NzS
 nnw+yZ7QvIXYlT/SW3lHxJS4XCbE/LHkucitlPirx2Iod3QLLqUKyPIkhUyeUi7Tz1XtsBIhS
 YOyLbwUCYScyOCFTESGcUC0KHZ9HvS+3WR2YonJ3wgWbR4sNhP8KS7HaUGmXmYyjv/jZ3nx5U
 P0/o6HrwGSNX0HC5yFW6l6rDBcU6xf2OQaQXPnCNIdmMej2XJiLJ3ZftBQqSZd0rR76ATyA+f
 80WW0t6bYGLkFX1fGHYD33Amo8/nhXJmoAm4VRspTIv5NyBK2F4xPxo5KHETxa4+riq8QtGkj
 xu1aGep7W9HwgrmfXzkey1SzfFjOiSdCE5VAR15D14Mz9P0uA6CJ5H0s8ImKentGLPEJncGS1
 vzk1GBZc6bEeuy1f3jeZuPKht1PX081weZD6BUkpj84422/PKwuV/HaxgDXuh29aagl1nzJw3
 B88yg4cBdnBgipG8hofhPj//kLsTo6jxFD8Ya/2Gpx7uuN1FCIypfbo0vl6yo87eY+hTxW34P
 Un/kvDq/zCmNr0DUWe5vYdIqnRmTVPqqwosTmPdKTwC8TZbdaP+cHVQiYm6syxb/6actb9rY0
 ZEqHyqH2MBh4KQsJROZQgPMw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721818681; x=1722423481; i=fiona.klute@gmx.de;
 bh=5S9a2V+EnJ2rvIRtOVk2IdybJMaO4K/EX3yy0z6YXs8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=G9HiMWuOarajXBLR4RVB2qJomQGgcgHn619eSJ/SPN8knW7JXz7J4dPe+/ZI+qsu
 +vqi21edPLpRbB6atiFGnWqm561Vgs+X8yMHeGCBjtjGywQLzQb0lQvQ024ihKqij
 ZtmESAWecWKeEBQRIDxmV/DPO/oTUx5lor3+Uc2OkQVUqw9NN7GgS0GmfDD/KvdPg
 5KkDY+HdS+hl08gJiqrHSpb2+pG4zFHNlSQPbcw4ZQ3vUj/t7iw+fsOb4OhT+NdDR
 uTv2SAtAg/g4impU8CUbfgD1R+16BAs9SvuE60cl1dZhr/uCELFu7F3Msa24Aan6z
 DogIetgzcttGpDsZdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=G9HiMWuO
Subject: Re: [Buildroot] RaspberryPi U-Boot watchdog
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9zw6khCgpBbSAyNC4wNy4yNCB1bSAxMjoxNiBzY2hyaWViIEpvc8OpIE1lbmRlczoKPiBI
aSBhbGwsCj4KPiBJJ20gdHJ5aW5nIHRvIGJ1aWxkIGEgc3lzdGVtIHdpdGggcmVkdW5kYW50IHJv
b3RmcyBwYXJ0aXRpb25zIGZvciBhCj4gUmFzcGJlcnJ5IFBpIDQgd2l0aCBVLUJvb3QuCj4KPiBJ
J20gdHJ5aW5nIHRvIHRlc3QgdGhlIHJlY292ZXJ5IG9mIHRoaXMgc3lzdGVtIGJ1dCBJIGNhbid0
IHNlZW0gdG8gZ2V0IHRoZQo+IHJhc3BiZXJyeSBwaSB0byByZXNldCBhZnRlciBhIGtlcm5lbCBw
YW5pYyBvbiBhIG5vbi13b3JraW5nIHJvb3Rmcy4KPgo+IFRvIHByb3Zva2UgdGhpcyBrZXJuZWwg
cGFuaWMgSSBhbSBzaW1wbHkgZGVsZXRpbmcgYWxsIHRoZSBmaWxlcyBpbiB0aGUKPiBwYXJ0aWN1
bGFyIHJvb3Rmcy4gVGhlIHN5c3RlbSBzZWVtcyB0byBqdXN0IGhhbmcgdGhlcmUgYWZ0ZXIgdGhl
IHBhbmljOgo+Cj4gLi4uLi4KPiBbICAgIDMuMzc0MjczXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3lu
Y2luZzogTm8gd29ya2luZyBpbml0IGZvdW5kLiAgVHJ5Cj4gcGFzc2luZyBpbml0PSBvcHRpb24g
dG8ga2VybmVsLiBTZWUgTGludXgKPiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2luaXQucnN0
IGZvciBndWlkYW5jZS4KPiBbICAgIDMuMzg4NDQ0XSBDUFU6IDMgUElEOiAxIENvbW06IHN3YXBw
ZXIvMCBOb3QgdGFpbnRlZCA2LjEuNjEtdjggIzIKPiBbICAgIDMuMzk0NjI3XSBIYXJkd2FyZSBu
YW1lOiBSYXNwYmVycnkgUGkgNCBNb2RlbCBCIFJldiAxLjUgKERUKQo+IFsgICAgMy40MDA0NTZd
IENhbGwgdHJhY2U6Cj4gWyAgICAzLjQwMjg5N10gIGR1bXBfYmFja3RyYWNlLnBhcnQuMCsweGU4
LzB4MTAwCj4gWyAgICAzLjQwNzI2NF0gIHNob3dfc3RhY2srMHgyMC8weDMwCj4gWyAgICAzLjQx
MDU3OV0gIGR1bXBfc3RhY2tfbHZsKzB4ODgvMHhiNAo+IFsgICAgMy40MTQyNDZdICBkdW1wX3N0
YWNrKzB4MTgvMHgzNAo+IFsgICAgMy40MTc1NjFdICBwYW5pYysweDFhMC8weDM3MAo+IFsgICAg
My40MjA2MThdICBrZXJuZWxfaW5pdCsweDEzOC8weDE0MAo+IFsgICAgMy40MjQxOTddICByZXRf
ZnJvbV9mb3JrKzB4MTAvMHgyMAo+IFsgICAgMy40Mjc3NzZdIFNNUDogc3RvcHBpbmcgc2Vjb25k
YXJ5IENQVXMKPiBbICAgIDMuNDMxNzAxXSBLZXJuZWwgT2Zmc2V0OiAweDEzNTNjMDAwMDAgZnJv
bSAweGZmZmZmZmMwMDgwMDAwMDAKPiBbICAgIDMuNDM3NjE3XSBQSFlTX09GRlNFVDogMHgwCj4g
WyAgICAzLjQ0MDQ5Ml0gQ1BVIGZlYXR1cmVzOiAweDgwMDAwLDIwMTNjMDgwLDAwMDA0MjFiCj4g
WyAgICAzLjQ0NTM2OF0gTWVtb3J5IExpbWl0OiBub25lCj4gWyAgICAzLjQ0ODQyM10gLS0tWyBl
bmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE5vIHdvcmtpbmcgaW5pdCBmb3VuZC4KPiBU
cnkgcGFzc2luZyBpbml0PSBvcHRpb24gdG8ga2VybmVsLiBTZWUgTGludXgKPiBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2luaXQucnN0IGZvciBndWlkYW5jZS4gXS0tLQo+Cj4gV2hhdCBJJ3Zl
IHRyaWVkOgo+IC0gRnJvbSBgVGFyZ2V0IHBhY2thZ2VzYDogd2F0Y2hkb2csIHdhdGNoZG9nZAo+
IC0gQnVzeWJveCB3YXRjaGRvZwo+IC0gRnJvbSBsaW51eC1tZW51Y29uZmlnID4gZGV2aWNlIGRy
aXZlcnMgPiB3YXRjaGRvZwo+IC0gRnJvbSB1Ym9vdC1tZW51Y29uZmlnID4gZGV2aWNlIGRyaXZl
cnMgPiB3YXRjaGRvZwo+Cj4gTm9uZSBvZiB0aGVzZSBzZWVtIHRvIGJlIHdvcmtpbmcgZm9yIG1l
LgoKVGhlIGNvbmZpZyBvcHRpb25zIGluIG1lbnVjb25maWcgKGJvdGggZm9yIFUtQm9vdCBhbmQg
TGludXgpIG9ubHkgZW5hYmxlCnRoZSBkcml2ZXJzIHRvIHN1cHBvcnQgdGhlIHdhdGNoZG9nLiBU
aGUga2VybmVsIGNhbiBoYW5kbGUgd2F0Y2hkb2dzCmludGVybmFsbHkgKHNlZSBDT05GSUdfV0FU
Q0hET0dfSEFORExFX0JPT1RfRU5BQkxFRCBhbmQKQ09ORklHX1dBVENIRE9HX09QRU5fVElNRU9V
VCBpbiB0aGUga2VybmVsIGNvbmZpZyksIGJ1dCBnZW5lcmFsbHkgeW91CndhbnQgdGhhdCBvbmx5
IGFzIGEgdHJhbnNpdG9yeSB0aGluZyBkdXJpbmcgYm9vdCBiZWZvcmUgYSB3YXRjaGRvZwpzZXJ2
aWNlICh3aGV0aGVyIHdhdGNoZG9nZCBvciBCdXN5Ym94IHdhdGNoZG9nKSB0YWtlcyBvdmVyLgoK
SWYgeW91IHdhbnQgdGhlIHdhdGNoZG9nIHRvIHJlc2V0IG5vIG1hdHRlciBob3cgYnJva2VuIHRo
ZSBrZXJuZWwgb3IKdXNlcnNwYWNlIG1heSBiZSwgZW5hYmxlIHRoZSB3YXRjaGRvZyBpbiBVLUJv
b3QgKmJlZm9yZSogc3RhcnRpbmcgdGhlCmtlcm5lbCB1c2luZyB0aGUgIndkdCIgY29tbWFuZDoK
aHR0cHM6Ly9kb2NzLnUtYm9vdC5vcmcvZW4vbGF0ZXN0L3VzYWdlL2NtZC93ZHQuaHRtbAoKRXhj
ZXJwdCBmcm9tIG15IGJvb3Quc2NyIHRoYXQgY29uZmlndXJlcyB0aGUgd2F0Y2hkb2cgb2YgYW4g
UlBpIENNNCAoc28sCnRoZSBkZXZpY2UgbWF5IGJlIGRpZmZlcmVudCBmb3IgeW91LCBhbmQgeW91
IG5lZWQgdGhlIG1hdGNoaW5nIGRyaXZlcgplbmFibGVkIGluIHRoZSBVLUJvb3QgY29uZmlnKSB0
byBleHBlY3QgYSBwZXQgZXZlcnkgMTUgc2Vjb25kczoKCndkdCBkZXYgd2F0Y2hkb2dAN2UxMDAw
MDAKd2R0IHN0YXJ0IDE1MDAwCgpPZiBjb3Vyc2UgdGhlIHN5c3RlbSB0aGVuIG5lZWRzIHRvIGJv
b3QgdXAgZmFyIGVub3VnaCB0byBoYW5kbGUgdGhlCndhdGNoZG9nIGJlZm9yZSB0aGF0IHRpbWUg
aXMgb3Zlci4KCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
