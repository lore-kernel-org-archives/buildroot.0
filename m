Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C172C433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 13:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B703882656;
	Wed, 12 Oct 2022 13:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B703882656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MuxSMwKdqamy; Wed, 12 Oct 2022 13:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E63FA82486;
	Wed, 12 Oct 2022 13:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E63FA82486
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98E5C1BF421
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 13:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7352E82486
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 13:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7352E82486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRyhtOWtORci for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 13:06:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC8582423
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEC8582423
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 13:06:05 +0000 (UTC)
Received: from 91-153-34-50.elisa-laajakaista.fi ([91.153.34.50] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oibQv-000Dxc-DY; Wed, 12 Oct 2022 15:06:01 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 13f771d8;
 Wed, 12 Oct 2022 13:05:51 +0000 (UTC)
Date: Wed, 12 Oct 2022 16:05:46 +0300
Message-ID: <20221012160546.GC2476394@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20221010064610.388468291C@smtp1.osuosl.org>
References: <20221010064610.388468291C@smtp1.osuosl.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2r5Sl5Ao9qK0CpViWKvqOQsH5ffmXtA+hOScMmHwbY=; b=glv9MW41xkeix60oOoxgg1+NZa
 xCdSJC33hHCM4CgFedVX+3iXVtlBN7OZ6aJMC0NQHTZZ1fkUGaiiXGExPZsONOm/JhDSoXIo03bxe
 6qEO9TvcVm8er6jKO51j0c8PVFGzyZnPoyQZiWA1UgBv4bO/cJ3GTfNEgekvUvUdOzXEn24DMQVQo
 en1oRDPZdsItFt5kWISMg6Y5gZSv/ga//RBjYACl6SfGsKNtYyAxCus4etzme//OJavEaVABt5Kt/
 1YQvXN+WagPF6f15C9YfY4WAIs5ryoIjAuWHG8GJpYo+5yhh6kMJSrCLpO87qs0vF5EqpQ9K4K6uK
 A0zXfmMA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=glv9MW41
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-10-09
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
Content-Type: multipart/mixed; boundary="===============1898506911055313783=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1898506911055313783==
Content-Type: multipart/signed; boundary="GlJYXBA8NZbdU31W"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--GlJYXBA8NZbdU31W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBNb24sIDEwIE9jdCAyMDIyIDA2OjQ2OjAzICswMDAwIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgogCj4gQXV0
b2J1aWxkIHN0YXRpc3RpY3MgZm9yIDIwMjItMTAtMDkKPiA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQo+Cj4gWy4uLl0KPgo+ICAgICBhcmMgICAgICB8ICAgICAgICAgIGJyb3Rs
aS0xLjAuOSAgICAgICAgICB8IE5PSyB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzL2E3NzAwMDI1MjM0MTEzMjhjNjkzMzE1ODQ2MWEwMDdkMDczMDVjOWUgfCAgICAgCgpU
aGlzIGJ1aWxkIGZhaWx1cmUgaXMgZHVlIHRvIGFuIGludGVybmFsIGNvbXBpbGVyIGVycm9yIGlz
c3VlIHdoaWNoIEkgaGF2ZQpzZWVuIHJlcG9ydGVkIGVsc2V3aGVyZSBbMV0sIGFuZCB0aGUgZml4
IGhhcyBtYWRlIGl0IGludG8gdXBzdHJlYW0gR0NDOgoKICBodHRwczovL2djYy5nbnUub3JnL2dp
dC8/cD1nY2MuZ2l0O2E9Y29tbWl0O2g9OWJiMjAyOTliYTFkMWNjM2JiZDgzYTA3YTc3N2ZjYzVh
OTNjZmViMAoKR0NDIDEyIHNob3VsZCBiZSB1bmFmZmVjdGVkLiBXaGF0IGlzIHRoZSBiZXN0IHdh
eSB0byBmaXggdGhpcz8gU2hvdWxkIHdlCmRpc2FibGUgdGhlIGJyb3RsaSBwYWNrYWdlIHdoZW4g
R0NDIDExIGlzIGluIHVzZSwgaW1wb3J0IGEgYmFja3BvcnRlZCBmaXgKdG8gR0NDIDExLCBvci4u
Lj8KCkNoZWVycywK4oCUQWRyacOhbgoKLS0tClsxXSBodHRwczovL2dpdGh1Yi5jb20vZm9zcy1m
b3Itc3lub3BzeXMtZHdjLWFyYy1wcm9jZXNzb3JzL3Rvb2xjaGFpbi9pc3N1ZXMvMzk4Cg==

--GlJYXBA8NZbdU31W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCY0a7qgAKCRCRxVnb5MkS
O8AgAJ9JOJ4eyq/ln2L3jkzXGn4C+ODp1wCeNLudyNr7BLgc7anwo2Dee3mpFXY=
=qEzR
-----END PGP SIGNATURE-----

--GlJYXBA8NZbdU31W--

--===============1898506911055313783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1898506911055313783==--
