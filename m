Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6927EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 11:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C3B82EB5;
	Sat, 29 Jan 2022 11:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0a09yVbTV88A; Sat, 29 Jan 2022 11:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E2082EA5;
	Sat, 29 Jan 2022 11:11:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E32B1BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB4C60AE2
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IMM7RJ7tauBn for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 11:11:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6BC560A91
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 11:11:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id s5so25235578ejx.2
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 03:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2cOl6nx+5cdiC99ZTn2tksBydv3nF1Sj25hAWmEfMwY=;
 b=SAuJSi9sMLOQs6cn00Y0eP3Hk8PGjqcGz8akuIeG9dxzNWDmL6ibUmng2rPy0g8ECx
 T/a736l/fEgfsEq7SwXfI5haUbbUd0pRqZMe3HeHfd9AHtZHzwL4Y8Qiaiya9PcCwL3W
 0rypfHbD29bm8AfxmTLsn0LhcZ+IMRNZsUIBPDKKZsTEQ0hvU5RdwKHQX4xNMOkkeZJh
 TBydmjYF/aA4r8uPQsjXBfW/OcdPG83m+E16XHUlNkJ4Y8X+lKwyKBfLIw8rAru6gsbQ
 brTQTGxBsrfh1UmwuOFyx/rt5PATbzyQvu3tScnQhsyP4DHY3nWzAzP4Okd3Hf3f8uAw
 ETfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2cOl6nx+5cdiC99ZTn2tksBydv3nF1Sj25hAWmEfMwY=;
 b=BjwhdaGCvYLHQKf1bQ7q2bXHvv8Hj1x/pYab9hgOgiX8FCS0khyaHoFUPW2OUn+T7G
 cQOd2ztMOe8d6axubXxzL8QDELt15x46vztfvSQWQ2LWKRwtqX2T0N5ZCzTUn0zzV599
 SlhxDH3CQbYVX4yOyhT1GOF4VwCLYDT9Z1GqXXXcH6PURI6L8U/f8f4VyECxWE83YzbN
 gQb8HkoRmP9Awn8FOB4L3sVquB2hMPv2w8m4kqxrvwmSfAIWldV/Ll7o2tqa8NE+65T5
 r61nG0hyDLmJCkPxkBwPj0mXY3DJoJHGlkxnlNKOC3ok5MticiAWgnHDbaxIfot9/iGI
 Bt6A==
X-Gm-Message-State: AOAM530HtoavDJMpalDwRxD0+BxBxKRn7VgDRK6Lt5NRVBlrLHZUmALc
 AZT6oxECSSA7dUpHI/DYnNB0guCYt6C5rrNVn/XteuTLeqM=
X-Google-Smtp-Source: ABdhPJzHnIjuJQ9P1l53Fm+re86K5WKhZ4xCBfDm50bf3nqkEaurg+GGZZaP1Fg6hbiiBnPIHFBnNMPZ0GhLHQbovU0=
X-Received: by 2002:a17:907:97d0:: with SMTP id
 js16mr10039336ejc.67.1643454694710; 
 Sat, 29 Jan 2022 03:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20211106181424.299041-1-peron.clem@gmail.com>
 <73fe7aba-588b-133b-f0a6-960cbefb162f@mind.be>
