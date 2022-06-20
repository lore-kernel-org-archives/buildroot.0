Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86603C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F311E41925;
	Mon, 20 Jun 2022 21:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F311E41925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnHmqrwlFTbs; Mon, 20 Jun 2022 21:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9985241921;
	Mon, 20 Jun 2022 21:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9985241921
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9084E1BF398
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 776C383E5F
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 776C383E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id km1C4yLmco-A for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:25:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C04F83E63
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C04F83E63
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:25:17 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id p8so14887440oip.8
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hXBbtSmHAeoSFkDb9auk6kDTg/F1MZ497fEX4BJkK78=;
 b=fT4pSSvDAgTZEMOMLCiE/hHaJRc/6i6jGjAT/WVS+4txykhqnypF5qSKclh7DiJH8g
 nSKnopKzrKva5Rm3jN3eBXdf5om+fsYftDmA/MnfpHlMdhJ3r/opE/bbQ/M4c4jzA2Vp
 jOOnm+LMOIw8BfRpVvLkwylyj5OTJfAg8cAYqKrszcGIaG6BbFa7nHGu6ZGy88m+HaSU
 cPhSXx6Tw6RLU2g2wlDedzF5u248BDpsm0VOC/foZdSNYlW8/4fIzsN41SImXBUge5Wu
 8Zz5rrA1wkEsOHb/2hMNEA1dXFEBn2VjvjZ9encwBSjLc+nOtZVW0TjuzcURKlUIJiw2
 phhw==
X-Gm-Message-State: AJIora9MDOyNo54PUFv9cWIat7Hh7KGuhRom04wb+k2gK/B4gcyubak3
 EL0x6Rdrxh6l8Q9gjoFQvjwnQay4JHuzV2gb5D5ndkQXVwQ=
X-Google-Smtp-Source: AGRyM1v4lj9dz0F24EzzyFUE39XjAyiLBmzNphxaoDXXxBufpW9EkI+hw8OuNmf65KXESNhKGWZ7+wdOmzee3ksppOo=
X-Received: by 2002:a05:6808:d46:b0:32f:3447:edcf with SMTP id
 w6-20020a0568080d4600b0032f3447edcfmr12646401oik.148.1655760316320; Mon, 20
 Jun 2022 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20220620210856.771825-1-fontaine.fabrice@gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Jun 2022 23:22:26 +0200
