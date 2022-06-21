Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF46DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 13:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8FC60EE1;
	Tue, 21 Jun 2022 13:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D8FC60EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13Wg38oTxh6Z; Tue, 21 Jun 2022 13:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9970160B89;
	Tue, 21 Jun 2022 13:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9970160B89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4596D1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121388249E
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 121388249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8HxcxWOllHM for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 13:54:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369E081BB4
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 369E081BB4
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:54:44 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-101cdfddfacso10312210fac.7
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 06:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/s+34yKpzPjKYgGSDf1zrkcA88A+8szsXDUhAm0FRU=;
 b=EUVpkXdmv3Kt7f2L319ujdiPz4Pm47NUQQm8wQ95cUuPOiuO26oCC7wgxh4dYlR9OZ
 cSrEE/ksmJLYXoqx7uGjxGFREQBHAv6PXlinLhFz1JvVxIuGJRSVu7yfmKBv0nsrEbE8
 3/PB2PtVaT/+ckswUo35iUUmL6c9wkzcbDmeowVcznLB50Y6dY4MpzKv7qP+T8JpWJz6
 2Kj9md9FKG8+s4HIikEmv933NJd1Qeo/46QEO+RnmiKuCPcUgJtgLAKjc4+XFK0iqq0Y
 fhfjrEH0s0xRZkaGUwPQ0B2uEt+QWW6stk2992U3ktSWitLs7QNVu1rqhJNmDkoPJNQf
 zSPA==
X-Gm-Message-State: AJIora/OpzWo48zW39LMSLkK87L4/ZlrFKAK7mnCn05xmmUhRF3Q8e1X
 JwhOI4nQTo7MkPfP461qvr/jKpfSM35ZtAQKUo6RoA==
X-Google-Smtp-Source: AGRyM1vxFSLJ+5yGeI0QZb8JuAWBKAcwzghnfFCC6W3T2P+ihgiW0f0c2t6xnuIybcMZ2KoFBxXvYF2m+gLqwbQJgP4=
X-Received: by 2002:a05:6870:51cb:b0:fb:5c97:bd1b with SMTP id
 b11-20020a05687051cb00b000fb5c97bd1bmr16074644oaj.104.1655819683124; Tue, 21
 Jun 2022 06:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220621130636.1100016-1-kory.maincent@bootlin.com>
 <CAN5uoS9XgxK9-A8-QKGCuifxXAS6-EUMHDJsfBrUdjYB3qcPdA@mail.gmail.com>
 <20220621154533.4f5e7c0e@kmaincent-XPS-13-7390>
In-Reply-To: <20220621154533.4f5e7c0e@kmaincent-XPS-13-7390>
From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 21 Jun 2022 15:54:32 +0200
Message-ID: <CAN5uoS9ssQz6NBaRZ2avNiafm_dgYbp-3QL1p5p-LG02OxVd+g@mail.gmail.com>
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/s+34yKpzPjKYgGSDf1zrkcA88A+8szsXDUhAm0FRU=;
 b=UyM0zrIUr9msRArdb3Z2WPaN02jF/bFGyFRzYIfryNsVURt+usVkBI9Sg1g3aHlq0t
 z49Y/jS8NzIeTOOonLEO/fZ3Fm9EffovsciuG3nVuITtU9pm22KrJt0ArrEQEIT4R0oP
 CuRHU8owjb2qqFQkrRKN1gKvo0u2vFGMspvPXqsn2ybZvkqmD1I0o0C4GGpQjNJKG28g
 PBqGUbVjfdzKI+JBM8OeQhEariWVe5/3iRX1I5uHyIM1WSYQNuDsjeETRDe+/Srz7onl
 Ni6R61CunqmULZdnqN5f1ZEFMMzOZLGOPRR1WOrz3/GqWu2MZZIJAfuOOFV2F/cspvYX
 VEbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=UyM0zrIU
Subject: Re: [Buildroot] [PATCH] boot/optee-os: add support for custom
 tarball URL
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBKdW4gMjAyMiBhdCAxNTo0NSwgS8O2cnkgTWFpbmNlbnQgPGtvcnkubWFpbmNl
bnRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gRXRpZW5uZSwKPgo+IFRoYW5rcyBmb3Ig
dGhlIHJldmlldyEKPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5t
ayBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiA+ID4gaW5kZXggODhmMTRiNDhlNC4uY2M5
MGNmZjJjYiAxMDA2NDQKPiA+ID4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+ID4g
PiArKysgYi9ib290L29wdGVlLW9zL29wdGVlLW9zLm1rCj4gPiA+IEBAIC0xMywxNCArMTMsMjIg
QEAgZW5kaWYKPiA+ID4gIE9QVEVFX09TX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4gPiAgT1BU
RUVfT1NfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiA+ID4KPiA+ID4gLWlmZXEgKCQoQlIyX1RBUkdF
VF9PUFRFRV9PU19DVVNUT01fR0lUKSx5KQo+ID4gPiAraWZlcSAoJChPUFRFRV9PU19WRVJTSU9O
KSxjdXN0b20pCj4gPgo+ID4gSXQgbG9va3Mgc3RyYW5nZSB0byBtZSB0aGF0ICJjdXN0b20iIGlz
IGEgcmVzZXJ2ZWQgdmVyc2lvbiBpZGVudGlmaWVyCj4gPiB3aGVuIHVzaW5nIGEgY3VzdG9tIHRh
cmJhbGwuCj4gPiBJJ2QgcmF0aGVyIHVzZToKPiA+ICAgIGlmZXEgKCQoQlIyX1RBUkdFVF9PUFRF
RV9PU19DVVNUT01fVEFSQkFMTCkseSkKPgo+IEkgaGF2ZSBjb3BpZWQgdGhlIHNhbWUgbWVjaGFu
aXNtIGFzIFUtYm9vdCBhbmQgVEYtQS4KPiBJIGRvbid0IGtub3cgd2hhdCdzIHRoZSBiZXR0ZXIg
d2F5LCBpZiB5b3UgcHJlZmVyIHRoaXMgSSBjYW4gY2hhbmdlIGl0Lgo+CgpJIHJlYWxseSBwcmVm
ZXIgbXkgcHJvcG9zYWwuCklzICJjdXN0b20iIGEgcmVzZXJ2ZWQgdmVyc2lvbiBpZGVudGlmaWVy
IGluIEJ1aWxkcm9vdCBjb25maWd1cmF0aW9uCnN3aXRjaGVzPyBJIGNhbid0IHRlbGwgYnV0IGkg
dGhpbmsgaXQnZCBiZSBhIGJpdCBmcmFnaWxlLgoKCj4gPiA+ICtpZmVxICgkKGNhbGwgcXN0cmlw
LCQoQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTF9MT0NBVElPTikpKSwpCj4gPiA+
ICskKGVycm9yIE5vIHRhcmJhbGwgbG9jYXRpb24gc3BlY2lmaWVkLiBQbGVhc2UgY2hlY2sKPiA+
ID4gQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fVEFSQkFMTF9MT0NBVElPTikpCj4gPgo+ID4g
VGhlcmUgaXMgYSBleHRyYSBlbmRpbmcgcGFyZW50aGVzZXMgdG8gYmUgcmVtb3ZlZCBpbiBlYWNo
IG9mIHRoZSAyIGFib3ZlCj4gPiBsaW5lcy4KPgo+IFRydWUsIGFuZCBURi1BIGhhcyB0aGUgc2Ft
ZSBpc3N1ZSEgOikKCk1heWJlIHlvdSBjYW4gZml4IGl0IGJ5IHRoZSB3YXkhCgpldGllbm5lCgo+
Cj4gS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
