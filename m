Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00070C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCBB8454D;
	Wed, 30 Mar 2022 07:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOOLtv6XY0Tq; Wed, 30 Mar 2022 07:44:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C0F58438D;
	Wed, 30 Mar 2022 07:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE91D1BF3E8
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A39041C0A
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNU7t8tlFeeT for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:44:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33D4341C07
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IXOsOFSYOxAxXgpA20MfMbkpgjApwhJqHWs0MFacl7E=; b=kLbEPzQqMtr7okp0OKeSTbgygO
 XVdz1m3+hRJPOnS2e0FP/HAB+PiQhU4bXP9/0OtsfCX4ozOsDxOcscZ9HZhvqE2gSRX1RVoE1kZ3w
 OWxbWlbGkbShf3zJILxO+UGybGu/X+jbUeZ2Z1sZ9LQAokd0ACw5xvQJ9LIgHww9W/bUcJSuiwcWR
 U7fhQ2h2OPdg2/vpc/upUbHM6EslYcpJ2+JMM0V+xBRtMytgAPhh54ks9Q5Lfbpw8pfqoAnHcLbnI
 0fA3P0Tlx4VaN0dlYF2dO8qFxBvM7TxWeKtdfHiLP7yf6swLjSGHayjaQ/w2nh63OsrcFcbDm66mG
 faCJaVdA==;
Received: from 91-153-34-241.elisa-laajakaista.fi ([91.153.34.241] helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nZT0I-0001oF-Pn; Wed, 30 Mar 2022 09:44:30 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 146f613f;
 Wed, 30 Mar 2022 07:44:19 +0000 (UTC)
Date: Wed, 30 Mar 2022 10:44:19 +0300
Message-ID: <20220330104419.GB1721679@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220330071449.4060342-1-james.hilliard1@gmail.com>
References: <20220330071449.4060342-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.12.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2700763172135156709=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2700763172135156709==
Content-Type: multipart/signed; boundary="4PZs7EzeycJCGstg"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--4PZs7EzeycJCGstg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpUaGFua3MgSmFtZXMgZm9yIHRoZSBwYXRjaCBhbmQgZm9yIHdhaXRpbmcgdW50aWwgLjQg
d2FzIHJlbGVhc2VkIHRvCnVwZGF0ZSBpdCA6KQoKT24gV2VkLCAzMCBNYXIgMjAyMiAwMToxNDo0
OSAtMDYwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+CgpBY2tlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+
Cgo+IC0tLQo+ICBwYWNrYWdlL2NvZy9jb2cuaGFzaCB8IDggKysrKy0tLS0KPiAgcGFja2FnZS9j
b2cvY29nLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NvZy9jb2cuaGFzaCBiL3Bh
Y2thZ2UvY29nL2NvZy5oYXNoCj4gaW5kZXggODM5YjEyZTYxOS4uMDBkM2E0ZTE5MSAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2NvZy9jb2cuaGFzaAo+ICsrKyBiL3BhY2thZ2UvY29nL2NvZy5oYXNo
Cj4gQEAgLTEsNyArMSw3IEBACj4gLSMgRnJvbSBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFz
ZXMvY29nLTAuMTIuMS50YXIueHouc3Vtcwo+IC1tZDUgIDI1YTgwYTVhOGE1MmI4ODczOTMzYTEy
ODE1MWI4OTI4ICBjb2ctMC4xMi4xLnRhci54ego+IC1zaGExICAzYjlmNjdiYzIzY2Q5ZTNkYjIy
MjEzNjZkNmNkZTRjYTBiMDZiODExICBjb2ctMC4xMi4xLnRhci54ego+IC1zaGEyNTYgIDIzY2Fh
YWZhMmVmNWMyZjZhOTdkNDY3ZmNjZTkwOGVhNzEwODdhZDAzYjcyZGViOTI4MDIyNWMwZGQ1NjFj
OTEgIGNvZy0wLjEyLjEudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVs
ZWFzZXMvY29nLTAuMTIuNC50YXIueHouc3Vtcwo+ICttZDUgIGNkYjhhY2RjM2FjYzliNTA4MmU3
ZGI5YzI3OTE1NWMzICBjb2ctMC4xMi40LnRhci54ego+ICtzaGExICA2MDBiMzBlZmFkZjU1YmY5
NGVhNTA2MmEwYTFiMmVhMGI3NDA1M2U1ICBjb2ctMC4xMi40LnRhci54ego+ICtzaGEyNTYgIDk5
ODNjNjIxYzhlMTRmY2EzNzkyZmY1NjZjYjZiODZkNmExZjE3NDQ2ZWI0YzA4M2FmNGE1YTc0OTEx
Mjk4MmYgIGNvZy0wLjEyLjQudGFyLnh6Cj4gIAo+ICAjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxl
czoKPiAgc2hhMjU2ICBlNmM0MmQ5M2M2OGIyOTJiY2NjZjZkMmVjM2UxM2RhODVkZjkwYjcxOGJh
MjdjMmMyYTAxMDUzYTlkMDA5MjUyICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY29n
L2NvZy5tayBiL3BhY2thZ2UvY29nL2NvZy5tawo+IGluZGV4IDJmNmVmNDAyZmIuLmYyY2EwYWY5
M2QgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9jb2cvY29nLm1rCj4gKysrIGIvcGFja2FnZS9jb2cv
Y29nLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiAgCj4gLUNPR19WRVJTSU9OID0gMC4xMi4xCj4gK0NPR19WRVJTSU9OID0gMC4xMi40Cj4gIENP
R19TSVRFID0gaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2VzCj4gIENPR19TT1VSQ0UgPSBj
b2ctJChDT0dfVkVSU0lPTikudGFyLnh6Cj4gIENPR19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAt
LSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--4PZs7EzeycJCGstg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYkQKUwAKCRCRxVnb5MkS
O+KPAJ9D36CuJpVV8vT8ueMpo3MQS5daUACfUSS5YIYZdY29KD+wIoOlyw3XhSY=
=k4XR
-----END PGP SIGNATURE-----

--4PZs7EzeycJCGstg--

--===============2700763172135156709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2700763172135156709==--
