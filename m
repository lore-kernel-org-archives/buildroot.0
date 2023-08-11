Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54DDC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 22:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C5C341B71;
	Fri, 11 Aug 2023 22:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C5C341B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jm8EfY0JGeBx; Fri, 11 Aug 2023 22:54:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C33341EAC;
	Fri, 11 Aug 2023 22:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C33341EAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E57EC1BF5F6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBE2D60AEE
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 22:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE2D60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnkOfbbzcTGv for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 22:54:17 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB1B860AE8
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 22:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1B860AE8
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3a7a180c3faso2158342b6e.2
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 15:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691794456; x=1692399256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQR6g/QWNc1nUM1/Ho9fLs7L0iEh21FrPu17SlcC7dE=;
 b=Te6ozX7rPV+5a7x3eeHoEvykYQ/Iw5PeB5U8IF3+O5/+8lu01gKFEMiehqXoOqBZFV
 5Q5Fm4P9pMSpN54brwHKV8bIJTqNAIamofub4L8uMSSCfsCfo6GmiCUqinaa7ihvtAPa
 oPC0WVZXagEdYmQull9toQKYOKigKfakWZO2raR3XlJiSqLRbN5u7jBNkei3J3v8SWGx
 iQSPsJ3zWjz1vRpbsONXDZX1My4pmPVvrhPqjZGCg206uJOY4fIYvUfffM4snDndL/jn
 dwGY3NB4jzXy5GK9iQBi6GwPpTwxJ6uqZToeanam1q3Nj3gtHIxXuXiKEs1buiJpzgiT
 9k9A==
X-Gm-Message-State: AOJu0Yyad9H4347fi/lEs5KEENhyRfu77QTyCpx9HFjwO5747Uyj8UYs
 0l8PcKrsDUVF2XDmR4dKRXiWwReT/5ckw5p70Ic=
X-Google-Smtp-Source: AGHT+IFZc/T2H7arNG557c9L2/wR3kUeVD6i5RWEyr1Sr16caPc+30ywdKpSxisdodeWi+RmX8qcYyMh6+umugjpfPs=
X-Received: by 2002:a05:6808:114b:b0:3a4:317d:eb7c with SMTP id
 u11-20020a056808114b00b003a4317deb7cmr4562524oiu.0.1691794456682; Fri, 11 Aug
 2023 15:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
 <13322713.uLZWGnKmhe@kilian-aisec> <1766550.VLH7GnMWUR@kilian-aisec>
 <20230811164145.2b978818@windsurf>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
