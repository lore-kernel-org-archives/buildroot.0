Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521FAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 13:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5854482142;
	Tue, 14 Nov 2023 13:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5854482142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6tDaP9EENtn; Tue, 14 Nov 2023 13:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8892682106;
	Tue, 14 Nov 2023 13:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8892682106
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 772BB1BF2B4
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 13:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E06161323
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 13:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E06161323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgnLHEkYaHSJ for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 13:07:30 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AECE612F0
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 13:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AECE612F0
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r2t8Y-0036Gu-D6; Tue, 14 Nov 2023 14:07:26 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9038ea0f;
 Tue, 14 Nov 2023 13:07:25 +0000 (UTC)
Date: Tue, 14 Nov 2023 15:07:25 +0200
Message-ID: <20231114150725.GD1974649@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20231110164617.569602-2-thomas@devoogdt.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231110164617.569602-2-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/shXYLEDS6TLSc7Laq7wqEeU3+g9LeuKqSjdaltGiyo=; b=Q/OvErexhhQGsZNnxYkENES2d8
 xUjKdKGC6qJmgdmLFQvfOw6HDBuvi62hp1xAn0yDuzP6HSKZ4tscvA3brdHnXUb0mefJFA91FnP6M
 Nv8E7HOaDZarCx5ejuPic4uRu5P5GyOcR6c5hI2tHe89BNndBX/OSEnCaVJL99cnjoHDXPO4rV4MG
 Vo4vdVoF4w4g6VmE78Rw7Ux9gORdHBUJjbKTMI4bNs21tBBZDvOqdjuFWjqccIE+z2Bpi/cwr3zkp
 34AiN9N+ioTzjztgcwAOonjywdayuA13gARAieea05RLc5EMKLNQt0Ui551SNQqogqtpSW6YNr1EW
 bzWGH0yQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Q/OvErex
Subject: Re: [Buildroot] [PATCH v5 2/3] package/webkitgtk: select
 wpebackend-fdo if wayland target is enabled
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3866283346481907919=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3866283346481907919==
Content-Type: multipart/signed; boundary="ajNL0VGGcrBZ/Q4G"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--ajNL0VGGcrBZ/Q4G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAxMCBOb3YgMjAyMyAxNzo0NjoxNiArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IGxpYndlcCAmIHdwZWJhY2tlbmQtZmRvIGFyZSBtYW5k
YXRvcnkgaWYgRU5BQkxFX1dBWUxBTkRfVEFSR0VUIGFuZCBFR0xfRk9VTkQKPiBodHRwczovL2dp
dGh1Yi5jb20vV2ViS2l0L1dlYktpdC9ibG9iLzJlMzU4OTBiMWZhOWRhMzlmZmFhODhlMGFjZDk3
M2JlYjU1ZDRhZDIvU291cmNlL2NtYWtlL09wdGlvbnNHVEsuY21ha2UjTDM4OC1MNDAwCj4gCj4g
ZWdsIGlzIG1hbmRhdG9yeSBpZiBFTkFCTEVfV0FZTEFORF9UQVJHRVQKPiBodHRwczovL2dpdGh1
Yi5jb20vV2ViS2l0L1dlYktpdC9ibG9iLzJlMzU4OTBiMWZhOWRhMzlmZmFhODhlMGFjZDk3M2Jl
YjU1ZDRhZDIvU291cmNlL2NtYWtlL09wdGlvbnNHVEsuY21ha2UjTDQ2Mi1MNDczCj4gCj4gU28g
d3BlYmFja2VuZC1mZG8gKC0+IGxpYndwZSkgaGFzIHRvIGJlIHNlbGVjdGVkIGlmIEJSMl9QQUNL
QUdFX0xJQkdUSzNfV0FZTEFORC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQg
PHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+CgpUZXN0ZWQtQnk6IEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKPiAtLS0KPiB2Mjogbi9hCj4gdjMsNCw1OiBubyBj
aGFuZ2UgKGFkZGVkIGZyb20gYW5vdGhlciBwYXRjaCBzZXJpZSkKPiAtLS0KPiAgcGFja2FnZS93
ZWJraXRndGsvQ29uZmlnLmluICAgIHwgMSArCj4gIHBhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0
ay5tayB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluIGIvcGFj
a2FnZS93ZWJraXRndGsvQ29uZmlnLmluCj4gaW5kZXggOTI3NzkyYjFlNC4uY2IxMDc4NDEzMyAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L3dlYmtpdGd0ay9Db25maWcuaW4KPiBAQCAtNTMsNiArNTMsNyBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfV0VCS0lUR1RLCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfV0VCUAo+ICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX1dFQlBfREVNVVgKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9XT0ZGMgo+ICsJc2VsZWN0
IEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPIGlmIEJSMl9QQUNLQUdFX0xJQkdUSzNfV0FZTEFO
RAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWENPTVBPU0lURSBpZiBCUjJfUEFDS0FH
RV9MSUJHVEszX1gxMQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWERBTUFHRSBpZiBC
UjJfUEFDS0FHRV9MSUJHVEszX1gxMQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWFJF
TkRFUiBpZiBCUjJfUEFDS0FHRV9MSUJHVEszX1gxMQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dl
YmtpdGd0ay93ZWJraXRndGsubWsgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiBp
bmRleCA4OGJkZmFlMjdiLi45YzY4ZmU3M2NmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2Via2l0
Z3RrL3dlYmtpdGd0ay5tawo+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+
IEBAIC0xMTUsNyArMTE1LDcgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJHVEszX1gxMSk6JChC
UjJfUEFDS0FHRV9MSUJHVEszX1dBWUxBTkQpOiQoQlIyX1BBQ0tBR0VfTEkKPiAgV0VCS0lUR1RL
X0RFUEVOREVOQ0lFUyArPSBsaWJlZ2wKPiAgZW5kaWYKPiAgCj4gLWlmZXEgKCQoQlIyX1BBQ0tB
R0VfTElCR1RLM19XQVlMQU5EKSQoQlIyX1BBQ0tBR0VfV1BFQkFDS0VORF9GRE8pLHl5KQo+ICtp
ZmVxICgkKEJSMl9QQUNLQUdFX1dQRUJBQ0tFTkRfRkRPKSx5KQo+ICBXRUJLSVRHVEtfQ09ORl9P
UFRTICs9IC1EVVNFX1dQRV9SRU5ERVJFUj1PTgo+ICBXRUJLSVRHVEtfREVQRU5ERU5DSUVTICs9
IHdwZWJhY2tlbmQtZmRvCj4gIGVsc2UKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--ajNL0VGGcrBZ/Q4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZVNxDQAKCRCRxVnb5MkS
OwDKAJ0VlwNtC1ZiBh+sToVoM0QGJtc69ACfUvMCD7ABSH8o81JHUDNMH+XkO3o=
=//KR
-----END PGP SIGNATURE-----

--ajNL0VGGcrBZ/Q4G--

--===============3866283346481907919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3866283346481907919==--
