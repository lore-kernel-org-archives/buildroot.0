Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD0AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 10:59:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7D161507
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 10:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D7D161507
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8DC640100;
	Fri,  1 Oct 2021 10:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSFudcU17brO; Fri,  1 Oct 2021 10:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E4D40218;
	Fri,  1 Oct 2021 10:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151E51BF2C2
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0054040523
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 10:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svZyJTFFI7BT for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 10:58:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34E78403B3
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=8MF5p6pS11qPaQ1uJdJABpAcSdQqE6VugFgCm5C4Y0Y=; 
 b=hoefst5+M/uQSk+zKMdM/hxZmuRUk+qCwgRNjFtZu2heJcUMvNT7HkLSlsSMGLAYfCQ+Z8/5roOcpNacOSvKKhrEy3eYwcjx9jfuE0a+zjRnzWYoMUAicbBwIkXBj+9GIhw3ox0cbHbPv0rVmyak7j6sRYMi4UpXBhzf+gxurEHn1K5psRcCU+JQLgQyU5Yvd/luHS7TiMr+JZBwEq0Hf1Cl/uOcpD0ir4rVDs5KS27s5VD/Mxzfq10fzwBvAWuc9vPepOvmYzGXAZlitXvltw8ATASv3mcTN0NZbFy3Sk2duFAoJTA1+OriDYjN/m+pWDVkogdzGZDfcMvXkA9ukQ==;
Received: from 91-158-76-100.elisa-laajakaista.fi ([91.158.76.100] helo=momiji)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mWGFk-0000Mf-K7; Fri, 01 Oct 2021 12:58:56 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 01bd2ba0;
 Fri, 1 Oct 2021 10:58:45 +0000 (UTC)
