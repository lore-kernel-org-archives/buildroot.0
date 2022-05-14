Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 13:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D780D83FC3;
	Sat, 14 May 2022 13:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YajO6kyUo6A6; Sat, 14 May 2022 13:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D137783FC0;
	Sat, 14 May 2022 13:49:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDB2F1BF48C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD01E83FC0
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 13:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slTKtfw9cMnA for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 13:49:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C77F83F99
 for <buildroot@buildroot.org>; Sat, 14 May 2022 13:49:40 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 y20-20020a056830071400b00606a2ebd91bso6896886ots.5
 for <buildroot@buildroot.org>; Sat, 14 May 2022 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FvSbecgoXY3A6y5XcaRFPtj5tKsI+LmGd59pqmEdP40=;
 b=MfztRBqyV173Y/kUSIfBp+XvwWfT3JEjdIRh/r+w8mn6x3QMT8hg/257AUhpv/ovlo
 Y9tOCv/QunH++zVMsxvtmZr4Wmm/eUDQ8eqLlxDxF2zUjyHtHbVGtw8Ica6Hn0xwQBXh
 LZCNsJUM9Jb/LgKM/Q5ti3k6siOR1oQligBV94TBlLu6lh8UnP/ARmw+wmA5tHJFmi6Z
 cBfhE6rkl84Cl/87SRwnadwto/+V2Hg4fj2i/TAoTWGEjldHdRpMo+WfXvSQQXF142fx
 /iAxMcI1b8DWsYieSfVpvt8XXyw4RvzE4dImhnMnVINCVFdA6Fl/UXqMvz4ve4DlP8FA
 YCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FvSbecgoXY3A6y5XcaRFPtj5tKsI+LmGd59pqmEdP40=;
 b=NhMOnClcdQkXhRodrc0NCq3kiOvOyec01dzkqZwRD2+q6nrpswV0yVUL+LWM+aaK/i
 WSrS8It41lbZHkPYWWil28/B0328wW0xOmvsqJVknLuDqCtsNL2rP5MjXi4kNNFZYFBJ
 5S1fxEcPxxm/voM+LI2/1UScEvKHUZkkWL6Gven4Lcaf8Z3Apc0WIpHqE9qXpzYKpCYR
 tM6U7xJujyi+vsp6WC0qqb54oyy2kPk3uetEJEht5EgetQnUPYdxjciRAmOZM0fSnTUW
 CnxsAAxszvFWfaeBnyNvr9hYXsvm4Brv2356y0h0m8Nbvda0qs0+awnzrLyPFB/Khc1Y
 2E8w==
X-Gm-Message-State: AOAM533bVclxWhPB4juiuFEJogDPzH9iaocnc1tK+s3rsqiPzok4y3pf
 /8bf11uRnMMeu2vV2UNE0xD6a3bRT6eUXqjeqDcMjivDIq0=
X-Google-Smtp-Source: ABdhPJzW1ZvBCTujg+uSJeu2JzwxkY+VSIXfj4yZsgokQuVK7St/6CR4ujVb9NdeGyjPn/DGP4++jvcvPIdJpZwP/4I=
X-Received: by 2002:a05:6830:1310:b0:606:4832:ea77 with SMTP id
 p16-20020a056830131000b006064832ea77mr3452781otq.114.1652536179104; Sat, 14
 May 2022 06:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220514092152.1625466-1-fontaine.fabrice@gmail.com>
 <20220514133641.GZ1597494@scaer>
