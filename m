Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C40C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 23:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF694091D;
	Tue, 29 Mar 2022 23:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ltax1jXntzjg; Tue, 29 Mar 2022 23:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC644090C;
	Tue, 29 Mar 2022 23:11:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78E541BF954
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72F754090C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvvsfHoBdD7i for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 23:11:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E30240906
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 23:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aqnyaAeYMPGT39rzxhVKURSu6aJQ7m/wDa5RsSRwE7E=; b=aPu6NZf52wBcqpVpZNpQgl2kLQ
 QtFN8i3mCBD4chvho0Ldq2P7CiSwZYTxaYaFmpgjrdQFrIy7NSJBv/MOBpspLwxbgCmPawlcIrfXr
 4Jbn35iM2RxdbLd6IG7b3rlPqQXpAC4ZrRBuW5h29LqhrwFoMsrHSnfob+LtYo50xflsXeWCx+Zq2
 soJDkIgkfGzU71wRoHuDIugD2vvzBpUFmK744ymLPAOsOIhUcgqFPj+1H4ooLDtL1R3V93eWgizgz
 cFdODKUick54e5DxIMon5mkZVcxnST8R/3N9VLoZy2knq3LgbrhG3RE37gyJNOxZaB2LF51FRs7zm
 tluwtr4g==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nZL01-0005Js-DR; Wed, 30 Mar 2022 01:11:41 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 950fd6c0;
 Tue, 29 Mar 2022 23:11:25 +0000 (UTC)
Date: Wed, 30 Mar 2022 02:11:25 +0300
Message-ID: <20220330021125.GB1680234@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20220330013403.GB1671742@momiji>
References: <20220329164036.4045575-1-james.hilliard1@gmail.com>
 <20220330013403.GB1671742@momiji>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: fix software rendering
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
Content-Type: multipart/mixed; boundary="===============8159717074064134693=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8159717074064134693==
Content-Type: multipart/signed; boundary="ZIyBcAfIItCO/nHh"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--ZIyBcAfIItCO/nHh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAzMCBNYXIgMjAyMiAwMTozNDowMyArMDMwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6CiAKPiBPbiBUdWUsIDI5IE1hciAyMDIyIDEwOjQw
OjM2IC0wNjAwIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90
ZToKPiA+IFdlIG5lZWQgdG8gYmFja3BvcnQgYSBwYXRjaCB0byBmaXggc29mdHdhcmUgcmVuZGVy
aW5nIHdpdGggY29nLgo+IAo+IEkgaGF2ZSBjaGVycnktcGlja2VkIHRoaXMgZml4IChhbmQgb25l
IG1vcmUpIGluIHRoZSBjb2ctMC4xMiBicmFuY2gsIGFuZCBJIGFtCj4gcGxhbm5pbmcgdG8gcmVs
ZWFzZSB2ZXJzaW9uIDAuMTIuNCBpbiB0aGUgbmV4dCBob3Vycy4gV0RZVCBhYm91dCB3YWl0aW5n
Cj4gdW50aWwgd2UgaGF2ZSB0aGF0IGFuZCBza2lwIGFoZWFkIHRvIC40IC0tIHRoYXQgd2F5IGl0
IHdpbGwgbm90IGJlIG5lZWRlZCB0bwo+IGltcG9ydCB0aGlzIHBhdGNoIGluIEJ1aWxkcm9vdC4K
CkhlcmUgaXQgZ29lczogaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2UvY29nLTAuMTIuNC5o
dG1sCgpDaGVlcnMsCi1BZHJpYW4K

--ZIyBcAfIItCO/nHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYkOSHQAKCRCRxVnb5MkS
O38LAJ9f4rwmK8iRCQqQyZo0uIb3fk3togCfTtTE5VMGtuqq4O9J21pPHzvbw9c=
=FpPd
-----END PGP SIGNATURE-----

--ZIyBcAfIItCO/nHh--

--===============8159717074064134693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8159717074064134693==--