Date: Fri, 1 Oct 2021 13:58:41 +0300
Message-ID: <20211001135841.GB1082333@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20210924105340.3514180-1-james.hilliard1@gmail.com>
References: <20210924105340.3514180-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 media-stream
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5188288522051343329=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5188288522051343329==
Content-Type: multipart/signed; boundary="seOFB1vJ+qRMKvOG"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--seOFB1vJ+qRMKvOG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgSmFtZXMsIGFsbCwKCk9uIEZyaSwgMjQgU2VwIDIwMjEgMDQ6NTM6NDAgLTA2MDAgSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+IFRoaXMgaGFzIGEg
Y29tcGlsZSB0aW1lIGRlcGVuZGVuY3kgb24gZ3N0MS1wbHVnaW5zLWJhZCBkdWUgdG8KPiB0aGUg
Y29kZWNwYXJzZXJzIGRlcGVuZGVuY3kuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlh
cmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uvd3Bld2Via2l0
L0NvbmZpZy5pbiAgICB8IDYgKysrKysrCj4gIHBhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5t
ayB8IDcgKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3ZWJr
aXQvQ29uZmlnLmluCj4gaW5kZXggMDRiMmJmM2JlYi4uZGYxYzkwMGQ5ZiAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC9D
b25maWcuaW4KPiBAQCAtMTA1LDYgKzEwNSwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VC
S0lUX01VTFRJTUVESUEKPiAgCSAgVGhpcyBvcHRpb24gcHVsbHMgaW4gYWxsIG9mIHRoZSByZXF1
aXJlZCBkZXBlbmRlbmNpZXMKPiAgCSAgdG8gZW5hYmxlIG11bHRpbWVkaWEgKHZpZGVvL2F1ZGlv
KSBzdXBwb3J0Lgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NRURJQV9TVFJF
QU0KPiArCWJvb2wgIm1lZGlhLXN0cmVhbSBzdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9XUEVXRUJLSVRfTVVMVElNRURJQQo+ICsJaGVscAo+ICsJICBUaGlzIG9wdGlvbiBlbmFi
bGVzIG1lZGlhLXN0cmVhbSBzdXBwb3J0Lgo+ICsKPiAgaWYgQlIyX1BBQ0tBR0VfV1BFV0VCS0lU
X01VTFRJTUVESUEKPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9XUEVXRUJLSVRfVVNFX0dTVFJF
QU1FUl9HTAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgYi9w
YWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiBpbmRleCA1YzVlNjYyNWY4Li45YWQ1Njlh
NDcyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+ICsrKyBi
L3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+IEBAIC00Niw2ICs0NiwxMyBAQCBXUEVX
RUJLSVRfQ09ORl9PUFRTICs9IFwKPiAgCS1ERU5BQkxFX1dFQl9BVURJTz1PRkYKPiAgZW5kaWYK
PiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01FRElBX1NUUkVBTSkseSkKPiAr
V1BFV0VCS0lUX0NPTkZfT1BUUyArPSAtREVOQUJMRV9NRURJQV9TVFJFQU09T04KPiArV1BFV0VC
S0lUX0RFUEVOREVOQ0lFUyArPSBnc3QxLXBsdWdpbnMtYmFkCj4gK2Vsc2UKPiArV1BFV0VCS0lU
X0NPTkZfT1BUUyArPSAtREVOQUJMRV9NRURJQV9TVFJFQU09T0ZGCgpUaGUgcHJvYmxlbSBJIHNl
ZSBoZXJlIGlzIHRoYXQgd2UgYXJlIGZvcmNpbmcgdG8gZGlzYWJsZSBhIGZlYXR1cmUgd2hpY2gK
d2lsZGx5IHBvcHVsYXIgd2ViIHNpdGVzIChlLmcuIFlvdVR1YmUpIHVzZSBtb3JlIGFuZCBtb3Jl
IGFuZCBiZWluZyBhYmxlCnRvIGRpc2FibGUgaXQgaXMgbGlrZWx5IHRvIGRvIG1vcmUgaGFybSB0
aGFuIGdvb2QuIFNpdGVzIHdpbGwgYnJlYWsgYW5kCnBlb3BsZSB3aWxsIHdyb25nbHkgYmxhbWUg
V1BFIFdlYktpdCA6LVwKClRoZSByaWdodCBhcHByb2FjaCBoZXJlIHdvdWxkIGJlIHRvIGJyZWFr
IHRoZSBjaXJjdWxhciBkZXBlbmRlbmN5IGlzIGRvaW5nCnR3byBwYXNzZXMgb24gdGhlIGdzdDEt
cGx1Z2lucy1iYWQgYnVpbGQ6IG9uZSBiYXNpYyBidWlsZCB3aGljaCBoYXMgdGhlCnRoaW5ncyB0
aGF0IFdlYktpdCBuZWVkcyAoaS5lLiBjb2RlY3BhcnNlcnMpLCB0aGVuIHVzZSB0aGF0IHRvIGJ1
aWxkIFdlYktpdCwKdGhlbiByZWJ1aWxkIHdpdGggYWxsIHRoZSBvcHRpb25zIGVuYWJsZWQuIFRo
aXMgc2Vjb25kIGdzdDEtcGx1Z2lucy1iYWQKYnVpbGQgd291bGQgYmUgdGhlIG9uZSB0byBpbnN0
YWxsIHRvIHRoZSB0YXJnZXQgaW1hZ2UuCgpVbmZvcnR1bmF0ZWx5LCBJIHRoaW5rIHRoZSDigJxn
b29k4oCdIHNvbHV0aW9uIGl0IGlzIG5vdCB0cml2aWFsIHRvIGFjaGlldmUKd2l0aCBCdWlsZHJv
b3QuIFdoYXQgY29tZXMgdG8gbWluZCBpcyBoYXZpbmcgYSBuZXcgZ3N0MS1wbHVnaW5zLWJhZC1t
aW5pbWFsCnBhY2thZ2Ugd2hpY2ggaXMgdXNlZCBvbmx5IGFzIGEgdGhyb3dhd2F5IGRlcGVuZGVu
Y3kgdG8gYnVpbGQgd3Bld2Via2l0LgpJZiBzb21lYm9keSBoYXMgYSBiZXR0ZXIgc3VnZ2VzdGlv
biwgSSB3b3VsZCBsb3ZlIHRvIGtub3cgOikKCj4gK2VuZGlmCj4gKwo+ICBpZmVxICgkKEJSMl9Q
QUNLQUdFX1dQRVdFQktJVF9VU0VfR1NUUkVBTUVSX0dMKSx5KQo+ICBXUEVXRUJLSVRfQ09ORl9P
UFRTICs9IC1EVVNFX0dTVFJFQU1FUl9HTD1PTgo+ICBlbHNlCj4gLS0gCj4gMi4yNS4xCj4gCgpD
aGVlcnMsCuKAlEFkcmnDoW4K

--seOFB1vJ+qRMKvOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYVbp4QAKCRCRxVnb5MkS
OxMnAJsFOvN/2MBOGWniJIk4yL0jpTd/OwCdHL0OOBBdkn5OpzUYmfuooCpU8LY=
=k5UM
-----END PGP SIGNATURE-----

--seOFB1vJ+qRMKvOG--

--===============5188288522051343329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5188288522051343329==--
