Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021FBC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 23:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F1EE40635;
	Sun, 11 Feb 2024 23:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3K7TwBXqxKj; Sun, 11 Feb 2024 23:32:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2CD40A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED2CD40A50;
	Sun, 11 Feb 2024 23:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D4531BF329
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 23:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32BE941928
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 23:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQDDxJOdxKN8 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 23:32:53 +0000 (UTC)
X-Greylist: delayed 2410 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 11 Feb 2024 23:32:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C027541927
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C027541927
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C027541927
 for <buildroot@uclibc.org>; Sun, 11 Feb 2024 23:32:49 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rZIgb-00GKsr-Gw; Sun, 11 Feb 2024 23:52:33 +0100
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 81f4518f;
 Sun, 11 Feb 2024 22:52:31 +0000 (UTC)
Date: Mon, 12 Feb 2024 00:52:26 +0200
Message-ID: <20240212005226.GB2106578@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <CADvTj4pgwRLcuj10aJ19e+OHiwRacPf2OY2cu=v48GrzuFRWDw@mail.gmail.com>
References: <20240206222231.8950D87481@busybox.osuosl.org>
 <CALAjcgVd0VGDZCRpH3cpeikpNH0ZZOkV9c667cH6GQhMa8qtTg__833.063844923743$1707444930$gmane$org@mail.gmail.com>
 <pan$a29b1$235b0aec$c06a1ff$d5539253@ID-313208.user.individual.net>
 <CADvTj4pgwRLcuj10aJ19e+OHiwRacPf2OY2cu=v48GrzuFRWDw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jognEIlWhcelILwMddK2BWq7IPKSYU+QoWpyabPmJd8=; b=RByOU6BkiauLtI7aBGdGRtOdBj
 TbJut1yx1puJtf2nZjaCaWVurdZ7vKq58A7B74svS8LGtfOrF3GL37LTwgXiJXpXTmCJ715KydOpA
 amGmluUk91b8vsh+R2h5FiueVzUbF8Dd9agXBNo4HDLsXNWytZcERR6tuSUi6K2rmQesJTzEeNtW9
 fg5hJ7lcYA2HXCAMVTo7P+jJwBCRREM7yNXCshtpSUrw3flMrshwk2FXAs1vDL4T2aNRbwNyI7kzR
 kj9Xxhzy46Yh8lNTAAHbs5RQ1P30UGABHYKA4eAd+NUpPnv3lOwBObUs8A0GI1J4VHs352M11/ykz
 1d+wQ4zA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=RByOU6Bk
Subject: Re: [Buildroot] [git commit] package/python3: bump version to 3.12.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
Content-Type: multipart/mixed; boundary="===============1412104414026470270=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1412104414026470270==
Content-Type: multipart/signed; boundary="XVfD/AiQnp7CwoOw"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--XVfD/AiQnp7CwoOw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBTdW4sIDExIEZlYiAyMDI0IDE0OjIwOjMxIC0wNzAwIEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiBPbiBGcmksIEZlYiA5LCAyMDI0IGF0
IDk6MTHigK9BTSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cm90ZToKPiA+Cj4gPiBB
bSBUaHUsIDggRmViIDIwMjQgMjE6MTQ6NTIgLTA1MDAgc2NocmllYiBKYW1lcyBLbmlnaHQ6Cj4g
Pgo+ID4gPiAgICAgICAgIGltcG9ydCBtYXRoCj4gPiA+ICAgICBJbXBvcnRFcnJvcjogL2xpYi94
ODZfNjQtbGludXgtZ251L2xpYm0uc28uNjogdmVyc2lvbiBgR0xJQkNfMi4zOCcKPiA+ID4gbm90
IGZvdW5kIChyZXF1aXJlZCBieQo+ID4gPiAvYnVpbGRzL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQv
cHl0aG9uMy0zLjEyLjEvYnVpbGQvbGliLmxpbnV4LQo+ID4geDg2XzY0LTMuMTIvbWF0aC5jcHl0
aG9uLTMxMi14ODZfNjQtbGludXgtZ251LnNvKQo+ID4KPiA+IEhpIEphbWVzLAo+ID4KPiA+IHNh
bWUgaGVyZSBvbiBEZWJpYW4gMTIuNC9ib29rd29ybSwgdHJ5IHRoaXMgcGF0Y2g6Cj4gPiBodHRw
czovL2dpdGh1Yi5jb20vYmt1aGxzL2J1aWxkcm9vdC9jb21taXQvCj4gPiBkY2E4YjViZWU3NzQy
ZmZlZGY4MWEwMjdhZmZhZGQ0YjdlMThmYzNmCj4gCj4gWWVhaCwgdGhpcyBmaXhlcyB0aGUgaXNz
dWUgZm9yIG1lIGFzIHdlbGwuCgpTYW1lIGhlcmUgb24gQXJjaCwgSSBuZWVkZWQgdG8gYXBwbHkg
dGhlIGNvbW1pdCB0byBnZXQgaG9zdC1weXRob24zIGJ1aWx0LgogCkNoZWVycywK4oCUQWRyacOh
bgo=

--XVfD/AiQnp7CwoOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZclPqgAKCRCRxVnb5MkS
O1IaAJ9x1StxNkkrTXxZ9qMRwGUaKt4tZgCfaZIdSWXrxjhMo3m5OIKrtBWWPrM=
=NRrB
-----END PGP SIGNATURE-----

--XVfD/AiQnp7CwoOw--

--===============1412104414026470270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1412104414026470270==--
