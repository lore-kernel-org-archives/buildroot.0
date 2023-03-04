Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E309CC678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 22:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE3760F95;
	Sat,  4 Mar 2023 22:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE3760F95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cW7k5dpl7_pA; Sat,  4 Mar 2023 22:52:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C1660F7D;
	Sat,  4 Mar 2023 22:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C1660F7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8074C1BF591
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501A681D35
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 22:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501A681D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFz_pmrLByj0 for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 22:52:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA0F981D0B
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA0F981D0B
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 22:52:06 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pYajU-0054pT-0F; Sat, 04 Mar 2023 23:52:04 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id a98606f5;
 Sat, 4 Mar 2023 22:52:03 +0000 (UTC)
Date: Sun, 5 Mar 2023 00:51:58 +0200
Message-ID: <20230305005158.GC46585@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230304221145.3222530-1-aperez@igalia.com>
References: <20230304221145.3222530-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GtvQnnI25aSeW3XzRw/eCPkq/mevUhl1QZDf1pJ0dtw=; b=NrAWmVRWVYA3hoMxRHm+Hgpfpg
 Jt/woyw7xlXVRllTvFln2GG+u7NPrr7m+whXCsnZIjLfrTuS9Ipc/qFF0EW0LAhvz9KV9gFtxSla+
 qtBpjmfx1YkE6v11Cw/c3mebvQhQdqRzgRG/3NfDGpeXxY8hgDidCZMdxTG1lNBnofRJu6Qk1IjnH
 xYTkY6zWTB/RTkubymDXJ46YWkyyggtZSmZNE++6znXJij3k42RSilRuha/VZzqmDoMPvCIqX2Fil
 hUdbAMSoxYCIK3iHgjDauu5Zqa+H66mfWVktCfmKbz3FaHcFWbBJWyp7/VowRFHJqVRtxqRdSb8bp
 Uiec+OAQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=NrAWmVRW
Subject: Re: [Buildroot] [PATCH] package/wpebackend-fdo: bump to version
 1.14.1
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
Content-Type: multipart/mixed; boundary="===============2221834520973670110=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2221834520973670110==
Content-Type: multipart/signed; boundary="g27UKG6j9vSUfnzg"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--g27UKG6j9vSUfnzg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgooQWRkZWQgUGV0ZXIgaW4gQ0MuKQoKT24gU3VuLCAwNSBNYXIgMjAyMyAwMDoxMTo0NSAr
MDIwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cgo+
IFRoaXMgaXMgYSBidWdmaXggcmVsZWFzZSB3aGljaCBpbmNsdWRlcyBpbXBvcnRhbnQgZml4ZXMg
d2hpY2ggc29sdmUgYQo+IG1lbW9yeSBsZWFrIGFuZCBoaXR0aW5nIGEgc2l0dWF0aW9uIHdoZXJl
IHRoZSBvdXRwdXQgbm8gbG9uZ2VyIGdldHMKPiB1cGRhdGVkLiBSZWxlYXNlIG5vdGVzOgo+IAo+
ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3BlYmFja2VuZC1mZG8tMS4xNC4xLmh0
bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KPiAtLS0KPiAgcGFja2FnZS93cGViYWNrZW5kLWZkby93cGViYWNrZW5kLWZkby5o
YXNoIHwgOCArKysrLS0tLQo+ICBwYWNrYWdlL3dwZWJhY2tlbmQtZmRvL3dwZWJhY2tlbmQtZmRv
Lm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKSXQgd291bGQgYmUgKnZlcnkgZGVzaXJhYmxlKiB0byBoYXZlIHRoaXMgdXBkYXRl
IGluIHN0YWJsZSBicmFuY2hlcyBhcyB3ZWxsLApiZWNhdXNlIHRoaXMgY29udGFpbnMgYnVnIGZp
eGVzIHdoaWNoIG1ha2UgV2ViS2l0e0dUSyxXUEV9IGFjdHVhbGx5IHVzYWJsZQppbiBzb21lIGNh
c2VzIChlLmcuIGxvbmcgcnVubmluZyBpbnN0YW5jZXMpLgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--g27UKG6j9vSUfnzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZAPLjgAKCRCRxVnb5MkS
O0k0AJ4l77Egbu0KHjpiyH3Wfra6CJpHhQCcDn60BdAXeaTnP9D3zcxnGB73eRU=
=5fXp
-----END PGP SIGNATURE-----

--g27UKG6j9vSUfnzg--

--===============2221834520973670110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2221834520973670110==--
