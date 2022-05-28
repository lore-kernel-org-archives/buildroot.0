Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55080C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35C641A3E;
	Sat, 28 May 2022 20:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EUaqp3z4KAb; Sat, 28 May 2022 20:26:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A534199F;
	Sat, 28 May 2022 20:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 675301BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F67C4199F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyjAQt3JdGJx for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D4AF4199D
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:26:02 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so9687259fac.12
 for <buildroot@buildroot.org>; Sat, 28 May 2022 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ySaP2AxwnA5SrcxW8WEo1ybEwlDZGWnJsXs8F7qxYPw=;
 b=d6nC2wTDkrtIZ+/1LdqZLqPA5xtri3KHkeUOOCuMhrwTMEVI0RTTRjXrs67pNA6eBW
 T0nT7WY2XRuEHyvKXK7R9OoJ1rWTbxoq4mfWSxrGb2iIuS0xDI9IuKOLjgmxVRHzIgmJ
 so0NBUpfmAq97Tgowyhrmqtpn2kJraHUS2x8VWKrzK/5tOV6PWrH0S6efY+rWOAkA3Ys
 yX397ZB0dm2+5S7u+ni5D8FkX0uLM8WT2hToDAqt4DqJuCyRYrXEfoB0ADI+4KnVjfOW
 +5/ODbdXU2dazQYBNThmFYqsY1PwEdiG6x4pMDetv0NaFCWB7VqkqiNQpko2y2UjuGd+
 R2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ySaP2AxwnA5SrcxW8WEo1ybEwlDZGWnJsXs8F7qxYPw=;
 b=qA1nXUhHt3cO9S4Xl0RATjXIMfF6avSEQ9Ak+VaU8buAuAI3D9uU6FtfiU42/X/rHG
 S9Es08KwsNFXlN3IUZbhqwLUjyF48ISatU8DOwjgGS1TRmZBlDkjEJYBS+bII6VB39cf
 zQJzCxrkfJm51nXj+trc6hw87aB2tD5aNo/lvlu0zf+crl6AxwcJDvJipXSJhO/En1hz
 LOgk3DuqHmuNjUApVhhv7uTHRFR3ZPnQOb+hlbuYWLXb+3ZgJPPC/5aYd//Zy4bcwrL1
 Lk8i5Ed1VkSP4/SDt3s8w/oYOfvvQF4/87Xv8u2H/auhdeh5wwBoqU/DMQzWRVU9ay8Q
 ICFg==
X-Gm-Message-State: AOAM532Txsq4tsl3Tulg+OnsRavst69oPF/kyXIzqOQMVudguoxlKpxu
 EvYF856fHisb3mATHYVROh+d3XjlaHGGXrDW+qg=
X-Google-Smtp-Source: ABdhPJzwne1Na7murwu46xHfpartUhFbxywW5zsyDYQhf0MBrwPE5w3hhOwYCvrcxxnfzr+t0mkHyxUsgGw5YRAgFZg=
X-Received: by 2002:a05:6870:5687:b0:f1:88fc:d7a1 with SMTP id
 p7-20020a056870568700b000f188fcd7a1mr6866419oao.228.1653769561141; Sat, 28
 May 2022 13:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220527204250.1748549-1-fontaine.fabrice@gmail.com>
 <20220528190053.GA853048@scaer>
