Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405C7ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ADBA40510;
	Wed, 21 Sep 2022 19:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ADBA40510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXDV-SyLfel0; Wed, 21 Sep 2022 19:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 578EB404B9;
	Wed, 21 Sep 2022 19:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 578EB404B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B30FD1BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D88A40492
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D88A40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8RLViLaVvDOl for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:08:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA08C403AC
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA08C403AC
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:08:19 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ob54z-0005Jh-PT; Wed, 21 Sep 2022 21:08:17 +0200
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 8edfd23a;
 Wed, 21 Sep 2022 19:08:06 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:08:02 +0300
Message-ID: <20220921220802.GB274304@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220921201854.5b4913b2@windsurf>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20220920230029.1680134-4-aperez@igalia.com>
 <20220921201854.5b4913b2@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e0lxCEiwnA8mw4Ez18HMNMHm9F5I52JMJ88VZgzrk7o=; b=WeRDawmSCUR73tdDkRo6oXgZ4O
 6wLaqx1P+BPy7a/5HmvhVtdPsWBOc8HUaT9QkOiKaTnia7GTJd7mC9YVtStUavCUdAj1a+As9jk8P
 z1SZSAi+n8h5xOdVgEepdmBatdaM5SLtmHeIdfrfhoSrHCZu2dNHwKy5sLcgbl3RQ4W2HjyqpcgEB
 SQ/SYolN8b3B+tDofB8SVzGG5lM3aR2Kt/JJ8jn+FpBpd1sceZ7fTcooj/o8zyxVSZkEwzUZtQzkq
 NEsH/sT2L0SEwzihVLNJ83u9oqKneDpnGs22vOTWGXewmM3UNFRDz+8XIZ3p1pPx4hIhThUEsYjKk
 zMqF7bfw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=WeRDawmS
Subject: Re: [Buildroot] [PATCH 3/3] package/wpewebkit: bump to version
 2.38.0
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7473981299101398160=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7473981299101398160==
Content-Type: multipart/signed; boundary="g5t6A5GKC3pD0IbR"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--g5t6A5GKC3pD0IbR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzLCBhbGwsCgpPbiBXZWQsIDIxIFNlcCAyMDIyIDIwOjE4OjU0ICswMjAwIFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+IEhl
bGxvIEFkcmlhbiwKPiAKPiBPbiBXZWQsIDIxIFNlcCAyMDIyIDAyOjAwOjI5ICswMzAwCj4gQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyb3RlOgo+IAo+ID4gVXBk
YXRlIHRvIGEgbmV3IG1ham9yIHJlbGVhc2Ugd2hpY2ggYnJpbmdzIGluIGltcHJvdmVtZW50cyBh
bmQgYSBmZXcKPiA+IG5ldyBmZWF0dXJlcy4gUmVsZWFzZSBub3RlczoKPiA+IAo+ID4gICBodHRw
czovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZS93cGV3ZWJraXQtMi4zOC4wLmh0bWwKPiA+IAo+ID4g
VGhpcyByZWxlYXNlIGFsc28gaW5jbHVkZXMgc2VjdXJpdHkgZml4ZXMgZm9yIENWRS0yMDIyLTMy
ODg2LAo+ID4gQ1ZFLTIwMjItMzI4OTEsIGFuZCBDVkUtMjAyMi0zMjkxMi4gQWNjb21wYW55aW5n
IHNlY3VyaXR5IGFkdmlzb3J5Ogo+ID4gCj4gPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9zZWN1
cml0eS9XU0EtMjAyMi0wMDA5Lmh0bWwKPiAKPiBBY2NvcmRpbmcgdG8gdGhpcyBwYWdlLCBDVkUt
MjAyMi0zMjg5MSBvbmx5IGFmZmVjdHMgdmVyc2lvbnMgdXAgMi4zNi41LAo+IGFuZCB3ZSdyZSB1
c2luZyAyLjM2LjcgaW4gQnVpbGRyb290Lgo+IAo+IEFsc28gYWNjb3JkaW5nIHRvIHRoaXMgcGFn
ZSwgdGhlIHR3byBvdGhlciBDVkVzIGhhdmUgYmVlbiBmaXhlZCBpbgo+IDIuMzYuOC4KPiAKPiBT
bywgY291bGQgeW91IHJld29yayB0aGlzIHBhdGNoIHNlcmllcyB0bzoKPiAKPiAgLSBIYXZlIGEg
Zmlyc3QgcGF0Y2ggInBhY2thZ2Uvd3Bld2Via2l0OiBzZWN1cml0eSBidW1wIHRvIHZlcnNpb24K
PiAgICAyLjM2LjgiLCB3aGljaCBkb2VzIGJ1bXAgdG8gMi4zNi44Cj4gCj4gIC0gSGFzIHRoZSBw
YXRjaGVzIHVwZGF0aW5nIGxpYndwZSwgd3BlYmFja2VuZC1mZG8uCj4gCj4gIC0gSGFzIHRoZSBw
YXRjaCB1cGRhdGluZyB3cGV3ZWJraXQgdG8gMi4zOC4wCgpPZiBjb3Vyc2UsIG5vIHByb2JsZW0u
IEknbGwgc2VuZCBhbiB1cGRhdGUgaW4gdGhlIG5leHQgZGF5cy4KCj4gSW5kZWVkLCB3ZSB3aWxs
IHdhbnQgdG8gYmFja3BvcnQgdGhlIDIuMzYuOCBidW1wIHRvIG91ciBzdGFibGUgYnJhbmNoLAo+
IGFzIGl0IGNvbnRhaW5zIHNlY3VyaXR5IGZpeGVzLgoKTWFrZXMgc2Vuc2UuIEFsbG93aW5nIExU
Uy9zdGFibGUgZGlzdHJvcyB0byBwaWNrIHRoZSB1cGRhdGUgbW9yZSBlYXNpbHkgaXMKb25lIG9m
IHRoZSByZWFzb25zIHdoeSBJIG1hZGUgb25lIG1vcmUgMi4zNi54IHdpdGggdGhlIGZpeGVzIDop
CgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--g5t6A5GKC3pD0IbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYythEgAKCRCRxVnb5MkS
O39jAJoCI1R/RjzdUqLXT9eLZT5WOTa86gCY1bVjxs/t546isp2JVw3vkmJNTw==
=vFL+
-----END PGP SIGNATURE-----

--g5t6A5GKC3pD0IbR--

--===============7473981299101398160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7473981299101398160==--
