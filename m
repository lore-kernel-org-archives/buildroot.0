Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E73C4167B
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 13:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CE9F82271;
	Tue, 14 Nov 2023 13:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE9F82271
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bc5DI9jc5_eq; Tue, 14 Nov 2023 13:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D1A8219A;
	Tue, 14 Nov 2023 13:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D1A8219A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78C761BF2B4
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 13:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 524DC612E3
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 13:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 524DC612E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4Ud_TqSqMIh for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 13:11:23 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D96E6119C
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 13:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D96E6119C
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r2tCJ-0036Kv-Th; Tue, 14 Nov 2023 14:11:20 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id efd4e205;
 Tue, 14 Nov 2023 13:11:19 +0000 (UTC)
Date: Tue, 14 Nov 2023 15:11:18 +0200
Message-ID: <20231114151118.GF1974649@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20231110164617.569602-3-thomas@devoogdt.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-3-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NG8kSZQN679eY2h3CfioR/CQxmEDJD7QcGCPQlBT9+o=; b=es/WkBXHJFwR+BjyrtTeq+u19V
 OqGvJ0Upjeiq8fX6clcILIy2lJwbtSQW1FSGya4/vMQ8DMVCaAw5JZM394WT4Ee8oVGu37h9PoI+W
 iWnmf9ZrjWAPB9GETXPdT7CzRPVF/BqOegjl/+l8Pa1Rw8BtV7l31DF0QU48mIIfiVTevAwP0yAi6
 /zc9ZSM6paWvevHbhUgfR83UNBklNuVghpC0xq6PSHDaSn4gCaBEacPl6eNRxAXlKClx6RhjK1yhL
 qrWmdQ9Zk7cRb13v6KO+HcgnhUg9/SOoyl4TCS2kXd0OE284pX+2F4ftf/AYEhq1ebRiiWknnFsd/
 oPRHjXdg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=es/WkBXH
