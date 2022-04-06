Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE31C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 10:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FEE1826F5;
	Wed,  6 Apr 2022 10:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ao5iO7mW8QyK; Wed,  6 Apr 2022 10:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5148D81C58;
	Wed,  6 Apr 2022 10:09:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C78111BF421
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 10:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62E660073
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 10:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a_l5_JyjKzcX for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 10:09:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C001A60EB9
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 10:09:06 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso1425343otj.0
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v74HjANpW0lTcUkiSJlFhLJ+Eub2oG1WJqpriWEN63M=;
 b=gVC3nRg2Ay4Wc1a4dHQ4dNxepvyT56zNmQIJ5J3WVajtSbEd9DiZnsYu0gjb2JHow6
 oy0LGoxFGUjf07HAzNwMYDQaAWkmm4ISWcwMEb8mQNM0TvWweT8xC/5xG/h8DaNtIGRp
 vDiH1PSJgWokOoEjAcXnOwf5GOnliJDOj2IUDXx7lwRs9LlPmU2r8N6wVDlFjsmUtGD+
 9GWmiv2eT78gZxbxIYTYkF9CJc7bRS5LuhsIZ0PUWxo19rNkCOINJ08PHQJSdlVKp1JA
 zKIwJwtIbsuVKiCL6+6ZSIZ0LUuXA+0SZ8eLXkzm7Nu4pEwiuTrdY2yJVXq5nONb1DEM
 pFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v74HjANpW0lTcUkiSJlFhLJ+Eub2oG1WJqpriWEN63M=;
 b=jqje0apzTij4Wrj+oUn4zqhrfR8AT0Kk6UiGzSK77SBlcxGEobAV5yNAHr4srR2Mt2
 fX+nH+xvXbAZPzUPrxpgIe8UrSMMh7pDnCiYTPNSzeUONbLPAU4+2shGPztR5si7DhLC
 HS0gfvHowOvwBAU8CwUTPXZPpmYKw/9ITMFpLiVQcb/VIbfh3b0an8wtoJgBAHY7nhNI
 eBprdhUE3Vy4SgzIGRMUmYBaLc41ZRmflMTvbb8hpI4HsV+Xr9faWfZAFGV6+F6kiMdz
 43R/aDqJSfDLU4gFh5g9b/dT+KMsiPou9rbX6HpQU0So2ZgzsXlVWQZYXyIgzhSPekN1
 Sedw==
X-Gm-Message-State: AOAM533D5o+n1RQtesQa23LtkQ7ehI9X96L1ciV9rQO0sx30+WcIwAjC
 d/gkWHZ3jlHKgV81Q6/hcBTL5L/tPPdd/9qK50I=
X-Google-Smtp-Source: ABdhPJxnB5t27q5r6mrD+czDHgWzU46pcexp1EpItjuhT8GOzHz9X4zGTUNM+cKf2caKAouVOfLSMxWhxlt1O/3DwCA=
X-Received: by 2002:a9d:6a84:0:b0:5cd:ad64:a50 with SMTP id
 l4-20020a9d6a84000000b005cdad640a50mr2714784otq.114.1649239745696; Wed, 06
 Apr 2022 03:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220405213351.2487658-1-fontaine.fabrice@gmail.com>
 <CACPK8XdUYqNuBpwPPMkjSz4rHxOD3JrrgCOH_3Wf=E06GrWnFA@mail.gmail.com>
