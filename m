Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2BFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 11:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE15F60B34;
	Fri, 28 Jan 2022 11:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K14c5a6j0NJ0; Fri, 28 Jan 2022 11:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E872160B10;
	Fri, 28 Jan 2022 11:42:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BC341BF338
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7947360B10
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 11:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zriX1ZfVBby for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 11:42:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70F8560B0E
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p7l11lYwBod9fub71W3UEGcdNKeuFR44pC6Fgy9nZ7k=; b=UKALleyMFHI7WmfKQCDsmeX5hh
 TDjZ4HmcEIcbonK8V+bHV49mSsiNS0/moVm/nSqHHSN+efce6FZxXuaDND1T2vU+EHm6RjI9uML52
 kIuPfNrRLbn3DMMg1iCtD5wZw4+sct0q8DcTS9KG6ZRJqF+0nkJxqGQGDiSEfmcObOlTA2D6ZpOai
 ZaG4ZniiiHgbJu2iiXGT8wUthmRwDx+zhB9/0ZnRcVMQ7rNpMIOvo8SGcr8SDO31zPQWlgSgIOHQ5
 zzw5oi8CJLosX/rejbTG3sbPYgIpa3DgdLTwQ+eSjaU9TZYh0DheQ4xHWEK3rloi7/BURG5WbOZek
 +b6LtkDw==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nDPeM-0001jV-8Z; Fri, 28 Jan 2022 12:42:42 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id c105db00;
 Fri, 28 Jan 2022 11:42:26 +0000 (UTC)
