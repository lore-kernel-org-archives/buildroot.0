Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CE4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 20:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD3F040523;
	Wed, 24 Nov 2021 20:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CP1vOYPHn3wO; Wed, 24 Nov 2021 20:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18450404FD;
	Wed, 24 Nov 2021 20:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 609721BF4E2
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50AF080B86
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 20:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yW7dF3gUrc5Z for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 20:58:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A696080B49
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uNbqyql88CcZr5W5DZzkgAAePId/HnBuviUQVfYzALA=; b=B+/3rW8B9fMTd6GR4DgTO/9/r8
 FBj5J76f2dz/Xxh21U87iJ6eTmMY/0kZBR0EjCVTzr9B4hCGtr7kEQe9UmmW+v48VQVQxHgJIM16a
 RGB4tXmxTj4GgwGh+Ex14nIlYXAL/skQ6gsiufnhWGlHGpix9avDVwvL4Us1i8dt/3jGt6xVGRZdF
 x/m9N/ZJg2HQaI9YOS8t9eWezVIzF2Kugh2SFFdoS1LewZgOgmo68KS92JilTq9Zy4mNTfoBW7fFa
 GGPLVEIWYkaEyUgqQ6ES8X7kfBRBAUKBXOuyoAZRDyThwL4xyRgsr6NSgSQuuxW1v5iD1HCBb4VNv
 s4/R+iUA==;
Received: from 91-152-140-142.elisa-laajakaista.fi ([91.152.140.142]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1mpzLX-0003c5-Jz; Wed, 24 Nov 2021 21:58:27 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 7fc44c58;
 Wed, 24 Nov 2021 20:58:17 +0000 (UTC)
Date: Wed, 24 Nov 2021 22:58:17 +0200
Message-ID: <20211124225817.GB860036@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20211124205607.3021277-1-aperez@igalia.com>
References: <20211124205607.3021277-1-aperez@igalia.com>
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
Content-Type: multipart/mixed; boundary="===============2743827004260965827=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2743827004260965827==
Content-Type: multipart/signed; boundary="Qw0orMSi3YkznL/m"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--Qw0orMSi3YkznL/m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAyNCBOb3YgMjAyMSAyMjo1NjowNyArMDIwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cgo+IFVwZGF0ZSB0byB0aGUgdGhlIG5leHQgbWlu
b3IgcmVsZWFzZSwgd2hpY2ggZml4ZXMgYW4gc2Nyb2xsaW5nIGlzc3VlIGFuZAo+IGluY29ycG9y
YXRlZCBhIHBhdGNoIHRoYXQgY2FuIG5vdyBiZSByZW1vdmVkIGZyb20gQnVpbGRyb290LiBSZWxl
YXNlCj4gbm90ZXM6Cj4KPiBbLi4uXQoKR2FoISBJIGZvcmdvdCB0byBtYWtlIEdpdCB3cml0ZSAi
UEFUQ0gvbmV4dCIgaW4gdGhlIHN1YmplY3QgbGluZS4gWXVwLCB0aGlzCnBhdGNoIGlzIGZvciB0
aGUgIm5leHQiIGJyYW5jaCBPOi0pCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--Qw0orMSi3YkznL/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYZ6naQAKCRCRxVnb5MkS
OzYgAJ9uyWEorYWpgjtD7Zzvdw+77kzymwCfZjUXFGIaChUcOWenpP1YzgrU41w=
=H5vV
-----END PGP SIGNATURE-----

--Qw0orMSi3YkznL/m--

--===============2743827004260965827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2743827004260965827==--
