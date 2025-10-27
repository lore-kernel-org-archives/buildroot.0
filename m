Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8933ACCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4745E60E34;
	Mon, 27 Oct 2025 13:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cbOK4YgCYLd; Mon, 27 Oct 2025 13:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523ED61001
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523ED61001;
	Mon, 27 Oct 2025 13:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6852043F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A05D40530
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOlpDnePs84s for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 13:30:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D82A40078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D82A40078
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D82A40078
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 13:30:53 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vDNJB-00FlaT-QZ; Mon, 27 Oct 2025 14:30:49 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 3210252d;
 Mon, 27 Oct 2025 13:30:43 +0000 (UTC)
Date: Mon, 27 Oct 2025 15:30:39 +0200
Message-ID: <20251027153039.GB121268@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20251025143512.78812-1-thomas@devoogdt.com>
References: <20251025143512.78812-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AeIXXalVI3LJp5RHFvzpcGiZzgqN2Q+Kjb5P1RW/oUs=; b=lL2nSyNeAUzftVkikpRAiDVu15
 AAOgAwhDi7/zJaLe0BLvBuGMv1viDrg0vbv2lX2uiqNF+eKTn27q24732Erk2qO/RusegQXqunfJE
 fMoql1y2Lq70+RCCh6VO5mUJayMYYVnxngoIxXhP53IfEnrkdCBD3H+3vNHiVIk5QyJyRvFSMPx6U
 AU4aq4jlUhbQ1wdWVsAtXJZEK2sbzTwNub5xJTA5UgC8uwFPirkbYvPwadwnD7E5BYvYElXLeVVG7
 Gp90ovjIGG9iwvt7RoDDtP/uwe1c6xO3HwXwt5Sdtn7vEokI4Xi5z7JVEGI2MdaBuRX/feTTnBFh9
 CZHAFoow==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=lL2nSyNe
Subject: Re: [Buildroot] [PATCH v1] package/wpewebkit: disable internal
 ccache configuration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1840586609163655900=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1840586609163655900==
Content-Type: multipart/signed; boundary="wHlAEbuLmS1GuB6p"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--wHlAEbuLmS1GuB6p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gU2F0LCAyNSBPY3QgMjAyNSAxNjozNToxMSArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IFdlYktpdCdzIGF1dG8tY29uZmlndXJlZCBjY2FjaGUg
cmVzdWx0cyBpbiAxMDAlIGNhY2hlIG1pc3Nlcy4KPiBEaXNhYmxlIFdlYktpdCdzIGludGVybmFs
IGNjYWNoZSBzZXR1cCBbMV0gc2luY2UgQnVpbGRyb290Cj4gYWxyZWFkeSBtYW5hZ2VzIHRoZSBj
Y2FjaGUgaW4gdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVyLmMuCj4gCj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9XZWJLaXQvV2ViS2l0L2Jsb2Ivd3Bld2Via2l0LTIuNDguMy9Tb3VyY2UvY21h
a2UvV2ViS2l0Q0NhY2hlLmNtYWtlCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0
IDx0aG9tYXNAZGV2b29nZHQuY29tPgoKQWNrZWQtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8g
PGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiAgcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0
Lm1rIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rIGIvcGFja2FnZS93cGV3ZWJr
aXQvd3Bld2Via2l0Lm1rCj4gaW5kZXggNzk2ZTI3MWVjYi4uMTVhMmVhOTNlOCAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiArKysgYi9wYWNrYWdlL3dwZXdl
YmtpdC93cGV3ZWJraXQubWsKPiBAQCAtMjEsNiArMjEsMTAgQEAgV1BFV0VCS0lUX0RFUEVOREVO
Q0lFUyA9IGhvc3QtZ3BlcmYgaG9zdC1weXRob24zIGhvc3QtcnVieSBob3N0LXVuaWZkZWYgXAo+
ICAKPiAgV1BFV0VCS0lUX0NNQUtFX0JBQ0tFTkQgPSBuaW5qYQo+ICAKPiArIyBCdWlsZHJvb3Qg
YWRkcyBzdXBwb3J0IGZvciBjY2FjaGUgdGhyb3VnaCBpdHMKPiArIyB0b29sY2hhaW4td3JhcHBl
ciwgc28gdGVsbCB3cGV3ZWJraXQgbm90IHRvIG1lc3Mgd2l0aCBpdC4KPiArV1BFV0VCS0lUX0NP
TkZfRU5WID0gV0tfVVNFX0NDQUNIRT1OTwo+ICsKPiAgV1BFV0VCS0lUX0NPTkZfT1BUUyA9IFwK
PiAgCS1EUE9SVD1XUEUgXAo+ICAJLURFTkFCTEVfQVBJX1RFU1RTPU9GRiBcCj4gLS0gCj4gMi40
My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNo
ZWVycywK4oCUQWRyacOhbgo=

--wHlAEbuLmS1GuB6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaP9z/wAKCRCRxVnb5MkS
O2DwAJwIPsUzCR6gEDWOraQW1RnHG0Pr2gCfWoe9UE97vnhvI//Gz1uS+Ew6KAM=
=ah7O
-----END PGP SIGNATURE-----

--wHlAEbuLmS1GuB6p--

--===============1840586609163655900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1840586609163655900==--
