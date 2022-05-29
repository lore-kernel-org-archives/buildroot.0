Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6DAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45F4A4090E;
	Sun, 29 May 2022 21:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5d-epeRYRYBe; Sun, 29 May 2022 21:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2100408FB;
	Sun, 29 May 2022 21:08:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E74FE1BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD81C408FB
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fTAZR-SKDPs for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2494400FF
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:08:25 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-f314077115so4831281fac.1
 for <buildroot@buildroot.org>; Sun, 29 May 2022 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dxMe+7Gd+QyEGy7PJpuWMXRO8OCP6k9uXjoyQ/BKXJI=;
 b=YN18icNLaiJNj9gh+1BGyFLAa81+6S8IgUaXI0j3zJWDg8DvPp/z/P1/YDOz9f7S+5
 DI2V0zItvG1nXsPaSJEttukUqWUo/gUDqgJhLXM4g8887p4lAASEmOfVWE7GL6Lxo4Iu
 r6SadMamqDlLSwDRf4V7xuyhxAOug5/aGkqi7O+VJ6dIiy5PE+Abz6pCALEZX7a4dslD
 KCHbEBS70j4xbY/nVo+NfBYJ60kev+tB/HKHpQGY0jL1qMj0hrgM0cQFVfhIjiJ6Ms8a
 9NMwhCXCCI02gdcBVggmz57e+wNySAM0ADiV2lTiHUnT7OCVvi6HQbxAxKJaSyGiHaoy
 MFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dxMe+7Gd+QyEGy7PJpuWMXRO8OCP6k9uXjoyQ/BKXJI=;
 b=NiO9H4OZAquPMe491DiOa4RWdJvBT9qTMorYXb/MLDV5+LG87d4knz//+wvDygfdKj
 y5pZ8n0I3cKWxDBwIJUYVgKGle9LFMvzQOTtWHIheYk3yTaRIvsoymKstCXOonaAhNTu
 KOdQAw5hVT3CgFb6ZgWsiqxicelQ8JZzO+qZViUckxETAxh69VnikpE4Hsf7coX6SV4O
 vWADT+KW1wFjspimMxi1zb8wfB0l0uXnSZsoMvI1G+3MqzsBIQ258R4jqJX+oItffqVh
 Cp7F4wHHFBd3J2pbRADy0fVE00UnQd7QagCHwVRp3WCe8G+x44ZCSar6wML7WWE+7gS4
 u0yg==
X-Gm-Message-State: AOAM532LXUDl3WPm49TCrOPaasoDjdzupPEFDSm4oiqkapvWjfL0rdX/
 UNeQjMJnmB2Tpkqlxk/OFSgSsS11sUyXN6g+mRw=
X-Google-Smtp-Source: ABdhPJybp/vcMcRxL49Ye7/NEKkE2AIaXZO5b3/KXBPhrViCVvbPHvSJxB8x1z2Q3yo+iOp+/z78FVLtBVOGY0W2EFo=
X-Received: by 2002:a05:6870:4184:b0:f1:97d2:6696 with SMTP id
 y4-20020a056870418400b000f197d26696mr9181321oac.148.1653858504821; Sun, 29
 May 2022 14:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220527122710.1296005-1-fontaine.fabrice@gmail.com>
 <20220529210219.GG993669@scaer>
