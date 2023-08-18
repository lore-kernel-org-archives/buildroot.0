Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C2EE499B
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 21:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57B6B419B4;
	Fri, 18 Aug 2023 21:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B6B419B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o9DZxI3RYUGd; Fri, 18 Aug 2023 21:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4992441993;
	Fri, 18 Aug 2023 21:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4992441993
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6BDA61BF2AA
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9E6418D6
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 21:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D9E6418D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR0_huAE9NvT for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 21:33:56 +0000 (UTC)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F26F84188C
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 21:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F26F84188C
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6491907dbc3so7285096d6.2
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 14:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692394434; x=1692999234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xsSyGmsd4QqKl3SRhUsA6HTxCf4L7GXg3a+YHtfDvuc=;
 b=OBC9mY5xTKx5X0xSOME44SlAIA6uNqts33xtSQFW1fQCuJJSt/twduFiab65jKpZxq
 A9KRfY+viP2g1E63BE16ZJPglyd/JWS+Za4p3aVmva92HbbOwZlk2rzKeb3FjGNdQym8
 kjIiebORt5HZmlD6lbd2xFS5zHbtRlpkVz1qk4fJgVm7wvVhay3LmDpnnnr0+2F2lPeS
 VsFBfh4fbaEDv5Yw4rdrNWhAFhi865ASjSg7z1x6QASq5y5huY2gRoZ/npFbTK0Es9gD
 I67aB8hEVEGujh+Nve2HPl2/XTXZvGemhlghTsDvpOUEe7wEVy+DbEw9rHIGkzdOl79A
 J2aA==
X-Gm-Message-State: AOJu0YxbsrWaM2g72v+AbCGkM84BowYnDOF9sNhQiuixMwMzoebrtzsn
 kpJXHfHSU83WcFaFyhBjYOCvbDPDHu8sIK53JvA=
X-Google-Smtp-Source: AGHT+IGzCdtLxZo0QRo5CLWLK86k2yRXE64vx1HXl1h04tnASbezQvYbpsTWiqDtFLNc7JtdOdLa0Vj2eII/eMD5/GA=
X-Received: by 2002:a0c:ca86:0:b0:64b:5240:1375 with SMTP id
 a6-20020a0cca86000000b0064b52401375mr509008qvk.8.1692394434536; Fri, 18 Aug
 2023 14:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
 <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
 <4850715.GXAFRqVoOG@kilian-aisec>
