Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFA3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 17:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A62940B1A;
	Tue, 12 Apr 2022 17:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrCENRlkfzWF; Tue, 12 Apr 2022 17:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A95BB40B16;
	Tue, 12 Apr 2022 17:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA64E1BF865
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 17:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77EA40B16
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 17:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZE0g2HtJu11r for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 17:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96C03400FF
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 17:02:56 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r13so38609515ejd.5
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rvDYIYrxzE1qU2G7WavqT6yYexKocFEuHJT9EkEXokg=;
 b=qxXd+PMJI8Rb7pOMhpJAnfc535LhRkn0WcKBX+W7NHJfbArrdMmTePiYTE94O7sw6P
 M8+AQM0fyAu47Jtw2gQFSMxCQrzmKw/ptC15O6oBfOy6EzvBXPj0l1Brw9nCYfvowQty
 cyQPqtJsvAW2/JsXs2furt7FPL3J7r/4V3Qx3bGRHR134mhdE3ZwhTsJyFJoDo3ZNVVr
 PIQMOTEdtV0UxIyszJdGiSs9M/8YmB04DnDQ+r3NO2zVPKmraBvF8M4nUsOVGmgXl4eG
 ym9dxef4oKV+4qvlGFIVSEJCYokEaJnU7BQPV5O4yvNKPSUXdKhPwml9psSCwqWtOjEf
 KRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rvDYIYrxzE1qU2G7WavqT6yYexKocFEuHJT9EkEXokg=;
 b=rIbPje+l3EaJJiT2Bq1vTmSmZusmtI6GOCUlQEAA0EavtotbTHlV9w2ZSbRauPMryA
 Qk6l6jYA+caXjbBUkkpJ5p5LZTNYxWk5HJeREmoDyoTJB4XfSa6aAwrhsDem1Rr1xtRm
 G+uo/lUYcTpm2sU3fBSq+rCR3gfsbDP8xgYFDm7nL7eGLfLbRta3F0hjYBgcQpvX/Iz/
 tAzH0Ny8dJ/nN/T0xtGBnig0ktZEg3bFnEMaEWg0UHRUgNpZIBg5aULU4s4p5y5Kdjnb
 Urbzdq8pFPmduWiXj+sXHSMHFX8FLvwPuixqKn5/22a+2VFXUztRscHyiudXbEWyEnY/
 8RNg==
X-Gm-Message-State: AOAM533kQmVcIuvZf0m0X1KEjvz/4hXB+qyG7w75wF3GLbdSL63/R6FU
 qeYe7QofeBr/GNoadKqwTvtBYFlSbSVnohvMbAw=
X-Google-Smtp-Source: ABdhPJy4l7hqF4xky/Zi9I9vSQB91twnx5AZIhmXVqt97YXnjagC0iJSiC/wcG5CIHz7XQQSOY6PrBbE7c9NGN3SWo8=
X-Received: by 2002:a17:906:54e:b0:6e8:94b3:4563 with SMTP id
 k14-20020a170906054e00b006e894b34563mr9525950eja.505.1649782974663; Tue, 12
 Apr 2022 10:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220412062810.8567-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20220412062810.8567-1-jose.pekkarinen@unikie.com>
Date: Tue, 12 Apr 2022 19:02:43 +0200
Message-ID: <CAGm1_ktFve3YVRWy_MzYiY50OwtNrzohEV-=J6-2b8qjwUfBSg@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH] Add overrides configuration option
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Mika Joenpera <mika.joenpera@unikie.com>,
 Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9zw6ksCgpwbGVhc2UgY2hhbmdlIHRoZSBwYXRjaCB0aXRsZSB0byBzb21ldGhpbmcgbGlr