Message-ID: <CAPi7W81oR4RwqWmFLq2M_EG-11N+B1sCOxhu_NT8xcTQnJ-ZCw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hXBbtSmHAeoSFkDb9auk6kDTg/F1MZ497fEX4BJkK78=;
 b=jV3rG8BiCNgoC/I90y23ojF6ojG9uPi9owqOd3Q5x4lGkwB5t5/PfU5PYvWmjW+JOM
 0F+bvipiWb2AaLaBpzXMFvIaBdSxvmASnnSA+bi1Uk+AR5FAwMuVeddqSsmKRkMvhnfd
 Hn7WeT5velmPMlmBWyuBcDHcEv/KtU7ZJbNlR476Cmpo/PsSbPpbI9pT4eehx1Up5Us/
 DBHKA8/iGQkM/6tNYvW9Ap/iy/Bhrmjz4tklXN+BW5dTGihcOwgexe06NrX2hkLVfxe7
 oPHtA7ED6PBxswpuqffG+gChfITh7xEFCFEQwFVA8DjtOKawGKDF0U8yky2vNah9fiNc
 bzfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jV3rG8Bi
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: fix
 xephyr build with kdrive
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQgYWxyZWFkeSBzZW50IHRoZSBzYW1lIHBhdGNoOgpodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNjIwMTg0OTI1LjUzODM0Mi0xLWJl
cm5kLmt1aGxzQHQtb25saW5lLmRlLwoKSSBjYW4gc2V0IHRoaXMgb25lIGFzIHN1cGVyc2VkZWQg
aG93ZXZlciBJIHdvdWxkIGFkdmlzZSB0byBvbmx5IGFkZAp0aG9zZSBkZXBlbmRlbmNpZXMgaWYg
QlIyX1BBQ0tBR0VfWFNFUlZFUl9YT1JHX1NFUlZFUl9YRVBIWVIgYW5kCkJSMl9QQUNLQUdFX1hT
RVJWRVJfWE9SR19TRVJWRVJfS0RSSVZFIGFyZSBzZXQuCkhlcmUgaXMgYW4gZXh0cmFjdCBvZiBj
b25maWd1cmUuYWM6CgppZiB0ZXN0ICIkS0RSSVZFIiA9IHllczsgdGhlbgogICAgWEVQSFlSX1JF
UVVJUkVEX0xJQlM9InhhdSB4ZG1jcCB4Y2IgeGNiLXNoYXBlIHhjYi1yZW5kZXIKeGNiLXJlbmRl
cnV0aWwgeGNiLWF1eCB4Y2ItaW1hZ2UgeGNiLWljY2NtIHhjYi1zaG0gPj0gMS45LjMKeGNiLWtl
eXN5bXMgeGNiLXJhbmRyIHhjYi14a2IiCgpMZSBsdW4uIDIwIGp1aW4gMjAyMiDDoCAyMzoxMiwg
RmFicmljZSBGb250YWluZQo8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IGEgw6ljcml0IDoK
Pgo+IEZpeCB0aGUgZm9sbG93aW5nIHhlcGh5ciBidWlsZCBmYWlsdXJlIHdpdGgga2RyaXZlIHJh
aXNlZCBzaW5jZSBjb21taXQKPiBlZWRiZDZmOTdkNTFhMDA0OWVjNTEyZGUyNjU0MTQ2NTQwM2Fi
MDZmOgo+Cj4gY2hlY2tpbmcgZm9yIFhFUEhZUi4uLiBubwo+IGNvbmZpZ3VyZTogZXJyb3I6IFBh
Y2thZ2UgcmVxdWlyZW1lbnRzICh4YXUgeGRtY3AgeGNiIHhjYi1zaGFwZSB4Y2ItcmVuZGVyIHhj
Yi1yZW5kZXJ1dGlsIHhjYi1hdXggeGNiLWltYWdlIHhjYi1pY2NjbSB4Y2Itc2htID49IDEuOS4z
IHhjYi1rZXlzeW1zIHhjYi1yYW5kciB4Y2IteGtiIHhjYi14dikgd2VyZSBub3QgbWV0Ogo+Cj4g
UGFja2FnZSAneGNiLXJlbmRlcnV0aWwnLCByZXF1aXJlZCBieSAndmlydHVhbDp3b3JsZCcsIG5v
dCBmb3VuZAo+IFBhY2thZ2UgJ3hjYi1hdXgnLCByZXF1aXJlZCBieSAndmlydHVhbDp3b3JsZCcs
IG5vdCBmb3VuZAo+IFBhY2thZ2UgJ3hjYi1pbWFnZScsIHJlcXVpcmVkIGJ5ICd2aXJ0dWFsOndv
cmxkJywgbm90IGZvdW5kCj4gUGFja2FnZSAneGNiLWljY2NtJywgcmVxdWlyZWQgYnkgJ3ZpcnR1
YWw6d29ybGQnLCBub3QgZm91bmQKPiBQYWNrYWdlICd4Y2Ita2V5c3ltcycsIHJlcXVpcmVkIGJ5
ICd2aXJ0dWFsOndvcmxkJywgbm90IGZvdW5kCj4KPiBGaXhlczoKPiAgLSBodHRwOi8vYXV0b2J1
aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iYWJhMjE4Yzg3OWI2N2JmYmFkYzljMjVkMzQzMTNh
YmM3NjM5N2JjCj4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvOTQ3
MWI3N2RiOWFlZmEyZmQwZTViZTYxZWE4NDcwOTE4MzUxMTYyMwo+Cj4gU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBh
Y2thZ2UveDExcjcveHNlcnZlcl94b3JnLXNlcnZlci9Db25maWcuaW4gICAgICAgICAgICAgIHwg
NCArKysrCj4gIHBhY2thZ2UveDExcjcveHNlcnZlcl94b3JnLXNlcnZlci94c2VydmVyX3hvcmct
c2VydmVyLm1rIHwgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveDExcjcveHNlcnZlcl94b3JnLXNlcnZlci9Db25m
aWcuaW4gYi9wYWNrYWdlL3gxMXI3L3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIvQ29uZmlnLmluCj4gaW5k
ZXggNGZiMDMwNTFkZC4uZGFmNGQ4MTcwMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3gxMXI3L3hz
ZXJ2ZXJfeG9yZy1zZXJ2ZXIvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS94MTFyNy94c2VydmVy
X3hvcmctc2VydmVyL0NvbmZpZy5pbgo+IEBAIC04NSw2ICs4NSwxMCBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfWFNFUlZFUl9YT1JHX1NFUlZFUl9YVkZCCj4KPiAgY29uZmlnIEJSMl9QQUNLQUdFX1hT
RVJWRVJfWE9SR19TRVJWRVJfWEVQSFlSCj4gICAgICAgICBib29sICJYZXBoeXIgc2VydmVyIgo+
ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1hDQl9VVElMX0lNQUdFIGlmIEJSMl9QQUNLQUdF
X1hTRVJWRVJfWE9SR19TRVJWRVJfS0RSSVZFCj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
WENCX1VUSUxfS0VZU1lNUyBpZiBCUjJfUEFDS0FHRV9YU0VSVkVSX1hPUkdfU0VSVkVSX0tEUklW
RQo+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1hDQl9VVElMX1JFTkRFUlVUSUwgaWYgQlIy
X1BBQ0tBR0VfWFNFUlZFUl9YT1JHX1NFUlZFUl9LRFJJVkUKPiArICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9YQ0JfVVRJTF9XTSBpZiBCUjJfUEFDS0FHRV9YU0VSVkVSX1hPUkdfU0VSVkVSX0tE
UklWRQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBYZXBoeXIgbmVzdGVkIFggc2VydmVyOyBz
dWNjZXNzb3IgdG8gWG5lc3QuCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94MTFyNy94c2VydmVy
X3hvcmctc2VydmVyL3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIubWsgYi9wYWNrYWdlL3gxMXI3L3hzZXJ2
ZXJfeG9yZy1zZXJ2ZXIveHNlcnZlcl94b3JnLXNlcnZlci5tawo+IGluZGV4IDBmMTc3OWRjYWIu
LmZhNWQyYTgwMmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94MTFyNy94c2VydmVyX3hvcmctc2Vy
dmVyL3hzZXJ2ZXJfeG9yZy1zZXJ2ZXIubWsKPiArKysgYi9wYWNrYWdlL3gxMXI3L3hzZXJ2ZXJf
eG9yZy1zZXJ2ZXIveHNlcnZlcl94b3JnLXNlcnZlci5tawo+IEBAIC04NCw2ICs4NCwxMyBAQCBY
U0VSVkVSX1hPUkdfU0VSVkVSX0NPTkZfT1BUUyArPSBcCj4gICAgICAgICAtLWRpc2FibGUtZ2x4
IFwKPiAgICAgICAgIC0tZGlzYWJsZS1kcmkKPgo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1hTRVJW
RVJfWE9SR19TRVJWRVJfWEVQSFlSKSx5KQo+ICtYU0VSVkVSX1hPUkdfU0VSVkVSX0RFUEVOREVO
Q0lFUyArPSBcCj4gKyAgICAgICB4Y2ItdXRpbC1pbWFnZSBcCj4gKyAgICAgICB4Y2ItdXRpbC1r
ZXlzeW1zIFwKPiArICAgICAgIHhjYi11dGlsLXJlbmRlcnV0aWwgXAo+ICsgICAgICAgeGNiLXV0
aWwtd20KPiArZW5kaWYKPiAgZWxzZSAjIG1vZHVsYXIKPiAgWFNFUlZFUl9YT1JHX1NFUlZFUl9D
T05GX09QVFMgKz0gLS1kaXNhYmxlLWtkcml2ZQo+ICBlbmRpZgo+IC0tCj4gMi4zNS4xCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
