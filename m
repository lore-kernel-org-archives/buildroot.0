Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B8C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B39783E4A;
	Thu,  6 Oct 2022 08:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B39783E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4D8C-QR8Kkv; Thu,  6 Oct 2022 08:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6167A83E46;
	Thu,  6 Oct 2022 08:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6167A83E46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF4461BF282
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 08:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D516B410C7
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 08:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D516B410C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVwPtY1U-cC8 for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 08:47:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB87B40982
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB87B40982
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 08:47:32 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ogMXP-00BACc-Kr; Thu, 06 Oct 2022 10:47:27 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 108d9364;
 Thu, 6 Oct 2022 08:47:16 +0000 (UTC)
Date: Thu, 6 Oct 2022 11:47:11 +0300
Message-ID: <20221006114711.GB961467@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Gary Bisson <gary.bisson@boundarydevices.com>
In-Reply-To: <Yz5//dAdsZQYniP9@p1g2>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20221004133057.2003750-1-aperez@igalia.com>
 <20221004133057.2003750-6-aperez@igalia.com> <Yz5//dAdsZQYniP9@p1g2>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4VrlwtWVWEmW0JHy19Xp/SMHPTxviPvJNCwSc1eXYQI=; b=RVKcVMTcSM0CcBEuYWb3K86PTD
 iKEXgdzmilOlhupAOJCpUaMbch8T4CADVuly1rC8KGiNfh3yM7blpY8Jl+vfz6V8P25IoPu7COT1I
 ypHBmRC8OSIxlBYnk3BWO2fDHOZ0Xtd20vjlkhyTQiOB2qfEGkOJ/WI0XyqPl9Xy+8g2Vy7qjIxwi
 WJ10DiCIJ/O2qPYu7PKo/shSDteK9ZKkulicV3PT6gSu6r1HmR3TRuAh+SEBBZJEnVnuVH92MyEKv
 e86C2qsqwKQMbpupxjlgEDgbhFfjzxXGCOy5GSb9oY5i+dOf9g382stlZxm04bf70r01Atob2Sfhm
 8R7y+MDw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=RVKcVMTc
