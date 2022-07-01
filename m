Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BF4C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 11:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1B5410E4;
	Fri,  1 Jul 2022 11:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1B5410E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1XOSC1uX3Gr; Fri,  1 Jul 2022 11:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D29E41498;
	Fri,  1 Jul 2022 11:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D29E41498
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCBB21BF5DD
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 11:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B9F414E5
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 11:33:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B9F414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Bwm87EdKxXA for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 11:33:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD4D41498
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECD4D41498
 for <buildroot@buildroot.org>; Fri,  1 Jul 2022 11:33:25 +0000 (UTC)
Received: from 135.224.60.213.dynamic.reverse-mundo-r.com ([213.60.224.135]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1o7Etl-00E6KA-JI; Fri, 01 Jul 2022 13:33:21 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 8fc207ac;
 Fri, 1 Jul 2022 11:33:11 +0000 (UTC)
Date: Fri, 1 Jul 2022 13:33:07 +0200
Message-ID: <20220701133307.GB636837@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220627073306.2673751-1-james.hilliard1@gmail.com>
References: <20220627073306.2673751-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oaWu2w0iMApaor6U0dIQr7uCPwm6kFmFMmUNsrzYriI=; b=mweJ0O0domjhAF6M65euAhAFiW
 5dwH4Tp/RYq3dKoSilwILLcwvzAt3YWgxbyG6BUF1LaO8zX82P87ge1RtzDjL4sOCi6CYuqclZb87
 idOcXAGUIQvBageTK9xk0rViRCZmP2PiCf2gd8fW8M44QxVH6DPU+0ttusH16+GptUKe7x7DkujYQ
 gOXmnfqW1zpu80o2vvuys97ik0tkhzTjxKDci/4HvIqwQnC322cFE1Fq2iSUhp4zeS++wdEFPZ98k
 n8vjODl+qKahdRVSky3P2r3wZV7eoYfyocGpA3O84g1BHiSFhXa+HRk6nMJC0cSimDBEmgEvHTrgs
 3cU9HBNQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=mweJ0O0d
Subject: Re: [Buildroot] [PATCH 1/1] package/{webkitgtk,
 wpewebkit}: select subenc for multimedia
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
Content-Type: multipart/mixed; boundary="===============1785926565086618089=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1785926565086618089==
Content-Type: multipart/signed; boundary="ykEIKh+rFljhat2g"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--ykEIKh+rFljhat2g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNyBKdW4gMjAyMiAwMTozMzowNiAtMDYwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gV2hlbiB1c2luZyB3ZWJraXQgd2l0aCBtdWx0
aW1lZGlhIHN1cHBvcnQgdGhlIHN1YmVuYyBlbGVtZW50IG1heQo+IGJlIG5lZWRlZCwgYXMgc3Vj
aCB3ZSBzaG91bGQgc2VsZWN0IHRoZSBzdWJlbmMgcGx1Z2luLgo+IAo+IEZpeGVzIHJ1bnRpbWUg
d2FybmluZzoKPiBpc0dTdHJlYW1lclBsdWdpbkF2YWlsYWJsZTogUGx1Z2luIHN1YmVuYyBub3Qg
Zm91bmQuIFBsZWFzZSBjaGVjayB5b3VyIEdTdHJlYW1lciBpbnN0YWxsYXRpb24KPiBXZWJLaXQg
d2Fzbid0IGFibGUgdG8gZmluZCBhIFdlYlZUVCBlbmNvZGVyLiBTdWJ0aXRsZXMgaGFuZGxpbmcg
d2lsbCBiZSBkZWdyYWRlZCB1bmxlc3MgZ3N0LXBsdWdpbnMtYmFkIGlzIGluc3RhbGxlZC4KPiAK
PiBTZWU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQvYmxvYi83MmI1OWFkNTBl
MDc5MDM3MDczNzIyYmJkZjQ2OWMwOTUyZTM5OWZhL1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL2dy
YXBoaWNzL2dzdHJlYW1lci9UZXh0Q29tYmluZXJHU3RyZWFtZXIuY3BwI0wyMjEKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KCkFj
a2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0t
Cj4gIHBhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbiB8IDEgKwo+ICBwYWNrYWdlL3dwZXdlYmtp
dC9Db25maWcuaW4gfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluIGIvcGFja2FnZS93ZWJr
aXRndGsvQ29uZmlnLmluCj4gaW5kZXggMjU3NTEwODM2My4uMjIxOWFhMzUzZSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0
ay9Db25maWcuaW4KPiBAQCAtOTcsNiArOTcsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0VCS0lU
R1RLX01VTFRJTUVESUEKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFECj4g
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fREVCVUdVVElMUwo+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQURfUExVR0lOX01QRUdUU0RFTVVY
Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBRF9QTFVHSU5fU1VCRU5DCj4g
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9QTFVHSU5TX0JBU0UKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVHSU5fQUxTQQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdF
X0dTVDFfUExVR0lOU19CQVNFX1BMVUdJTl9BUFAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3
ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4gaW5kZXggZjUw
ZTBkYTIxYy4uZmFjNzY3MjkzOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dwZXdlYmtpdC9Db25m
aWcuaW4KPiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiBAQCAtOTAsNiArOTAs
NyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01VTFRJTUVESUEKPiAgCXNlbGVjdCBC
UjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFECj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0JBRF9QTFVHSU5fREVCVUdVVElMUwo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFf
UExVR0lOU19CQURfUExVR0lOX01QRUdUU0RFTVVYCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NU
MV9QTFVHSU5TX0JBRF9QTFVHSU5fU1VCRU5DCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfR1NUMV9Q
TFVHSU5TX0JBU0UKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9HU1QxX1BMVUdJTlNfQkFTRV9QTFVH
SU5fQUxTQQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dTVDFfUExVR0lOU19CQVNFX1BMVUdJTl9B
UFAKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--ykEIKh+rFljhat2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYr7bcwAKCRCRxVnb5MkS
O/4qAJ9FC3bQnGfpk7gP0TizIQLU1nrK1gCfeFY6FplSwTPIys8SW354e0Jkek4=
=iar5
-----END PGP SIGNATURE-----

--ykEIKh+rFljhat2g--

--===============1785926565086618089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1785926565086618089==--
