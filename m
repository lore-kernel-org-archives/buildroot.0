Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07081C433FE
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 07:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70BF260EB0;
	Wed,  1 Jun 2022 07:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnfkO-qvZaLY; Wed,  1 Jun 2022 07:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE3760EA0;
	Wed,  1 Jun 2022 07:39:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2299B1BF3DE
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 07:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EFB4831F8
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 07:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5M5PIy0dpbp for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 07:39:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 092EF831F5
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jw/SKHmniDXCe9Xsf5FcshWs44HF24TpHEt5P3mmy+E=; b=CH7UekFP8najtrAnrKFb7HZWvh
 wVsBamWRAOXzAae7l+jP4QSeiPi7DyYiIeeRkcDm1K480HcfB5XEhe/cL1OANVVJGqXJxUWhv07Hn
 dxv56sFejb7hYNDeOQqRrONy+Vx29PeWCRh6BudLYJf52zd5avc45D1fGQad4HfwoCRrswLS5CEIX
 aYtGrHAegb3N2TbSBLQhXNJicC36pJrE0Kf8HO54H8CtKxVbzr3oc9P4T8hS1Z+shj54vuhwhCq0R
 hWNBFvETxTm3eMh9ywkk3bKIddpDJYp7BqsE04Xw9W6bKDTKtx0Lg0nhWUUYrRJK+EX62+FVz92wU
 0o1eKZ3g==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nwIwt-007DMs-FN; Wed, 01 Jun 2022 09:39:23 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 235a85b3;
 Wed, 1 Jun 2022 07:39:10 +0000 (UTC)