In-Reply-To: <20220529210219.GG993669@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 May 2022 23:05:54 +0200
Message-ID: <CAPi7W80+yF-pwsgkZx7WGXzimC23g3Zfc2tV454-2GotodEZZg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix uclibc build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIGRpbS4gMjkgbWFpIDIwMjIgw6AgMjM6MDIsIFlhbm4gRS4gTU9SSU4gPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4KPiBPbiAy
MDIyLTA1LTI3IDE0OjI3ICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+
IEZpeCB0aGUgZm9sbG93aW5nIHVjbGliYyBidWlsZCBmYWlsdXJlOgo+ID4KPiA+IC9ob21lL2J1
aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L29wdC9leHQtdG9vbGNo
YWluL2Jpbi8uLi9saWIvZ2NjL21pcHNlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjLzEwLjMuMC8u
Li8uLi8uLi8uLi9taXBzZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4vbGQ6IHNyYy9waXBl
d2lyZS9saWJwaXBld2lyZS0wLjMuc28uMC4zNTEuMC5wL2ludHJvc3BlY3QuYy5vOiBpbiBmdW5j
dGlvbiBgcHdfbm9kZV9pbmZvX21lcmdlJzoKPiA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQv
aW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC9waXBld2lyZS0wLjMuNTEvYnVpbGQvLi4vc3JjL3Bp
cGV3aXJlL2ludHJvc3BlY3QuYzoyMTY6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJlYWxsb2Nh
cnJheScKPiA+Cj4gPiBGaXhlczoKPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzLzM3NDU4MmY3NTcxM2M0MTE2YWUyM2Y5NzJjNWJjNTUyMTQ4Nzk1MDIKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPgo+IFRoaXMgcGF0Y2ggaXMgbWFya2VkICJTdXBlcnNlZGVkIiBpbiBwYXRjaHdvcmss
IGlzIHRoYXQgZXhwZWN0ZWQ/CgpZZXMsIHRoaXMgcGF0Y2ggaXMgYnJva2VuIGFuZCByYWlzZXMg
YSBydW50aW1lIGJ1aWxkIGZhaWx1cmUgd2l0aApnbGliYyAoYW5kIHJlYWxsb2NhcnJheSkuClVw
c3RyZWFtIGFwcGxpZXMgWzFdIHRvICJmaXgiIGl0LgpIb3dldmVyLCByZWFsbG9jYXJyYXkgZGV0
ZWN0aW9uIGlzIHN0aWxsIGJyb2tlbiwgYSBNUiBpcyBwZW5kaW5nIFsyXS4KClsxXSBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUvcGlwZXdpcmUvLS9jb21taXQvM2U3Zjk3
NWY4M2M3OTE4ZGVhMWMwMmE1YmYzMzQ5NDBlODJjMjU5MQpbMl0gaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3BpcGV3aXJlLy0vbWVyZ2VfcmVxdWVzdHMvMTI1MQo+Cj4g
UmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiAtLS0KPiA+ICAuLi4vMDAwMS1maXgtYnVp
bGQtd2l0aG91dC1yZWFsbG9jYXJyYXkucGF0Y2ggfCA0NiArKysrKysrKysrKysrKysrKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9waXBld2lyZS8wMDAxLWZpeC1idWlsZC13aXRob3V0LXJlYWxsb2NhcnJheS5w
YXRjaAo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BpcGV3aXJlLzAwMDEtZml4LWJ1aWxk
LXdpdGhvdXQtcmVhbGxvY2FycmF5LnBhdGNoIGIvcGFja2FnZS9waXBld2lyZS8wMDAxLWZpeC1i
dWlsZC13aXRob3V0LXJlYWxsb2NhcnJheS5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAuLmVlODBkZmIzYmIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL3BhY2thZ2UvcGlwZXdpcmUvMDAwMS1maXgtYnVpbGQtd2l0aG91dC1yZWFsbG9jYXJyYXku
cGF0Y2gKPiA+IEBAIC0wLDAgKzEsNDYgQEAKPiA+ICtGcm9tIDA3MDhhMzliNDM5Y2VjMjg3MWNm
ZTNiNzA1MTkxMDI4Mzk3ZTViOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiArRnJvbTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiArRGF0ZTog
RnJpLCAyNyBNYXkgMjAyMiAxMDo1Nzo1MCArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gc3Jj
L3BpcGV3aXJlL3V0aWxzLmg6IGZpeCBidWlsZCB3aXRob3V0IHJlYWxsb2NhcnJheQo+ID4gKwo+
ID4gK0ZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aG91dCByZWFsbG9jYXJyYXkg
KGUuZy4gb24gdWNsaWJjKToKPiA+ICsKPiA+ICsvaG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2lu
c3RhbmNlLTAvb3V0cHV0LTEvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9t
aXBzZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy8xMC4zLjAvLi4vLi4vLi4vLi4vbWlwc2VsLWJ1
aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOiBzcmMvcGlwZXdpcmUvbGlicGlwZXdpcmUtMC4z
LnNvLjAuMzUxLjAucC9pbnRyb3NwZWN0LmMubzogaW4gZnVuY3Rpb24gYHB3X25vZGVfaW5mb19t
ZXJnZSc6Cj4gPiArL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0wL291dHB1dC0x
L2J1aWxkL3BpcGV3aXJlLTAuMy41MS9idWlsZC8uLi9zcmMvcGlwZXdpcmUvaW50cm9zcGVjdC5j
OjIxNjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcmVhbGxvY2FycmF5Jwo+ID4gKwo+ID4gK0Zp
eGVzOgo+ID4gKyAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzM3NDU4
MmY3NTcxM2M0MTE2YWUyM2Y5NzJjNWJjNTUyMTQ4Nzk1MDIKPiA+ICsKPiA+ICtTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+ICtb
UmV0cmlldmVkIGZyb206Cj4gPiAraHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3
aXJlL3BpcGV3aXJlLy0vY29tbWl0LzA3MDhhMzliNDM5Y2VjMjg3MWNmZTNiNzA1MTkxMDI4Mzk3
ZTViOGJdCj4gPiArLS0tCj4gPiArIHNyYy9waXBld2lyZS91dGlscy5oIHwgNSArKysrKwo+ID4g
KyAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiArCj4gPiArZGlmZiAtLWdpdCBh
L3NyYy9waXBld2lyZS91dGlscy5oIGIvc3JjL3BpcGV3aXJlL3V0aWxzLmgKPiA+ICtpbmRleCAz
NTEyMTZlYjMuLjVhMGRjNmZkMiAxMDA2NDQKPiA+ICstLS0gYS9zcmMvcGlwZXdpcmUvdXRpbHMu
aAo+ID4gKysrKyBiL3NyYy9waXBld2lyZS91dGlscy5oCj4gPiArQEAgLTI5LDYgKzI5LDcgQEAK
PiA+ICsgZXh0ZXJuICJDIiB7Cj4gPiArICNlbmRpZgo+ID4gKwo+ID4gKysjaW5jbHVkZSA8c3Rk
bGliLmg+Cj4gPiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPiA+ICsgI2luY2x1ZGUgPHN5cy91bi5o
Pgo+ID4gKyAjaWZuZGVmIF9QT1NJWF9DX1NPVVJDRQo+ID4gK0BAIC04Niw2ICs4NywxMCBAQCBw
d19zdHJpcChjaGFyICpzdHIsIGNvbnN0IGNoYXIgKndoaXRlc3BhY2UpOwo+ID4gKyAjZW5kaWYK
PiA+ICsKPiA+ICsgc3NpemVfdCBwd19nZXRyYW5kb20odm9pZCAqYnVmLCBzaXplX3QgYnVmbGVu
LCB1bnNpZ25lZCBpbnQgZmxhZ3MpOwo+ID4gKysKPiA+ICsrI2lmICFkZWZpbmVkKHJlYWxsb2Nh
cnJheSkKPiA+ICsrIyBkZWZpbmUgcmVhbGxvY2FycmF5KHB0ciwgbm1lbWIsIHNpemUpICAgICAg
ICAgICAgIHJlYWxsb2MocHRyLCBubWVtYiAqIHNpemUpCj4gPiArKyNlbmRpZgo+ID4gKyAvKioK
PiA+ICsgICogXH0KPiA+ICsgICovCj4gPiArLS0KPiA+ICtHaXRMYWIKPiA+ICsKPiA+IC0tCj4g
PiAyLjM1LjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScK
CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
