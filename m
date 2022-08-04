Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3736AC00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 06:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7424C8148D;
	Thu,  4 Aug 2022 06:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7424C8148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQxDFVtJElGh; Thu,  4 Aug 2022 06:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8269881357;
	Thu,  4 Aug 2022 06:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8269881357
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49BA51C116E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 06:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30A6360C02
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 06:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A6360C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7SGbbkHAh-zE for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 06:46:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50B2F60BED
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B2F60BED
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 06:45:59 +0000 (UTC)
Received: from 91-153-34-64.elisa-laajakaista.fi ([91.153.34.64] helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1oJUcF-00G3SI-Iy; Thu, 04 Aug 2022 08:45:55 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id b9b2b4bb;
 Thu, 4 Aug 2022 06:45:42 +0000 (UTC)
Date: Thu, 4 Aug 2022 09:45:42 +0300
Message-ID: <20220804094542.GB45716@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87y1w5rr63.fsf@dell.be.48ers.dk>
References: <20220713132908.949744-1-aperez@igalia.com>
 <87y1w5rr63.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gzazCfBFAmxRtBs8TesMZf0ZxFOJ1whyHezpv4qPaoE=; b=Jrax2mEkXP5oUzgejUwI6wn/UH
 /qajgRv9JGdemxU5ANtHQFr8R24J5qqzk8EJ4NTECu0O9fgcd0mvjRPZ4fXezLyQ8qixUVNWbu1Ml
 pDit3a5Wu4djaulERkorm/TRJO2x6/mrKk12MZ1WI8kG7LWFYqmcmNqODQPxt1FMThUdZc/n56Xtb
 y3m6jW28Cb1jF5wWa8YLIdVDy4wb0N3fSJTcD8iId/lJ397LN/jnoRcsLJTdiFEnphCM5yPYNbpOu
 ghyJ33+rnSV9LsqFsXciBtlmKCBJdmNRdXxoOD3QgarFJ0AbVxf5vlMlG/hVoe1u/+qFgmQpQVLPv
 eYTRri1g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Jrax2mEk
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.36.4
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
Content-Type: multipart/mixed; boundary="===============2010313038629801422=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2010313038629801422==
Content-Type: multipart/signed; boundary="io1fSMFKS5AAM0Gt"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--io1fSMFKS5AAM0Gt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gUGV0ZXIsCgpPbiBXZWQsIDAzIEF1ZyAyMDIyIDIyOjQ2OjQ0ICswMjAwIFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gIkFkcmlhbiIgPT0g
QWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyaXRlczoKPiAKPiAg
PiBCdWdmaXggcmVsZWFzZSwgZml4ZXMgYSBXZWJLaXRXZWJQcm9jZXNzIGxlYWssIE1QUklTL01l
ZGlhU2Vzc2lvbgo+ICA+IHN1cHBvcnQsIGFkZHMgYSBtaXNzaW5nIEFUU1BJIGExMXkgaW50ZXJm
YWNlLCBhbmQgc2VjdXJpdHkgcGF0Y2hlcwo+ICA+IGZvciBDVkUtMjAyMi0yMjY3NyBhbmQgQ1ZF
LTIwMjItMjY3MTAuCj4gCj4gID4gUmVsZWFzZSBub3RlczoKPiAKPiAgPiAgIGh0dHBzOi8vd2Vi
a2l0Z3RrLm9yZy8yMDIyLzA3LzA1L3dlYmtpdGd0azIuMzYuNC1yZWxlYXNlZC5odG1sCj4gCj4g
ID4gQWNjb21wYW55aW5nIHNlY3VyaXR5IGFkdmlzb3J5Ogo+IAo+ICA+ICAgaHR0cHM6Ly93ZWJr
aXRndGsub3JnL3NlY3VyaXR5L1dTQS0yMDIyLTAwMDYuaHRtbAo+IAo+ICA+IE9uZSBwYXRjaCBp
cyBub3cgaW5jbHVkZWQgaW4gdGhlIHBhY2thZ2VkIHJlbGVhc2UsIGFuZCBhbm90aGVyIHdpdGgg
YQo+ICA+IGJ1aWxkIGZpeCBpbXBvcnRlZCwgd2hpY2ggaXMgYWN0dWFsbHkgYSByZXZlcnQgb2Yg
YSBwYXRjaCB0aGF0IG1hZGUgaXQKPiAgPiBpbnRvIHRoZSByZWxlYXNlIGJ1dCBjYW4gY2F1c2Ug
bGlua2luZyBpc3N1ZXMgd2hlbiB1c2luZyBMVE8uCj4gCj4gID4gU2lnbmVkLW9mZi1ieTogQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gCj4gQ29tbWl0dGVkIHRv
IDIwMjIuMDUueCBhbmQgMjAyMi4wMi54LCB0aGFua3MuCgpJIHN1cHBvc2UgeW91IG1heSBoYXZl
IHNlZW4gdGhlbSBhbHJlYWR5OiBJIGhhdmUgYWxzbyBzdWJtaXR0ZWQgdXBkYXRlcwpmb3Igd2Vi
a2l0Z3RrIGFuZCB3cGV3ZWJraXQgdG8gdXBkYXRlIHRoZW0gdG8gdmVyc2lvbiAyLjM2LjUsIHdo
aWNoIGFsc28KaGFzIHNlY3VyaXR5IGZpeGVzLiBUaGUgcGF0Y2hlcyBhcmUgdGhlc2U6CgogIGh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjA3
MjkwNTI4MDkuNzkzNTgxLTEtYXBlcmV6QGlnYWxpYS5jb20vCiAgaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDcyOTA1MjE0NS43OTIwMzct
MS1hcGVyZXpAaWdhbGlhLmNvbS8KClRoZXkgYXJlIGJvdGggYWxyZWFkeSBpbiAibWFzdGVyIiA6
LSkKCkNoZWVycywK4oCUQWRyacOhbgo=

--io1fSMFKS5AAM0Gt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYutrFgAKCRCRxVnb5MkS
OzD2AJ4p/Z0ugJnfbytRBUKSxeLe31Zq7wCfXcwbQ5152zEbTibuvm/fqz0XAHM=
=YE8A
-----END PGP SIGNATURE-----

--io1fSMFKS5AAM0Gt--

--===============2010313038629801422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2010313038629801422==--
