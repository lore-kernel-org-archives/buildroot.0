Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C8EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 20:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF3AE408E7;
	Wed, 24 Nov 2021 20:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwh3GBVFMksw; Wed, 24 Nov 2021 20:52:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D10A408F8;
	Wed, 24 Nov 2021 20:52:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBCEE1BF4E2
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB8AA408E7
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QkhYO9VcwNxO for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 20:52:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A060E405E3
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U3ktH1XeVXarweF6bIbBoRhDT4ShUBG7Bsl9v/F3tMA=; b=h9u9RyCte/YootrDd8aQF2usm+
 DHiRnHN0Ry3KcSAMRxCLwSYKLDqU36ap6uAc6qc3HoLVGf9E5HReGrAXiurVAUlt4WsUILU4YDn4C
 aHwjbVOOckgxUignHJbxIxhIHa6Pi77MyeZcW6so+yFyCBGrOxYI5AsWVN61NFHojtPhYHarR8b+D
 pcvL3wy7ZUfJmS1+cp1T01xe2/fpwUh3lrFsg9Yo1ojK+vdSmSSM3jgE9Ppk2pCSj8nByC6VVWN5q
 DCr7ywrJZQUYLwfckBKsEpgDl5nlwaFc6qyKvOD3aamKhaa5oc839cOAOJ27EAQv0FPzRlLHEY82r
 RIRtHr0A==;
Received: from 91-152-140-142.elisa-laajakaista.fi ([91.152.140.142]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1mpzFQ-0003VJ-RY; Wed, 24 Nov 2021 21:52:08 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id cf6d4632;
 Wed, 24 Nov 2021 20:51:58 +0000 (UTC)
Date: Wed, 24 Nov 2021 22:51:54 +0200
Message-ID: <20211124225154.GB817652@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <2321c28a-a39c-790d-35fa-b52cf7cfeabc@mind.be>
References: <20211025224403.979315-1-aperez@igalia.com>
 <2321c28a-a39c-790d-35fa-b52cf7cfeabc@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/4] Update WPE WebKit (and deps) to 2.34.1
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
Content-Type: multipart/mixed; boundary="===============9137390085173728340=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9137390085173728340==
Content-Type: multipart/signed; boundary="w+viDopVefJHucnV"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--w+viDopVefJHucnV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBXZWQsIDE3IE5vdiAyMDIxIDIyOjAyOjMwICswMTAwIEFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6CiAKPiBPbiAyNi8xMC8yMDIxIDAwOjQzLCBBZHJp
YW4gUGVyZXogZGUgQ2FzdHJvIHdyb3RlOgo+Cj4gPiBUaGlzIHBhdGNoIHNldCB1cGRhdGVzIFdQ
RSBXZWJLaXQgYW5kIGl0cyBkZXBlbmRlbmNpZXMgdG8gdGhlIGxhdGVzdCByZWxlYXNlcwo+ID4g
b2YgdGhlaXIgY3VycmVudCBzdGFibGUgc2VyaWVzLiBBcyBvZnRlbiBoYXBwZW5zLCBJIG5lZWRl
ZCB0byBtYWtlIGEgcGF0Y2ggdG8KPiA+IGZpeCB0aGUgYnVpbGQgd2l0aCBtdWx0aW1lZGlhIHN1
cHBvcnQgZGlzYWJsZWQsIGFuZCB0aGF0IGhhcyBiZWVuIHNlbnQgdG8KPiA+IHVwc3RyZWFtIFdl
YktpdCBhcyB3ZWxsLgo+ID4gCj4gPiBBbiBhZGRpdGlvbmFsIHBhdGNoIHRvIGVuYWJsZSB0aGUg
bmV3IGNvbG9yIG1hbmFnZW1lbnQgaXMgaW4gdGhlIHNlcmllcyBhcwo+ID4gd2VsbDsgYnV0IGZv
ciB0aGUgbW9tZW50IHRoZSBzdXBwb3J0IHRvIGJ1aWxkIHdpdGggbGlic291cDMgaXMgbGVmdCBv
dXQuCj4gPiBJIHdvdWxkIHJhdGhlciBzdWJtaXQgdGhhdCBhcyBwYXJ0IG9mIGRpZmZlcmVudCAi
YWRkIGxpYnNvdXAzIGFuZCBlbmFibGUKPiA+IHdoZXJlIHN1cHBvcnRlZCIgcGF0Y2ggc2V0IHNv
bWUgb3RoZXIgZGF5IDstKQo+ID4gCj4gPiBDaGVlcnMsCj4gPiAtQWRyaWFuCj4gCj4gICBTZXJp
ZXMgYXBwbGllZCB0byBuZXh0LCB0aGFua3MuIEhvcGVmdWxseSB0aGlzIG1vdGl2YXRlcyBzb21l
b25lIHRvIGZpeCB0aGUgCj4gY3Jhc2ggcmVwb3J0ZWQgYnkgSmFtZXMgOi0pCj4gCj4gICBUd28g
c21hbGwgY29tbWVudHMgb24gdHdvIG9mIHRoZSBwYXRjaGVzLCB3aGljaCBJJ2xsIG1ha2UgaW4t
bGluZS4KClxvLwoKVGhhbmtzIEFybm91dCEgSSB3aWxsIGJlIHN1Ym1pdHRpbmcgdGhlIHVwZGF0
ZSB0byAyLjM0LjIgbW9tZW50YXJpbHksIHdoaWNoCnJlbW92ZXMgdGhlIG5lZWQgZm9yIHRoZSBw
YXRjaCB3ZSBoYXZlIGluIHRoZSByZXBvOyBhbmQgYWxzbyBhbiB1cGRhdGUgdG8KQ29nIDAuMTIu
MCwgd2hpY2ggaGFzIGp1c3QgYmVlbiByZWxlYXNlZC4KCkNoZWVycywK4oCUQWRyacOhbgo=

--w+viDopVefJHucnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYZ6l6gAKCRCRxVnb5MkS
O3RfAJ9LcJHmclX10KO8HwVpWZamiD+SzwCfXgUDx5DY+J3KzvjeQ4PQhqqtRm0=
=n3hn
-----END PGP SIGNATURE-----

--w+viDopVefJHucnV--

--===============9137390085173728340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9137390085173728340==--
