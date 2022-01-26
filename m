Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79501C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3152F4178E;
	Wed, 26 Jan 2022 22:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUgWygji_pmN; Wed, 26 Jan 2022 22:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6630F4178B;
	Wed, 26 Jan 2022 22:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21F491BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CEE640143
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELLnfX_Uf2MN for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:40:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99F6C4015A
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:40:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id j2so1703475ejk.6
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gQNq8E09Z4k6kNfzP0+a55lvOYC2ULDP3QIikTaXrG8=;
 b=MZLxqcB89tfmchPhMWYNbfsIy+p0IXgn9boO9W4K2Zw1hQ3pD5gagixmVtqW7KJ3Wh
 EwUDbrHHQv30KacC35tRpMPL2YxOGwxD9f22TV8856MN1bo8EWWnmWwMz6wFQJFUIkFw
 kbnvWGTJYyxLdxj1HZBDEUlWizJaHEDrf0FYwuBIt8cQVP0ati1Sk0YkXsAdbusRYYRn
 DI/qGKhEQiFW6nMEsoZ9iK4ENY9WjUxD7gP5Q6Awd7yLj3v4001Vsby7gOhtAw5GLUvB
 TwkNA4PnLJAavatmty7mqkAi1oRx8HB4MZFUixvBRevgKu5PMaBGt2h0+Mw69Oqn3dKM
 TkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gQNq8E09Z4k6kNfzP0+a55lvOYC2ULDP3QIikTaXrG8=;
 b=rf5sGKT3IBeqwJw4yBKOMEjHvbJCKKqFg9EU+o4EHtwx21VYlhnakns6oplixE0kc7
 DQ9B3L/txG1YwnkwIgiO9IvRHygweBl+bMHo1+l7ELWgv3OJlaBTL44BNHSrIUHPYGIc
 GKcDjTgmWpsnSrwksxW0j8r6iPReFc/6kgliHpfImmR9lHcKC7TB8G6HMrCIMMoZ3bl4
 G+JrkV9Y8OQIV4PTj2TSdwxrv+G7tX4Ms6u+xO9J4ldZ5NqORkvcSlff+fXkNDjHMVSb
 YWCmHLJaXe2iIwPT3ZqJXwKgvnZbZo5Jqg/6ajuQQrB5lxLHvLcBDZfIYk8ikDRO3mb9
 l3FA==
X-Gm-Message-State: AOAM530MnwLvSD9NnYkclIbmo/n09noy97s6Hrs5z8y5i7xL4+nKMNR/
 inkA/zcQzcKEo1soTA22cQiHLfsP0LT6WmaysdQ=
X-Google-Smtp-Source: ABdhPJz+qVBSoFXB7r8njxwG3RQ7hMNZstNNj0+hPRaGEvjSqVYhNwrNvfY/nKl+qE3pWinRsClPWGXMTTHGkC0KaTI=
X-Received: by 2002:a17:906:c154:: with SMTP id
 dp20mr737101ejc.184.1643236814419; 
 Wed, 26 Jan 2022 14:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
 <20220126233204.36d9c37c@windsurf>
