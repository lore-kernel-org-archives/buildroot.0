Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF4BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 10:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F3961A6F
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 10:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09F3961A6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A5A140146;
	Fri,  1 Oct 2021 10:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhJcBp_JbBxL; Fri,  1 Oct 2021 10:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EEDE4021A;
	Fri,  1 Oct 2021 10:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43BC71BF2C2
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 10:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4010A843BD
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 10:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WlQXqEDe4oKQ for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 10:31:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 686C08437D
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=IMYNr4gNANaPATPBfi/Ps1lySKDr73xriDlJjLusV1o=; 
 b=ez+sm/eBqb5KuRD+MuaYyemhE+Wy7k9DlxMr84YaMP7VdWfgE4mogP13pFoBSKezjjXgVozgBmqNBP4o4Bre/YgcVDY6fCiq/PDX97dW4IU6gtRgXWV5vv/GkUDfxXlxbK1cMggFJfm64Ejcn//3FT2fBUaw35z9n3AaGDPhAvF3yntW2lXGwb1ghQdZtVYzDEF35DfOO1EtYx9uLeHFGl2+uVIm2LXdDIYlOcnH/CyWnvV04F+y1SsqEvornniWdlBWR6FeRHrGxnlPgFXXOpvQ36ykXvItleByVAPiKU/R5yIG1n0FkiIPI6pL0+CrFIEa2IKFatRQW67DbZrePw==;
Received: from 91-158-76-100.elisa-laajakaista.fi ([91.158.76.100] helo=momiji)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mWFow-0006Fe-2n; Fri, 01 Oct 2021 12:31:14 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 3d2cc581;
 Fri, 1 Oct 2021 10:26:03 +0000 (UTC)
Date: Fri, 1 Oct 2021 13:25:59 +0300
Message-ID: <20211001132559.GC1057162@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20210924124525.168298-1-james.hilliard1@gmail.com>
References: <20210924124525.168298-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: remove
 gst1-plugins-good from dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Normand <philn@igalia.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2818272532242157317=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2818272532242157317==
Content-Type: multipart/signed; boundary="o+5mEOJRudUq3A/m"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--o+5mEOJRudUq3A/m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAyNCBTZXAgMjAyMSAwNjo0NToyNSAtMDYwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gVGhpcyBpcyBvbmx5IGEgcnVudGltZSBkZXBl
bmRlbmN5IG5vdCBhIGJ1aWxkIGRlcGVuZGVuY3kuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQWRyaWFu
IHBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL3dw
ZXdlYmtpdC93cGV3ZWJraXQubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93
cGV3ZWJraXQubWsgYi9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiBpbmRleCA1YzVl
NjYyNWY4Li41MDcxNGI0MzY2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdl
YmtpdC5tawo+ICsrKyBiL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+IEBAIC0zOSw3
ICszOSw3IEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01VTFRJTUVESUEpLHkpCj4g
IFdQRVdFQktJVF9DT05GX09QVFMgKz0gXAo+ICAJLURFTkFCTEVfVklERU89T04gXAo+ICAJLURF
TkFCTEVfV0VCX0FVRElPPU9OCj4gLVdQRVdFQktJVF9ERVBFTkRFTkNJRVMgKz0gZ3N0cmVhbWVy
MSBnc3QxLWxpYmF2IGdzdDEtcGx1Z2lucy1iYXNlIGdzdDEtcGx1Z2lucy1nb29kCj4gK1dQRVdF
QktJVF9ERVBFTkRFTkNJRVMgKz0gZ3N0cmVhbWVyMSBnc3QxLWxpYmF2IGdzdDEtcGx1Z2lucy1i
YXNlCj4gIGVsc2UKPiAgV1BFV0VCS0lUX0NPTkZfT1BUUyArPSBcCj4gIAktREVOQUJMRV9WSURF
Tz1PRkYgXAo+IC0tIAo+IDIuMjUuMQo+IAoKV2Ugc2hvdWxkIGRvIHRoZSBzYW1lIGVkaXQgaW4g
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rIDopCgoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--o+5mEOJRudUq3A/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYVbiNwAKCRCRxVnb5MkS
O4xFAJ9B3dg/01R5HcLKE/jZJIPjvx7+SwCdEneL+glH4fdQpBO+otKsGKiUfIg=
=Pg4c
-----END PGP SIGNATURE-----

--o+5mEOJRudUq3A/m--

--===============2818272532242157317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2818272532242157317==--
