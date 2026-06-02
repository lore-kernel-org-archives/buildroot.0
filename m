Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F916CD5BD1
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 14:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90C9560DA1;
	Tue,  2 Jun 2026 14:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKtTBwGtuVWk; Tue,  2 Jun 2026 14:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29FD660D97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780409269;
	bh=29wGnA2GA6Gm7d3AWD0tuihPFec1MNdFHLPqkSNmpz8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qsg/NPYvKqjMSKUnt/AxTz40+x9tEPj8Nmr2x5+d4EP6VzuJWOH1n3X9VdXK88JZn
	 AG4d6AYFYaM5Z3N0UFa0pml0V1DTSew2C9eRtmktLV4Yorj1mTOurTPMfMKHfguADp
	 LWkiKckqKONpwUWhbvmIuF3ooELEd/Glp3OQy3AaBbikp6cG2HHnJZ1tsqbsTyN6qT
	 FEISP5bp4q9dynuoFzyFx9tw7agLe4dgzN09ZU2iJJUMINVnM8eGJtjRC0ukUzCSdc
	 WeTxJX3kEynEu9e0pAle90tC7V/s/WTTjMIGij77eDauqKqdJa+z/58QkSsZyC6Y6S
	 REzLsgHgKj8/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29FD660D97;
	Tue,  2 Jun 2026 14:07:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FC62223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 14:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C35140B2D
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 14:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRowIuRG0rQ6 for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 14:07:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B97C640B2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B97C640B2C
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B97C640B2C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 14:07:43 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wUPmN-00BjRQ-C6; Tue, 02 Jun 2026 16:07:39 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id e005353c;
 Tue, 2 Jun 2026 14:07:38 +0000 (UTC)
Date: Tue, 2 Jun 2026 17:07:38 +0300
Message-ID: <20260602170738.GD1708212@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20260528172818.26277-1-raphael.pavlidis@gmail.com>
References: <20260528172818.26277-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zQ5F/EEW3wOctS0mYTFeCyPsk5fJOtS2uQzVmFj5+OY=; b=GwwKe2Ys3wG6YjGybJ62y0lG7n
 EI0+XmNNDv3fmq5+xPu2idid2jotGfrV1qTBi6PwbJMqHv2IyHWSIHMCLQKrTbBCZCRbsHLNM4HkQ
 ncBSCbriv9tCAGsKj42sao0jcf8WtcbG2hOCOuCDhWypYgMx73dtEPNuOvvuQ5+vmFKQlXtpqD6vO
 HgPgsMf8qplMpGaFi1/5kpmgheaf+5QhV3O37uhQJJ7ENEsmNK47egn5XydsuweC5QPliAeNfiVFj
 YhXJqLEBlVAVHeJKvHrOBWr9pw0jzJL/7AJ2O2vqdHp6an0pgX321M49WgKZoXBJohBpwtZb0xeuq
 P+hBClYw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=GwwKe2Ys