Subject: Re: [Buildroot] [PATCH 5/5] package/cog: bump to version 0.16.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8961407770206798135=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8961407770206798135==
Content-Type: multipart/signed; boundary="cGy6zjpFQ9w/6SQT"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--cGy6zjpFQ9w/6SQT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgR2FyeSwgYWxsLAoKT24gVGh1LCAwNiBPY3QgMjAyMiAwOToxMzowMSArMDIwMCBHYXJ5IEJp
c3NvbiA8Z2FyeS5iaXNzb25AYm91bmRhcnlkZXZpY2VzLmNvbT4gd3JvdGU6CiAKPiBPbiBUdWUs
IE9jdCAwNCwgMjAyMiBhdCAwNDozMDo1N1BNICswMzAwLCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IHdyb3RlOgo+ID4gVGhpcyBuZXcgdmVyc2lvbiBpbmNsdWRlcyBzdXBwb3J0IGZvciBzZXR0aW5n
IHByb3h5IG9wdGlvbnMgYW5kIGdhbWVwYWQKPiA+IHN1cHBvcnQuIFJlbGVhc2Ugbm90ZXM6Cj4g
PiAKPiA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2UvY29nLTAuMTYuMC5odG1sCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2Fs
aWEuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9jb2cvY29nLmhhc2ggfCAgOCArKysrLS0tLQo+
ID4gIHBhY2thZ2UvY29nL2NvZy5tayAgIHwgMzcgKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NvZy9jb2cuaGFzaCBiL3Bh
Y2thZ2UvY29nL2NvZy5oYXNoCj4gPiBpbmRleCBhYTEyOGQ3M2Q4Li5hMmM1NWM0Yjk0IDEwMDY0
NAo+ID4gLS0tIGEvcGFja2FnZS9jb2cvY29nLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvY29nL2Nv
Zy5oYXNoCj4gPiBAQCAtMSw3ICsxLDcgQEAKPiA+IC0jIEZyb20gaHR0cHM6Ly93cGV3ZWJraXQu
b3JnL3JlbGVhc2VzL2NvZy0wLjE0LjEudGFyLnh6LnN1bXMKPiA+IC1tZDUgIDY5ZDcyYWMwNDZh
MGZjNDg1ZWE3YjYxYjk2ZTdlN2ZjICBjb2ctMC4xNC4xLnRhci54ego+ID4gLXNoYTEgIDYyMzY5
NzJiMGFlMGJjZTM4YTBhMDE3NjEwZjE2MWIzNDk3MjM4NjIgIGNvZy0wLjE0LjEudGFyLnh6Cj4g
PiAtc2hhMjU2ICBmYjkxMTA0ZTI1ZTFkZGUyNzE4OWM5MWM3MGFjYzM1NmUzODdmNDdhY2ViYWE4
OTk3ZTAxY2U1ODc5YzNhNjAwICBjb2ctMC4xNC4xLnRhci54ego+ID4gKyMgRnJvbSBodHRwczov
L3dwZXdlYmtpdC5vcmcvcmVsZWFzZXMvY29nLTAuMTYuMC50YXIueHouc3Vtcwo+ID4gK21kNSAg
MjcwNTQ3MmVhNGYzMzMyOTA5NzM3MjJjMDg2MmIyMWQgIGNvZy0wLjE2LjAudGFyLnh6Cj4gPiAr
c2hhMSAgZWYxNmU1ZTNkOTFkMGRhMDU2ZmU1ZTRmNTk2YzIxMWFmNzQ1M2I0ZSAgY29nLTAuMTYu
MC50YXIueHoKPiA+ICtzaGEyNTYgIDI5NTZmNzE5ZDM2YzlhNjM2OGY2MzkwMWEwZDFjZWFmNGQy
N2Y1MjlmN2RmNDQxYjM3NDhjMzZkNzI5MDZmYzYgIGNvZy0wLjE2LjAudGFyLnh6Cj4gPiAgCj4g
PiAgIyBIYXNoZXMgZm9yIGxpY2Vuc2UgZmlsZXM6Cj4gPiAgc2hhMjU2ICBlNmM0MmQ5M2M2OGIy
OTJiY2NjZjZkMmVjM2UxM2RhODVkZjkwYjcxOGJhMjdjMmMyYTAxMDUzYTlkMDA5MjUyICBDT1BZ
SU5HCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb2cvY29nLm1rIGIvcGFja2FnZS9jb2cvY29n
Lm1rCj4gPiBpbmRleCAxZjI0YmViZWU0Li5hYzJlYzJhMzBlIDEwMDY0NAo+ID4gLS0tIGEvcGFj
a2FnZS9jb2cvY29nLm1rCj4gPiArKysgYi9wYWNrYWdlL2NvZy9jb2cubWsKPiA+IEBAIC00LDcg
KzQsNyBAQAo+ID4gICMKPiA+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gIAo+ID4gLUNP
R19WRVJTSU9OID0gMC4xNC4xCj4gPiArQ09HX1ZFUlNJT04gPSAwLjE2LjAKPiA+ICBDT0dfU0lU
RSA9IGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcwo+ID4gIENPR19TT1VSQ0UgPSBjb2ct
JChDT0dfVkVSU0lPTikudGFyLnh6Cj4gPiAgQ09HX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ID4g
QEAgLTEyLDM3ICsxMiw0MCBAQCBDT0dfREVQRU5ERU5DSUVTID0gZGJ1cyB3cGV3ZWJraXQgd3Bl
YmFja2VuZC1mZG8gd2F5bGFuZAo+ID4gIENPR19MSUNFTlNFID0gTUlUCj4gPiAgQ09HX0xJQ0VO
U0VfRklMRVMgPSBDT1BZSU5HCj4gPiAgQ09HX0NPTkZfT1BUUyA9IFwKPiA+IC0JLURDT0dfQlVJ
TERfUFJPR1JBTVM9T04gXAo+ID4gLQktRENPR19QTEFURk9STV9IRUFETEVTUz1PTiBcCj4gPiAt
CS1ESU5TVEFMTF9NQU5fUEFHRVM9T0ZGIFwKPiA+IC0JLURDT0dfSE9NRV9VUkk9JyQoY2FsbCBx
c3RyaXAsJChCUjJfUEFDS0FHRV9DT0dfUFJPR1JBTVNfSE9NRV9VUkkpKScgXAo+ID4gLQktRFVT
RV9TT1VQMj1PTgo+ID4gKwktRGRvY3VtZW50YXRpb249ZmFsc2UgXAo+ID4gKwktRG1hbnBhZ2Vz
PWZhbHNlIFwKPiA+ICsJLURwcm9ncmFtcz10cnVlIFwKPiA+ICsJLURzb3VwMj10cnVlIFwKPiAK
PiBJJ20gdGVzdGluZyB5b3VyIHNlcmllcyBhbmQgaXQgc2VlbXMgbGlrZSB0aGUgYWJvdmUgaXMg
bm90IGNvcnJlY3QsIGl0Cj4gc2hvdWxkIGJlICctRHNvdXAyPWVuYWJsZWQnIGFzIHNvdXAyIGlz
bid0IGEgYm9vbGVhbiBvcHRpb24uIEN1cnJlbnRseQo+IGl0IGlzIHRocm93aW5nIHRoZSBmb2xs
b3dpbmcgZXJyb3I6Cj4gLi4vb3V0cHV0L2J1aWxkL2NvZy0wLjE2LjAvbWVzb24uYnVpbGQ6MTow
OiBFUlJPUjogVmFsdWUgInRydWUiIChvZiB0eXBlICJzdHJpbmciKSBmb3IgY29tYm8gb3B0aW9u
ICJCdWlsZCB3aXRoIGxpYnNvdXAyIGluc3RlYWQgb2YgbGlic291cDMiIGlzIG5vdCBvbmUgb2Yg
dGhlIGNob2ljZXMuIFBvc3NpYmxlIGNob2ljZXMgYXJlIChhcyBzdHJpbmcpOiAiZW5hYmxlZCIs
ICJkaXNhYmxlZCIsICJhdXRvIi4KCk91Y2gsIGdvb2QgY2F0Y2guIEkgaGFkIHRoZSBmaXggZm9y
IHRoaXMgbG9jYWxseSBpbiB0aGUgR2l0IHN0YXNoIGFuZApzb21laG93IG1hbmFnZWQgdG8gbm90
IGluY2x1ZGUgaXQgaW4gdGhlIHN1Ym1pdHRlZCBwYXRjaCBzZXQuIEkgd2lsbCB1cGRhdGUKdGhl
IHNlcmllcyBsYXRlci4KIAo+IEJ5IHVzaW5nIGVuYWJsZWQgSSBnb3QgYW5vdGhlciBmYWlsdXJl
IGR1ZSB0byB0aGUgd2F5bGFuZCBwbGF0Zm9ybSBub3QKPiBmaW5kaW5nIGRybV9mb3VyY2MuaCwg
SSBzdWJtaXR0ZWQgYSBwYXRjaCB0byBDb2cgZGlyZWN0bHlbMV0uCgpUaGFua3MgZm9yIHRoZSBw
YXRjaCwgaXQncyBzdXBlciBuaWNlIHdoZW4gcGVvcGxlIHRha2UgdGhlIGluaXRpYXRpdmUgbGlr
ZQp0aGlzISBMZXQncyB0cnkgYW5kIGhhdmUgdGhhdCBsYW5kZWQgYmVmb3JlIEkgc3VibWl0IHRo
ZSBuZXcgdmVyc2lvbiBvZiB0aGUKcGF0Y2ggc2V0LgogCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9JZ2FsaWEvY29nL3B1bGwvNTAxCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--cGy6zjpFQ9w/6SQT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYz6WEAAKCRCRxVnb5MkS
O4wKAJ4uSuuzKF65mb77bT232HW6RIx4qgCfXIt8nS9F/3BurgL2SNSimmuVLws=
=Yl5b
-----END PGP SIGNATURE-----

--cGy6zjpFQ9w/6SQT--

--===============8961407770206798135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8961407770206798135==--
