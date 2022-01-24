Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46B5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 14:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E6060E78;
	Mon, 24 Jan 2022 14:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUdMxRU-tD1o; Mon, 24 Jan 2022 14:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CDB860E67;
	Mon, 24 Jan 2022 14:16:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 610891BF398
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 14:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D73383E59
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 14:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03IJrcfT13-j for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 14:16:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E17A82A53
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NYdF5o0jtELDfzb4OLzkbkO4NRh88Rb00mNu4zIXKGI=; b=Ql3WaP93M2EAbYAOobxjXGxK9y
 KqyqALXLa9bp+k/Ai0UFEi8AYJbtSflkalGukeBrSqgofrCLRmVhijKMYb15PNKCRNZ5M16MvQ6ga
 rPquu+6mNOP3KWCIHYubNsYvGYJ0KmHzhHfZrgcnA+c5Eh0V19PBRhlllsNJkawycYfj5GosrY3Ss
 DkUGwYHq670PORS95aRWFZSoRyPoi2XSSmODK6UDFlVmwEbk5L5uW0MfrYbW9XC+pjer/KeP12rXf
 hkohC0sTupcscikrZgJPyAaC/jMjQgfm3qjg4EdBv0i98XniOitSgeHsrS931gCyGf0zUXATnOT7n
 DJzc7AWg==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nC090-0001U2-J2; Mon, 24 Jan 2022 15:16:30 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 87680ebb;
 Mon, 24 Jan 2022 14:16:15 +0000 (UTC)
Date: Mon, 24 Jan 2022 16:16:11 +0200
Message-ID: <20220124161611.GB162969@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87mtjlwlvo.fsf@dell.be.48ers.dk>
References: <20211124205607.3021277-1-aperez@igalia.com>
 <87mtjlwlvo.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump version to
 2.34.2
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
Content-Type: multipart/mixed; boundary="===============5968994373560939831=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5968994373560939831==
Content-Type: multipart/signed; boundary="3ALwnFYuQ3BBeo9u"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--3ALwnFYuQ3BBeo9u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gUGV0ZXIsIGFsbCwKCk9uIE1vbiwgMjQgSmFuIDIwMjIgMDk6NTg6MzUgKzAxMDAgUGV0
ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiA+Pj4+PiAiQWRyaWFu
IiA9PSBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JpdGVzOgo+
IAo+ICA+IFVwZGF0ZSB0byB0aGUgdGhlIG5leHQgbWlub3IgcmVsZWFzZSwgd2hpY2ggZml4ZXMg
YW4gc2Nyb2xsaW5nIGlzc3VlIGFuZAo+ICA+IGluY29ycG9yYXRlZCBhIHBhdGNoIHRoYXQgY2Fu
IG5vdyBiZSByZW1vdmVkIGZyb20gQnVpbGRyb290LiBSZWxlYXNlCj4gID4gbm90ZXM6Cj4gCj4g
ID4gICBodHRwczovL3dwZXdlYmtpdC5vcmcvcmVsZWFzZS93cGV3ZWJraXQtMi4zNC4yLmh0bWwK
PiAKPiAgPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdh
bGlhLmNvbT4KPiAKPiBXaGF0IGFib3V0IHdlYmtpdGd0az8gSXQgd291bGQgYWxzbyBiZSBnb29k
IHRvIG1vdmUgdGhhdCB0byB0aGUgMi4zNC54Cj4gc2VyaWVzIGJlZm9yZSB3ZSByZWxlYXNlIDIw
MjIuMDIuCgpJIGhhdmUgYWxsIHRoZSBpbnRlbnRpb24gdG8gdXBkYXRlIFdlYktpdEdUSyBhcyBz
b29uIGFzIEkgaGF2ZSBzb21lIHNwYXJlCmN5Y2xlcyB0byBmaWd1cmUgb3V0IGEgYnVpbGQgaXNz
dWUgd2hlbiBYMTEgaGVhZGVycyBhcmUgbm90IHByZXNlbnQgKGUuZy4KaW4gV2F5bGFuZC1vbmx5
IGNvbmZpZ3VyYXRpb25zKTsgY3VycmVudGx5IEkgYWxyZWFkeSBoYXZlIGEgV0lQIHBhdGNoIHNl
dApoZXJlOgoKICBodHRwczovL2dpdC5zci5odC9+YXBlcmV6ZGMvYnVpbGRyb290L2xvZy93aXAv
d2Via2l0Z3RrCgpBbHNvIEkganVzdCBzdWJtaXR0ZWQgc29tZSBtb21lbnRzIGFnbyBhIHNtYWxs
IHBhdGNoIHRvIHVwZGF0ZSB0aGUgV1BFIFdlYktpdApwYWNrYWdlIHRvIDIuMzQuNCBhcyB3ZWxs
LgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--3ALwnFYuQ3BBeo9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYe60qwAKCRCRxVnb5MkS
O8eUAJ9+s+6pMwXT5N3GMIM14+80J+f5GgCfXpbySS075lnoUZQxcGDylb9vuzY=
=hFfE
-----END PGP SIGNATURE-----

--3ALwnFYuQ3BBeo9u--

--===============5968994373560939831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5968994373560939831==--