Subject: Re: [Buildroot] [PATCH v1 1/1] package/sway: bump to version 1.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7856991831844178222=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7856991831844178222==
Content-Type: multipart/signed; boundary="XC3RBJdmyDH2GAlo"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--XC3RBJdmyDH2GAlo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVGh1LCAyOCBNYXkgMjAyNiAxOToyODoxOCArMDIwMCBSYXBoYWVsIFBhdmxpZGlzIDxyYXBo
YWVsLnBhdmxpZGlzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQWxzbyBmaXggdGhlIGN1cnJlbnQgYnVp
bGQgZXJyb3Igd2l0aCAxLjExLCBiZWNhdXNlIHN3YXkgMS4xMSBjYW5ub3QgYmUKPiBidWlsZCB3
aXRoIHdscm9vdHMgMC4yMC4wLgo+IAo+IENoYW5nZWxvZzoKPiBodHRwczovL2dpdGh1Yi5jb20v
c3dheXdtL3N3YXkvcmVsZWFzZXMvdGFnLzEuMTIKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIFBh
dmxpZGlzIDxyYXBoYWVsLnBhdmxpZGlzQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9zd2F5
L3N3YXkuaGFzaCB8IDUgKysrLS0KPiAgcGFja2FnZS9zd2F5L3N3YXkubWsgICB8IDIgKy0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvc3dheS9zd2F5Lmhhc2ggYi9wYWNrYWdlL3N3YXkvc3dheS5oYXNo
Cj4gaW5kZXggNDZmMmJlZTc1My4uMmI4YThlZTk5MCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N3
YXkvc3dheS5oYXNoCj4gKysrIGIvcGFja2FnZS9zd2F5L3N3YXkuaGFzaAo+IEBAIC0xLDUgKzEs
NiBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJl
Cj4gLSMgaHR0cHM6Ly9naXRodWIuY29tL3N3YXl3bS9zd2F5L3JlbGVhc2VzL2Rvd25sb2FkLzEu
MTEvc3dheS0xLjExLnRhci5nei5zaWcKPiArIyBodHRwczovL2dpdGh1Yi5jb20vc3dheXdtL3N3
YXkvcmVsZWFzZXMvZG93bmxvYWQvMS4xMi9zd2F5LTEuMTIudGFyLmd6LnNpZwo+ICAjIHdpdGgg
a2V5IDM0RkY5NTI2Q0ZFRjBFOTdBMzQwRTJFNDBGREU3QkUwRTg4RjVFNDggImVtZXJzaW9uIDxj
b250YWN0QGVtZXJzaW9uLmZyPiIKPiAtc2hhMjU2ICAwZTM3YTU1YjdjMzM3OTIzMGU5N2UxYWQ5
ODI1NDJiNzUwMTZhMGM3ZDY2NzYxOTg2MDRlNTU3ZjliMzczZGFlICBzd2F5LTEuMTEudGFyLmd6
Cj4gKyMgVW5mb3J0dW5hdGVseSwgdGhlIGtleXMgZXhwaXJlZCBvbiAyMDI1LTA0LTAzLgo+ICtz
aGEyNTYgIGE3YjFiZWNjMjE3NDMzYzExYzYyODRkMzZiY2VhMDY4N2I4N2I3N2IwZWQyNmEzODQ1
NjUyOTJlYzMyMWYyYjEgIHN3YXktMS4xMi50YXIuZ3oKPiAgc2hhMjU2ICBiZDM1NzIyYmZmNDYz
MjdmNWVkZWQxZDIxMTIwNzI3N2JiZTA0M2QyYTIyMDQ4YjI4MmM0MmVmODAxNTkzYjhiICBMSUNF
TlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3dheS9zd2F5Lm1rIGIvcGFja2FnZS9zd2F5L3N3
YXkubWsKPiBpbmRleCBhNDk3YTJjYmU3Li41NmQxOGVmNmY5IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvc3dheS9zd2F5Lm1rCj4gKysrIGIvcGFja2FnZS9zd2F5L3N3YXkubWsKPiBAQCAtNCw3ICs0
LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtU1dBWV9WRVJTSU9O
ID0gMS4xMQo+ICtTV0FZX1ZFUlNJT04gPSAxLjEyCj4gIFNXQVlfU0lURSA9IGh0dHBzOi8vZ2l0
aHViLmNvbS9zd2F5d20vc3dheS9yZWxlYXNlcy9kb3dubG9hZC8kKFNXQVlfVkVSU0lPTikKPiAg
U1dBWV9MSUNFTlNFID0gTUlUCj4gIFNXQVlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAtLSAK
PiAyLjU0LjAKClJldmlld2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KCkNoZWVycywK4oCUQWRyacOhbgo=

--XC3RBJdmyDH2GAlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCah7jqgAKCRCRxVnb5MkS
O+PkAJ9R19Zc2YkDTmER1NBK9lA6NOEG9gCfdzCrZNwszTzyYDrgFdsDcGC2kaY=
=vfEX
-----END PGP SIGNATURE-----

--XC3RBJdmyDH2GAlo--

--===============7856991831844178222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7856991831844178222==--