Date: Wed, 1 Jun 2022 10:39:05 +0300
Message-ID: <20220601103905.GB863200@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Michael Nosthoff <buildroot@heine.tech>
In-Reply-To: <54-6295dc80-3-54e5e980@111886211>
References: <54-6295dc80-3-54e5e980@111886211>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Content-Type: multipart/mixed; boundary="===============0465911748330109726=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0465911748330109726==
Content-Type: multipart/signed; boundary="bsRnJyeZdxTdzWwv"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--bsRnJyeZdxTdzWwv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gTWljaGFlbCwKCk9uIFR1ZSwgMzEgTWF5IDIwMjIgMTE6MTQ6NTcgKzAyMDAgTWljaGFl
bCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6
CiAKPiBPbiBUdWVzZGF5LCBNYXkgMzEsIDIwMjIgMDA6MTggQ0VTVCwgQWRyaWFuIFBlcmV6IGRl
IENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgo+IAo+ID4gSGVsbG8gTWljaGFlbCwK
PiA+IAo+ID4gT24gVHVlLCAyNCBNYXkgMjAyMiAxMjoyNTo1MSArMDIwMCBNaWNoYWVsIE5vc3Ro
b2ZmIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+ICAK
PiA+ID4gCj4gPiA+IEkganVzdCB0ZXN0ZWQgdGhlIDIwMjIuMDUtcmMxICsgdGhpcyBwYXRjaCB3
aXRoIG15IGNvbmZpZy4KPiA+ID4gCj4gPiA+IFRoZSBwYXRjaCBzb2x2ZWQgdGhlIFgxMSBoZWFk
ZXJzIGJ1aWxkIGVycm9yIGJ1dCBJJ20gZ2V0dGluZyB0d28gb3RoZXIgZXJyb3JzLgo+ID4gPiAK
PiA+ID4gKFRoaXMgYXBwbGllcyB0byAyLjM2LjEgYXMgd2VsbCBhcyAyLjM2LjIsIGJvdGggcGF0
Y2hlZCkKPiA+ID4gCj4gPiA+IFRoZSBmaXJzdCBvbmUgImRpc2FwcGVhcnMiIHdoZW4gSSBpc3N1
ZSAibWFrZSB3cGV3ZWJraXQiIGEgc2Vjb25kIHRpbWUsIHNvIEkgZ3Vlc3MgdGhpcwo+ID4gPiBp
cyBhIGNvbmN1cnJlbmN5IGlzc3VlIGluIHRoZSBidWlsZCBzZXR1cDoKPiA+ID4gCj4gPiA+IFsg
MzklXSBCdWlsdCB0YXJnZXQgSmF2YVNjcmlwdENvcmVfQ29weVByaXZhdGVIZWFkZXJzCj4gPiA+
IFNjYW5uaW5nIGRlcGVuZGVuY2llcyBvZiB0YXJnZXQganNjCj4gPiA+IG1ha2VbNF06ICoqKiBO
byBydWxlIHRvIG1ha2UgdGFyZ2V0ICdTb3VyY2UvSmF2YVNjcmlwdENvcmUvQ01ha2VGaWxlcy9M
b3dMZXZlbEludGVycHJldGVyTGliLmRpci9sbGludC9Mb3dMZXZlbEludGVycHJldGVyLmNwcC5v
JywgbmVlZGVkIGJ5ICdiaW4vanNjJy4gIFN0b3AuCj4gPiA+IG1ha2VbNF06ICoqKiBXYWl0aW5n
IGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCj4gPiA+IFsgMzklXSBCdWlsZGluZyBDWFggb2JqZWN0
IFNvdXJjZS9KYXZhU2NyaXB0Q29yZS9zaGVsbC9DTWFrZUZpbGVzL2pzYy5kaXIvX18vanNjLmNw
cC5vCj4gPiA+IG1ha2VbM106ICoqKiBbQ01ha2VGaWxlcy9NYWtlZmlsZTI6Nzk0OiBTb3VyY2Uv
SmF2YVNjcmlwdENvcmUvc2hlbGwvQ01ha2VGaWxlcy9qc2MuZGlyL2FsbF0gRXJyb3IgMgo+ID4g
PiBtYWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+ID4gPiBTY2Fu
bmluZyBkZXBlbmRlbmNpZXMgb2YgdGFyZ2V0IExvd0xldmVsSW50ZXJwcmV0ZXJMaWIKPiA+ID4g
WyAzOSVdIEJ1aWxkaW5nIENYWCBvYmplY3QgU291cmNlL0phdmFTY3JpcHRDb3JlL0NNYWtlRmls
ZXMvTG93TGV2ZWxJbnRlcnByZXRlckxpYi5kaXIvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5j
cHAubwo+ID4gPiBbIDM5JV0gQnVpbHQgdGFyZ2V0IExvd0xldmVsSW50ZXJwcmV0ZXJMaWIKPiA+
ID4gWyAzOSVdIEJ1aWx0IHRhcmdldCBXZWJJbnNwZWN0b3JVSQo+ID4gPiBtYWtlWzJdOiAqKiog
W01ha2VmaWxlOjE3MTogYWxsXSBFcnJvciAyCj4gPiA+IAo+ID4gPiBhbmQgdGhlIGJ1aWxkIHVs
dGltYXRlbHkgdGhlbiBsYXRlciBmYWlscyB3aXRoIHRoaXMgZXJyb3I6Cj4gPiA+IAo+ID4gPiBb
IDQ4JV0gQnVpbGRpbmcgQ1hYIG9iamVjdCBTb3VyY2UvV2ViQ29yZS9DTWFrZUZpbGVzL1dlYkNv
cmUuZGlyL19fL19fL1dlYkNvcmUvRGVyaXZlZFNvdXJjZXMvdW5pZmllZC1zb3VyY2VzL1VuaWZp
ZWRTb3VyY2UtY2JkZmUzMjMtNDIuY3BwLm8KPiA+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHBs
YXRmb3JtL2dyYXBoaWNzL2ZpbHRlcnMvRkVTcGVjdWxhckxpZ2h0aW5nLmg6MjUsCj4gPiA+ICAg
ICAgICAgICAgICAgICAgZnJvbSBzdmcvU1ZHRkVTcGVjdWxhckxpZ2h0aW5nRWxlbWVudC5oOjI1
LAo+ID4gPiAgICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vV2ViQ29yZS9EZXJpdmVkU291cmNl
cy9KU1NWR0ZFU3BlY3VsYXJMaWdodGluZ0VsZW1lbnQuaDoyNiwKPiA+ID4gICAgICAgICAgICAg
ICAgICBmcm9tIC4uLy4uL1dlYkNvcmUvRGVyaXZlZFNvdXJjZXMvSlNTVkdGRVNwZWN1bGFyTGln
aHRpbmdFbGVtZW50LmNwcDoyMiwKPiA+ID4gICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uL1dl
YkNvcmUvRGVyaXZlZFNvdXJjZXMvdW5pZmllZC1zb3VyY2VzL1VuaWZpZWRTb3VyY2UtM2E1MmNl
NzgtMTE5LmNwcDo1Ogo+ID4gPiBwbGF0Zm9ybS9ncmFwaGljcy9maWx0ZXJzL0ZFTGlnaHRpbmcu
aDo3Mjo0MTogZXJyb3I6IOKAmExpZ2h0aW5nRGF0YeKAmSBkb2VzIG5vdCBuYW1lIGEgdHlwZQo+
ID4gPiAgICA3MiB8ICAgICBpbmxpbmUgdm9pZCBwbGF0Zm9ybUFwcGx5TmVvbihjb25zdCBMaWdo
dGluZ0RhdGEmLCBjb25zdCBMaWdodFNvdXJjZTo6UGFpbnRpbmdEYXRhJik7Cj4gPiA+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+
ID4gPiBtYWtlWzRdOiAqKiogW1NvdXJjZS9XZWJDb3JlL0NNYWtlRmlsZXMvV2ViQ29yZS5kaXIv
YnVpbGQubWFrZTo1MTUyOiBTb3VyY2UvV2ViQ29yZS9DTWFrZUZpbGVzL1dlYkNvcmUuZGlyL19f
L19fL1dlYkNvcmUvRGVyaXZlZFNvdXJjZXMvdW5pZmllZC1zb3VyY2VzL1VuaWZpZWRTb3VyY2Ut
M2E1MmNlNzgtMTE5LmNwcC5vXSBFcnJvciAxCj4gPiA+IAo+ID4gPiBJIHRyaWVkIHRvIGZpbmQg
aXQgaW4gdGhlIHdlYmtpdCBidWd0cmFja2VyIGJ1dCB3YXMgbm90IHN1Y2Nlc3NmdWwuIAo+ID4g
Cj4gPiBXZSBoYXZlIGhhZCBhIGZldyBidWdzIHJlbGF0ZWQgdG8gdGhlIGZpbHRlcnMgY29kZSBp
biB0aGUgcGFzdCB3aGVuCj4gPiB0YXJnZXRpbmcgMzItYml0IEFSTSwgc3BlY2lhbGx5IHRoZSBO
RU9OIGZhc3QtcGF0aHMgd2hpY2ggZG8gbm90IGdldAo+ID4gcmVndWxhcmx5IGJ1aWx0IGJ5IGJ1
aWxkYm90cyBvbiBlYWNoIFdlYktpdCBjb21taXQuCj4gPiAKPiA+ID4gTXkgV1BFIGRlZmNvbmZp
ZyBpcyAKPiA+ID4gCj4gPiA+IEJSMl9QQUNLQUdFX1dQRVdFQktJVD15Cj4gPiA+IEJSMl9QQUNL
QUdFX1dQRVdFQktJVF9TQU5EQk9YPXkKPiA+ID4gCj4gPiA+IHdpdGggdGhlIGFybSBnY2MgMTAu
MyB0b29sY2hhaW4uCj4gPiAKPiA+IENhbiB5b3UgY29uZmlybSB0aGF0IHlvdSBhcmUgdGFyZ2V0
aW5nIHNvbWUgMzItYml0IEFSTSBwcm9jZXNzb3I/IElmCj4gPiB5ZXMsIGRvZXMgaXQgaGF2ZSBO
RU9OIHN1cHBvcnQ/IEFsdGVybmF0aXZlbHksIGlmIHlvdSBjYW4gc2hhcmUgYQo+ID4gLmNvbmZp
Zywgb3IgdXNlIOKAnG1ha2Ugc2F2ZWRlZmNvbmZpZ+KAnSBhbmQgc2hhcmUgdGhlIG91dHB1dCwg
dGhhdCB3aWxsCj4gPiBtYWtlIGl0IG11Y2ggZWFzaWVyIGZvciBtZSB0byByZXByb2R1Y2UgdGhl
IGlzc3VlIGFuZCBmaW5kIGEgc3VpdGFibGUKPiA+IGZpeC4KPiA+IAo+ID4gPiBkbyB5b3UgaGF2
ZSBhbnkgaWRlYSBpZiB0aGlzIG1pZ2h0IGJlIGZpeGVkIGluIHRoZSB1cGNvbWluZyAyLjM2LjM/
Cj4gPiAKPiA+IE1vc3QgbGlrZWx5IG5vdC4gSXQgbWlnaHQgYmUgZml4ZWQgYnkgY2hhbmNlIGR1
ZSB0byBzaGlmdGluZyBpbiB0aGUKPiA+IHNvdXJjZXMgd2hpY2ggZ2V0IGluY2x1ZGVkIGluIGVh
Y2ggdW5pZmllZC1zb3VyY2UgY29tcGlsYXRpb24gdW5pdCwKPiA+IHRobyAtLSBidXQgb25jZSBJ
IGhhdmUgYSB3YXkgdG8gcmVwcm9kdWNlLCBJIGFtIGNvbmZpZGVudCBpdCBjYW4gYmUKPiA+IHNv
bHZlZC4KPiAKPiBJIHRyaWVkIHdpdGggdGhlIGxhdGVzdCBtYXN0ZXIgYnJhbmNoICh3aXRoIDIu
MzYuMykgYW5kIGV4dGVuZGVkIHRoZSByYXNwYmVycnlwaTRfZGVmY29uZmlnIHdpdGggZ3JhcGhp
Y3MgZHJpdmVyLgo+IAo+IFRoaXMgaXMgdGhlIGRlZmNvbmZpZzoKPgo+IFsuLi5dCgpUaGFua3Mg
YSBsb3QgZm9yIHNoYXJpbmcgeW91ciBjb25maWcsIHRoYXQgd2FzIG1vc3QgaGVscGZ1bCEgSSBo
YXZlIGJlZW4KYWJsZSB0byByZXByb2R1Y2UgdGhlIGJ1aWxkIGlzc3VlIGFuZCBJIGFtIGFscmVh
ZHkgd29ya2luZyBvbiBhIGZpeCwKd2hpY2ggd2lsbCBtYWtlIGl0IGludG8gdGhlIDIuMzYuNCBy
ZWxlYXNlIGluIHNvbWUgd2Vla3MuIEluIHRoZQptZWFudGltZSBJIHdpbGwgc3VibWl0IGEgZml4
IHRvIGhhdmUgdGhlIHBhdGNoIGluIEJ1aWxkcm9vdC4KCkNoZWVycywK4oCUQWRyacOhbgo=

--bsRnJyeZdxTdzWwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYpcXmQAKCRCRxVnb5MkS
O4DTAJsHFUeCUn5n2iKZFLsj2l/qhedk/QCeOdSqPSl1jGXPvbzPQ+xskH02Hn0=
=yoXC
-----END PGP SIGNATURE-----

--bsRnJyeZdxTdzWwv--

--===============0465911748330109726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0465911748330109726==--
