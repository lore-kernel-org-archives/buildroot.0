Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8EFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5BC283366;
	Tue,  1 Feb 2022 22:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhSHKfBUON-B; Tue,  1 Feb 2022 22:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E988E83336;
	Tue,  1 Feb 2022 22:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57E521BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F0C0400CE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbrTaJyn5v1k for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:28:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9D65400CC
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c5Rl9G2sgE2yGP6RzfUjGMYu4YqJatXX+oZ446de9sc=; b=dC96GGJUDrrt0RA985R+2SgNc5
 dagjGMzchbNFUcwjt23t/YtceKVWybrt+TFGWqErIqH4/X1LYZC4nqvBO9AkIVuR6aUrbrvtz7HKJ
 OaGNw73bcIeN9Rd7nkK9SzE6CIjdXVDV/W5mBv2SHPXDQgXIqjzOW3DtK0cHD8QfIME7/qTOMr6vr
 wNccyfe3NTVTzSceUeJERxJWivdfAl1YJbPZeLmD17KWtoP+0lyxq9OH6Uo77FvBUKIOgu7c1t+9e
 ZrxLsIRwKEDnYSMZcT7U0kD+RpaFZm1TO3cdrP4R5vPbnNvm3cPYnfdnuGAqCeHFxfzmxMxTHjK9D
 28z0a9XQ==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nF1d0-00064F-1w; Tue, 01 Feb 2022 23:27:58 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id a432736d;
 Tue, 1 Feb 2022 22:27:46 +0000 (UTC)
Date: Wed, 2 Feb 2022 00:27:42 +0200
Message-ID: <20220202002742.GB1241348@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Seiderer <ps.report@gmx.net>
In-Reply-To: <20220126193431.17777-1-ps.report@gmx.net>
References: <20220126193431.17777-1-ps.report@gmx.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/binutils: add upstream patch for
 v2.37 fixing linking of thin archives
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7095391334089003044=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7095391334089003044==
Content-Type: multipart/signed; boundary="0JNM1GNPsQpMx0i/"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--0JNM1GNPsQpMx0i/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBXZWQsIDI2IEphbiAyMDIyIDIwOjM0OjMxICswMTAwIFBldGVyIFNlaWRlcmVyIDxw
cy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6Cj4gQWRkIHVwc3RyZWFtIHBhdGNoIChbMV0pIGZvciB2
Mi4zNyBmaXhpbmcgbGlua2lnIG9mIHRoaW4gYXJjaGl2ZXMgKHNlZSBbMl0gZm9yCj4gZGV0YWls
cykuCj4gCj4gRml4ZXM6Cj4gCj4gICAuLi4vaG9zdC9iaW4vYXJtLWJ1aWxkcm9vdC1saW51eC1n
bnVlYWJpaGYtZysrIFsuLi5dIC1vIGxpYlF0NVdlYkVuZ2luZUNvcmUuc28uNS4xNS4yIFsuLi5d
Cj4gICAuLi4vYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvYmluL2xkOiAuLi4vYnVpbGQv
cXQ1d2ViZW5naW5lLTUuMTUuMi9zcmMvY29yZS9yZWxlYXNlL29iai90aGlyZF9wYXJ0eS9ib3Jp
bmdzc2wvbGliYm9yaW5nc3NsLmE6IGVycm9yIGFkZGluZyBzeW1ib2xzOiBtYWxmb3JtZWQgYXJj
aGl2ZQo+ICAgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4gICBt
YWtlWzVdOiAqKiogW01ha2VmaWxlLmNvcmVfbW9kdWxlOjkwOiAuLi8uLi9saWIvbGliUXQ1V2Vi
RW5naW5lQ29yZS5zby41LjE1LjJdIEVycm9yIDEKPiAgIG1ha2VbNF06ICoqKiBbTWFrZWZpbGU6
MTI0OiBzdWItY29yZV9tb2R1bGUtcHJvLW1ha2VfZmlyc3RdIEVycm9yIDIKPiAgIG1ha2VbM106
ICoqKiBbTWFrZWZpbGU6Nzk6IHN1Yi1jb3JlLW1ha2VfZmlyc3RdIEVycm9yIDIKPiAgIG1ha2Vb
Ml06ICoqKiBbTWFrZWZpbGU6NDk6IHN1Yi1zcmMtbWFrZV9maXJzdF0gRXJyb3IgMgo+ICAgbWFr
ZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI5NTogLi4uL2J1aWxkL3F0NXdlYmVu
Z2luZS01LjE1LjIvLnN0YW1wX2J1aWx0XSBFcnJvciAyCj4gICBtYWtlOiAqKiogW01ha2VmaWxl
OjIzOiBfYWxsXSBFcnJvciAyCj4gCj4gWzFdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0L2dp
dHdlYi5jZ2k/cD1iaW51dGlscy1nZGIuZ2l0O2g9MWM2MTFiNDBlNmJmYzgwMjliZmY3Njk2ODE0
MzMwYjViYzBlZTVjMAo+IFsyXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3df
YnVnLmNnaT9pZD0yODEzOAoKQW11c2luZ2x5IEkgcmFuIGludG8gdGhpcyBhIGNvdXBsZSBvZiBk
YXlzIGFnbyBhbmQgYWxtb3N0IHNpbXVsdGFuZW91c2x5IHNlbnQKYSBwYXRjaCB0byBpbmNsdWRl
IHRoZSBmaXhlcyBpbiB0aGUgV2ViS2l0IFNESyB3ZSB1c2UgZm9yIGRldmVsb3BtZW50IFsxXSA9
KQoKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CgpS
ZXZpZXdlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+CgoK
Q2hlZXJzLArigJRBZHJpw6FuCgotLS0KWzFdIGh0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3df
YnVnLmNnaT9pZD0yMzU5NzUK

--0JNM1GNPsQpMx0i/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYfmz3gAKCRCRxVnb5MkS
O0VUAJwNaEi2monpVkAvZsPNJpSlAnW+wQCeJbYC6dumkMlqmUTNJvSx11O6dfU=
=+NFW
-----END PGP SIGNATURE-----

--0JNM1GNPsQpMx0i/--

--===============7095391334089003044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7095391334089003044==--