Subject: Re: [Buildroot] [PATCH v5 3/3] package/webkitgtk: bump to version
 2.42.2
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4154066847651470665=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4154066847651470665==
Content-Type: multipart/signed; boundary="E87jvqAZVvr2JT1M"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--E87jvqAZVvr2JT1M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ggc2V0IHdpdGggdGhlIGZpeGVzIGFuZCB0
aGUgdXBkYXRlIHRvIDIuNDIueCwgSSBoYXZlCnJldmlld2VkIGFuZCB0ZXN0ZWQgdGhlIG90aGVy
IHR3byBwYXRjaGVzICh0aGV5IGFyZSBnb29kISkgYnV0IHRoaXMgb25lCm5lZWRzIG9uZSBtb3Jl
IGNoYW5nZSBiZWZvcmUgaXQgY2FuIGJlIG1lcmdlZCwgcGxlYXNlIHJlYWQgdGhlIGNvbW1lbnQK
YmVsb3cuCgpPbiBGcmksIDEwIE5vdiAyMDIzIDE3OjQ2OjE3ICswMTAwIFRob21hcyBEZXZvb2dk
dCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3JvdGU6Cj4gVXBkYXRlIHRvIGEgbmV3IG1ham9yIHJl
bGVhc2UuCj4gCj4gUmVsZWFzZSBub3RlczoKPiAKPiBodHRwczovL3dlYmtpdGd0ay5vcmcvMjAy
My8wOS8xNS93ZWJraXRndGsyLjQyLjAtcmVsZWFzZWQuaHRtbAo+IGh0dHBzOi8vd2Via2l0Z3Rr
Lm9yZy8yMDIzLzA5LzI3L3dlYmtpdGd0azIuNDIuMS1yZWxlYXNlZC5odG1sCj4gaHR0cHM6Ly93
ZWJraXRndGsub3JnLzIwMjMvMTEvMTAvd2Via2l0Z3RrMi40Mi4yLXJlbGVhc2VkLmh0bWwKPiAK
PiBTZWN1cml0eSBub3RlczoKPiAKPiBodHRwczovL3dlYmtpdGd0ay5vcmcvc2VjdXJpdHkvV1NB
LTIwMjMtMDAwOC5odG1sCj4gCj4gLSBVU0VfSlBFR1hMIGlzIGVuYWJsZWQgYnkgZGVmYXVsdCBu
b3cgWzFdLCBzbyBhZGQgYSBsaWJqeGwgaWYgdXNlZC4KPiAKPiAtIEVOQUJMRV9HTEVTMiBoYXMg
YmVlbiBkcm9wcGVkLCBzbyBkcm9wIGl0IGFsc28gaGVyZSBbMl0uCj4gICBJbnN0ZWFkLCBlbmFi
bGUgVVNFX09QRU5HTF9PUl9FUyBpZiBsaWJnbGVzIGlzIHByZXNlbnQuIEJld2FyZSB0aGF0IGFs
c28KPiAgIGxpYmVnbCBpcyBuZWVkZWQgZm9yIFVTRV9PUEVOR0xfT1JfRVMsIGJ1dCB0aGF0IG9u
ZSBpcyBtb3N0IG9mIHRoZSB0aW1lIGEKPiAgIGRlcGVuZGVuY3kgZm9yIGxpYmdsZXMsIHNvIGxl
YXZlIGl0IG91dCBoZXJlLgo+IAo+IC0gQWxzbyByYWlzZSB0aGUgbWluaW1hbCBHQ0MgdmVyc2lv
biB0byAxMC4yLCB3aGljaCBpcyByZXF1aXJlZCBzaW5jZSB3ZWJraXRndGstMi40Mi54IFszXS4K
PiAgIFNpbWlsYXIgdG8gY29tbWl0IGVjMWZmODAyZGY5YTBmMTdkZDJiNzM0YmE1MzZhNWUyMDZh
YTVhYTQsCj4gICB3ZSBkbyBjaGVjayBvbiA+PSBHQ0MgMTAsIGJlY2F1c2Ugd2UgY2FuJ3QgY2hl
Y2sgb24gPj0gR0NDIDEwLjIuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQvV2Vi
S2l0L2NvbW1pdC85Mzg2NTQxNGYzMzE5MGM1N2UyOTNhODA0OTJlMTBlZGM0NjFkN2YwCj4gWzJd
IGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0L2NvbW1pdC9jZmU5MTdmZWM0NWJmNzJj
MzcxMDg3ZWNlMDM0ZmVlZTg0NTRmMWI0Cj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9XZWJLaXQv
V2ViS2l0L2NvbW1pdC8xMzM0OThhYWVlOGY0NDQ0M2Q5ZTNiMmEwOGJlNGE0Yjc3YjkzZmM5Cj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28u
Y29tPgo+IC0tLQo+ICB2Mjogbi9hCj4gIHYzOgo+ICAtIHJlcGxhY2UgZm9yIHBhY2thZ2Uvd2Vi
a2l0Z3RrOiBhZGQgYSBVU0VfT1BFTkdMX09SX0VTIGNvbmZpZyBvcHRpb24KPiAgLSAyLjQyLjAg
bmVlZHMgYW4gZXh0cmEgYnVuY2ggb2YgcGF0Y2hlcywgc28gYnVtcCB0byBpbW1lZGlhdGVseSB0
byAyLjQyLjEKPiAgdjQ6Cj4gIC0gZml4ZWQgaW5jb21wbGV0ZSBnaXQgbWFzc2FnZSAoYSBfX19f
IGxpbmUgc3BsaXRzIHRoZSBnaXQgbWVzc2FnZSBhcHBhcmVudGx5KQo+ICAtIHJlLWFkZGVkIHBh
dGNoZXMgd2l0aCB1cHN0cmVhbSBjaGVycnktcGljayBhbmQgaGFzaAo+ICB2NToKPiAgLSAyLjQy
LjEgbmVlZHMgYW4gZXh0cmEgYnVuY2ggb2YgcGF0Y2hlcywgc28gYnVtcCB0byBpbW1lZGlhdGVs
eSB0byAyLjQyLjIKClBhdGNoICIwMDAyLVdQRS1HVEstRXh0ZW5zaW9uc0dMT3BlbkdMRVMuY3Bw
LXVzZXMtR0xFUzMtc3ltYm9scy0ucGF0Y2giIGFsc28KbmVlZHMgdG8gYmUgcmVtb3ZlZDogaXQg
ZG9lcyBub3QgYXBwbHkgYmVjYXVzZSB0aGUgZml4IGhhcyBiZWVuIGltcG9ydGVkCnVwc3RyZWFt
IGFuZCBpcyBwYXJ0IG9mIHRoZSAyLjQyLnggcmVsZWFzZXMuCgo+IC0tLQo+ICAuLi5lLXdoZW4t
Z3N0cmVhbWVyLXN1cHBvcnQtaXMtZGlzYWJsZWQucGF0Y2ggfCAzNiAtLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIHBhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8ICA2
ICsrLS0KPiAgcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2ggICAgICAgICAgICAgIHwg
IDYgKystLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsgICAgICAgICAgICAgICAg
fCAxNiArKysrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0NyBk
ZWxldGlvbnMoLSkKPgo+IFsuLi5dCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--E87jvqAZVvr2JT1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZVNx9wAKCRCRxVnb5MkS
O4zPAJwPI3Ga413mSlYwDnQKcFknpH1kyACff4hT0TA7PxjyFeS2zUkCPkm2Bg4=
=p7qY
-----END PGP SIGNATURE-----

--E87jvqAZVvr2JT1M--

--===============4154066847651470665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4154066847651470665==--