ZSB0aGlzOgoKcGFja2FnZS93cGFfc3VwcGxpY2FudDogYWRkIG92ZXJyaWRlcyBjb25maWd1cmF0
aW9uIG9wdGlvbgoKT24gVHVlLCBBcHIgMTIsIDIwMjIgYXQgODoyOCBBTSBKb3PDqSBQZWtrYXJp
bmVuCjxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBNaWthIEpv
ZW5wZXJhIDxtaWthLmpvZW5wZXJhQHVuaWtpZS5jb20+Cj4KPiBPdmVycmlkZXMgY29uZmlncmF0
aW9uIG9wdGlvbiBlbmFibGVkIHRocm91Z2gKCnMvY29uZmlncmF0aW9uL2NvbmZpZ3VyYXRpb24K
Cj4gd3BhX3N1cHBsaWNhbnQgY29uZmlndXJhdGlvbiBmaWxlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
TWlrYSBKb2VucGVyYSA8bWlrYS5qb2VucGVyYUB1bmlraWUuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEpvc8OpIFBla2thcmluZW48am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4gIHBh
Y2thZ2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluICAgICAgICAgfCAgNyArKysrKysrCj4gIHBh
Y2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsgfCAxMCArKysrKysrKysrCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC9Db25m
aWcuaW4KPiBpbmRleCA4ZjA5NWNkZjJkLi5iYjRiNzg0MzNlIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvd3BhX3N1cHBsaWNhbnQvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS93cGFfc3VwcGxpY2Fu
dC9Db25maWcuaW4KPiBAQCAtODQsNiArODQsMTMgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dQQV9T
VVBQTElDQU5UX01FU0hfTkVUV09SS0lORwo+ICAgICAgICAgICBFbmFibGUgc3VwcG9ydCBmb3Ig
b3BlbiBhbmQgc2VjdXJlZCBtZXNoIG5ldHdvcmtpbmcKPiAgICAgICAgICAgKElFRUUgODAyLjEx
cykKPgo+ICtjb25maWcgQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfT1ZFUlJJREVTCj4gKyAg
ICAgICBib29sICJFbmFibGUgSFQvVkhUIG92ZXJyaWRlcyIKPiArICAgICAgIGhlbHAKPiArICAg
ICAgICAgRW5hYmxlIHdwYV9zdXBwbGljYW50IG92ZXJyaWRlcyBmb3IgSFQgYW5kIFZIVCAoZGlz
YWJsZQo+ICsgICAgICAgICBIVC9IVDQwLCBtYXNrIE1DUyByYXRlcywgZXRjLikgaW4gd3BhX3N1
cHBsaWNhbnQKPiArICAgICAgICAgY29uZmlndXJhdGlvbiBmaWxlLgo+ICsKPiAgY29uZmlnIEJS
Ml9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX0FVVE9TQ0FOCj4gICAgICAgICBib29sICJFbmFibGUg
YXV0b3NjYW4iCj4gICAgICAgICBoZWxwCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBs
aWNhbnQvd3BhX3N1cHBsaWNhbnQubWsgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBw
bGljYW50Lm1rCj4gaW5kZXggM2MwYjBjMWRmYy4uYjlkYTZjMGM2ZCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCj4gKysrIGIvcGFja2FnZS93
cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tawo+IEBAIC0xMTAsNiArMTEwLDE2IEBAIGVs
c2UKPiAgV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgKz0gQ09ORklHX01FU0gKPiAgZW5k
aWYKPgo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX09WRVJSSURFUykseSkK
PiArV1BBX1NVUFBMSUNBTlRfQ09ORklHX0VOQUJMRSArPSBcCj4gKyAgICAgICBDT05GSUdfSFRf
T1ZFUlJJREVTIFwKPiArICAgICAgIENPTkZJR19WSFRfT1ZFUlJJREVTCgpEb2VzIGl0IG1ha2Ug
c2Vuc2UgdG8gYWxzbyBlbmFibGUgQ09ORklHX0hFX09WRVJSSURFUz8KClJlZ2FyZHMsClllZ29y
Cgo+ICtlbHNlCj4gK1dQQV9TVVBQTElDQU5UX0NPTkZJR19ESVNBQkxFICs9IFwKPiArICAgICAg
IENPTkZJR19IVF9PVkVSUklERVMgXAo+ICsgICAgICAgQ09ORklHX1ZIVF9PVkVSUklERVMKPiAr
ZW5kaWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfQVVUT1NDQU4p
LHkpCj4gIFdQQV9TVVBQTElDQU5UX0NPTkZJR19FTkFCTEUgKz0gXAo+ICAgICAgICAgQ09ORklH
X0FVVE9TQ0FOX0VYUE9ORU5USUFMIFwKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