In-Reply-To: <20220126233204.36d9c37c@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 26 Jan 2022 23:38:23 +0100
Message-ID: <CAPi7W81eq5Q+ApiWX-RFtSjFErOh4bvDeEqc6+=PkurLFPqK2w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/xvisor: drop arm support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiAyNiBqYW52LiAyMDIyIMOgIDIzOjMyLCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUsIDI1IEphbiAyMDIy
IDIwOjA2OjQ5ICswMTAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBTdXBwb3J0IGZvciBvbGQgMzItYml0IEFSTSBib2FyZHMgKGku
ZS4gQVJNdjUsIEFSTXY2LCBBUk12N2EpIHdpdGhvdXQKPiA+IHZpcnR1YWxpemF0aW9uIGhhcyBi
ZWVuIGRyb3BwZWQgc2luY2UKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS94dmlzb3IveHZpc29yL2Nv
bW1pdC85ZmNkNjk2OTI0ODRlMGY2YWE1MDM2YzI3MTk2ZjU1Yzc5NzU4MmM1Cj4gPiByZXN1bHRp
bmcgaW4gdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiAw
LjMuMSBpbgo+ID4gY29tbWl0IGM0ZjhiODk2ODc3MGVjYmY2NDQ0YTU5MjFjNjQ3MmYxMjY3MTc2
MjY6Cj4gPgo+ID4gKioqIENhbid0IGZpbmQgZGVmYXVsdCBjb25maWd1cmF0aW9uICIvaG9tZS9n
aXVsaW9iZW5ldHRpL2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMy9vdXRwdXQtMS9idWlsZC94dmlz
b3ItMC4zLjEvYXJjaC9hcm0vY29uZmlncy9nZW5lcmljLXY2LWRlZmNvbmZpZyIhCj4gPgo+ID4g
KioqIENhbid0IGZpbmQgZGVmYXVsdCBjb25maWd1cmF0aW9uICIvaG9tZS9naXVsaW9iZW5ldHRp
L2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC94dmlzb3ItMC4zLjEvYXJj
aC9hcm0vY29uZmlncy9nZW5lcmljLXY3LWRlZmNvbmZpZyIhCj4gPgo+ID4gRml4ZXM6Cj4gPiAg
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8xMjExYmY2ZmYxMGM3NTgx
NWZhM2FjMzIwNTMyZmFiNWZlNjQ5YTJiCj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy8yYmNiYmIyNzBkZjcxZDI0ODliN2JjODNlNTZjODk4YzU4Y2M5MGQyCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL3h2aXNvci9Db25maWcuaW4gfCA2ICstLS0t
LQo+ID4gIHBhY2thZ2UveHZpc29yL3h2aXNvci5tayB8IDIgKy0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IEkgdGhpbmsgdGhpcyBpcyBi
YXNlZCBvbiBhIG1pc3VuZGVyc3RhbmRpbmcgb2YgdGhlCj4gaHR0cHM6Ly9naXRodWIuY29tL3h2
aXNvci94dmlzb3IvY29tbWl0LzlmY2Q2OTY5MjQ4NGUwZjZhYTUwMzZjMjcxOTZmNTVjNzk3NTgy
YzUKPiBjb21taXQuIFRoaXMgY29tbWl0IHNheXMgdGhhdCB0aGV5IHJlbW92ZSBzdXBwb3J0IGZv
ciAiQVJNMzIgd2l0aG91dAo+IHZpcnR1YWxpemF0aW9uIHN1cHBvcnQiLCBidXQgdGhlcmUgYXJl
IEFSTTMyIGNvcmVzIHdpdGggdmlydHVhbGl6YXRpb24KPiBzdXBwb3J0ISBBcyBleHBsYWluZWQg
aW4gdGhlIGNvbW1pdCBsb2csIHRoZSBBUk0zMiBjb3JlcyB0aGF0IHN1cHBvcnQKPiB0aGUgQVJN
djd2ZSBpbnN0cnVjdGlvbiBzZXQgYXJlIHN0aWxsIHN1cHBvcnRlZCBieSBYdmlzb3IuCj4KPiBU
aGlzIG1lYW5zIHRoYXQgQ29ydGV4LUE3LCBDb3J0ZXgtQTEyLCBDb3J0ZXgtQTE1IGFuZCBDb3J0
ZXgtQTE3LCB3aGljaAo+IGFyZSBhbGwgQVJNMzIgY29yZXMsIGFyZSBzdGlsbCBzdXBwb3J0ZWQg
YnkgWHZpc29yLiBTbyB0aGlzIHBhdGNoCj4gZW50aXJlbHkgZHJvcHBpbmcgQVJNMzIgZnJvbSBY
dmlzb3IgaXNuJ3QgZW50aXJlbHkgY29ycmVjdC4KPgo+IFNvLCB0aGUgY2hhbmdlIHNob3VsZCBi
ZSBtb3JlIGxpa2UgdGhpczoKPgo+IGNvbmZpZyBCUjJfUEFDS0FHRV9YVklTT1JfQVJDSF9TVVBQ
T1JUUwo+ICAgICAgICAgYm9vbAo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICAg
ICAgICAgZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0Cj4gICAgICAgICBkZWZhdWx0IHkgaWYgQlIy
X3g4Nl82NAo+ICAgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9jb3J0ZXhfYTcgfHwgQlIyX2NvcnRl
eF9hMTIgfHwgQlIyX2NvcnRleF9hMTUgfHwgQlIyX2NvcnRleF9hMTcKPgo+ICBjb25maWcgQlIy
X1BBQ0tBR0VfWFZJU09SX0RFRkNPTkZJRwo+ICAgICAgICAgc3RyaW5nICJEZWZjb25maWcgbmFt
ZSIKPiAtICAgICAgIGRlZmF1bHQgImdlbmVyaWMtdjUiIGlmIEJSMl9BUk1fQ1BVX0FSTVY1Cj4g
LSAgICAgICBkZWZhdWx0ICJnZW5lcmljLXY2IiBpZiBCUjJfQVJNX0NQVV9BUk1WNgo+IC0gICAg
ICAgZGVmYXVsdCAiZ2VuZXJpYy12NyIgaWYgQlIyX0FSTV9DUFVfQVJNVjdBCj4gKyAgICAgICBk
ZWZhdWx0ICJnZW5lcmljLXY3LXZlIiBpZiBCUjJfQVJNX0NQVV9BUk1WN0EKPiAgICAgICAgIGRl
ZmF1bHQgImdlbmVyaWMtdjgiIGlmIEJSMl9hYXJjaDY0Cj4gICAgICAgICBkZWZhdWx0ICJ4ODZf
NjRfZ2VuZXJpYyIgaWYgQlIyX3g4Nl82NAo+Cj4gV2hhdCBkbyB5b3UgdGhpbmsgPwpZb3UgaGF2
ZSBtb3JlIGtub3dsZWRnZSB0aGFuIG1lIG9uIEFSTTMyLiBJJ2xsIHNlbmQgYSB2MiBvZiB0aGUg
c2VyaWUuCj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
