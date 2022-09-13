Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4156EECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 18:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6EC5606BF;
	Tue, 13 Sep 2022 18:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6EC5606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQh9xb0TQ_vf; Tue, 13 Sep 2022 18:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F115260675;
	Tue, 13 Sep 2022 18:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F115260675
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA26C1BF853
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 955D9812D4
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 955D9812D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pESSCIRUGAAd for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 18:03:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431F0812B8
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 431F0812B8
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 18:03:40 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oYAFx-001bGH-FT; Tue, 13 Sep 2022 20:03:33 +0200
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 595297de;
 Tue, 13 Sep 2022 18:03:22 +0000 (UTC)
Date: Tue, 13 Sep 2022 21:03:18 +0300
Message-ID: <20220913210318.GB297238@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220909050800.3520691-1-james.hilliard1@gmail.com>
References: <20220909050800.3520691-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+cypfnzrGWggRZR9thka6UQnO7OoSJfEm5MQDBUZcdQ=; b=opJWg4abapUbsKXvv7U1jp5snV
 DvNPBl9iPxqwsGJuUcFasVUqklbYvPvELkmZvMGzuRzGVQbKovSWero5iBx2xJWFy5twjvYxgP0Lq
 7NDvLqLTuP0QmTYRmwVRVGyoNhP9UY+GMtVJObcjl+rCUjf+mKIOf8kOCMVgn9XdnDiVd2pKrPN9h
 DrEEjKBPYqAUrvmfnpztwWCVgfPErbWTg8vdVpzx9FmLXTjEAoSZFkdCJkndkRQ9Q8KFAABBuHvUM
 Xl8m4U3ah8vpAfj2Hw+N6+T0ZK+XHFUoEKigzzIZqQiCclpvfNbk4vEehBKQr6kyfsQ1rifHKMRx3
 3QNz1VZw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=opJWg4ab
Subject: Re: [Buildroot] [PATCH 1/2] package/weston: install to staging
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5494081101186655292=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5494081101186655292==
Content-Type: multipart/signed; boundary="ZSw0qiOnJaD4GrUP"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--ZSw0qiOnJaD4GrUP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpQYXRjaCBzZXQgTEdUTS4KCk9uIFRodSwgMDggU2VwIDIwMjIgMjM6MDc6NTkgLTA2MDAg
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+IFdlIG5l
ZWQgdG8gaW5zdGFsbCB3ZXN0b24gdG8gc3RhZ2luZyBzbyB0aGF0IGFwcGxpY2F0aW9ucyBsaWtl
IGNvZwo+IGNhbiB1c2Ugd2VzdG9uLWRpcmVjdC1kaXNwbGF5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6
IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgcGFj
a2FnZS93ZXN0b24vd2VzdG9uLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlc3Rvbi93ZXN0b24ubWsgYi9wYWNrYWdl
L3dlc3Rvbi93ZXN0b24ubWsKPiBpbmRleCBlNmM1NGVlN2FhLi41ZTcxNDczNjQwIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2Uvd2VzdG9uL3dlc3Rvbi5tawo+ICsrKyBiL3BhY2thZ2Uvd2VzdG9uL3dl
c3Rvbi5tawo+IEBAIC0xMCw2ICsxMCw3IEBAIFdFU1RPTl9TT1VSQ0UgPSB3ZXN0b24tJChXRVNU
T05fVkVSU0lPTikudGFyLnh6Cj4gIFdFU1RPTl9MSUNFTlNFID0gTUlUCj4gIFdFU1RPTl9MSUNF
TlNFX0ZJTEVTID0gQ09QWUlORwo+ICBXRVNUT05fQ1BFX0lEX1ZFTkRPUiA9IHdheWxhbmQKPiAr
V0VTVE9OX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICAKPiAgV0VTVE9OX0RFUEVOREVOQ0lFUyA9
IGhvc3QtcGtnY29uZiB3YXlsYW5kIHdheWxhbmQtcHJvdG9jb2xzIFwKPiAgCWxpYnhrYmNvbW1v
biBwaXhtYW4gbGlicG5nIHVkZXYgY2Fpcm8gbGliaW5wdXQgbGliZHJtCj4gLS0gCj4gMi4zNC4x
Cj4gCj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--ZSw0qiOnJaD4GrUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYyDF5gAKCRCRxVnb5MkS
O5mBAJ0YS26EN3Z1V7S8fQfsU8HwgVi9jQCfUBhtNSG+SqZFMQs6Ma/+RJFbKDw=
=1Ix/
-----END PGP SIGNATURE-----

--ZSw0qiOnJaD4GrUP--

--===============5494081101186655292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5494081101186655292==--