In-Reply-To: <20220514133641.GZ1597494@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 May 2022 15:47:21 +0200
Message-ID: <CAPi7W83wx+D5gYHKUtdS5abrYh-z-5h8QBe41pDnPrnCFK_HOQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: add
 V4L2LOOPBACK_LINUX_CONFIG_FIXUPS
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
Cc: Alexandre Esse <alexandre.esse.dev@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkxlIHNhbS4gMTQgbWFpIDIwMjIgw6AgMTU6MzYsIFlhbm4gRS4gTU9SSU4gPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4KPiBGYWJyaWNlLCBBbGwsCj4KPiBP
biAyMDIyLTA1LTE0IDExOjIxICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToK
PiA+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6Cj4gPgo+ID4gRVJST1I6IG1vZHBv
c3Q6ICJ2aWRlb19pb2N0bDIiIFsvbnZtZWRhdGEvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1
dC0xL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEyLjUvLi92NGwybG9vcGJhY2sua29dIHVuZGVmaW5l
ZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAiX192aWRlb19yZWdpc3Rlcl9kZXZpY2UiIFsvbnZtZWRh
dGEvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1dC0xL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEy
LjUvLi92NGwybG9vcGJhY2sua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAidjRs
Ml9jdHJsX25ld19jdXN0b20iIFsvbnZtZWRhdGEvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1
dC0xL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEyLjUvLi92NGwybG9vcGJhY2sua29dIHVuZGVmaW5l
ZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAidjRsMl9jdHJsX2hhbmRsZXJfaW5pdF9jbGFzcyIgWy9u
dm1lZGF0YS9hdXRvYnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvYnVpbGQvdjRsMmxvb3BiYWNr
LTAuMTIuNS8uL3Y0bDJsb29wYmFjay5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6
ICJ2aWRlb19kZXZpY2VfYWxsb2MiIFsvbnZtZWRhdGEvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291
dHB1dC0xL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEyLjUvLi92NGwybG9vcGJhY2sua29dIHVuZGVm
aW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAidjRsMl9kZXZpY2VfcmVnaXN0ZXIiIFsvbnZtZWRh
dGEvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1dC0xL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEy
LjUvLi92NGwybG9vcGJhY2sua29dIHVuZGVmaW5lZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAidmlk
ZW9fZGV2aWNlX3JlbGVhc2UiIFsvbnZtZWRhdGEvYXV0b2J1aWxkL2luc3RhbmNlLTEwL291dHB1
dC0xL2J1aWxkL3Y0bDJsb29wYmFjay0wLjEyLjUvLi92NGwybG9vcGJhY2sua29dIHVuZGVmaW5l
ZCEKPiA+IEVSUk9SOiBtb2Rwb3N0OiAidjRsMl9jdHJsX2hhbmRsZXJfZnJlZSIgWy9udm1lZGF0
YS9hdXRvYnVpbGQvaW5zdGFuY2UtMTAvb3V0cHV0LTEvYnVpbGQvdjRsMmxvb3BiYWNrLTAuMTIu
NS8uL3Y0bDJsb29wYmFjay5rb10gdW5kZWZpbmVkIQo+ID4gRVJST1I6IG1vZHBvc3Q6ICJ2NGwy
X2RldmljZV91bnJlZ2lzdGVyIiBbL252bWVkYXRhL2F1dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRw
dXQtMS9idWlsZC92NGwybG9vcGJhY2stMC4xMi41Ly4vdjRsMmxvb3BiYWNrLmtvXSB1bmRlZmlu
ZWQhCj4gPiBFUlJPUjogbW9kcG9zdDogInZpZGVvX3VucmVnaXN0ZXJfZGV2aWNlIiBbL252bWVk
YXRhL2F1dG9idWlsZC9pbnN0YW5jZS0xMC9vdXRwdXQtMS9idWlsZC92NGwybG9vcGJhY2stMC4x
Mi41Ly4vdjRsMmxvb3BiYWNrLmtvXSB1bmRlZmluZWQhCj4gPgo+ID4gRml4ZXM6Cj4gPiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy82NDBmOGY2MWM3ZjQzM2ZmZTVl
OWE2NzU5ZWVjYzlhMDNmNzM1NTY5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3Y0
bDJsb29wYmFjay92NGwybG9vcGJhY2subWsgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Y0bDJsb29wYmFj
ay92NGwybG9vcGJhY2subWsgYi9wYWNrYWdlL3Y0bDJsb29wYmFjay92NGwybG9vcGJhY2subWsK
PiA+IGluZGV4IDc3MDFiYzNhMzAuLjcxMjA4OGI2YjAgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L3Y0bDJsb29wYmFjay92NGwybG9vcGJhY2subWsKPiA+ICsrKyBiL3BhY2thZ2UvdjRsMmxvb3Bi
YWNrL3Y0bDJsb29wYmFjay5tawo+ID4gQEAgLTE1LDUgKzE1LDEwIEBAIGRlZmluZSBWNEwyTE9P
UEJBQ0tfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ID4gIGVuZGVmCj4gPiAgZW5kaWYKPiA+Cj4gPiAr
ZGVmaW5lIFY0TDJMT09QQkFDS19MSU5VWF9DT05GSUdfRklYVVBTCj4gPiArICAgICAkKGNhbGwg
S0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19NRURJQV9TVVBQT1JUKQo+Cj4gVGhpcyBvbmUgZGVw
ZW5kcyBvbiBDT05GSUdfSEFTX0lPTUVNLCB3aGljaCBpcyBhbHdheXMgdHJ1ZSwgZXhjZXB0IG9u
Cj4gczM5MHggKG5lZWRzIFBDSSkgb3IgdW1sIChidXQgd2UgZG9uJ3Qgc3VwcG9ydCBVTUwpLgo+
Cj4gPiArICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19WSURFT19ERVYpCj4K
PiBUaGF0IG9uZSBhbHNvIGRlcGVuZHMgb24gQ09ORklHX0kyQyAod2hpY2ggaGFzIG5vIGRlcGVu
ZGVuY3kpLgoKVGhhbmtzIGZvciB5b3VyIHJldmlldyBidXQgSSB3YXNuJ3QgYWJsZSB0byBmaW5k
IHRoZSBDT05GSUdfSTJDCmRlcGVuZGVuY3kgaW4ga2VybmVsIDUuMTcuNy4KSGVyZSBpcyBhbiBl
eHRyYWN0IG9mIGRyaXZlcnMvbWVkaWEvS2NvbmZpZzoKCmNvbmZpZyBWSURFT19ERVYKICAgIHRy
aXN0YXRlICJWaWRlbzRMaW51eCBjb3JlIgogICAgZGVmYXVsdCBNRURJQV9DQU1FUkFfU1VQUE9S
VCB8fCBNRURJQV9BTkFMT0dfVFZfU1VQUE9SVCB8fApNRURJQV9SQURJT19TVVBQT1JUIHx8IE1F
RElBX1NEUl9TVVBQT1JUIHx8IE1FRElBX1BMQVRGT1JNX1NVUFBPUlQgfHwKTUVESUFfVEVTVF9T
VVBQT1JUCgo+Cj4gU28sIG1heWJlOgo+Cj4gICAgIGRlZmluZSBWNEwyTE9PUEJBQ0tfTElOVVhf
Q09ORklHX0ZJWFVQUwo+ICAgICAgICAgJChpZiAkKEJSMl9zMzkweCksJChjYWxsIEtDT05GSUdf
RU5BQkxFX09QVCxDT05GSUdfUENJKSkKPiAgICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9P
UFQsQ09ORklHX01FRElBX1NVUFBPUlQpCj4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVf
T1BULENPTkZJR19JMkMpCj4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJ
R19WSURFT19ERVYpCj4gICAgIGVuZGVmCj4KPiBDb3JkaWFsZW1lbnQsCj4gWWFubiBFLiBNT1JJ
Ti4KPgo+ID4gK2VuZGVmCj4gPiArCj4gPiAgJChldmFsICQoa2VybmVsLW1vZHVsZSkpCj4gPiAg
JChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiA+IC0tCj4gPiAyLjM1LjEKPiA+Cj4gPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
