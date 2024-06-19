Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71766C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 11:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2FE64064E;
	Wed, 19 Jun 2024 11:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f92NH-37jWTD; Wed, 19 Jun 2024 11:05:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9343840129
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9343840129;
	Wed, 19 Jun 2024 11:05:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D30F1BF277
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 11:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2967740129
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 11:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSM1lS9hfU86 for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 11:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF74940109
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF74940109
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF74940109
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 11:05:26 +0000 (UTC)
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sJt7y-0056qd-Ka; Wed, 19 Jun 2024 13:05:22 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 28bd3455;
 Wed, 19 Jun 2024 11:05:18 +0000 (UTC)
Date: Wed, 19 Jun 2024 14:05:13 +0300
Message-ID: <20240619140513.GB831334@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Michael Nosthoff <buildroot@heine.tech>
In-Reply-To: <1582f-6672b400-7-af99240@116839531>
References: <1582f-6672b400-7-af99240@116839531>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s77WttYBS5aSZRAYzr7if7zbRHEcf3J6/HibgmTm6qU=; b=f/9JIlquVVDps/9q6f3FWCvhih
 fz6uyFib+t9EF6tf0Bnf72YyYfDsoS+CckG2X7aW8rQ5gBZAwR+OTkW54L5laWlbViCiEKSp4SUwc
 ChD94mm+yon6p4W5NStYWfuvhmU2Go+8ixaW1tmJXKj6vWPags/atWLLzytKCT0Tn3sjfjTW+nR7a
 rtjR2OKDX4mhVIWgMVVFeoQEh1mW7oJPHE5GMkogKcWadvgISUqXHaiDqPKMzAxDjcWpmrSkTtb6i
 o4kr6gsTghmm7U4y+9X3Dsuu7VNwZBQAwqxWU4vx+rnn9blfyxbvablyVnrI1QqqbwBGPk5PDOM2i
 4Cl3qYRw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=f/9JIlqu
Subject: Re: [Buildroot] [PATCH 2/4] package/wpewebkit: security bump to
 version 2.44.2
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2265427034230360934=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2265427034230360934==
Content-Type: multipart/signed; boundary="H2P6MK0HGR+w4F9X"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--H2P6MK0HGR+w4F9X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBXZWQsIDE5IEp1biAyMDI0IDEyOjM0OjA5ICswMjAwIE1pY2hhZWwgTm9zdGhv
ZmYgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IEhpIGFs
bCwKPiAKPiBPbiBTYXR1cmRheSwgSnVuZSAwOCwgMjAyNCAxODo0NyBDRVNULCBQZXRlciBLb3Jz
Z2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdyb3RlOgo+IAo+ID4gPj4+Pj4gIkFkcmlhbiIg
PT0gQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyaXRlczoKPiA+
IAo+ID4gID4gVXBkYXRlIHRvIHRoZSBtb3N0IHJlY2VudCBzdGFibGUgcmVsZWFzZSBvZiBXUEUg
V2ViS2l0LiBBcyB0aGlzIGlzIGEKPiA+ICA+IGNoYW5nZSB0byBhIG5ld2VyIHJlbGVhc2Ugc2Vy
aWVzLCB0aGVyZSBhcmUgYSBmZXcgY2hhbmdlcyBpbiB0aGUgQ01ha2UKPiA+ICA+IGJ1aWxkIG9w
dGlvbnMuIERlcGVuZGVuY2llcyBtb3N0bHkgcmVtYWluIHRoZSBzYW1lLiBUaGUgbWFpbiBjaGFu
Z2VzCj4gPiAgPiBhcmU6Cj4gPiAKPiAuLi4KPiA+IAo+ID4gID4gU2lnbmVkLW9mZi1ieTogQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gPiAKPiA+IENvbW1pdHRl
ZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KPiAKPiB0aGlzIGJ1bXAgYnJva2UgdGhlIGJ1aWxkIG9u
IEFSTSBORU9OIChhZ2FpbikuIFNpbmNlIHRoZSBnaXRsYWIgaXNzdWUgdHJhY2tlciBkb2Vzbid0
IHNlZW0gdG8gbm90aWZ5IHRoZSBNTCAKPiBoZXJlIGlzIHRoZSBsaW5rOiBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9pc3N1ZXMvMyAKClRoZXJlIHdhcyBhIGZp
eCB0aGF0IGxhbmRlZCBpbiB0aGUgV2ViS2l0ICJtYWluIiBicmFuY2ggc29tZSBkYXlzCmFnbyBh
bmQgSSBkaWQgYSBiYWNrcG9ydCB0byB0aGUgMi40NCBicmFuY2g7IEkgaGF2ZSBhbHJlYWR5IHN0
YXJ0ZWQKcHJlcGFyaW5nIGEgcGF0Y2ggZm9yIEJ1aWxkcm9vdC4KIApDaGVlcnMsCuKAlEFkcmnD
oW4K

--H2P6MK0HGR+w4F9X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZnK7agAKCRCRxVnb5MkS
O6z6AJ4nYCv0XWTeOs6e7SbfmypYwWbHEACfXgS1+Jca3aMnb04h9lz75GTkLl0=
=+QPX
-----END PGP SIGNATURE-----

--H2P6MK0HGR+w4F9X--

--===============2265427034230360934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2265427034230360934==--
