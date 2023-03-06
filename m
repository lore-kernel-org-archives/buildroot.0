Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90E5C64EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F27640A38;
	Mon,  6 Mar 2023 22:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F27640A38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEgrT_IgAbNa; Mon,  6 Mar 2023 22:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB4D1408DB;
	Mon,  6 Mar 2023 22:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4D1408DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2301BF3AD
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 22:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A77416DB
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 22:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A77416DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSA1rfTIbOLD for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 22:25:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C750F416D9
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C750F416D9
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 22:25:44 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pZJH3-007CaP-2Y; Mon, 06 Mar 2023 23:25:41 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 7c88c9bd;
 Mon, 6 Mar 2023 22:25:32 +0000 (UTC)
Date: Tue, 7 Mar 2023 00:25:31 +0200
Message-ID: <20230307002531.GB375908@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87wn3v9sy5.fsf@dell.be.48ers.dk>
References: <20230304221145.3222530-1-aperez@igalia.com>
 <20230305005158.GC46585@igalia.com> <87wn3v9sy5.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LEc6BGGq+FXsIVenT43PE76XGbjMrL3Vuq/CArX/URw=; b=Y+Efc8W+uUVcEN+B5pm5j1j4co
 zPO7RZcK2ZtJncXBSyIZEkIsGKB6vDTIz58iU8GO2OcLlfmlC0nrvNHdzm1DaUgZZruNJpW1jmwxm
 18vLrlBYPeTbdY8qd09R0/E5kbppTdjg2ciDBekPpqKIQ5lc+iWzMg2MQHAW/PKkSnk0DdKpbx9E+
 tSm0Pxaed06ggsTzj+LGGV+yCedz8lTWN3PeR3fGYgfTHj99E/g2x7GU5jQ6XqjCKNkp5b3Q1qH3W
 RO/bH7tNWwGXkaDRJZWF+fiTyt5c/weVv7HTJaMDkKSDtABoboK3kwzvGJoRQtSyFJPbLG6Nt1Wez
 uuYAxe/Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Y+Efc8W+
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6241214113033881780=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6241214113033881780==
Content-Type: multipart/signed; boundary="Na6SqcW3jiS76/w3"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--Na6SqcW3jiS76/w3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gUGV0ZXIsCgpPbiBTdW4sIDA1IE1hciAyMDIzIDE1OjI0OjUwICswMTAwIFBldGVyIEtv
cnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gIkFkcmlhbiIgPT0g
QWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+IHdyaXRlczoKPiAKPiAg
PiBIaSwKPiAgPiAoQWRkZWQgUGV0ZXIgaW4gQ0MuKQo+IAo+ICA+IE9uIFN1biwgMDUgTWFyIDIw
MjMgMDA6MTE6NDUgKzAyMDAgQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5j
b20+IHdyb3RlOgo+IAo+ICA+PiBUaGlzIGlzIGEgYnVnZml4IHJlbGVhc2Ugd2hpY2ggaW5jbHVk
ZXMgaW1wb3J0YW50IGZpeGVzIHdoaWNoIHNvbHZlIGEKPiAgPj4gbWVtb3J5IGxlYWsgYW5kIGhp
dHRpbmcgYSBzaXR1YXRpb24gd2hlcmUgdGhlIG91dHB1dCBubyBsb25nZXIgZ2V0cwo+ICA+PiB1
cGRhdGVkLiBSZWxlYXNlIG5vdGVzOgo+ICA+PiAKPiAgPj4gaHR0cHM6Ly93cGV3ZWJraXQub3Jn
L3JlbGVhc2Uvd3BlYmFja2VuZC1mZG8tMS4xNC4xLmh0bWwKPiAgPj4gCj4gID4+IFNpZ25lZC1v
ZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+ICA+PiAt
LS0KPiAgPj4gcGFja2FnZS93cGViYWNrZW5kLWZkby93cGViYWNrZW5kLWZkby5oYXNoIHwgOCAr
KysrLS0tLQo+ICA+PiBwYWNrYWdlL3dwZWJhY2tlbmQtZmRvL3dwZWJhY2tlbmQtZmRvLm1rICAg
fCAyICstCj4gID4+IDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+IAo+ICA+IEl0IHdvdWxkIGJlICp2ZXJ5IGRlc2lyYWJsZSogdG8gaGF2ZSB0aGlzIHVw
ZGF0ZSBpbiBzdGFibGUgYnJhbmNoZXMgYXMgd2VsbCwKPiAgPiBiZWNhdXNlIHRoaXMgY29udGFp
bnMgYnVnIGZpeGVzIHdoaWNoIG1ha2UgV2ViS2l0e0dUSyxXUEV9IGFjdHVhbGx5IHVzYWJsZQo+
ICA+IGluIHNvbWUgY2FzZXMgKGUuZy4gbG9uZyBydW5uaW5nIGluc3RhbmNlcykuCj4gCj4gV2l0
aCBzdGFibGUgYnJhbmNoZXMgSSBndWVzcyB5b3UgbWVhbiBvdXIgKGxhdGUpIHVwY29taW5nIExU
UyByZWxlYXNlLAo+IDIwMjMuMDI/IDIwMjIuMDIueCBhbmQgMjAyMi4xMS54IHVzZSB3cGViYWNr
ZW5kLWZkbyAxLjEyLjEsIGJ1dCB0aGV5IGFyZQo+IGFsbW9zdCBFT0wuCgpZZXMsIEkgbWVhbnQg
MjAyMy4wMjsgdGhlIGJyYW5jaGVzIHRoYXQgYXJlIGJlaW5nIEVPTCdkIHNvb24gYXJlIHByb2Jh
Ymx5Cm5vdCB3b3J0aCB1cGRhdGluZy4KCj4gQ29tbWl0dGVkIHRvIG1hc3RlciAod2hpY2ggd2ls
bCBiZWNvbWUgMjAyMy4wMiksIHRoYW5rcy4KCkV4Y2VsbGVudCwgdGhhbmtzIQoKQ2hlZXJzLAri
gJRBZHJpw6FuCg==

--Na6SqcW3jiS76/w3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZAZoWwAKCRCRxVnb5MkS
O3e0AJ4lUnCZMwdnJUKzgTYqEfQAWhmBmACfQ5pZfU5xsEFZDZveln6J+TzqH/4=
=uNoT
-----END PGP SIGNATURE-----

--Na6SqcW3jiS76/w3--

--===============6241214113033881780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6241214113033881780==--