In-Reply-To: <20220528190053.GA853048@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 May 2022 22:23:30 +0200
Message-ID: <CAPi7W82QOe-xNgYfUTOe7-RDtUMf=xsH-3cANXDvNRkRVL0LzA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/pcsc-lite: needs gcc >= 4.9
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
Cc: Simon Dawson <spdawson@gmail.com>, Juha Rantanen <juha@codercoded.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiAyOCBtYWkgMjAyMiDDoCAyMTowMCwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IE9uIDIwMjItMDUtMjcgMjI6NDIgKzAyMDAsIEZh
YnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gZ2NjID49IDQuOSBpcyBuZWVkZWQgc2lu
Y2UgYnVtcCB0byB2ZXJzaW9uIDEuOS42IGluIGNvbW1pdAo+ID4gYjAyZjEzY2Q1NDkxMmYzZGZm
ZDBlMDg2MzM3ODA1MDEwNDQzMGQ3NyBhbmQKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9MdWRvdmlj
Um91c3NlYXUvUENTQy9jb21taXQvZDU2ZWQxOGRiZWJjNDQyMzUwNmNlN2Y2MWQzZTNiY2Y0YmRj
NGNiMDoKPiA+Cj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gd2luc2NhcmRfY2xudC5jOjEyMzow
Ogo+ID4gcmVhZGVyZmFjdG9yeS5oOjEwMTozOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ19B
dG9taWMnCj4gPiAgICBfQXRvbWljIERXT1JEIGR3RXZlbnRTdGF0dXM7IC8qKjwgUmVjZW50IGV2
ZW50IHRoYXQgbXVzdCBiZSBzZW50ICovCj4gPiAgICBeCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8xODlmMDMwYTIyNTJmMTdhYmY4
YjgxOWZlZWMwMDAzODE1YzY2ZTc5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiBbLS1TTklQLS1dCj4g
PiBpbmRleCBlYWQ2MWU0NTI5Li4zNjg2ZjU3MGE5IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9s
aWJuZmMvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL2xpYm5mYy9Db25maWcuaW4KPiA+IEBA
IC0xMywxMyArMTMsMTUgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQk5GQ19BQ1IxMjJfUENTQwo+
ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgcGNzYy1saXRl
Cj4gPiAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgcGNzYy1saXRlCj4gPiAgICAgICBk
ZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBwY3NjLWxpdGUKPiA+ICsgICAgIGRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85ICMgcGNzYy1saXRlCj4KPiBsaWJuZmMg
aW4gdHVybiBpcyBzZWxlY3RlZCBieSBsaWJmcmVlZmFyZSwgbGlibGxjcCwgbGlicGFtLW5mYywg
YW5kCj4gbWZvYy4gVGhpcyBuZXcgZ2NjIGRlcGVuZGVuY3kgbXVzdCBiZSBwcm9wYWdhdGVkIHRv
IHRob3NlIHBhY2thZ2VzLgoKcGNzYy1saXRlIGlzIG9ubHkgbmVlZGVkIGJ5IGxpYm5mYydzIGFj
cjEyMl9wY3NjIGRyaXZlciBhbmQgbm8gcGFja2FnZQppcyBzZWxlY3RpbmcgQlIyX1BBQ0tBR0Vf
TElCTkZDX0FDUjEyMl9QQ1NDLgoKPgo+IEZvcnR1bmF0ZWx5LCBub25lIG9mIHRob3NlIHBhY2th
Z2VzIGhhdmUgcmV2ZXJzZSBkZXBlbmRlbmNpZXMgdGhhdAo+IHNlbGVjdCB0aGVtLCBzbyBpdCdz
IGEgb25lLWxldmVsLWRlZXAgY2hhaW4uCj4KPiBDYW4geW91IHJlc3BpbiwgcGxlYXNlPwoKQXMg
ZXhwbGFpbmVkIGFib3ZlLCBJTUhPIG5vIHVwZGF0ZSBpcyBuZWVkZWQgb24gdGhpcyBwYXRjaC4K
Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICAgICAgIHNlbGVjdCBCUjJfUEFD
S0FHRV9QQ1NDX0xJVEUKPiA+ICAgICAgIGhlbHAKPiA+ICAgICAgICAgc3VwcG9ydCBmb3IgYWNy
MTEyX3Bjc2MgZHJpdmVyCj4gPgo+ID4gLWNvbW1lbnQgImFjcjEyMl9wY3NjIGRyaXZlciBuZWVk
cyBhIHRvb2xjaGFpbiB3LyB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnkiCj4gPiArY29tbWVudCAi
YWNyMTIyX3Bjc2MgZHJpdmVyIG5lZWRzIGEgdG9vbGNoYWluIHcvIHRocmVhZHMsIGR5bmFtaWMg
bGlicmFyeSwgZ2NjID49IDQuOSIKPiA+ICAgICAgIGRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiA+
IC0gICAgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgQlIyX1NUQVRJ
Q19MSUJTCj4gPiArICAgICBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8
IEJSMl9TVEFUSUNfTElCUyB8fCBcCj4gPiArICAgICAgICAgICAgICFCUjJfVE9PTENIQUlOX0dD
Q19BVF9MRUFTVF80XzkKPiA+Cj4gPiAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQk5GQ19BQ1IxMjJf
VVNCCj4gPiAgICAgICBib29sICJhY3IxMjJfdXNiIGRyaXZlciIKPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3Bjc2MtbGl0ZS9Db25maWcuaW4gYi9wYWNrYWdlL3Bjc2MtbGl0ZS9Db25maWcuaW4K
PiA+IGluZGV4IDFiNGQwZjdkMTguLmY0ZWQ1YmEyZjAgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L3Bjc2MtbGl0ZS9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2thZ2UvcGNzYy1saXRlL0NvbmZpZy5p
bgo+ID4gQEAgLTMsNiArMyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QQ1NDX0xJVEUKPiA+ICAg
ICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwo+ID4gICAgICAgZGVwZW5k
cyBvbiBCUjJfVVNFX01NVSAjIGZvcmsoKQo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJ
Q19MSUJTCj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRf
OSAjIF9BdG9taWMga2V5d29yZAo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBNaWRkbGV3YXJl
IHRvIGFjY2VzcyBzbWFydCBjYXJkIHVzaW5nIFNDYXJkIEFQSSAoUEMvU0MpLgo+ID4KPiA+IEBA
IC0zMyw2ICszNCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QQ1NDX0xJVEVfRU1CRURERUQKPiA+
Cj4gPiAgZW5kaWYKPiA+Cj4gPiAtY29tbWVudCAicGNzYy1saXRlIG5lZWRzIGEgdG9vbGNoYWlu
IHcvIHRocmVhZHMsIGR5bmFtaWMgbGlicmFyeSIKPiA+ICtjb21tZW50ICJwY3NjLWxpdGUgbmVl
ZHMgYSB0b29sY2hhaW4gdy8gdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5LCBnY2MgPj0gNC45Igo+
ID4gICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ID4gLSAgICAgZGVwZW5kcyBvbiAhQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBCUjJfU1RBVElDX0xJQlMKPiA+ICsgICAgIGRlcGVu
ZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgQlIyX1NUQVRJQ19MSUJTIHx8IFwK
PiA+ICsgICAgICAgICAgICAgIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQo+ID4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvc3Ryb25nc3dhbi9Db25maWcuaW4gYi9wYWNrYWdlL3N0cm9uZ3N3
YW4vQ29uZmlnLmluCj4gPiBpbmRleCA0MzA2MjVhMTAyLi45MTljZTFmNWJjIDEwMDY0NAo+ID4g
LS0tIGEvcGFja2FnZS9zdHJvbmdzd2FuL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9zdHJv
bmdzd2FuL0NvbmZpZy5pbgo+ID4gQEAgLTEwOCw5ICsxMDgsMTMgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX1NUUk9OR1NXQU5fRUFQX1NJTV9GSUxFCj4gPiAgY29uZmlnIEJSMl9QQUNLQUdFX1NUUk9O
R1NXQU5fRUFQX1NJTV9QQ1NDCj4gPiAgICAgICBib29sICJFbmFibGUgRUFQLVNJTSBzbWFydCBj
YXJkIGJhY2tlbmQiCj4gPiAgICAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBwY3Nj
LWxpdGUKPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85
ICMgcGNzYy1saXRlCj4gPiAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUENTQ19MSVRFCj4gPiAg
ICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfU1RST05HU1dBTl9FQVBfU0lNCj4gPgo+ID4gK2NvbW1l
bnQgIkVBUC1TSU0gc21hcnQgYmFja2VuZCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxp
YnJhcnksIGdjYyA+PSA0LjkiCj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUyB8
fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF85Cj4gPiArCj4gPiAgY29uZmlnIEJSMl9Q
QUNLQUdFX1NUUk9OR1NXQU5fRUFQX0FLQQo+ID4gICAgICAgYm9vbCAiRW5hYmxlIEVBUC1BS0Ei
Cj4gPiAgICAgICBkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfU1RST05HU1dBTl9FQVAgIyBsZWdh
Y3kKPiA+IC0tCj4gPiAyLjM1LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
