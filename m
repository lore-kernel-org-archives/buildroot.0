Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF1DCD6E6E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 21:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB1B5857D8;
	Thu,  4 Jun 2026 21:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8w16dzxQprA; Thu,  4 Jun 2026 21:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DBC857D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780607823;
	bh=t4Iw3G4zekd5a1L6nSEZVloHgGW9Ap8vuTnd7u0x3OA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qITH6nIJHIhSCJf1XhIb1RVywL0IopQUO3Ef/qWaFfHZWc10wzsSV6Q8IeOMSoc0a
	 aXlV557LSeqWv/V+ZZfiV17D8q5MckUTJLMkNVW3cevipgdcKU8mB4WTOuC7zfaf74
	 V3oJdqTVi2oMb2iDu5RJ/6BQqBwS6mvvLS2Ex9PPhBRN7/U65xnz6mnIOCHSq0dGSS
	 tB544mX0rNHw4QCkuOmENItjlHGjKdRoYDzcBpg0DlYh0oOzvSbrj/ZQR6JyWGIc3R
	 WK/GLdhqlXEaEOa/qacrRJPKa8AMGD19Wf4be4Ues0+wtZ7tXI4bWlnb0HW+azzF8C
	 wPDLb9TAD5goQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DBC857D2;
	Thu,  4 Jun 2026 21:17:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 434DEDE
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412034EC97
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWPNrEzWdxTQ for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 21:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6F014EC60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6F014EC60
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6F014EC60
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 21:16:59 +0000 (UTC)
Received: from 81-197-150-176.elisa-laajakaista.fi ([81.197.150.176]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wVFQt-00CpKO-PV; Thu, 04 Jun 2026 23:16:55 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 1aa5e772;
 Thu, 4 Jun 2026 21:16:53 +0000 (UTC)
Date: Fri, 5 Jun 2026 00:16:49 +0300
Message-ID: <20260605001649.GB120710@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
References: <20260604051221.317172-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K6760IOlEhsrxjLuvV8DFYUVrcW+pC9olHpRHFfOsXI=; b=A9AD/ot9mCvSq5K4fnXZ4jq+rm
 8m+KP1Fca4dZ+GIwycDVF32CZbEbZh7aF7ao5MuHO33L9PJn7I4itqrAs0pT8yjbkjvnnf0FkcfuJ
 ChYSCpY0czHJjQZHAGCjO9fK85aupvQuJSw+YW1MlhRWd3l80maSvw6Xgl8Qq+oiQbLuidHoZYr/6
 /D+dkZtNSWRXCgRfHoyPXDziK/WYdRlQ+tGM7kj97spVAY0u8M65PfqMDb18RaLQg46F2vo01rYj3
 0rBPDDKIN9HL7I+Ct8PvZmvgUC/EjlGGhc9CqItqoqt2BlzEneE4DrgG75MnA7ouAVra6W+18XrP8
 g77KaFAw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=A9AD/ot9
Subject: Re: [Buildroot] [PATCH] package/libglib2: disable sysprof profiling
 support
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
Content-Type: multipart/mixed; boundary="===============9172367264912829921=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9172367264912829921==
Content-Type: multipart/signed; boundary="ozahne1xDP/eEIKq"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--ozahne1xDP/eEIKq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gSmVhbiwgYWxsLAoKT24gVGh1LCAwNCBKdW4gMjAyNiAwNzoxMjoyMSArMDIwMCBKZWFu
LU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnPiB3cm90ZToK
Cj4gVGhlIHN5c3Byb2YgcHJvZmlsaW5nIHN1cHBvcnQgaXMgbm90IHVzZWZ1bCBvbiBlbWJlZGRl
ZCB0YXJnZXRzIGFuZAo+IG9ubHkgYWRkcyBidWlsZCBjb21wbGV4aXR5LiBEaXNhYmxlIGl0IGV4
cGxpY2l0bHkgc28gdGhhdCB0aGUgYnVpbGQKPiBkb2VzIG5vdCBkZXBlbmQgb24gd2hldGhlciBs
aWJzeXNwcm9mLWNhcHR1cmUgaGFwcGVucyB0byBiZSBkZXRlY3RlZAo+IG9uIHRoZSBob3N0LgoK
U29ycnksIGJ1dCBJIHdpbGwgaGF2ZSB0byBkaXNhZ3JlZS4gV2hpbGUgZGV2ZWxvcGluZyBXZWJL
aXQgKEkgd29yayBib3RoCmluIHRoZSBHVEsgYW5kIHRoZSBXUEUgcG9ydHMpIHRoZSBTeXNwcm9m
IHRyYWNpbmcgc3VwcG9ydCBoYXMgYmVlbgppbnN0cnVtZW50YWwgZm9yIG91ciB0ZWFtIHRvIGJl
IGFibGUgdG8gbWVhc3VyZSBhbmQgZGVsaXZlciBwZXJmb3JtYW5jZQppbXByb3ZlbWVudHMuIEhh
dmluZyBTeXNwcm9mIHRyYWNpbmcgZm9yIHRoZSBkZXBlbmRlbmNpZXMgKGluY2x1ZGluZwpHTGli
KSBpcyBuZWVkZWQgbGVzcyBvZnRlbjsgYnV0IGhhcyBoZWxwZWQuCgpJTU8sIHdoYXQgbWFrZXMg
c2Vuc2UgaXMgdG8gZGlzYWJsZSBTeXNwcm9mIGZvciAqaG9zdCogYnVpbGRzLCBidXQgbGVhdmUK
aXQgZW5hYmxlZCBmb3IgKnRhcmdldCogYnVpbGRzIC0tIGJlY2F1c2Ugb2YgY291cnNlIHBlb3Bs
ZSBhcmUKaW50ZXJlc3RlZCBpbiBvcHRpbWl6aW5nIGZvciB0aGVpciB0YXJnZXQgZGV2aWNlcy4K
IAo+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWljaGVsLmhhdXRi
b2lzQHlvc2VsaS5vcmc+Cj4gLS0tCj4gIHBhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgfCAz
ICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgYi9wYWNrYWdlL2xp
YmdsaWIyL2xpYmdsaWIyLm1rCj4gaW5kZXggY2FlOGE4NWEyOC4uZGVlYTZjMTQ2ZCAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCj4gKysrIGIvcGFja2FnZS9saWJn
bGliMi9saWJnbGliMi5tawo+IEBAIC02MCw3ICs2MCw4IEBAIExJQkdMSUIyX0NPTkZfT1BUUyA9
IFwKPiAgCS1EbGliZWxmPWRpc2FibGVkIFwKPiAgCS1EZ2lvX21vZHVsZV9kaXI9L3Vzci9saWIv
Z2lvL21vZHVsZXMgXAo+ICAJLUR0ZXN0cz1mYWxzZSBcCj4gLQktRG9zc19mdXp6PWRpc2FibGVk
Cj4gKwktRG9zc19mdXp6PWRpc2FibGVkIFwKPiArCS1Ec3lzcHJvZj1kaXNhYmxlZAoKVGhlcmVm
b3JlLCBJIHdvdWxkIGFkZCAiLURzeXNwcm9mPWRpc2FibGVkIiB0byB0aGUKSE9TVF9MSUJHTElC
Ml9DT05GX09QVFMgdmFyaWFibGUgaW5zdGVhZC4KCj4gIExJQkdMSUIyX01FU09OX0VYVFJBX1BS
T1BFUlRJRVMgPSBcCj4gIAloYXZlX2M5OV92c25wcmludGY9dHJ1ZSBcCj4gLS0gCj4gMi4zOS41
CiAKQ2hlZXJzLArigJRBZHJpw6FuCg==

--ozahne1xDP/eEIKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaiHrQQAKCRCRxVnb5MkS
OzTrAJ4pltupXf6/LnwKyx6PZ5b0ZfAizgCeOQGC/y+ElecA0vFcua04ssIGPsY=
=rytA
-----END PGP SIGNATURE-----

--ozahne1xDP/eEIKq--

--===============9172367264912829921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9172367264912829921==--
