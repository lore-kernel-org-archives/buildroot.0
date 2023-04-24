Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C0DC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 12:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 082BB41763;
	Mon, 24 Apr 2023 12:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 082BB41763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipTv76qpWuKp; Mon, 24 Apr 2023 12:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6AC54174A;
	Mon, 24 Apr 2023 12:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6AC54174A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 955321C2AA3
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 791FA41499
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 12:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791FA41499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbIKBexyui6U for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 12:14:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF3C4174A
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FF3C4174A
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:14:42 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqv5c-00ArwC-15; Mon, 24 Apr 2023 14:14:40 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a34cff74;
 Mon, 24 Apr 2023 12:14:39 +0000 (UTC)
Date: Mon, 24 Apr 2023 15:14:39 +0300
Message-ID: <20230424151439.GJ3960430@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230227105838.358916-5-thomas.devoogdt@barco.com>
References: <20230227105838.358916-1-thomas.devoogdt@barco.com>
 <20230227105838.358916-5-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5TWL9adZ2Llll53tOVY2B368HCTSVgGskZs3OalixJQ=; b=bruj8X+38THA7Fe6NK6N4hEHAI
 5bE8H9PnNs3QGuYp7622NvgeneI57C8f4WFiq41xLbPZAIfvdwFkTP66M9ZQRRxOnSddBtAfRLD2g
 u+k8yiJl9TqSqbkE2CBmxKeFpDabv3uaDCxSwmVGzGSFgJW7cQXDqKAOpDbOQeP2JFy8eGusDTz4+
 nfcPTCXISIVVjHRZLjKUlcdXxHo2eCbkJjXIenPdsC8uS6v2stfgwoWlgPQGk/9M3vlrZBYlx1E6t
 X1lOcdmo/uCe1had0mJLTmwTNHZ1akEHUY4DLabW8+HgMbkYlhUSL502rOP4nla02Y3qK93SdXY96
 fOmGgomQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=bruj8X+3
Subject: Re: [Buildroot] [PATCH v5 5/5] package/libgtk3: fix
 update-icon-cache on empty directory
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1187754918764717746=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1187754918764717746==
Content-Type: multipart/signed; boundary="rSCyzznvsBzyXsIE"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--rSCyzznvsBzyXsIE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNyBGZWIgMjAyMyAxMTo1ODozOCArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IElmIGJvdGgsIGhpY29sb3ItaWNvbi10aGVtZSAoc2Vs
ZWN0ZWQgYnkgbGliZ3RrMy1kZW1vKSBhbmQKPiBhZHdhaXRhLWljb24tdGhlbWUgaXMgbm90IHNl
bGVjdGVkLCB0aGVuIHRoZSAvdXNyL3NoYXJlL2ljb25zCj4gZm9sZGVyIGlzIGVtcHR5LCBjYXVz
aW5nIGZpbmQgdG8gZmFpbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRo
b21hcy5kZXZvb2dkdEBiYXJjby5jb20+CgpUZXN0ZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0
cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiB2NTogCj4gIC0gRml4ZWQgaW5kZW50YXRp
b24uCj4gIC0gR3JvdXBlZCBwYXRjaGVzLgo+IC0tLQo+ICBwYWNrYWdlL2xpYmd0azMvbGliZ3Rr
My5tayB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJndGszL2xpYmd0azMubWsgYi9w
YWNrYWdlL2xpYmd0azMvbGliZ3RrMy5tawo+IGluZGV4IDI4MjFjN2ViNTIuLjE5MWUyOGRkYTYg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJndGszL2xpYmd0azMubWsKPiArKysgYi9wYWNrYWdl
L2xpYmd0azMvbGliZ3RrMy5tawo+IEBAIC0xNDYsOCArMTQ2LDkgQEAgZW5kZWYKPiAgIyBDcmVh
dGUgaWNvbi10aGVtZS5jYWNoZSBmb3IgZWFjaCBvZiB0aGUgaWNvbiBkaXJlY3Rvcmllcy90aGVt
ZXMKPiAgIyBJdCdzIG5vdCBzdHJpY3RseSBuZWNlc3NhcnkgYnV0IHNwZWVkcyB1cCBsb29rdXBz
Cj4gIGRlZmluZSBMSUJHVEszX1VQREFURV9JQ09OX0NBQ0hFCj4gLQlmaW5kICQoVEFSR0VUX0RJ
UikvdXNyL3NoYXJlL2ljb25zIC1tYXhkZXB0aCAxIC1taW5kZXB0aCAxIC10eXBlIGQgXAo+IC0J
CS1leGVjICQoSE9TVF9ESVIpL2Jpbi9ndGstdXBkYXRlLWljb24tY2FjaGUge30gXDsKPiArCVsg
ISAtZCAkKFRBUkdFVF9ESVIpL3Vzci9zaGFyZS9pY29ucyBdIHx8IFwKPiArCQlmaW5kICQoVEFS
R0VUX0RJUikvdXNyL3NoYXJlL2ljb25zIC1tYXhkZXB0aCAxIC1taW5kZXB0aCAxIC10eXBlIGQg
XAo+ICsJCQktZXhlYyAkKEhPU1RfRElSKS9iaW4vZ3RrLXVwZGF0ZS1pY29uLWNhY2hlIHt9IFw7
Cj4gIGVuZGVmCj4gIExJQkdUSzNfVEFSR0VUX0ZJTkFMSVpFX0hPT0tTICs9IExJQkdUSzNfVVBE
QVRFX0lDT05fQ0FDSEUKPiAgCj4gLS0gCj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--rSCyzznvsBzyXsIE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEZyrwAKCRCRxVnb5MkS
O8tIAJ0epAcJwrq9xPjhv4sMelNbo5HHSQCeLZOu9mvUyfzTRqFj9bAEFFGXELM=
=XhV/
-----END PGP SIGNATURE-----

--rSCyzznvsBzyXsIE--

--===============1187754918764717746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1187754918764717746==--
