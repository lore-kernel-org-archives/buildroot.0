Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1A0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 20:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB894087A;
	Sun,  3 Apr 2022 20:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VaSmbBmSDWzs; Sun,  3 Apr 2022 20:14:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF9F40861;
	Sun,  3 Apr 2022 20:14:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C6191BF31F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A06140155
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 20:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKP8trkBWWHP for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 20:14:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D59534011D
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 20:14:51 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d39f741ba0so8408081fac.13
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JYq95eMU+H/U1CXio+TMOfqkdNJxnyc/YWLnclbkd+I=;
 b=pJTkf+ZXrdjWxrJ3JCtbHF+I4RoM+RntQnrpCKkmCsYZnf1NRTj8B5WBxk7ZqQPzzr
 hXJBhC557W9lMnzHg753aVgcRfQBZ5nh7647MaXXTvZ/b4dBrFnGFewYSmNlsFpMVGwB
 h/YlrJehmd6sTRy4mtX4GY00nHeuqYFB0L38YC1UFGKecwIYPJWgvW7Sdo8lFZTa1QsU
 rXIACHOvXTcQWunikLTAUPqjkIetkVL7ygZzhi7AJXJmYeMqwYMPDb733gN6oW44d/Ga
 yriBNhyW14/C7LMYUrdiakmhHVtcos6eLc1ZfFoXCOuGpoYXytY895N9U8zcSgKt0Oqm
 bDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JYq95eMU+H/U1CXio+TMOfqkdNJxnyc/YWLnclbkd+I=;
 b=wAeRmG2tychzqB/Xeb1/NHRb8XTJpY57mHu4DdkgNO7Yxb9UET9x0MTXtTqupKJhLR
 CL4bOhVObmMnS6wP1HJZspHnj0qT6Dyl6xGwifi+gtvWJnnyYtH1ygONQcYmAkhjPwYo
 TjTWuqShI4M33Ssldy4+Oe3npimWpwVGM1fM7brwtmYQ9j2m2xHHfj5NDX8l8pEyFjLV
 pl8U15cUhD/voMfDesmZ5yQDJ73QQkfv95EtkqEjMeikKhmoRUmehQxp6PQTIx5qfHrR
 VUyg6yuCRg0Aqhn/s+mCkq6RETrpOycEDMYfpdeTp9h3gcZhgrm4mazWQfNmIoKdFEPI
 ciCw==
X-Gm-Message-State: AOAM5335dmJNkWLFJstcjwo4TnQxiscr7jq823WC/liJCPz7ILQKl/qG
 lF/Wm34NO67hT8sIlisDVU9fkHU5L74A9N8rHns=
X-Google-Smtp-Source: ABdhPJx7QnNDfB0hAy5sDZfoNWQ7iOIEuqokSHDd/3fnE0IVbKBEOHN/HwlGP7wmMxX7IwZIYEooR5wz96ZI2uhNO7w=
X-Received: by 2002:a05:6871:1c8:b0:de:1f3f:ce9a with SMTP id
 q8-20020a05687101c800b000de1f3fce9amr9521111oad.148.1649016890875; Sun, 03
 Apr 2022 13:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220403191103.1019544-1-fontaine.fabrice@gmail.com>
 <20220403195905.GA2354230@scaer>
In-Reply-To: <20220403195905.GA2354230@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 3 Apr 2022 22:13:06 +0200
Message-ID: <CAPi7W82cXSh+aBNy5En8Qh3dpLpdi3SW4PDRuX+ZZo+09k5AmA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: fix build on powerpc
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgZGltLiAzIGF2ci4gMjAyMiDDoCAyMTo1OSwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4x
OTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9uIDIwMjItMDQt
MDMgMjE6MTEgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gRGlzYWJs
ZSBQT1dFUjggb3B0aW1pc2F0aW9ucyB0byBmaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJl
IHdpdGgKPiA+IHBvd2VycGMgYW5kIGxpYmdsaWIyIHJhaXNlZCBzaW5jZSBidW1wIHRvIHZlcnNp
b24gMS45LjktYjEgaW4gY29tbWl0Cj4gPiAxZjdiMTJhMGI0NTcyZDdlNzYzYzQzMWE2M2MyMmNm
YjkxMmI4YjE0IGFuZAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3psaWItbmcvemxpYi1uZy9jb21t
aXQvYjgxZjRlZTk2ZGNiZGYxZGIzNGIwMDcyN2I2ZjE4MjlhMmJhMWVkYjoKPiA+Cj4gPiAvaG9t
ZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3RhbmNlLTkvb3V0cHV0LTEvaG9zdC9saWIvZ2NjL3Bv
d2VycGMtYnVpbGRyb290LWxpbnV4LW11c2wvMTEuMi4wLy4uLy4uLy4uLy4uL3Bvd2VycGMtYnVp
bGRyb290LWxpbnV4LW11c2wvYmluL2xkOiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3Rh
bmNlLTkvb3V0cHV0LTEvaG9zdC9wb3dlcnBjLWJ1aWxkcm9vdC1saW51eC1tdXNsL3N5c3Jvb3Qv
dXNyL2xpYi9saWJ6LmEoYWRsZXIzMl9wb3dlcjguYy5vKTogaW4gZnVuY3Rpb24gYGFkbGVyMzJf
cG93ZXI4JzoKPiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtOS9vdXRwdXQt
MS9idWlsZC96bGliLW5nLTIuMC42L2FyY2gvcG93ZXIvYWRsZXIzMl9wb3dlcjguYzoxMDY6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYHZlY19zdW1zdScKPiA+Cj4gPiBGaXhlczoKPiA+ICAtIGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2Y4NjRhMGUyMzA3ZTI1MzQyYjQ1
YzkwYTViNGZiNTdhMGY1YzFjOTMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uvemxp
Yi1uZy96bGliLW5nLm1rIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvemxpYi1uZy96bGliLW5nLm1rIGIvcGFja2Fn
ZS96bGliLW5nL3psaWItbmcubWsKPiA+IGluZGV4IGZiNDk3YjhjMTEuLjA5ZWRmZTFmYWYgMTAw
NjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawo+ID4gKysrIGIvcGFja2Fn
ZS96bGliLW5nL3psaWItbmcubWsKPiA+IEBAIC0xNSw2ICsxNSw3IEBAIFpMSUJfTkdfUFJPVklE
RVMgPSB6bGliCj4gPiAgWkxJQl9OR19DT05GX09QVFMgKz0gXAo+ID4gICAgICAgLURXSVRIX0da
RklMRU9QPTEgXAo+ID4gICAgICAgLURXSVRIX09QVElNPTEgXAo+ID4gKyAgICAgLURXSVRIX1BP
V0VSOD1PRkYgXAo+Cj4gV2h5IGNhbid0IHRoYXQgYmUgY29uZGl0aW9uYWwgb24gQlIyX3Bvd2Vy
cGNfcG93ZXI4ID8KCkl0IGNhbiwgSSdsbCBzZW5kIGEgdjIuCkhvd2V2ZXIsIGl0IHNob3VsZCBi
ZSBub3RlZCB0aGF0IHBvd2VyOCBpcyB1bmNvbmRpdGlvbmFsbHkgZGlzYWJsZWQgb24KbWVzYTNk
IHRob3VnaC4KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICAgICAgIC1EWkxJ
Ql9DT01QQVQ9MSBcCj4gPiAgICAgICAtRFpMSUJfRU5BQkxFX1RFU1RTPU9GRgo+ID4KPiA+IC0t
Cj4gPiAyLjM1LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
