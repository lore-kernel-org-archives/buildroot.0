Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2E6C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 18:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84FD440162;
	Tue, 13 Sep 2022 18:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84FD440162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2N2i5DRQaOtw; Tue, 13 Sep 2022 18:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D9CB40122;
	Tue, 13 Sep 2022 18:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D9CB40122
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3F31BF853
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0B36068A
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 18:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A0B36068A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygfUWELv6vhm for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 18:03:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DD796003C
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DD796003C
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 18:03:46 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oYAG7-001bGH-4O; Tue, 13 Sep 2022 20:03:43 +0200
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id c77a9733;
 Tue, 13 Sep 2022 18:03:39 +0000 (UTC)
Date: Tue, 13 Sep 2022 21:03:39 +0300
Message-ID: <20220913210339.GD297238@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220909050800.3520691-2-james.hilliard1@gmail.com>
References: <20220909050800.3520691-1-james.hilliard1@gmail.com>
 <20220909050800.3520691-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GihK1X+TxfIlnLYrBOWa5D3w3bXrv2LhdRCORvB8heI=; b=ao0Idpi1fAqLAYOrERka+Oae+x
 zocr18ie/kVZiAV1BvavhCK7YDEcHdsQMkB6lVcJtk0cai1JnsxWHIjRdtPd+FdgiSdpbyVskj4RP
 TdxiQgkiS/e4MogCUQuTycZ8otXVnI6/nRV8tifeHV/sUf+tbtDwxkUxG2BTvvqAiayqF1OGzFvPE
 3K1bLOHFVV15KCmdAz+EBkHBEbBN4DPq171l5JyNtj58GSVV18KFogW66g1YAL4s7zO7LUOMEH4ye
 yiSeNph7h1TGeqqFqbKL5dxSIedAsHWHrTpVWT8VFZ6l6BMeipop89489/FKyDDpXyMf9J5A0TpHL
 1ok4YBxw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=ao0Idpi1
Subject: Re: [Buildroot] [PATCH 2/2] package/cog: add weston direct display
 support
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
Content-Type: multipart/mixed; boundary="===============6865947074484062827=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6865947074484062827==
Content-Type: multipart/signed; boundary="g/DENFM70o8zqLYe"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--g/DENFM70o8zqLYe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpQYXRjaCBzZXQgTEdUTS4KCk9uIFRodSwgMDggU2VwIDIwMjIgMjM6MDg6MDAgLTA2MDAg
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+IEVuYWJs
ZSBvcHRpb25hbCB3ZXN0b24gZGlyZWN0IGRpc3BsYXkgc3VwcG9ydCB3aGVuIHdlc3RvbiBpcwo+
IGF2YWlsYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxh
cGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gIHBhY2thZ2UvY29nL2NvZy5tayB8IDggKysrKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NvZy9jb2cubWsgYi9wYWNrYWdlL2NvZy9jb2cubWsKPiBp
bmRleCA1ZjdhYmNhYjFmLi4xZjI0YmViZWU0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvY29nL2Nv
Zy5tawo+ICsrKyBiL3BhY2thZ2UvY29nL2NvZy5tawo+IEBAIC0xNCwxMSArMTQsMTcgQEAgQ09H
X0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gIENPR19DT05GX09QVFMgPSBcCj4gIAktRENPR19C
VUlMRF9QUk9HUkFNUz1PTiBcCj4gIAktRENPR19QTEFURk9STV9IRUFETEVTUz1PTiBcCj4gLQkt
RENPR19XRVNUT05fRElSRUNUX0RJU1BMQVk9T0ZGIFwKPiAgCS1ESU5TVEFMTF9NQU5fUEFHRVM9
T0ZGIFwKPiAgCS1EQ09HX0hPTUVfVVJJPSckKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfQ09H
X1BST0dSQU1TX0hPTUVfVVJJKSknIFwKPiAgCS1EVVNFX1NPVVAyPU9OCj4gIAo+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX1dFU1RPTikseSkKPiArQ09HX0NPTkZfT1BUUyArPSAtRENPR19XRVNUT05f
RElSRUNUX0RJU1BMQVk9T04KPiArQ09HX0RFUEVOREVOQ0lFUyArPSB3ZXN0b24KPiArZWxzZQo+
ICtDT0dfQ09ORl9PUFRTICs9IC1EQ09HX1dFU1RPTl9ESVJFQ1RfRElTUExBWT1PRkYKPiArZW5k
aWYKPiArCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfQ09HX1BMQVRGT1JNX0ZETykseSkKPiAgQ09H
X0NPTkZfT1BUUyArPSAtRENPR19QTEFURk9STV9XTD1PTgo+ICBDT0dfREVQRU5ERU5DSUVTICs9
IGxpYnhrYmNvbW1vbiB3YXlsYW5kLXByb3RvY29scwo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpDaGVlcnMsCuKAlEFkcmnD
oW4K

--g/DENFM70o8zqLYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYyDF+wAKCRCRxVnb5MkS
OzftAJ9jkpL0sZdAmgyMT51mW2V3SHD93wCdGf0li8m7we8Okel2wPuiqrUArZ8=
=Tj9Y
-----END PGP SIGNATURE-----

--g/DENFM70o8zqLYe--

--===============6865947074484062827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6865947074484062827==--