In-Reply-To: <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 11 Aug 2023 17:53:50 -0500
Message-ID: <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691794456; x=1692399256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQR6g/QWNc1nUM1/Ho9fLs7L0iEh21FrPu17SlcC7dE=;
 b=D5DRoJ9D/3p6rXVfHzOTw6x9m3b3X0ek2Qjnd5BkvGoaXQGXRCqop3cImIam0dWIEc
 DBFL36T2nd0+2yJPl82iatk/Ubj7iTiPr4tnfbvjMWR0s5G4xW/vv8xn27H9L2YhMMgc
 ncWxFm0pkArW+BcbE3TAHXn0KTmWRU6m7FqtUvxgUGUJ3r+yY6ccorx2IyyJ7af60Wzx
 ewR5E0cgvD5L1LX+6Rc4ytj/Cst65UVE8Ayu68fqH8h24UxTjOIvGfTTzBEtKjHmcOHh
 0cmQdBUoPkP3jbIm2FgZkNEX6IwYWFmEe2crk3gp/FFHGtu0vWbWyUSdsVb576dtIz0m
 gaaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=D5DRoJ9D
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgNDozMOKAr1BNIFJvYmVydCBOZWxzb24gPHJvYmVydGNu
ZWxzb25AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDExLCAyMDIzIGF0IDk6NDLi
gK9BTSBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3QKPiA8YnVpbGRyb290QGJ1aWxkcm9v
dC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgMTAgQXVnIDIwMjMgMTM6MDI6MzIgKzAyMDAK
PiA+IEtpbGlhbiBaaW5uZWNrZXIgPGtpbGlhbi56aW5uZWNrZXJAbWFpbC5kZT4gd3JvdGU6Cj4g
Pgo+ID4gPiBJIGFsc28gdGhpbmsgdGhhdCB0aGVyZSBpcyBhcmUgc2ltaWxhciBpc3N1ZXMgcmVn
YXJkaW5nIHRoZSBiZWFnbGV2X2RlZmNvbmZpZwo+ID4gPiBhbmQgdGhlIHVzZWQsIHZlcnkgb2xk
IG9wZW5zYmkgdmVyc2lvbiBhbmQgbWF5YmUgYWxzbyB0aGUgdXNlZCBzdGFyZml2ZSBjdXN0b20K
PiA+ID4ga2VybmVsIHZlcnNpb24uCj4gPiA+Cj4gPiA+IEkgY291bGQgdHJ5IHRvIGJ1bXAgdGhl
IHZlcnNpb25zIG9yIGFkZCBwYXRjaGVzIHVudGlsIGl0IGNvbXBpbGVzIGFnYWluLgo+ID4gPiBI
b3dldmVyLCBJIGRvbid0IGhhdmUgYSBCZWFnbGVWIGN1cnJlbnRseSBhdCBoYW5kLCBzbyBJIHdv
dWxkIG5vdCBiZSBhYmxlIHRvCj4gPiA+IHJlYWxseSB0ZXN0IHdoYXQgSSBwcm9kdWNlZCBhZnRl
cndhcmRzLiBTbyBpdCBtaWdodCBiZSBiZXR0ZXIgc29tZW9uZSBlbHNlLAo+ID4gPiB3aGljaCBo
YXMgYWNjZXNzIHRvIGEgQmVhZ2xlViwgaGFzIGEgbG9vay4KPiA+Cj4gPiBJIGRvIGhhdmUgYSBC
ZWFnbGVWIChub3QgaGVyZSB3aXRoIG1lIHRob3VnaCksIGJ1dCBhcyBJIHJlcGxpZWQgdG8KPiA+
IGFub3RoZXIgZS1tYWlsLCBJIHRoaW5rIHdlIGNvdWxkIHNpbXBseSBkcm9wIGJlYWdsZXZfZGVm
Y29uZmlnIGFzIG5vdAo+ID4gbWFueSBzYW1wbGVzIG9mIHRoaXMgcGxhdGZvcm0gd2VyZSBzaGlw
cGVkLCBhbmQgaXQncyBubyBsb25nZXIgcHJvZHVjZWQuCj4KPiBTbyB0aGUgcGxhbiBmcm9tIEJl
YWdsZUJvYXJkLm9yZyBpczoKPgo+IGJlYWdsZXYtPGRldmljZT4KPgo+IFNvIHRoZSBUSDE1MjAg
YmFzZWQgQmVhZ2xlViBpczogYmVhZ2xldi1haGVhZAo+Cj4gTG9va2luZyBhdCBhbGwgb3VyIGdp
dGxhYiByZXBvcywgeWVhaCBpIGNhbGxlZCBldmVyeSBjb25maWcgYGJlYWdsZXZfYC4uLgo+Cj4g
YWRkIHRoYXQgdG8gbXkgY2xlYW51cCBsaXN0Li4KCk9rYXkgS2lsaWFuLCB0aGVzZSBhbGwgYnVp
bGQgd2l0aCB4ODZfNjQtZ2NjLTEzLjIuMC1ub2xpYmMtcmlzY3Y2NC1saW51eC50YXIueHoKCm9w
ZW5zYmk6IGh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYt
YWhlYWQtb3BlbnNiaS8tL3RyZWUvMC45LTEuMS4yLXVidW50dQp1LWJvb3Q6IGh0dHBzOi8vZ2l0
LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYtYWhlYWQtdS1ib290Ly0vdHJl
ZS9iZWFnbGV2LXYyMDIwLjAxLTEuMS4yLXVidW50dQpsaW51eDogaHR0cHM6Ly9naXQuYmVhZ2xl
Ym9hcmQub3JnL2JlYWdsZXYtYWhlYWQvYmVhZ2xldi1haGVhZC1saW51eC8tL3RyZWUvYmVhZ2xl
di12NS4xMC4xMTMtMS4xLjItdWJ1bnR1CgpGb3IgYmFuZHdpZHRoIGlzc3VlcywgcGxlYXNlIHVz
ZSB0aGUgZ2l0aHViIG1pcnJvcnMgZGlyZWN0bHkgaW4KcGF0Y2hlcyBmb3IgYnVpbGRyb290LCBh
cyB0aGVzZSBhcmUgcHVzaCBtaXJyb3JlZCBmcm9tCmdpdC5iZWFnbGVib2FyZC5vcmcvICwgYXQg
d29yc3QgdGhleSBsYWcgYnkgMTAgbWludXRlcyBhZnRlciBhIG5ldwpjb21taXQKCm9wZW5zYmk6
IGh0dHBzOi8vZ2l0aHViLmNvbS9iZWFnbGVib2FyZC9iZWFnbGV2LWFoZWFkLW9wZW5zYmkvdHJl
ZS8wLjktMS4xLjItdWJ1bnR1CnUtYm9vdDogaHR0cHM6Ly9naXRodWIuY29tL2JlYWdsZWJvYXJk
L2JlYWdsZXYtYWhlYWQtdS1ib290L3RyZWUvYmVhZ2xldi12MjAyMC4wMS0xLjEuMi11YnVudHUK
bGludXg6IGh0dHBzOi8vZ2l0aHViLmNvbS9iZWFnbGVib2FyZC9saW51eC90cmVlL2JlYWdsZXYt
djUuMTAuMTEzLTEuMS4yLXVidW50dQoKVmVyaWZpY2F0aW9uIGNpIGltYWdlLCBhdmFpbGFibGUg
Zm9yIHRoZSBuZXh0IDE0IGRheXMuLgoKaHR0cHM6Ly9naXQuYmVhZ2xlYm9hcmQub3JnL2JlYWds
ZXYtYWhlYWQveHVhbnRpZS11YnVudHUvLS9qb2JzLzEzMzAzCgpgYGAKdm9vZG9vQGhlc3RpYTp+
L0Rvd25sb2FkcyQgdW56aXAgeHVhbnRpZS11YnVudHUtMS4xLjItMTMzMDMuemlwCkFyY2hpdmU6
ICB4dWFudGllLXVidW50dS0xLjEuMi0xMzMwMy56aXAKICBpbmZsYXRpbmc6IGRlcGxveS9ib290
LmV4dDQueHoKICBpbmZsYXRpbmc6IGRlcGxveS9mYXN0Ym9vdF9lbW1jLnNoCiAgaW5mbGF0aW5n
OiBkZXBsb3kvbWFjX2Zhc3Rib290X2VtbWMuc2gKICBpbmZsYXRpbmc6IGRlcGxveS9yb290LmV4
dDQueHoKICBpbmZsYXRpbmc6IGRlcGxveS91LWJvb3Qtd2l0aC1zcGwuYmluCnZvb2Rvb0BoZXN0
aWE6fi9Eb3dubG9hZHMkIGNkIGRlcGxveS8Kdm9vZG9vQGhlc3RpYTp+L0Rvd25sb2Fkcy9kZXBs
b3kkIHN1ZG8gLi9mYXN0Ym9vdF9lbW1jLnNoCmBgYAoKQm9vdCBsb2c6IGh0dHBzOi8vZ2lzdC5n
aXRodWIuY29tL1JvYmVydENOZWxzb24vNDJkZWIyNGM0MWE5MmNlNWU4OWU4MGRmZTA1OGUzZDgK
CgpSZWdhcmRzLAoKLS0KUm9iZXJ0IE5lbHNvbgpodHRwczovL3Jjbi1lZS5jb20vCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
