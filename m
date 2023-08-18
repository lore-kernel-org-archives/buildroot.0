Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E30EEE499B
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEC13400BB;
	Fri, 18 Aug 2023 21:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC13400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPie8Bo-w0zY; Fri, 18 Aug 2023 21:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF7B54013D;
	Fri, 18 Aug 2023 21:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF7B54013D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D101BF2AA
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B19A4013D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B19A4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L387Nh7ivhJv for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 21:36:26 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDDED400BB
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 21:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDDED400BB
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6459a5919cdso7327866d6.3
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 14:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692394585; x=1692999385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zypaAWqWAzVrg5LGynNJEyHHXe0OwgWjS0W+VjFD/mE=;
 b=cOsmd6VdqL9DQHuNqV4uOlq3DbpaFoUdi7UpTiJFWfIlHLqOmkqa/mBevKlvMnklZU
 tJixxth+b11/ywqVg8seos++llqO4PP52iti4lgWN3QOmcp0f5zsIdap3GpeVEiITrgk
 iwlaD8nRyvduQklkoH92F8vvBEXxBA0z6bip0xuBnoSH28SOYGWn5Wu9bA/yxUAhdJSq
 c5x+Z6hHIeABVODY5vUI2lPbpDRBhtwYEC2HJdu464+bEVN5O7xef/Gj8q2n8kfkPA7Z
 1B55gl0EHZieIiuqiEvdUaRQ/A+Wgh/M7baEgXEVsNCte/EF+VrkP1DVf+IK8QjONVhb
 ekbA==
X-Gm-Message-State: AOJu0Yy8xQzPF6hR0M5zhatUz7fBPkCIoRUFDd9RjVHBF4z2i4F8aO8x
 h/hzsOnm3+1V/1/WiQzKoxwHbINcrpSWtP2T1/E=
X-Google-Smtp-Source: AGHT+IHCB4r8Z+aVGAwCmPAa3E3N5AWmbXN0FP6q0RnZX5723w6mKcrpWUBom7wZ8XfPs5Kqq2HwtE1GPSYoKcB29V0=
X-Received: by 2002:a0c:f150:0:b0:647:d558:1ee2 with SMTP id
 y16-20020a0cf150000000b00647d5581ee2mr480950qvl.12.1692394585607; Fri, 18 Aug
 2023 14:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
 <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
 <4850715.GXAFRqVoOG@kilian-aisec>
 <CAOCHtYh7RMBBFJKySPkcHqA5LoCK3jUpYv2k+80Q1GmenWnuDQ@mail.gmail.com>
