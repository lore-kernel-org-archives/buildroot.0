Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02B4C77B7C
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 11:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6299641DED;
	Fri,  5 May 2023 11:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6299641DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pr6B_O_P_i7S; Fri,  5 May 2023 11:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48A5B429B8;
	Fri,  5 May 2023 11:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A5B429B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E42221BF3BF
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 11:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6E4484279
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 11:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E4484279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjFdP7dCsLUp for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 11:57:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A66BF8423A
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A66BF8423A
 for <buildroot@buildroot.org>; Fri,  5 May 2023 11:57:19 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1puu3k-001paw-KH; Fri, 05 May 2023 13:57:13 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 50698311;
 Fri, 5 May 2023 11:57:10 +0000 (UTC)
Date: Fri, 5 May 2023 14:57:10 +0300
Message-ID: <20230505145710.GH3311548@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230428075920.3750005-4-thomas@devoogdt.com>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
 <20230428075920.3750005-4-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2vfsIXy3tC3eEOIJ8FKysJezkwizvY0T7vVYf1AQbEo=; b=FnEhIZ02/CdtHddtqf+yyR0hiY
 03wlyFhrQqYLhjCccdlOInXms1X9q0OJoSqw7scavwc5JBtC5C9vY/GxRV7dtPYSAtryBEOWQ5vwo
 pu9XxlqSPP5bCa/JpGQez+BPipmLfHucHoRAWrt3Ni9s22iPYiJdnjxp2oEog690U6YCqpLe11tNd
 FRd/Mv1+yDtuXhY5/hby2uhVbmJ3YPb/xsL45QEjdl2dROJt/0T/5EebwVr6BTYXGwqUNy3X0P/Gw
 z9C4xivIB92al7Bw6bapA/H9xMtdfS1W2cEC9htRl8I6Y0KB/atiPIvwS+B2QHKlx/mqmLFRuD8u6
 WNhiE8aw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=FnEhIZ02