In-Reply-To: <4850715.GXAFRqVoOG@kilian-aisec>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 18 Aug 2023 16:33:28 -0500
Message-ID: <CAOCHtYh7RMBBFJKySPkcHqA5LoCK3jUpYv2k+80Q1GmenWnuDQ@mail.gmail.com>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692394434; x=1692999234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xsSyGmsd4QqKl3SRhUsA6HTxCf4L7GXg3a+YHtfDvuc=;
 b=qNQE8QIasuS/mrsfUG+zn6pb6IooP2rYxQHFDhbjWFV/WbnFasDHq5IqkL0zCqNVFc
 gx07McITIgD/tlboHzRKz3N+j24+fy4/TrYzA26/7u7P+XmNPHPgyilfMQVMKHQfROWR
 Y5iLWRrod8BwvMgkDIXy1ZIcAHdF3UxX2r7EmwZT1jG706tbYRo4ZkfWUiGARdQevJOI
 Bra4Rqcnsxgz6AyCGGJwcfuau62j/Nrh6JH4bXl5LCAuo4aK87vAd3C58xKs/V59WmMK
 bdRrch0kuN9t1cPYvSr/o2ZQK9lzkagLSg5tDYv/vLKPSHGBuufheXPxJkRwAUZoANzz
 wEgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qNQE8QIa
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

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgMTI6MTjigK9QTSBLaWxpYW4gWmlubmVja2VyCjxraWxp
YW4uemlubmVja2VyQG1haWwuZGU+IHdyb3RlOgo+Cj4gSGVsbG8gUm9iZXJ0IGFuZCBUaG9tYXMs
Cj4KPiBJIGFtIG1ha2luZyBhIGJpdCBvZiBwcm9ncmVzcy4gSG93ZXZlciwgSSBzdGlsbCBoYXZl
IHNvbWUgaXNzdWVzLgo+Cj4gWy0tU05JUC0tXQo+Cj4gPiBPa2F5IEtpbGlhbiwgdGhlc2UgYWxs
IGJ1aWxkIHdpdGgKPiA+IHg4Nl82NC1nY2MtMTMuMi4wLW5vbGliYy1yaXNjdjY0LWxpbnV4LnRh
ci54ego+ID4KPiA+IG9wZW5zYmk6Cj4gPiBodHRwczovL2dpdC5iZWFnbGVib2FyZC5vcmcvYmVh
Z2xldi1haGVhZC9iZWFnbGV2LWFoZWFkLW9wZW5zYmkvLS90cmVlLzAuOS0+IDEuMS4yLXVidW50
dSB1LWJvb3Q6Cj4gPiBodHRwczovL2dpdC5iZWFnbGVib2FyZC5vcmcvYmVhZ2xldi1haGVhZC9i
ZWFnbGV2LWFoZWFkLXUtYm9vdC8tL3RyZWUvYmVhZ2wKPiA+IGV2LXYyMDIwLjAxLTEuMS4yLXVi
dW50dSBsaW51eDoKPiA+IGh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9iZWFnbGV2LWFoZWFk
L2JlYWdsZXYtYWhlYWQtbGludXgvLS90cmVlL2JlYWdsZQo+ID4gdi12NS4xMC4xMTMtMS4xLjIt
dWJ1bnR1Cj4gPgo+ID4gRm9yIGJhbmR3aWR0aCBpc3N1ZXMsIHBsZWFzZSB1c2UgdGhlIGdpdGh1
YiBtaXJyb3JzIGRpcmVjdGx5IGluCj4gPiBwYXRjaGVzIGZvciBidWlsZHJvb3QsIGFzIHRoZXNl
IGFyZSBwdXNoIG1pcnJvcmVkIGZyb20KPiA+IGdpdC5iZWFnbGVib2FyZC5vcmcvICwgYXQgd29y
c3QgdGhleSBsYWcgYnkgMTAgbWludXRlcyBhZnRlciBhIG5ldwo+ID4gY29tbWl0Cj4gPgo+ID4g
b3BlbnNiaToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9iZWFnbGVib2FyZC9iZWFnbGV2LWFoZWFk
LW9wZW5zYmkvdHJlZS8wLjktMS4xLjItdWJ1bnR1Cj4gPiB1LWJvb3Q6Cj4gPiBodHRwczovL2dp
dGh1Yi5jb20vYmVhZ2xlYm9hcmQvYmVhZ2xldi1haGVhZC11LWJvb3QvdHJlZS9iZWFnbGV2LXYy
MDIwLjAxLTEKPiA+IC4xLjItdWJ1bnR1IGxpbnV4Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2Jl
YWdsZWJvYXJkL2xpbnV4L3RyZWUvYmVhZ2xldi12NS4xMC4xMTMtMS4xLjItdWJ1bnR1Cj4KPiBX
aGVuIGJ1aWxkcm9vdCBjb21waWxlcyBvcGVuc2JpLCBJIGdldCBhIGxvdCBvZiAidW5kZWZpbmVk
IHJlZmVyZW5jZSB0bwo+IGBfX3N0YWNrX2Noa19ndWFyZCciIGVycm9ycy4gSSB0aGluayB0aGF0
IGVpdGhlciB0aGUgbmVjZXNzYXJ5ICItZm5vLXN0YWNrLQo+IHByb3RlY3RvciIgZmxhZyBpcyBu
b3QgYWN0aXZlIGR1cmluZyBidWlsZCwgb3IgdGhhdCB0aGUgdG9vbGNoYWluIGRvZXMgbm90Cj4g
cHJvdmlkZSB0aGUgbmVjZXNzYXJ5IGZ1bmN0aW9ucy4gSSB0cmllZCBhZGRpbmcgc29tZXRoaW5n
IHNpbWlsYXIgbGlrZSB0aGlzCj4KPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9ibG9iL21hc3Rlci9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVz
dGVkLWZpcm13YXJlLm1rP3JlZl90eXBlPWhlYWRzI0w2Ny03Mgo+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL2Jvb3QvYXJtLXRydXN0ZWQt
ZmlybXdhcmUvQ29uZmlnLmluP3JlZl90eXBlPWhlYWRzI0wyMzQtMjUxCj4KPiB0byB0aGUgb3Bl
bnNiaSBjb25maWcgYW5kIG1ha2UgZmlsZXMsIGJ1dCBpdCBkaWQgbm90IGhlbHAuIEkgYWxzbyBj
aGVja2VkIGFuZAo+IHRoZSAuY29uZmlnIGNvbnRhaW5zIHRoZSBmb2xsb3dpbmcgZmxhZ3M6Cj4K
PiBCUjJfU1NQX1NUUk9ORz15Cj4gQlIyX1NTUF9PUFRJT049Ii1mc3RhY2stcHJvdGVjdG9yLXN0
cm9uZyIKPiBCUjJfVEFSR0VUX09QRU5TQklfU1NQPXkKPiBCUjJfVEFSR0VUX09QRU5TQklfU1NQ
X0xFVkVMPSJzdHJvbmciCj4KPiBEb2VzIGFueW9uZSBoYXZlIGFuIGlkZWE/IEkgY2FuIHByb3Zp
ZGUgbW9yZSBpbmZvIGlmIG5lZWRlZC4KCk9oIGxldCdzIGJhY2twb3J0OgpodHRwczovL2dpdGh1
Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvY29tbWl0LzYxMzlhYjI3MmIxZTY5ZTRm
ZjhhMzc2NTU5NjljODc3YWU4NmRlNDkKClJlbWVtYmVyLCBvdXIgdmVyc2lvbiBvZiBPcGVuU0JJ
IGlzIHByZXR0eSBhbmNpZW50ICgwLjkpIHdlIGFyZSBvbmx5CnN0dWNrIG9uIGl0IGZvciB0aGUg
dGhlYWQgdjUuMTAuMTEzLTEuMS4yLXVidW50dSBicmFuY2gsIG9uIG1haW5saW5lCndlIGFyZSBh
bHJlYWR5IHVzaWcgbWFpbmxpbmUgb3BlblNCSS4uCgpSZWdhcmRzLAoKLS0gClJvYmVydCBOZWxz
b24KaHR0cHM6Ly9yY24tZWUuY29tLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