In-Reply-To: <CAOCHtYh7RMBBFJKySPkcHqA5LoCK3jUpYv2k+80Q1GmenWnuDQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 18 Aug 2023 16:35:59 -0500
Message-ID: <CAOCHtYjVZLkEe0FXnh16dpNDC5cCPA5_kmk7ELWOnkTEPuxpvA@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692394585; x=1692999385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zypaAWqWAzVrg5LGynNJEyHHXe0OwgWjS0W+VjFD/mE=;
 b=qcvQL47c9WSwojwgu6zDKaYwLq2DWNYRm26VSIaBKCLGkNVcYKyh6j2YqQOGdWrjKs
 S+D0OfodYWdxxQkZxd6rRxg0A69r9f28GrlN5TB/A4T3LUEL6KWfTWVZM9wDor/Pb/Zm
 wh+1K3YG9TiLoBUI/GtVAs/d1I5OuvDAUzwofP9PFfamO/TOe2kL2lQn+nyRr+AincXi
 8bdag3EmN25h2PLyLqpUjuPl27FcFYrlz9xLSRlhccMihN0xebH0QQ5YIa8e45UDZDRR
 mZzKpT//I5ltgJeMpeaUXILNPTHhi4IfNuFb9NNMVQ0S5ZUMjA0eWgjJcpgX1tUH18yG
 Uq2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qcvQL47c
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgNDozM+KAr1BNIFJvYmVydCBOZWxzb24gPHJvYmVydGNu
ZWxzb25AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDE4LCAyMDIzIGF0IDEyOjE4
4oCvUE0gS2lsaWFuIFppbm5lY2tlcgo+IDxraWxpYW4uemlubmVja2VyQG1haWwuZGU+IHdyb3Rl
Ogo+ID4KPiA+IEhlbGxvIFJvYmVydCBhbmQgVGhvbWFzLAo+ID4KPiA+IEkgYW0gbWFraW5nIGEg
Yml0IG9mIHByb2dyZXNzLiBIb3dldmVyLCBJIHN0aWxsIGhhdmUgc29tZSBpc3N1ZXMuCj4gPgo+
ID4gWy0tU05JUC0tXQo+ID4KPiA+ID4gT2theSBLaWxpYW4sIHRoZXNlIGFsbCBidWlsZCB3aXRo
Cj4gPiA+IHg4Nl82NC1nY2MtMTMuMi4wLW5vbGliYy1yaXNjdjY0LWxpbnV4LnRhci54ego+ID4g
Pgo+ID4gPiBvcGVuc2JpOgo+ID4gPiBodHRwczovL2dpdC5iZWFnbGVib2FyZC5vcmcvYmVhZ2xl
di1haGVhZC9iZWFnbGV2LWFoZWFkLW9wZW5zYmkvLS90cmVlLzAuOS0+IDEuMS4yLXVidW50dSB1
LWJvb3Q6Cj4gPiA+IGh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFkL2Jl
YWdsZXYtYWhlYWQtdS1ib290Ly0vdHJlZS9iZWFnbAo+ID4gPiBldi12MjAyMC4wMS0xLjEuMi11
YnVudHUgbGludXg6Cj4gPiA+IGh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFo
ZWFkL2JlYWdsZXYtYWhlYWQtbGludXgvLS90cmVlL2JlYWdsZQo+ID4gPiB2LXY1LjEwLjExMy0x
LjEuMi11YnVudHUKPiA+ID4KPiA+ID4gRm9yIGJhbmR3aWR0aCBpc3N1ZXMsIHBsZWFzZSB1c2Ug
dGhlIGdpdGh1YiBtaXJyb3JzIGRpcmVjdGx5IGluCj4gPiA+IHBhdGNoZXMgZm9yIGJ1aWxkcm9v
dCwgYXMgdGhlc2UgYXJlIHB1c2ggbWlycm9yZWQgZnJvbQo+ID4gPiBnaXQuYmVhZ2xlYm9hcmQu
b3JnLyAsIGF0IHdvcnN0IHRoZXkgbGFnIGJ5IDEwIG1pbnV0ZXMgYWZ0ZXIgYSBuZXcKPiA+ID4g
Y29tbWl0Cj4gPiA+Cj4gPiA+IG9wZW5zYmk6Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9iZWFn
bGVib2FyZC9iZWFnbGV2LWFoZWFkLW9wZW5zYmkvdHJlZS8wLjktMS4xLjItdWJ1bnR1Cj4gPiA+
IHUtYm9vdDoKPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2JlYWdsZWJvYXJkL2JlYWdsZXYtYWhl
YWQtdS1ib290L3RyZWUvYmVhZ2xldi12MjAyMC4wMS0xCj4gPiA+IC4xLjItdWJ1bnR1IGxpbnV4
Ogo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vYmVhZ2xlYm9hcmQvbGludXgvdHJlZS9iZWFnbGV2
LXY1LjEwLjExMy0xLjEuMi11YnVudHUKPiA+Cj4gPiBXaGVuIGJ1aWxkcm9vdCBjb21waWxlcyBv
cGVuc2JpLCBJIGdldCBhIGxvdCBvZiAidW5kZWZpbmVkIHJlZmVyZW5jZSB0bwo+ID4gYF9fc3Rh
Y2tfY2hrX2d1YXJkJyIgZXJyb3JzLiBJIHRoaW5rIHRoYXQgZWl0aGVyIHRoZSBuZWNlc3Nhcnkg
Ii1mbm8tc3RhY2stCj4gPiBwcm90ZWN0b3IiIGZsYWcgaXMgbm90IGFjdGl2ZSBkdXJpbmcgYnVp
bGQsIG9yIHRoYXQgdGhlIHRvb2xjaGFpbiBkb2VzIG5vdAo+ID4gcHJvdmlkZSB0aGUgbmVjZXNz
YXJ5IGZ1bmN0aW9ucy4gSSB0cmllZCBhZGRpbmcgc29tZXRoaW5nIHNpbWlsYXIgbGlrZSB0aGlz
Cj4gPgo+ID4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxv
Yi9tYXN0ZXIvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5t
az9yZWZfdHlwZT1oZWFkcyNMNjctNzIKPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvQ29u
ZmlnLmluP3JlZl90eXBlPWhlYWRzI0wyMzQtMjUxCj4gPgo+ID4gdG8gdGhlIG9wZW5zYmkgY29u
ZmlnIGFuZCBtYWtlIGZpbGVzLCBidXQgaXQgZGlkIG5vdCBoZWxwLiBJIGFsc28gY2hlY2tlZCBh
bmQKPiA+IHRoZSAuY29uZmlnIGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgZmxhZ3M6Cj4gPgo+ID4g
QlIyX1NTUF9TVFJPTkc9eQo+ID4gQlIyX1NTUF9PUFRJT049Ii1mc3RhY2stcHJvdGVjdG9yLXN0
cm9uZyIKPiA+IEJSMl9UQVJHRVRfT1BFTlNCSV9TU1A9eQo+ID4gQlIyX1RBUkdFVF9PUEVOU0JJ
X1NTUF9MRVZFTD0ic3Ryb25nIgo+ID4KPiA+IERvZXMgYW55b25lIGhhdmUgYW4gaWRlYT8gSSBj
YW4gcHJvdmlkZSBtb3JlIGluZm8gaWYgbmVlZGVkLgo+Cj4gT2ggbGV0J3MgYmFja3BvcnQ6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC82MTM5
YWIyNzJiMWU2OWU0ZmY4YTM3NjU1OTY5Yzg3N2FlODZkZTQ5Cj4KPiBSZW1lbWJlciwgb3VyIHZl
cnNpb24gb2YgT3BlblNCSSBpcyBwcmV0dHkgYW5jaWVudCAoMC45KSB3ZSBhcmUgb25seQo+IHN0
dWNrIG9uIGl0IGZvciB0aGUgdGhlYWQgdjUuMTAuMTEzLTEuMS4yLXVidW50dSBicmFuY2gsIG9u
IG1haW5saW5lCj4gd2UgYXJlIGFscmVhZHkgdXNpZyBtYWlubGluZSBvcGVuU0JJLi4KCmFuZCBw
dXNoZWQ6IGh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYt
YWhlYWQtb3BlbnNiaS8tL2NvbW1pdHMvMC45LTEuMS4yLXVidW50dQoKLS0gClJvYmVydCBOZWxz
b24KaHR0cHM6Ly9yY24tZWUuY29tLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
