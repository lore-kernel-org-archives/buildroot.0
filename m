Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5886C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 12:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C22F61B80;
	Thu, 17 Feb 2022 12:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YriFlSoqE-l; Thu, 17 Feb 2022 12:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2AD60D5E;
	Thu, 17 Feb 2022 12:36:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89C0F1BF3DF
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 12:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7713683F3C
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 12:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohkt2a_kbjR8 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 12:36:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E7083F3B
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uzx9cNRXn8q8hMln7t6kqUG7lY5m+qNHfkq8ZLeCvNM=; b=P/tQC9CDN/g1NQb/nnXgqkiZMB
 KGngS18s4FSC0GLEDUv3S+DZIsJ/raWGCArgXfuoqtvSej4OH7hBe2UWnyWeucAJbFClTo3vt/XOh
 KNmntBSMSyiZl/l2Mv9YhIsAyw0nnFFJsG2jaImGkKbAnNEwy2H3gWPOadsAkIWuWNrr20680SP9G
 8OszAxIWVC6vdhuTDe+XW7FSBiPNOkZ+zcb76/JrR/X2E/SbEG22kALNKlCW3GLOmLmXcHMhe3puA
 B7leuBYQJFljj3vVtGOMOPUVzHmBcvyt14RN4jLy4ydsxolwuQ+Mi173/t3n7nSklY2A8XiLpjQg5
 UdL0RF4Q==;
Received: from 163.179.165.83.dynamic.reverse-mundo-r.com ([83.165.179.163]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nKg1S-0000CM-Qb; Thu, 17 Feb 2022 13:36:34 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 793fc241;
 Thu, 17 Feb 2022 12:36:25 +0000 (UTC)
Date: Thu, 17 Feb 2022 13:36:20 +0100
Message-ID: <20220217133620.GB757559@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220124161611.GB162969@momiji>
References: <20211124205607.3021277-1-aperez@igalia.com>
 <87mtjlwlvo.fsf@dell.be.48ers.dk> <20220124161611.GB162969@momiji>
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
Content-Type: multipart/mixed; boundary="===============6115511604817931257=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6115511604817931257==
Content-Type: multipart/signed; boundary="/8PAfF+OMciR9BsB"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--/8PAfF+OMciR9BsB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gYWdhaW4sCgpPbiBNb24sIDI0IEphbiAyMDIyIDE2OjE2OjExICswMjAwIEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBIZWxsbyBQZXRlciwg
YWxsLAo+IAo+IE9uIE1vbiwgMjQgSmFuIDIwMjIgMDk6NTg6MzUgKzAxMDAgUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiA+ID4+Pj4+ICJBZHJpYW4iID09IEFk
cmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cml0ZXM6Cj4gPiAKPiA+
ICA+IFVwZGF0ZSB0byB0aGUgdGhlIG5leHQgbWlub3IgcmVsZWFzZSwgd2hpY2ggZml4ZXMgYW4g
c2Nyb2xsaW5nIGlzc3VlIGFuZAo+ID4gID4gaW5jb3Jwb3JhdGVkIGEgcGF0Y2ggdGhhdCBjYW4g
bm93IGJlIHJlbW92ZWQgZnJvbSBCdWlsZHJvb3QuIFJlbGVhc2UKPiA+ICA+IG5vdGVzOgo+ID4g
Cj4gPiAgPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlL3dwZXdlYmtpdC0yLjM0LjIu
aHRtbAo+ID4gCj4gPiAgPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxh
cGVyZXpAaWdhbGlhLmNvbT4KPiA+IAo+ID4gV2hhdCBhYm91dCB3ZWJraXRndGs/IEl0IHdvdWxk
IGFsc28gYmUgZ29vZCB0byBtb3ZlIHRoYXQgdG8gdGhlIDIuMzQueAo+ID4gc2VyaWVzIGJlZm9y
ZSB3ZSByZWxlYXNlIDIwMjIuMDIuCj4gCj4gSSBoYXZlIGFsbCB0aGUgaW50ZW50aW9uIHRvIHVw
ZGF0ZSBXZWJLaXRHVEsgYXMgc29vbiBhcyBJIGhhdmUgc29tZSBzcGFyZQo+IGN5Y2xlcyB0byBm
aWd1cmUgb3V0IGEgYnVpbGQgaXNzdWUgd2hlbiBYMTEgaGVhZGVycyBhcmUgbm90IHByZXNlbnQg
KGUuZy4KPiBpbiBXYXlsYW5kLW9ubHkgY29uZmlndXJhdGlvbnMpOyBjdXJyZW50bHkgSSBhbHJl
YWR5IGhhdmUgYSBXSVAgcGF0Y2ggc2V0Cj4gaGVyZToKPiAKPiAgIGh0dHBzOi8vZ2l0LnNyLmh0
L35hcGVyZXpkYy9idWlsZHJvb3QvbG9nL3dpcC93ZWJraXRndGsKCkhlcmUgd2UgZ286IGh0dHBz
Oi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yMzY3NzAg4oCUIHR1cm5zIG91dCB0
aGUKYnVpbGQgd2FzIGJyb2tlbiBpbiB0aGUgZGV2ZWxvcG1lbnQgYnJhbmNoIGFzIHdlbGwsIGFu
ZCBJIHBsYW4gdG8gYmFja3BvcnQKdGhlIHBhdGNoIHRvIDIuMzQueC4KCj4gQWxzbyBJIGp1c3Qg
c3VibWl0dGVkIHNvbWUgbW9tZW50cyBhZ28gYSBzbWFsbCBwYXRjaCB0byB1cGRhdGUgdGhlIFdQ
RSBXZWJLaXQKPiBwYWNrYWdlIHRvIDIuMzQuNCBhcyB3ZWxsLgoKSSBhbSByZWxlYXNpbmcgMi4z
NC42IHRoaXMgd2Vlaywgd2hpY2ggd2lsbCBpbmNsdWRlIHRoZSBwYXRjaCBtZW50aW9uZWQKYWJv
dmUsIHNvIEkgd2lsbCBzdWJtaXQgZGlyZWN0bHkgYW4gdXBkYXRlIHRvIDIuMzQuNiBvbmNlIGl0
IGhhcyBiZWVuCnB1Ymxpc2hlZC4KCkNoZWVycywK4oCUQWRyacOhbgo=

--/8PAfF+OMciR9BsB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYg5BRAAKCRCRxVnb5MkS
O3V6AJ9xo8cgNk+lWQMAsQJhV0pS9kiAUACfUXdJIrvgiVrIR1KFFxY3WPf2WKE=
=r3IJ
-----END PGP SIGNATURE-----

--/8PAfF+OMciR9BsB--

--===============6115511604817931257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6115511604817931257==--