In-Reply-To: <CACPK8XdUYqNuBpwPPMkjSz4rHxOD3JrrgCOH_3Wf=E06GrWnFA@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 6 Apr 2022 12:07:16 +0200
Message-ID: <CAPi7W80wRyuumLEQoqMZwthMbny4GkuiE_8BEW7dW8qrfhrb6A@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build on powerpc
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9lbCwKCkxlIG1lci4gNiBhdnIuIDIwMjIgw6AgMTE6NTcsIEpvZWwgU3RhbmxleSA8am9l
bEBqbXMuaWQuYXU+IGEgw6ljcml0IDoKPgo+IEhpIEZhYnJpY2UsCj4KPiBPbiBUdWUsIDUgQXBy
IDIwMjIgYXQgMjE6MzUsIEZhYnJpY2UgRm9udGFpbmUKPiA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+ID4KPiA+IFNldCBOU1NfRElTQUJMRV9DUllQVE9fVlNYIHdoaWNoIGlz
IGF2YWlsYWJsZSBzaW5jZSB2ZXJzaW9uIDMuNjQgYW5kCj4gPiBodHRwczovL2dpdGh1Yi5jb20v
bnNzLWRldi9uc3MvY29tbWl0LzlkYWI0MzM3MWQ0ZDkyNDQxOTUyM2UxOGJhODRmMDI4MDQ4ODA1
MzMKPiA+IHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiBwb3dlcnBjOgo+
ID4KPiA+IGNjMTogd2FybmluZzogJy1tdnN4JyByZXF1aXJlcyBoYXJkd2FyZSBmbG9hdGluZyBw
b2ludAo+ID4gY2MxOiBlcnJvcjogJy1tbm8tdnN4JyB0dXJucyBvZmYgJy1tY3J5cHRvJwo+ID4K
PiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
NmJlZGI1YjY1OGY2YzljMTZjMjZjNzNhNTI0YTk5NWU1ZTg0ZmNjOAo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgcGFja2FnZS9saWJuc3MvbGlibnNzLm1rIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibnNzL2xp
Ym5zcy5tayBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tawo+ID4gaW5kZXggMmY3YTI2NTEzNi4u
NDU4MmM1NWFkYSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tawo+ID4g
KysrIGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCj4gPiBAQCAtNTEsNiArNTEsNyBAQCBMSUJO
U1NfQlVJTERfVkFSUyA9IFwKPiA+ICAgICAgICAgTlNQUl9JTkNMVURFX0RJUj0kKFNUQUdJTkdf
RElSKS91c3IvaW5jbHVkZS9uc3ByIFwKPiA+ICAgICAgICAgTlNQUl9MSUJfRElSPSQoU1RBR0lO
R19ESVIpL3Vzci9saWIgXAo+ID4gICAgICAgICBOU19VU0VfR0NDPTEgXAo+ID4gKyAgICAgICBO
U1NfRElTQUJMRV9DUllQVE9fVlNYPTEgXAo+Cj4gSG93IGFib3V0IHdlIGludHJvZHVjZSBhIEJS
Ml9QT1dFUlBDX0NQVV9IQVNfVlNYLCBpbiBhIHNpbWlsYXIgZmFzaGlvbgo+IHRvIEJSMl9QT1dF
UlBDX0NQVV9IQVNfQUxJVElWRUM/Cj4KPiBJJ3ZlIHByZXBhcmVkIGEgcGF0Y2ggdG8gZG8gdGhh
dCwgYW5kIHJlYmFzZWQgeW91ciBjaGFuZ2UgdG8gdXNlIGl0Ogo+Cj4gIGh0dHBzOi8vZ2l0aHVi
LmNvbS9zaGVua2kvYnVpbGRyb290L2NvbW1pdHMvcG93ZXJwYy12c3gKPgo+IEkgZGlkIGEgYnVp
bGQgdGVzdCBvZiB0aGUgYXV0b2J1aWxkZXIgY29uZmlnIHlvdSBsaW5rZWQgdG8gYW5kIGl0IHN1
Y2NlZWRlZC4KPgo+IEknbGwgc2VuZCB0aGVtIG91dCB0b21vcnJvdyB1bmxlc3MgeW91IGhhdmUg
YW4gYWx0ZXJuYXRpdmUgcHJvcG9zYWwuCgpTdXJlLCBJJ2xsIHNldCBteSBwYXRjaCBhcyBzdXBl
cnNlZGVkIGluIHBhdGNod29yay4KCkkgd291bGQgYWR2aXNlIHRvIGFkZCBzdXBwb3J0IGZvciB0
aGlzIG5ldyBvcHRpb24gdG8gZmxhYyBhcyB2c3ggd2FzCnVuY29uZGl0b25hbGx5IGRpc2FibGVk
IHdpdGgKaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0L3BhY2thZ2Uv
ZmxhYz9pZD01MTk3Y2U1ZmYzMGQxYTIzYjgxMWRkZGRjYTgwMzBmMTM2NThkN2RhCgo+Cj4gQ2hl
ZXJzLAo+Cj4gSm9lbAo+Cj4gPiAgICAgICAgIE5TU19ESVNBQkxFX0dURVNUUz0xIFwKPiA+ICAg
ICAgICAgTlNTX1VTRV9TWVNURU1fU1FMSVRFPTEgXAo+ID4gICAgICAgICBOQVRJVkVfQ0M9IiQo
SE9TVENDKSIgXAo+ID4gLS0KPiA+IDIuMzUuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
