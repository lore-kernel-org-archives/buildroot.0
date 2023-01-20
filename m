Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96DEC05027
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 10:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C0E38274F;
	Fri, 20 Jan 2023 10:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C0E38274F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Em8X30_jOGW; Fri, 20 Jan 2023 10:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A0782702;
	Fri, 20 Jan 2023 10:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A0782702
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BAEB1BF3E0
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 10:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8385403C7
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 10:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8385403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7hKX6EUZzIR for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 10:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E57F4012F
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E57F4012F
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 10:02:57 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pIoEX-00DIVe-IY; Fri, 20 Jan 2023 11:02:53 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 44f434a1;
 Fri, 20 Jan 2023 10:02:51 +0000 (UTC)
Date: Fri, 20 Jan 2023 12:02:47 +0200
Message-ID: <20230120120247.GB608428@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <874jslbrhw.fsf@dell.be.48ers.dk>
References: <20230117135943.2893779-1-aperez@igalia.com>
 <874jslbrhw.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tCEhRbyXxcGyf9nd9p2681oo3tWU/HO1s7XBqzjMRcc=; b=kcVWw9dsSsuNe4R11khfRBa7mI
 yimxVKFIoM7etL5BL8j35MHane9BI5hyjjVM2voWPr6xgm8bvEiMKKl/oX80CsvP5UQHvl31AJ8fK
 IcqHR9vmFvuBY/L8cO7387/w5RtKIJvef/+uVAedP88hxhQh3PfR+36xWdJ5LbLatWW5RfawhGKEc
 I+pi8m/H62ug0ZJFw4Ly7Fl1AU4tVq1dHmFjbyFbigFwT1ckTjDknHRy7Mb3bicu3Saw7V3Cbplxb
 x5eM7607T7KFyTus6enBNmAxdJJm2/4nIDd+Troo3/xDgH5392HfzQxgRt59fu17nW3sgYVFC5CTA
 LrGDajTw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=kcVWw9ds
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.38.3
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
Content-Type: multipart/mixed; boundary="===============4575907889814191724=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4575907889814191724==
Content-Type: multipart/signed; boundary="pusPwFcGFoancmak"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--pusPwFcGFoancmak
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsCgpPbiBGcmksIDIwIEphbiAyMDIzIDA4OjIxOjQ3ICswMTAwIFBldGVyIEtvcnNn
YWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gIkFkcmlhbiIgPT0gQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyaXRlczoKPiAKPiAgPiBC
dWdmaXggcmVsZWFzZSwgd2l0aCBzZWN1cml0eSBmaXhlcyBmb3IgQ1ZFLTIwMjItNDI4NTIsIENW
RS0yMDIyLTQyODU2LAo+ICA+IENWRS0yMDIyLTQyODY3LCBDVkUtMjAyMi00NjY5MSwgQ1ZFLTIw
MjItNDY2OTIsIENWRS0yMDIyLTQ2Njk4LAo+ICA+IENWRS0yMDIyLTQ2Njk5LCBDVkUtMjAyMi00
NjcwMCwgQ1ZFLTIwMjItNDI4MjMsIGFuZCBDVkUtMjAyMi00Mjc5OS4KPiAKPiAgPiBSZWxlYXNl
IG5vdGVzOgo+IAo+ICA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3JlbGVhc2Uvd3Bld2Via2l0
LTIuMzguMy5odG1sCj4gID4gICBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZS93cGV3ZWJr
aXQtMi4zOC4yLmh0bWwKPiAgPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdl
YmtpdC0yLjM4LjEuaHRtbAo+IAo+ICA+IEFjY29tcGFueWluZyBzZWN1cml0eSBhZHZpc29yaWVz
Ogo+IAo+ICA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3NlY3VyaXR5L1dTQS0yMDIyLTAwMTEu
aHRtbAo+ICA+ICAgaHR0cHM6Ly93cGV3ZWJraXQub3JnL3NlY3VyaXR5L1dTQS0yMDIyLTAwMTAu
aHRtbAo+IAo+ICA+IEFkZGl0aW9uYWxseSwgdGhlIHVwZGF0ZSBicmluZ3MgaW4gaW1wb3J0YW50
IGJ1ZyBmaXhlcyBmb3IgdGhlCj4gID4gQnViYmxld3JhcCBzYW5kYm94IHN1cHBvcnQsIHNjcm9s
bGluZyBpbiBjZXJ0YWluIHdlYiBzaXRlcywgbXVsdGltZWRpYQo+ICA+IHBsYXliYWNrLCBhbmQg
YnVpbGQgZml4ZXMuCj4gCj4gID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3Ry
byA8YXBlcmV6QGlnYWxpYS5jb20+Cj4gCj4gSGVoLCBJIG1pc3NlZCB0aGF0IHlvdSBoYWQgYWxy
ZWFkeSBzZW50IHRoaXMgLSBDb21taXR0ZWQsIHRoYW5rcyEKCk5vIHByb2JsZW0gYXQgYWxsISBU
aGFua3MgZm9yIGFsbCB0aGUgbWVyZ2VzIDopCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--pusPwFcGFoancmak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCY8pmxwAKCRCRxVnb5MkS
O6VMAJwIIuya7GBjaG1/ax93k7upg21UYQCbBGe62XqW0EK6vjnOgF4RF0Sf8dw=
=wb1G
-----END PGP SIGNATURE-----

--pusPwFcGFoancmak--

--===============4575907889814191724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4575907889814191724==--
