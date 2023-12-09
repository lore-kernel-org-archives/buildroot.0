Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D29BC10DC3
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DDC81A46;
	Sat,  9 Dec 2023 09:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86DDC81A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id le2cRffS-RCS; Sat,  9 Dec 2023 09:28:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C3281A64;
	Sat,  9 Dec 2023 09:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C3281A64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEC0F1BF5A7
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 09:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BE1A404D2
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE1A404D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aoXdKf5RxG5S for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 09:28:20 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 371E1404AF
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 09:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 371E1404AF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F316B13F8A7;
 Sat,  9 Dec 2023 10:28:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 10:28:13 +0100
Date: Sat, 9 Dec 2023 10:28:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZXQzLeF6j3U1TOjU@landeda>
References: <20231207220930.1356097-1-fontaine.fabrice@gmail.com>
 <ZXOehwwVDyiGPpRf@landeda>
 <CAPi7W838vzhK48R5GduRL660bWQnS1WGTPsDmnx+gsj3HfVX3w@mail.gmail.com>
 <ZXOi7tN9L6o6nEmp@landeda>
 <CAPi7W81SxGKzj7feR4i6TtwJZNjBYsADqMw-2ZriWb2oLc+bTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W81SxGKzj7feR4i6TtwJZNjBYsADqMw-2ZriWb2oLc+bTQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702114097;
 bh=jDkpoX9IDDiuYKGJ1KAh8dok0EukSZ6i6TmegZq8jzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T30vcl4BhFk+UbaF5zXMm6GNt4jsBMIdP93AQGncyXiarcwthYzPEbU+Fre5bhFD3
 ALHHjOHpIVU/Y14jBpnYoFBC5ayJbajBLie1NX+ZtLAXyBFZSDbjVwqDTQgtVDAGoO
 Qq5DbIStfsDKU98e+dQG4LvSY+kTR6ueD7FhyINwHnX/gm2r36WD1Lcxi4innEAcHp
 s944XZlzqRWdMZ36lXva6sfR8i9yysLEalJ1Fqv121+TxtXytvGA4o2iBYJ1Z319gY
 dy3cebrq2FWm2zcr+rURIA6ta4oSdheNqihUBUW2ZJ8vxnt0yyfpkTgaomhbZxbHRm
 yg9RLAV5UY+Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T30vcl4B
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: pass TARGET_CC
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
Cc: Steve Kenton <skenton@ou.edu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMy0xMi0wOSAwMDoyMCArMDEwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgc2FtLiA5IGTDqWMuIDIwMjMgw6AgMDA6MTIsIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiBPbiAyMDIzLTEy
LTA5IDAwOjA0ICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+ID4gTGUg
dmVuLiA4IGTDqWMuIDIwMjMgw6AgMjM6NTQsIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiA+ID4gT24gMjAyMy0xMi0wNyAyMzowOSArMDEwMCwg
RmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4gPiA+ID4gPiBQYXNzIENDPSQoVEFSR0VU
X0NDKSB0byBtYWtlIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSByYWlzZWQK
PiA+ID4gPiA+IHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiA2LjIwIGluIGNvbW1pdAo+ID4gPiA+ID4g
YTc0MzA4NzU5M2E1ZmQ1YjMzZTI2NTA1OTFjYWRhMDk5MjljMjdhNjoKPiA+IFstLVNOSVAtLV0K
PiA+ID4gPiA+ICBkZWZpbmUgTUVNVEVTVDg2X0JVSUxEX0NNRFMKPiA+ID4gPiA+IC0gICAgICQo
VEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIC1DICQoQEQpLyQoTUVNVEVTVDg2X0JVSUxE
X0RJUikKPiA+ID4gPiA+ICsgICAgICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIEND
PSQoVEFSR0VUX0NDKSBcCj4gPiA+ID4gQ0M9JChUQVJHRVRfQ0MpIGlzIGFscmVhZHkgcHJlc2Vu
dCBpbiBUQVJHRVRfQ09ORklHVVJFX09QVFMsIHNvIHdoeSBpcwo+ID4gPiA+IGl0IG5vdCBhY2Nv
dW50ZWQgZm9yPwo+ID4gPiBCZWNhdXNlICJDQz0kKFRBUkdFVF9DQykgbWFrZSIgaXMgbm90IHRo
ZSBzYW1lIGFzICJtYWtlCj4gPiA+IENDPSQoVEFSR0VUX0NDKSIKPiA+Cj4gPiBZZWFoLCBJIGtu
b3cgdGhhdCBwcmV0dHkgd2VsbCAoZXZlbiBpZiBJIG5ldmVyIHJlbWVtYmVyIHRoZSBydWxlcyBv
Zgo+ID4gcHJlY2VkZW5jZSBmb3IgdGhlIGVudmlyb25tZW50LCBhcmd1bWVudCwgYW5kIE1ha2Vm
aWxlIHZhcmlhYmxlcykuLi4KPiA+Cj4gPiA+IGFzIGJ1aWxkezMyLDY0fS9NYWtlZmlsZSBpcyBz
ZXR0aW5nIENDIHRvIGdjYy4KPiA+Cj4gPiBCdXQgdGhhdCB3YXMgbm90IHRoZSBjYXNlIHByZXZp
b3VzbHksIEkgZ3Vlc3MsIGFzIHlvdSBzYWlkIGl0IGFwcGVhcmVkCj4gPiB3aXRoIHRoZSBidW1w
IHRvIDYuMjAuIFNvIG1heWJlIHdlIHNob3VsZCBub3cgbW92ZSB0aGUgd2hvbGUgb2YKPiA+ICQo
VEFSR0VUX0NPTkZJR1VSRV9PUFRTKSB0byBiZSBhcmd1bWVudHMgcmF0aGVyIHRoYW4gZW52aXJv
bm1lbnQKPiA+IHZhcmlhYmxlcywgaW5zdGVhZCBvZiBqdXN0IG1vdmluZyBDQyB0aGVyZS4KPiAK
PiBJIGFscmVhZHkgdHJpZWQgdGhhdCBidXQgaXQgcmFpc2VzIGEgYnVpbGQgZmFpbHVyZSBiZWNh
dXNlIHRoZQo+IGZvbGxvd2luZyBDRkxBR1Mgd2lsbCBiZSBvdmVycmlkZGVuOgo+IAo+IENGTEFH
UyA9IC1zdGQ9YzExIC1XYWxsIC1XZXh0cmEgLVdzaGFkb3cgLW0zMiAtbWFyY2g9aTU4NiAtZnBp
YyAtZm5vLWJ1aWx0aW4gXAo+ICAgICAgICAgIC1mZnJlZXN0YW5kaW5nIC1mb21pdC1mcmFtZS1w
b2ludGVyIC1mbm8tc3RhY2stcHJvdGVjdG9yCgpPSywgYnV0IHRoZW4gaXQgbWVhbnMgd2UgYWxz
byBoYXZlIHRvIGZvcmNpYmx5IG92ZXJyaWRlIGEgZmV3IG90aGVyCnZhcmlhYmxlcywgYXMgdGhl
IE1ha2VmaWxlIGRlZmluZXMgdGhlbToKCiAgICBBUyA9IGFzIC02NAogICAgQ0MgPSBnY2MKICAg
IE9CSkNPUFkgPSBvYmpjb3B5CgpCb3RoIEFTIGFuZCBPQkpDT1BZIGFyZSBlcXVhbGx5IHdyb25n
IGluIGNyb3NzLWNvbXBpbGF0aW9uIGFzIENDIGlzLgpCdXQgZm9yIExELCBpdCBkb2VzIGl1c2Ug
dGhlIG9uZSBmcm9tIHRoZSBlbnZpcm9ubWVudC4KCkFsc28sIGFyZ3VhYmx5LCBsZXR0aW5nIHRo
ZSBwYWNrYWcgZGVmaW5lIGl0cyBvd24gQ0ZMQUdTIGlzIG5vdCBuaWNlLApiZWNhdXNlIGl0IGlz
IG1pc3NpbmcgYWxsIHRoZSBvbmVzIHdlIGFyZSBzZXR0aW5nLCBsaWtlIHRoZSBfRk9SVElGWSwK
dGhlIG9wdGltaXNhdGlvbnMsIG9yIHRoZSBkZWJ1ZyBsZXZlbHMuLi4KCkJ1dCBpbiBmYWN0LCBt
ZW10ZXN0ODYrIGlzIGEgZnJlZS1zdGFuZGluZyBwcm9qZWN0IChpdCBydW5zIGFzIGEga2VybmVs
Cm9yIGEgYm9vdGxvYWRlciBpbiBmYWN0KSwgc28gdGhhdCdzIE9LIHRvIGxldCBpdCBvdmVycmlk
ZSB0aG9zZSBDRkxBR1MuCgpBbHNvLCBJIGtub3cgd2h5IHRoYXQgZGlkIG5vdCBoYXBwZW4gaW4g
cHJldmlvdXMgdmVyc2lvbnM6IHdlIHNpbXBseQp3ZXJlIG5vdCBidWlsZGluZyBtZW10ZXM4Nisg
YW5kIHdlcmUganVzdCBjb3B5aW5nIHRoZSBwcmUtYnVpbHQgZmlsZXMuCgpDYW4geW91IHBsZWFz
ZSByZXNwaW4gdG8gYWNjb3VudCBmb3IgQVMgYW5kIE9CSkRVTVAsIGFuZCBhZGQgYSBibHVyYgp0
aGF0IENGTEFHUyBpcyBvdmVycmlkZW4gYnV0IHRoYXQncyBPSz8KClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
