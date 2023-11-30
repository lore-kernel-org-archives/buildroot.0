Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D0EC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB9A5400CF;
	Thu, 30 Nov 2023 22:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB9A5400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TET4UVBbz5fA; Thu, 30 Nov 2023 22:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E607C4045C;
	Thu, 30 Nov 2023 22:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E607C4045C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 768F91BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DEC44045C
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DEC44045C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98g88-FMUQcU for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:44:24 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54AA3400CF
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AA3400CF
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8plX-008zGF-Hq; Thu, 30 Nov 2023 23:44:15 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 711dd6ab;
 Thu, 30 Nov 2023 22:44:14 +0000 (UTC)
Date: Fri, 1 Dec 2023 00:44:14 +0200
Message-ID: <20231201004414.GB232434@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <CACXRmJjSErFeRc2TwopyzemtPk9t3TXS3L1cM=gOgqoR91erog@mail.gmail.com>
References: <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-3-thomas@devoogdt.com>
 <20231114151118.GF1974649@igalia.com>
 <CACXRmJjSErFeRc2TwopyzemtPk9t3TXS3L1cM=gOgqoR91erog@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z2M+C1lETrATFKuOstTkfgzhZx20b/NvP22DLycX6pc=; b=KO8vgW0H4sd1479ExmysnFVGS+
 JOLZXr18rL8PZZEBS0HPyM7PFcmHf1RIERJOUhDJHYEGnPrfJtPE33/I/GGSHRqs4gCpqf1U+b84N
 bmeCkbRn7Ctiin+T4zEmQFPx9E/DQZNfTj29gIydeSp2FiNvbNharjL+loPbuU4xa6jp2b2jp8IsS
 aCkEEPGOY2YlzcvU+wGUh9lC4EdODzOv9BA+UFiv2QGaTyL2u/bYfDPYxkaGqrQoUGjd0no1Y8IV+
 TNoopgomcEov4prcPdAMRgYnoqZN/NQMfF5ipegBK8r3qkkS/nmjCjcbU1okaq4R9OamBqF2kwZs2
 zHtBBrPw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=KO8vgW0H
Subject: Re: [Buildroot] [PATCH v5 3/3] package/webkitgtk: bump to version
 2.42.2
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2569921989495486580=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2569921989495486580==
Content-Type: multipart/signed; boundary="wkBWnVW8eIP5Pc91"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--wkBWnVW8eIP5Pc91
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAxNCBOb3YgMjAyMyAyMTowNjo1MyArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IEhpIEFkcmlhbiwKPiAKPiBUaHggZm9yIHRoZSByZXZp
ZXchCj4gQXJlIHlvdSBzdXJlIHRoYXQgdGhpcyBwYXRjaCBpcyBzdGlsbCBwcmVzZW50LCBhbmQg
bm90IGp1c3QgYSBsZWZ0b3Zlcgo+IG9uIHlvdXIgc3Rhc2g/IEknbSB0cnlpbmcgdG8gZmluZCBv
dXQgd2hpY2ggcGF0Y2ggdGhpcyBpcyBhYm91dCwgYnV0IEkKPiBkb24ndCBzZWUgaXQuCj4gCj4g
Q2hlY2tlZCBieSBkb2luZzoKPiAgMTE3MyAgZ2l0IGNsZWFuIC1mZHgKPiAgMTE3NCAgZ2l0IGZl
dGNoCj4gIDExNzUgIGdpdCBjaGVja291dCBvcmlnaW4vbWFzdGVyCj4gIDExNzYgIGN1cmwgaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9zZXJpZXMvMzgxNjU2L21ib3gvIHwgZ2l0IGFtCj4g
IDExNzcgIGxzIHBhY2thZ2Uvd2Via2l0Z3RrLwogCkQnb2ghIFlvdSB3ZXJlIHJpZ2h0LCB0aGF0
IHdhcyBhIHN0cmF5IHBhdGNoIEkgaGFkIGxvY2FsbHkuIFJlLXRlc3RlZCB0aGUKcGF0Y2ggc2V0
IGFuZCBpdCBpcyB3b3JraW5nIGZpbmUgPSkKClNvcnJ5IGFib3V0IHRoZSBtaXh1cC4KIAoKQ2hl
ZXJzLArigJRBZHJpw6FuCg==

--wkBWnVW8eIP5Pc91
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZWkQPgAKCRCRxVnb5MkS
O2RWAJ95u5WPT9GhiyqrfgECJFHAAbvvlACfeGrabZFa7F+eQqnTC647IiZTL/w=
=tdTt
-----END PGP SIGNATURE-----

--wkBWnVW8eIP5Pc91--

--===============2569921989495486580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2569921989495486580==--