Date: Fri, 28 Jan 2022 13:42:23 +0200
Message-ID: <20220128134223.GB765275@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas.devoogdt@gmail.com>
In-Reply-To: <20220128105917.30421-2-thomas.devoogdt@barco.com>
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
 <20220128105917.30421-2-thomas.devoogdt@barco.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: bump to version 3.0.4
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8191383204862578792=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8191383204862578792==
Content-Type: multipart/signed; boundary="Y8H4284dheJcY+8g"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--Y8H4284dheJcY+8g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLCBhbGwsCgpPbiBGcmksIDI4IEphbiAyMDIyIDExOjU5OjE3ICswMTAwIFRo
b21hcyBEZXZvb2dkdCA8dGhvbWFzLmRldm9vZ2R0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gRHJvcCB1
cHN0cmVhbWVkIHBhdGNoOgo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJzb3Vw
Ly0vY29tbWl0LzVjM2Q0MzFiZGIwOTRjNTk5OTdmMmEyM2UzMWU4M2Y4MTVhYjY2N2MKPiAKPiBU
aGUgZ25vbWUgb3B0aW9uIHdhcyBkcm9wcGVkIGluOgo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS9saWJzb3VwLy0vY29tbWl0LzNmY2FhODgyYzRlYjI5ZmQ3NTRjZGI2ZGQwNjE5NTYz
MmNiNGI1MmEKPiAKPiBBIG5ldyAibGlibmdodHRwMiIgZGVwZW5kZW5jeSBpcyBhZGRlZCBzaW5j
ZSBsaWJzb3VwIDIuOTkuNiAoSFRUUDIgYmFja2VuZCk6Cj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2xpYnNvdXAvLS9jb21taXQvMWExZDI5YzMxMTRjYTg2YzY3M2QwYzBiMDJhNDky
ZDA5NjJkY2ZlOAo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzLmRl
dm9vZ2R0QGJhcmNvLmNvbT4KPiAtLS0KPiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKysrCj4gIC4uLi8wMDAxLW1lc29uLmJ1aWxkLXNldC1jX3N0
ZC10by1nbnU5OS5wYXRjaCB8IDQwIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9saWJz
b3VwL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0tCj4gIHBhY2thZ2UvbGli
c291cC9saWJzb3VwLmhhc2ggICAgICAgICAgICAgICAgICB8ICA0ICstCj4gIHBhY2thZ2UvbGli
c291cC9saWJzb3VwLm1rICAgICAgICAgICAgICAgICAgICB8IDExICsrLS0tCj4gIHBhY2thZ2Uv
bWlkb3JpL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgNiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvbGlic291cC8wMDAxLW1lc29uLmJ1aWxkLXNldC1jX3N0ZC10by1nbnU5
OS5wYXRjaAoKTm90ZSB0aGF0IGxpYnNvdXAzIGhhcyBhIG5ldyBBUEkgWzFdIChhbmQgQUJJLCB0
aGVyZWZvcmUpLiBQYWNrYWdlcyB1c2luZwpsaWJzb3VwMiBtYXkgbm90IGV2ZW4gY29tcGlsZSB3
aXRoIGxpYnNvdXAzLCBvciBtYXkgY3Jhc2ggYXQgcnVudGltZSBpbgp1bmV4cGVjdGVkIHdheXMu
CgpZb3Ugd2lsbCBuZWVkIGZvbGxvd3VwIHBhdGNoZXMgdG8gbW9kaWZ5IHBhY2thZ2VzIHRoYXQg
ZGVwZW5kIG9uIGxpYnNvdXAKdG8gbWFrZSB0aGVtIHVzZSBsaWJzb3VwMi4gRm9yIGV4YW1wbGUg
aW4gcGFja2FnZS93cGV3ZWJraXQubWsgd2UgYXJlCmN1cnJlbnRseSBwYXNzaW5nIC1EVVNFX1NP
VVAyPU9OIHRvIENNYWtlLCB3aGljaCBuZWVkcyB0byBiZSBjaGFuZ2VkIHRvCk9GRi4KClNvbWUg
cGFja2FnZXMgbWF5IG5vdCBldmVuIHN1cHBvcnQgeWV0IGJ1aWxkaW5nIHdpdGggbGlic291cDMu
IFRoZXJlZm9yZQp3ZSBtYXkgbmVlZCB0byBrZWVwIHRoZSBsaWJzb3VwMiBwYWNrYWdlLiBUaGlz
IGlzIHBvc3NpYmxlLCBhcyBib3RoIHZlcnNpb25zCmFyZSBwYXJhbGxlbC1pbnN0YWxsYWJsZS4g
QnV0IHRoZW4gdGhlcmUgaXMgb25lIG1vcmUgaXNzdWU6IG9uZSBjYW5ub3QgdXNlCmJvdGggbGli
cmFyaWVzIGluIHRoZSBzYW1lIHByb2Nlc3MuIFdoaWNoIG1lYW5zLCBmb3IgZXhhbXBsZSwgaWYg
d3Bld2Via2l0CmdldHMgY2hhbmdlZCB0byB1c2UgbGlic291cDMsIHRoZW4gR1N0cmVhbWVyICph
bHNvKiBuZWVkcyB0byBiZSBjaGFuZ2VkCmJlY2F1c2UgYm90aCBhcmUgdXNlZCBpbnNpZGUgV2Vi
S2l0LgoKVGhlc2UgYXJlIGFsbCByZWFzb25zIHdoeSBJIGhhdmUgbm90IHlldCBzZW50IHBhdGNo
ZXMgdG8gZG8gdGhlIHN3aXRjaC4KUHJvYmFibHkgd2Ugd2FudCB0byBkaXNjdXNzIGhvdyB0byBn
byBhaGVhZCB3aXRoIHRoZSBsaWJzb3VwMyBtaWdyYXRpb24gaW4KQnVpbGRyb290LgoKQ2hlZXJz
LArigJRBZHJpw6FuCgotLS0KWzFdIGh0dHBzOi8vbGlic291cC5vcmcvbGlic291cC0zLjAvY2gw
Mi5odG1sCg==

--Y8H4284dheJcY+8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYfPWnwAKCRCRxVnb5MkS
O1VdAJ42Li7biEnvGjW48dQKrh7Pm1b0JwCdESVOyQOoSv2VIbBN28g9jI7mGWs=
=Mr54
-----END PGP SIGNATURE-----

--Y8H4284dheJcY+8g--

--===============8191383204862578792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8191383204862578792==--
