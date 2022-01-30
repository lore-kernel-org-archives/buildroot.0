Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C7EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB60E40004;
	Sun, 30 Jan 2022 22:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I_5LQ0iJCXQ9; Sun, 30 Jan 2022 22:02:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C87E24019C;
	Sun, 30 Jan 2022 22:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61BF31BF3E3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B4CA40108
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcA_4IGYSZs7 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:02:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C18E040004
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ucRCA+48UE4Dl+qp/WmTzTdHbRUixELfpzgoME+M6D0=; b=sYm5AIhzkweCpCPG3SPXhDUJbY
 Z4Ch31azmKqVeeIMqkDq1tbCNinbBdgHmQkWV+1Ksqa4g7wb+4aVHN3lizmc+X7yERcG1vnyifJTm
 AGQZ5+a/u49YXhbtgJWEN/m1e25xvOGyxeRtPQJCi93MDH9eAczH7W816w2h/L9Hp2nXud4HYsYlv
 JOnT/eExMSC2pz4EI1OPx/Yi+CUJejPQAYjo2/8Y9ibYacEcvGa04+XualHHBpb1hqjBdsek9WxqZ
 k5C4TjU/kC39PqDbwal2m/wUWQZHqzSKx4DibKJqFrSGehoa6lSLBAAjRNTlnN33qWsXjudVlGIff
 L6fIxWvg==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nEIHQ-0007yy-37; Sun, 30 Jan 2022 23:02:40 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 41377bbc;
 Sun, 30 Jan 2022 22:02:26 +0000 (UTC)
Date: Mon, 31 Jan 2022 00:02:21 +0200
Message-ID: <20220131000221.GC987440@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220130154908.0ff0f0b6@windsurf>
References: <20220129214235.5133-1-thomas.devoogdt@gmail.com>
 <20220129214235.5133-2-thomas.devoogdt@gmail.com>
 <20220130154908.0ff0f0b6@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libsoup: add choice between
 libsoup2 and libsoup3
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0023432518213155897=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0023432518213155897==
Content-Type: multipart/signed; boundary="+yLDhtRYvIzdfpHO"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--+yLDhtRYvIzdfpHO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBUaG9tYXMsIGFuZCBhbGwsCgpPbiBTdW4sIDMwIEphbiAyMDIyIDE1OjQ5OjA4
ICswMTAwIFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9v
dC5vcmc+IHdyb3RlOgogCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+IAo+IE9uIFNhdCwgMjkg
SmFuIDIwMjIgMjI6NDI6MzUgKzAxMDAKPiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dk
dEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+ID4gTGlic291cDMgaGFzIGEgbmV3IEFQSSBbMV0sIHBh
Y2thZ2VzIHVzaW5nIGxpYnNvdXAyIG1heSBub3QKPiA+IGNvbXBpbGUgd2l0aCBsaWJzb3VwMyBv
ciBtYXkgY3Jhc2ggYXQgcnVudGltZSBpbiB1bmV4cGVjdGVkCj4gPiB3YXlzLiBTbyB0aGUgZGVm
YXVsdCB3aWxsIChmb3Igbm93KSBzdGF5IG9uIGxpYnNvdXAyLgo+ID4gQSB0cmFja2luZyB0YWJs
ZSBmb3IgdGhlIG1pZ3JhdGlvbiBjYW4gYmUgZm91bmQgaGVyZSBbMl0uCj4gCj4gQSAiY2hvaWNl
IiBpcyBub3QgZ29pbmcgdG8gd29yayB3ZWxsLCBhcyBpdCBtZWFucyB0aGF0IGluIGEgZ2l2ZW4K
PiBjb25maWd1cmF0aW9uIHdlIHdpbGwgb25seSBiZSBhYmxlIHRvIGluc3RhbGwgZWl0aGVyIHBh
Y2thZ2VzIHRoYXQgbmVlZAo+IGxpYnNvdXAyICpvciogcGFja2FnZXMgdGhhdCBsaWJzb3VwMywg
Yml0IG5vdCBhIG1peCBvZiBib3RoLgo+IAo+IElzIGl0IHBvc3NpYmxlIHRvIGluc3RhbGwgYm90
aCBsaWJzb3VwMiBhbmQgbGlic291cDMgc2lkZS1ieS1zaWRlIGluCj4gdGhlIHNhbWUgc3lzdGVt
PyBUaGlzIHJlcXVpcmVzIHRoZW0gaGF2aW5nIGEgZGlmZmVyZW50IGxpYnJhcnkgbmFtZSBhbmQK
PiBhIGRpZmZlcmVudCBsb2NhdGlvbiBmb3IgaGVhZGVyIGZpbGVzLgoKWWVzLCBsaWJzb3VwMiBh
bmQgbGlic291cDMgYXJlIHBhcmFsbGVsLWluc3RhbGxhYmxlLCBib3RoIGNhbiBjb2V4aXN0IGlu
CnRoZSBzYW1lIHN5c3RlbS4gVGhlIG9ubHkgY2F2ZWF0IGlzLCBhcyBJIG1lbnRpb25lZCBpbiBh
IHByZXZpb3VzIGVtYWlsLAp0aGF0IGhhdmluZyBib3RoIHZlcnNpb25zIGxvYWRlZCBpbiB0aGUg
c2FtZSBwcm9jZXNzIHdpbGwgcmVzdWx0IGluIG9kZApjcmFzaGVzIGFuZCBhc3NvcnRlZCBmYWls
dXJlcyBkdWUgdG8gc3ltYm9scyBjbGFzaGluZy4KCgo+IElmIHRoYXQncyB0aGUgY2FzZSwgd2Ug
d2lsbCBkZWZpbml0ZWx5IHdhbnQgdG8gaGF2ZSBhIHNlcGFyYXRlIGxpYnNvdXAzCj4gcGFja2Fn
ZSwgc28gdGhhdCB3ZSBjYW4gaW5zdGFsbCBsaWJzb3VwIGFuZCBsaWJzb3VwMyBzaWRlIGJ5IHNp
ZGUgaW4KPiB0aGUgc2FtZSBzeXN0ZW0uCgpZZXMsIEkgdGhpbmsgd2UgbWF5IG5lZWQgdG8gaGF2
ZSBhIHNlcGFyYXRlIGxpYnNvdXAyIHBhY2thZ2UuIFdoaWxlIG1vc3QK4oCcYmln4oCdIHBhY2th
Z2VzIGFyZSBhbHJlYWR5IHN1cHBvcnRpbmcgbGlic291cDMgKG9yIHdpbGwgc29vbiksIHByb2Jh
Ymx5Cm90aGVycyAobGlrZSBndXBucCkgbWF5IHRha2UgbG9uZ2VyIGFuZCBhbGxvd2luZyB0byBj
b250aW51ZSBidWlsZGluZyB0aGVtCndpdGggbGlic291cDIgd291bGQgYmUgYSBnb29kIGlkZS4K
CkNoZWVycywK4oCUQWRyacOhbgo=

--+yLDhtRYvIzdfpHO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYfcK7QAKCRCRxVnb5MkS
O5tsAJ4t+3PnZgufg2oZEDk6nCiJeqKqsgCePe6qHiiVQpPRWM5y7C20TRQpmvQ=
=Mda3
-----END PGP SIGNATURE-----

--+yLDhtRYvIzdfpHO--

--===============0023432518213155897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0023432518213155897==--
