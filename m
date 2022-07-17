Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D98C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C96140A1B;
	Sun, 17 Jul 2022 07:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C96140A1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RG5hlMZwtkiC; Sun, 17 Jul 2022 07:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D47940A15;
	Sun, 17 Jul 2022 07:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D47940A15
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC44C1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83748846CC
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83748846CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRzlvrENlgvg for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:30:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B3E846AD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77B3E846AD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:30:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EADDE7804FF;
 Sun, 17 Jul 2022 09:30:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 09:30:40 +0200
Date: Sun, 17 Jul 2022 09:30:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <20220717073040.GZ2543@scaer>
References: <20220714220805.29298-1-kris@embeddedTS.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714220805.29298-1-kris@embeddedTS.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658043045;
 bh=5QxH8Rg4DDkwycCPnt10PG+pNxc3e2KXGOwHN2u4CVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bJG8iR5qOEyXEIWLdRNorRai21iyqAxItQYTyQtuDmBCINhPS+ronC/mvR0X6BOXe
 KqfJ8qiQ6mz6vnzaPN3NQYYecLOdwUDwxRp+2m+3r385c2TZUf92AqhSHzLfvoysu6
 BDCAdwP3aVBgPmc4X47QerBJs/c+5w6wFfBYVhah2hsMUwZoz7M5z1FB/A9hCHxJ3o
 aDC3ue29s5gZwezt+1RkTFge+SGZDEOOp6CDwPcWYo6/CFR7VV9vwSdn6P/FNdWa2f
 TVSUxK96joi4azjwN5MzQ2v35Q5mqeZFUqzOEOkYSw4nPY9EXt+dApmpZ4uJN3Ot4K
 QzJOsJmu06kBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bJG8iR5q
Subject: Re: [Buildroot] [PATCH 1/1] configs/ts7680: bump Linux version to
 4.9.311
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Mark Featherston <mark@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S3JpcywgQWxsLAoKT24gMjAyMi0wNy0xNCAxNTowOCAtMDcwMCwgS3JpcyBCYWhuc2VuIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEtyaXMgQmFobnNlbiA8a3Jp
c0BlbWJlZGRlZFRTLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgo+IC0tLQo+IAo+
IEknbSBhbHNvIGhhcHB5IHRvIGFkZCBteXNlbGYgb3IgYmUgYWRkZWQgdG8gREVWRUxPUEVSUyBm
b3IgdGhpcyBhbmQgb3RoZXIKPiBlbWJlZGRlZFRTIGRldmljZXMuIEknbSBqdXN0IHVuc3VyZSBv
ZiBwcm9jZWR1cmUgZm9yIGRvaW5nIHNvLgoKSnVzdCBlZGl0IHRoZSBERVZFTE9QRVJTIGZpbGUs
IGFkZCB5b3VyIG5hbWUgaW4gYWxwaGFiZXRpY2FsIG9yZGVyIHdpdGgKYW4gJ04nIGZpZWxkLCBh
bmQgYWRkIHRoZSBmaWxlcyBhbmQgZGlyZWN0b3JpZXMvIHlvdSB3b3VsZCBsaWtlIHRvCm1vbml0
b3IsIHN0aWxsIGluIGFscGhhYmV0aWNhbCBvcmRlciwgYXMgJ0YnIGZpZWxkcy4gTm9lIHRoYXQg
d2lsZGNhcmRzCmFyZSBub3Qgc3VwcG9ydGVkLiBGb3IgY29uZmlncy90czc2ODAsIHRoYXQgd291
bGQgYmUgc29tZXRoaW5nIGxpa2UKKGZpZWxkcyBhbmQgdmFsdWVzIGFyZSBzZXBhcmF0ZWQgYnkg
YSBUQUIgwrsgKToKCiAgICBOOsK7S3JpcyBCYWhuc2VuIDxrcmlzQGVtYmVkZGVkVFMuY29tPgog
ICAgRjrCu2NvbmZpZ3MvdHM3NjgwX2RlZmNvbmZpZwoKWW91IGNhbiB0ZXN0IHRoYXQgaXQgd29y
a3M6CgogICAgJCAuL3V0aWxzL2dldC1kZXZlbG9wZXJzIC1mIGNvbmZpZ3MvdHM3NjgwX2RlZmNv
bmZpZwogICAgSnVsaWVuIEdyb3NzaG9sdHogPGp1bGllbi5ncm9zc2hvbHR6QG9wZW5lc3QuaW8+
CiAgICBLcmlzIEJhaG5zZW4gPGtyaXNAZW1iZWRkZWRUUy5jb20+CgpUaGFua3MhCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKPiAgY29uZmlncy90czc2ODBfZGVmY29uZmlnIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvY29uZmlncy90czc2ODBfZGVmY29uZmlnIGIvY29uZmlncy90czc2ODBfZGVmY29uZmln
Cj4gaW5kZXggZTRmNWMxYWFiZC4uOWUwNThiMWQ3OCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3Rz
NzY4MF9kZWZjb25maWcKPiArKysgYi9jb25maWdzL3RzNzY4MF9kZWZjb25maWcKPiBAQCAtNCw3
ICs0LDcgQEAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dl
bmltYWdlLnNoIgo+ICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jIGJvYXJkL3RlY2hu
b2xvZ2ljL3RzNzY4MC9nZW5pbWFnZS5jZmciCj4gIEJSMl9MSU5VWF9LRVJORUw9eQo+ICBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkKPiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
VEFSQkFMTF9MT0NBVElPTj0iJChjYWxsIGdpdGh1YixlbWJlZGRlZFRTLGxpbnV4LTQuOS55LGQw
M2Q0MjZlNmFiZDk1YTk3M2JjNjY5MzE1MjA2Mjk1NzEzYzE3ZTgpL2xpbnV4LWQwM2Q0MjZlNmFi
ZDk1YTk3M2JjNjY5MzE1MjA2Mjk1NzEzYzE3ZTgudGFyLmd6Igo+ICtCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLGVtYmVkZGVkVFMsbGludXgt
NC45LnksdjQuOS4zMTEtdHMpL2xpbnV4LXY0LjkuMzExLXRzLnRhci5neiIKPiAgQlIyX0xJTlVY
X0tFUk5FTF9ERUZDT05GSUc9InRzX2lteDI4Igo+ICBCUjJfTElOVVhfS0VSTkVMX1VJTUFHRT15
Cj4gIEJSMl9MSU5VWF9LRVJORUxfVUlNQUdFX0xPQURBRERSPSIweDQwMDA4MDAwIgo+IC0tIAo+
IDIuMTEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
