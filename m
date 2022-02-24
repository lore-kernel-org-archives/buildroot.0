Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D9AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 23:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8592861211;
	Thu, 24 Feb 2022 23:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3mRrFyK1XRa; Thu, 24 Feb 2022 23:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB2806120D;
	Thu, 24 Feb 2022 23:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50FFD1BF29C
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 23:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F25A6120D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 23:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEJPTG5Krggc for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 23:27:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6284260B14
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9woDZFKkDhw8fguGBVz1IXLkIPA0jlZaxK66JFrOm/s=; b=HPtLcFHp5v97Pjy6M49TQgEpT4
 u/Yjx+NL6Pmcc4UGeeRze1k5QKO2W3O2uUmFGaOgCBBg07GldrNJTt01Lw/vjcwrbIjrrtKxjAOqM
 wCuSYUHTaicuC48upH06gtz0YIeAJK+ffnNaeqD/ypEcrvUbc1+XkuCAjAhbOzRLLRdQsFu9j8L4+
 TYllip5It9Zw+aLre0/0SsCox05Lj1V9WctQf5tFt3GwFrC9aq0DjMPeleTaW5XPC1AoifWBH+5Ls
 2a4dmK06jXdqqXcdEQeGK+moxuTD9THL5MvTpMbXz/Zx7yfHzdinL1+HLRlPh4gpCMkLJe0QBgNHN
 1qLLF3sw==;
Received: from 163.179.165.83.dynamic.reverse-mundo-r.com ([83.165.179.163]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nNNVi-000CMk-Dg; Fri, 25 Feb 2022 00:26:58 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 466fbe5d;
 Thu, 24 Feb 2022 23:26:48 +0000 (UTC)
Date: Fri, 25 Feb 2022 00:26:44 +0100
Message-ID: <20220225002644.GB1672112@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20220224232159.1103756-1-aperez@igalia.com>
References: <20220224232159.1103756-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.12.1
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
Content-Type: multipart/mixed; boundary="===============2111841988991418682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2111841988991418682==
Content-Type: multipart/signed; boundary="jWERmYFePGyNtVyc"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--jWERmYFePGyNtVyc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBGcmksIDI1IEZlYiAyMDIyIDAxOjIxOjU5ICswMjAwIEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBUaGlzIGlzIGEgbWlub3IgcmVsZWFz
ZSB3aGljaCBmaXhlcyBhbiBpbnN0YWxsYXRpb24gcGF0aCBhbmQgYSBjcmFzaAo+IHdpdGggY2Vy
dGFpbiBXYXlsYW5kIGNvbXBvc2l0b3JzLiBSZWxlYXNlIG5vdGVzIGNhbiBiZSBmb3VuZCBhdDoK
PiAKPiAgIGh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlL2NvZy0wLjEyLjEuaHRtbAo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29t
Pgo+IC0tLQo+ICBwYWNrYWdlL2NvZy9jb2cuaGFzaCB8IDggKysrKy0tLS0KPiAgcGFja2FnZS9j
b2cvY29nLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKSkZUUiwgdGhpcyByZWxlYXNlIGhhcyBvbmx5IGEgY291cGxlIG9mIGZp
eGVzIGFuZCB0aGF0J3MgdGhlIHJlYXNvbiBJIGRpZG4ndApzZXQgdGhlIHN1YmplY3QgcHJlZml4
IHRvICJQQVRDSC9uZXh0IjogSSB0aGluayBpdCdzIHdvcnRoIGluY2x1ZGluZyBpbiB0aGUKbmV4
dCBzdGFibGUgdmVyc2lvbiBldmVuIGlmIHdlIG1pZ2h0IGJlIGEgYml0IGxhdGUgaW4gdGhlIGRl
dmVsb3BtZW50IGN5Y2xlCihJIGFtIHdlbGwgYXdhcmUgdGhlcmUgYXJlIGFscmVhZHkgcmVsZWFz
ZSBjYW5kaWRhdGVzISkKCklmIG90aGVycyB0aGluayBpdCdzIGJldHRlciB0byBtZXJnZSB0aGlz
IGluICJuZXh0IiwgdGhhdCdsbCBiZSBva2F5LCBidXQgdGhlbgphdCBsZWFzdCB3ZSB3b3VsZCB3
YW50IHRvIGluY2x1ZGUgYSB3b3JrYXJvdW5kIGZvciB0aGUgcGx1Zy1pbiBpbnN0YWxsYXRpb24K
cGF0aCAoc2hvdWxkIGJlIGEgb25lLWxpbmUgcGF0Y2gsIGlmIHdlIGdvIGVuZCB1cCBnb2luZyB0
aGlzIHdheSkuCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--jWERmYFePGyNtVyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYhgUNQAKCRCRxVnb5MkS
O9HfAJ9+JAxTuhekfL5lad+XBJt/Le//vwCfcQHlRarp7pavunFlYpVJiA39704=
=BIgy
-----END PGP SIGNATURE-----

--jWERmYFePGyNtVyc--

--===============2111841988991418682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2111841988991418682==--
