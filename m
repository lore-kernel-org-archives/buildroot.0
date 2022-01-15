Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F34C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9607C60BAC;
	Sat, 15 Jan 2022 20:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZa4PHXK8WVg; Sat, 15 Jan 2022 20:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29DD60745;
	Sat, 15 Jan 2022 20:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44BD41BF3A6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D11E60BBA
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cU1om7lL65jw for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51E7E60BAC
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:19:32 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id l15so23086229uai.11
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NX7qr/SzR8OiMaEOKT9Lop3hk/hmeg+xRGasK7FIjRs=;
 b=Uqdn6a8no5TLf7n06CsagSpfzkC3AMpasaAyWkYZyOJLpmF5S9wE3Y90uXz9Geiehx
 jSFUJ/egz5MEwm+jZoWnIjGMnTfcNKQtmIazodaakJH2bBaTO/o3M73h94mAnpLxCTeZ
 egJBm3qWzFXHB68X4GQoR5V/QdmDMjpI7NyE17ChYLg0irV9UgFcOB+0yVHHydcjaaOd
 udNDLzno/G5w9w+1Ov0lKXgMKnfJiXHyTqjo0/tJRG3XLkEatrF4Y91POGnFN2O/E0Cg
 aGi4UyWuEef/Mx3Q0JgOWgnjJsRbgQqdY8hvOnlFAGkUzbxlrE/QJdTBT+xKXvhKSBR1
 vEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NX7qr/SzR8OiMaEOKT9Lop3hk/hmeg+xRGasK7FIjRs=;
 b=x3kPm9AbNnagvIlXX2UoouogN2uKMr7nQzXe+Zy65oV+LzaIKjAiqOheWulnD76Rm+
 tFh4YcVSrpHxGfNOBsWtjw2WvjLbnYnfZNkzBusuYJ5grzkT0NIa5oocyvcz0V81/obf
 RPFca4c9TF+nye07j5LrfuLu9MdmOBNcLCG0jSf93rhRyww5s5ChI4+mxIuvmMqqllVm
 yZSpfmbWidgSMEqkAHFodxYyVcMWdX4K2wlWprNe7M5A0IjbJDVYKa8hjzSXny25P6PL
 sAJbhVMyfS2aS+P4KoO9e4snHq0S3nKgVp6mlcjJuzGwF177O9z27iYXOP3iR4jvuLWc
 yDiQ==
X-Gm-Message-State: AOAM532dKaCC5TA9+GIvzOuPUJ2m3xcYdt+hYUP/pXBhGdiEstTrobLx
 dH47Ylaq4ZZC2Bp13v1QmMLYC27cY+U7G7pgjjLxXPd8
X-Google-Smtp-Source: ABdhPJzbNC9XiCWkhKQUVxf4Ztteg7wOQMGAdxUKrFW4pDictq8wMBQaVZBSg8sSlRSD2sPeO2HfPob1P3CNWdYthao=
X-Received: by 2002:ab0:a90:: with SMTP id d16mr6114758uak.69.1642277970979;
 Sat, 15 Jan 2022 12:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20211024113931.88898-1-gilles.talis@gmail.com>
 <20220113224531.6f9ac64a@windsurf>
In-Reply-To: <20220113224531.6f9ac64a@windsurf>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 15 Jan 2022 21:19:19 +0100
Message-ID: <CAKcgs2ygLz2KyxZ4_oShqXY_UDwrH9-W4PPsk4k6G50_757STw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] configs/friendlyarm_nanopi_r2s: new
 defconfig
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKTGUgamV1LiAxMyBqYW52LiAy
MDIyIMOgIDIyOjQ1LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBHaWxsZXMsCj4KPiBPbiBTdW4sIDI0IE9jdCAyMDIx
IDEzOjM5OjMxICswMjAwCj4gR2lsbGVzIFRhbGlzIDxnaWxsZXMudGFsaXNAZ21haWwuY29tPiB3
cm90ZToKPgo+ID4gVGhlIE5hbm9QaSBSMlMgaXMgYSBGcmllbmRseUVsZWMgbWluaS1yb3V0ZXIg
YmFzZWQgb246Cj4gPgo+ID4gLSBSb2NrY2hpcCBSSzMzMjggU29DCj4gPiAtIDFHQiAob3IgMkdC
KSBERFI0IFJBTQo+ID4gLSBHaWdhYml0IEV0aGVybmV0IChXQU4pCj4gPiAtIEdpZ2FiaXQgRXRo
ZXJuZXQgKFVTQjMpIChMQU4pCj4gPiAtIFVTQiAyLjAgSG9zdCBQb3J0Cj4gPiAtIE1pY3JvU0Qg
c2xvdAo+ID4gLSBSZXNldCBidXR0b24KPiA+IC0gV0FOIC0gTEFOIC0gU1lTIExFRAo+ID4KPiA+
IGh0dHBzOi8vd3d3LmZyaWVuZGx5YXJtLmNvbS9pbmRleC5waHA/cm91dGU9cHJvZHVjdC9wcm9k
dWN0JnBhdGg9NjkmcHJvZHVjdF9pZD0yODIKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHaWxsZXMg
VGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cj4KPiBUaGlzIG9idmlvdXNseSBsb29rcyB2
ZXJ5IGdvb2QsIGJ1dCB0aGVyZSBpcyBvbmUgcXVlc3Rpb246IGNvdWxkIHlvdQo+IGRyb3AgdGhl
IFZGQVQgcGFydGl0aW9uLCBhbmQgaGF2ZSB0aGUga2VybmVsLCBEVEIgYW5kIGV4dGxpbnV4LmNv
bmYgYmUKPiBkaXJlY3RseSBpbiB0aGUgZXh0NCBwYXJ0aXRpb24sIHdpdGggVS1Cb290IGxvYWRp
bmcgdGhlbSBmcm9tIHRoZSBleHQ0Cj4gcGFydGl0aW9uIGRpcmVjdGx5Pwo+Cj4gVGhpcyB3b3Vs
ZCBzaW1wbGlmeSB0aGluZ3MgYSBiaXQuCkdvb2Qgc3VnZ2VzdGlvbi4gSSB3aWxsIGRvIHRoYXQg
YW5kIHNlbmQgYSB2MiBzaG9ydGx5LgoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4
IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNv
bQoKVGhhbmtzIQpHaWxsZXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