In-Reply-To: <73fe7aba-588b-133b-f0a6-960cbefb162f@mind.be>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 29 Jan 2022 12:11:23 +0100
Message-ID: <CAJiuCce=L6sWa5L0w1rsrDcb09FR16Psv64y3Yk-ro17Kb9okQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] configs/beelink_gs1: increase rootfs
 size to 120M
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gVHVlLCAyNSBKYW4gMjAyMiBhdCAyMTo1NywgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPgo+ICAgSGkgQ2xlzIFtZW50LAo+Cj4gT24g
MDYvMTEvMjAyMSAxOToxNCwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+ID4gRm9yIHRoZSBtb21l
bnQgQmVlbGluayBHUzEgdXNlIGEgZGVmYXVsdCByb290ZnMgc2l6ZSBvZiA2ME0KPiA+IHdoaWNo
IG1ha2Ugc29tZXRpbWVzIHRoZSBidWlsZCBmYWlsZWQgZHVlIHRvIG1pc3Npbmcgc3BhY2UuCj4K
PiAgIFRoYXQncyBzdXJwcmlzaW5nLi4uIFRoZSBvbmx5IHRoaW5nIGluIHRoZSByb290ZnMgaXMg
YnVzeWJveCwgc28gdGhlIHJvb3Rmcwo+IHNpemUgc2hvdWxkIGJlIHdheSBsZXNzIHRoYW4gMU1C
LCBsZXQgYWxvbmUgNjBNQi4uLgo+Cj4gICBBbHNvLCAic29tZXRpbWVzIiBpcyBzdXNwaWNpb3Vz
LiBUaGUgcm9vdGZzIHNob3VsZCBiZSBhbG1vc3QgYmluYXJ5IGlkZW50aWNhbAo+IGJldHdlZW4g
dHdvIGJ1aWxkcyAodGhlcmUgYXJlIHNvbWUgZGF0ZXMgYW5kIHBhdGhzIGluIHRoZXJlIGlmIHlv
dSBkb24ndCBlbmFibGUKPiBCUjJfUkVQUk9EVUNJQkxFKS4KPgo+ICAgRG8geW91IGhhdmUgYSBi
aXQgbW9yZSBkZXRhaWwvZXhhbXBsZSBvZiBob3cgaXQgZmFpbHM/CgpBZ3JlZSwgIlNvbWV0aW1l
cyIgaXMgbm90IHRoZSBwcm9wZXIgd29yZCwgSSByZWNlaXZlZCB0d28gdGltZXMgYSBtYWlsCnNh
eWluZyBtaXNzaW5nIHNwYWNlIGluIHRoZSB0YXJnZXQsIG1heWJlIGl0IHdhcyBkdWUgdG8gYSBw
YWNrYWdlIHRoYXQKd2FzIHdyb25nbHkgYWRkZWQgYnkgZGVmYXVsdCB3aXRoIHNvbWUgZGVwZW5k
ZW5jaWVzPyAoQ2FuJ3QgZmluZCB0aGVtCmFnYWluKS4KCkFueXdheSA2ME1pQiBpcyByZWFsbHkg
bG93IGFuZCBJIG5lZWQgdG8gY2hhbmdlIGl0IGV2ZXJ5IHRpbWUgSSB3YW50CnRvIGFkZCBhIGdy
YXBoaWMgc3RhY2suCgpJIHdpbGwgZWRpdCB0aGUgY29tbWl0IGxvZyBhbmQgc2VuZCBhIFYyLgoK
UmVnYXJkcywKQ2xlbWVudAoKPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cj4gPgo+ID4gSW5j
cmVhc2UgdGhlIHJvb3RmcyBzaXplIHRvIDEyME0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBjb25maWdz
L2JlZWxpbmtfZ3MxX2RlZmNvbmZpZyB8IDEgKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25m
aWcgYi9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwo+ID4gaW5kZXggZTg4ZjNlM2I2OS4u
MTg3MmFhYmRmMCAxMDA2NDQKPiA+IC0tLSBhL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmln
Cj4gPiArKysgYi9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZwo+ID4gQEAgLTI0LDYgKzI0
LDcgQEAgQlIyX1BBQ0tBR0VfQVVUT1NTSD15Cj4gPiAgIEJSMl9QQUNLQUdFX0RST1BCRUFSPXkK
PiA+ICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMj15Cj4gPiAgIEJSMl9UQVJHRVRfUk9PVEZTX0VY
VDJfND15Cj4gPiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIxMjBNIgo+ID4KPiA+ICAg
IyBGaXJtd2FyZQo+ID4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