Subject: Re: [Buildroot] [PATCH v7 4/5] package/libgtk3: re-enable atk-bridge
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============8060537011542309938=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8060537011542309938==
Content-Type: multipart/signed; boundary="pSvS+mmjCC5MOGYp"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--pSvS+mmjCC5MOGYp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAyOCBBcHIgMjAyMyAwOTo1OToxOSArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IFRoZSBhdC1zcGkyLWNvcmUgYW5kIGF0LXNwaTItYXRr
IHdlcmUgbWVyZ2VkLCBhbmQgYXJlIG5vdyBidWlsdCBieSBkZWZhdWx0LAo+IHNvIHRoaXMgcGF0
Y2ggaXMgbm8gbG9uZ2VyIHJlcXVpcmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZv
b2dkdCA8dGhvbWFzLmRldm9vZ2R0QGJhcmNvLmNvbT4KPiBUZXN0ZWQtYnk6IEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKUmV2aWV3ZWQtYnk6IEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiB2NTogYWRkZWQgcmUtZW5h
YmxlIGF0ay1icmlkZ2UgcGF0Y2ggdG8gdGhlIHBhY2thZ2UvYXQtc3BpMi1jb3JlOiBidW1wIHRv
IHZlcnNpb24gMi40Ny4xIGdyb3VwCj4gdjY6IG5vIGNoYW5nZQo+IHY3OiBubyBjaGFuZ2UKPiAt
LS0KPiAgcGFja2FnZS9saWJndGszLzAwMDEtZGlzYWJsZS1hdGstYnJpZGdlLnBhdGNoIHwgNDEg
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDEgZGVsZXRpb25zKC0pCj4g
IGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmd0azMvMDAwMS1kaXNhYmxlLWF0ay1icmlk
Z2UucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJndGszLzAwMDEtZGlzYWJsZS1h
dGstYnJpZGdlLnBhdGNoIGIvcGFja2FnZS9saWJndGszLzAwMDEtZGlzYWJsZS1hdGstYnJpZGdl
LnBhdGNoCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggZjNlOWJmZjJiYS4uMDAw
MDAwMDAwMAo+IC0tLSBhL3BhY2thZ2UvbGliZ3RrMy8wMDAxLWRpc2FibGUtYXRrLWJyaWRnZS5w
YXRjaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw0MSArMCwwIEBACj4gLVJlbW92ZSBhdGstYnJp
ZGdlIHN1cHBvcnQuCj4gLQo+IC1hdGstYnJpZGdlIGRvZXNuJ3Qgc2VlbSB1c2VmdWwgZm9yIG5v
dyBpbiBCdWlsZHJvb3QgYW5kIHJlcXVpcmVzIHRvCj4gLWFkZCB0d28gbmV3IHBhY2thZ2VzIGp1
c3QgZm9yIGl0OiBhdC1zcGkyLWNvcmUgYW5kIGF0LXNwaTItYXRrLgo+IC0KPiAtU2lnbmVkLW9m
Zi1ieTogSGFkcmllbiBCb3V0dGV2aWxsZSA8aGFkcmllbi5ib3V0dGV2aWxsZUBnbWFpbC5jb20+
Cj4gLQo+IC0tLS0gYS9ndGsvYTExeS9ndGthY2Nlc3NpYmlsaXR5LmMKPiAtKysrIGIvZ3RrL2Ex
MXkvZ3RrYWNjZXNzaWJpbGl0eS5jCj4gLUBAIC0zNywxMCArMzcsNiBAQAo+IC0gI2luY2x1ZGUg
PGd0ay9ndGt0b2dnbGVidXR0b24uaD4KPiAtICNpbmNsdWRlIDxndGsvZ3RrYWNjZXNzaWJsZS5o
Pgo+IC0KPiAtLSNpZmRlZiBHREtfV0lORE9XSU5HX1gxMQo+IC0tI2luY2x1ZGUgPGF0ay1icmlk
Z2UuaD4KPiAtLSNlbmRpZgo+IC0tCj4gLSBzdGF0aWMgZ2Jvb2xlYW4gZ2FpbF9mb2N1c193YXRj
aGVyICAgICAgKEdTaWduYWxJbnZvY2F0aW9uSGludCAqaWhpbnQsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGd1aW50ICAgICAgICAgICAgICAgICAgbl9wYXJh
bV92YWx1ZXMsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IEdWYWx1ZSAgICAgICAgICAqcGFyYW1fdmFsdWVzLAo+IC1AQCAtOTg4LDkgKzk4NCw1IEBA
IF9ndGtfYWNjZXNzaWJpbGl0eV9pbml0ICh2b2lkKQo+IC0gICBfZ3RrX2FjY2Vzc2liaWxpdHlf
b3ZlcnJpZGVfYXRrX3V0aWwgKCk7Cj4gLSAgIGRvX3dpbmRvd19ldmVudF9pbml0aWFsaXphdGlv
biAoKTsKPiAtCj4gLS0jaWZkZWYgR0RLX1dJTkRPV0lOR19YMTEKPiAtLSAgYXRrX2JyaWRnZV9h
ZGFwdG9yX2luaXQgKE5VTEwsIE5VTEwpOwo+IC0tI2VuZGlmCj4gLS0KPiAtICAgYXRrX21pc2Nf
aW5zdGFuY2UgPSBnX29iamVjdF9uZXcgKEdUS19UWVBFX01JU0NfSU1QTCwgTlVMTCk7Cj4gLSB9
Cj4gLS0tLSBhL21lc29uLmJ1aWxkCj4gLSsrKyBiL21lc29uLmJ1aWxkCj4gLUBAIC01NjQsNyAr
NTY0LDcgQEAgaWYgeDExX2VuYWJsZWQKPiAtICAgeGZpeGVzX2RlcCAgICAgPSBkZXBlbmRlbmN5
KCd4Zml4ZXMnLCByZXF1aXJlZDogZmFsc2UpCj4gLSAgIHhjb21wb3NpdGVfZGVwID0gZGVwZW5k
ZW5jeSgneGNvbXBvc2l0ZScsIHJlcXVpcmVkOiBmYWxzZSkKPiAtICAgZm9udGNvbmZpZ19kZXAg
PSBkZXBlbmRlbmN5KCdmb250Y29uZmlnJywgZmFsbGJhY2s6IFsnZm9udGNvbmZpZycsICdmb250
Y29uZmlnX2RlcCddKQo+IC0tICBhdGticmlkZ2VfZGVwICA9IGRlcGVuZGVuY3koJ2F0ay1icmlk
Z2UtMi4wJywgdmVyc2lvbjogYXRfc3BpMl9hdGtfcmVxKQo+IC0rICBhdGticmlkZ2VfZGVwICA9
IGRlcGVuZGVuY3koJ2F0ay1icmlkZ2UtMi4wJywgdmVyc2lvbjogYXRfc3BpMl9hdGtfcmVxLCBy
ZXF1aXJlZDogZmFsc2UpCj4gLSAKPiAtICAgYmFja2VuZF9pbW1vZHVsZXMgKz0gWyd4aW0nXQo+
IC0gCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--pSvS+mmjCC5MOGYp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZFTvFgAKCRCRxVnb5MkS
OzkmAJ9I8FxPxGE1RY2rP6MYbzAlee6Q3gCbBfKE5l8fuLV3ehmQDkGC0ejdoAU=
=1WuS
-----END PGP SIGNATURE-----

--pSvS+mmjCC5MOGYp--

--===============8060537011542309938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8060537011542309938==--
