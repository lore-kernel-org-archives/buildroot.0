Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5183C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 11:23:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E34BC60F92
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 11:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E34BC60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1CE560841;
	Sun, 10 Oct 2021 11:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtZnwfHzXZod; Sun, 10 Oct 2021 11:23:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1882D6079D;
	Sun, 10 Oct 2021 11:23:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C186F1BF21A
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 11:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF31C40522
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 11:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3AryRR75MtN for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 11:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A0F2404CA
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=e85fAElWCmon5XFliOc5OjC5zn5yGv8919QDkdG5cGQ=; 
 b=axqfNzfTs5WZIxyU0i2eBCZ8echYcFXza1E5VEaTG9tEt0rIwErIirzOWwaZ30CqklhjaK0Qg62xlrobo/IU9JxxkdzSxVQG5kGnzuddpI7myU5GSeFImNpAGLjRJMtf8wfx6GOE9z37W+/CcCOb5PV8zJBwjiY/33zUZjJ49ukt9dM/C+vc7nPSpvi+p/I7r4mFTi7HYdzUT9EipwIW2Tkj3o2m398HxG2dhlgcn/nQKp8mjV+SCx+6IEmefmLeVSVaVPE4XwvxS2IfPcFjBZ4ZJphJ3wS/ToHrF4QjJ4aG2J3NodO2HZOgVS5joKkNIipmJM8UMJKE18iYgucr1A==;
Received: from 42.232.60.213.dynamic.reverse-mundo-r.com ([213.60.232.42]
 helo=momiji) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mZWux-0004O5-9Q; Sun, 10 Oct 2021 13:22:59 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id a965eca6;
 Sun, 10 Oct 2021 11:22:49 +0000 (UTC)
Date: Sun, 10 Oct 2021 13:22:49 +0200
Message-ID: <20211010132249.GB2046@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <6c16498a-c426-c0a3-f1e0-050a402291cd@mind.be>
References: <20210924105340.3514180-1-james.hilliard1@gmail.com>
 <6c16498a-c426-c0a3-f1e0-050a402291cd@mind.be>
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
Content-Type: multipart/mixed; boundary="===============7602249951327986875=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7602249951327986875==
Content-Type: multipart/signed; boundary="j53d2YGqJF7fPqEw"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--j53d2YGqJF7fPqEw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBXZWQsIDA2IE9jdCAyMDIxIDIxOjEyOjM3ICswMjAwIEFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6CiAKPiBPbiAyNC8wOS8yMDIxIDEyOjUzLCBKYW1l
cyBIaWxsaWFyZCB3cm90ZToKPiA+IFRoaXMgaGFzIGEgY29tcGlsZSB0aW1lIGRlcGVuZGVuY3kg
b24gZ3N0MS1wbHVnaW5zLWJhZCBkdWUgdG8KPiA+IHRoZSBjb2RlY3BhcnNlcnMgZGVwZW5kZW5j
eS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20+Cj4gCj4gICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+IAo+ICAgQXMg
SmFtZXMgbWVudGlvbmVkLCB0aGUgY3VycmVudCBzaXR1YXRpb24gYWxyZWFkeSBpcyB0aGF0IHdw
ZXdlYmtpdCBpcyAKPiBjb21waWxlZCB3aXRob3V0IG1lZGlhc3RyZWFtIHN1cHBvcnQuIFNvIGFs
dGhvdWdoIHRoaXMgaXMgbm90IGEgcGVyZmVjdCAKPiBzb2x1dGlvbiwgaXQncyBhdCBsZWFzdCBh
IHN0ZXAgZm9yd2FyZC4KClJpZ2h0LCBJIHdhcyB1bmRlciB0aGUgKGVycm9uZW91cykgaW1wcmVz
c2lvbiB0aGF0IHdlIHdlcmUgZW5hYmxpbmcKbWVkaWEtc3RyZWFtIGJ5IGRlZmF1bHQgaW4gdGhl
IGJ1aWxkIHN5c3RlbS4gVHVybnMgb3V0LCB0aGF0IGlzIG9ubHkKdHJ1ZSBmb3IgZGV2ZWxvcGVy
IGJ1aWxkcy0tSSBzaG91bGQgaGF2ZSBkb3VibGUgY2hlY2tlZCBpbnN0ZWFkIG9mCnJlbHlpbmcg
b24gbXkgc2xlZXB5IGJyYWluIDpdCgpUaGFua3MgSmFtZXMgZm9yIHRoZSBwYXRjaCwgYW5kIEFy
bm91dCBmb3IgbWVyZ2luZyBpdCEKCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--j53d2YGqJF7fPqEw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYWLNCQAKCRCRxVnb5MkS
O54/AJ9FLNmbiCzT45YibejtXyMHh6YGowCbBZkDo21yAVT4Ro2dG0NViXyZkaQ=
=ZMgh
-----END PGP SIGNATURE-----

--j53d2YGqJF7fPqEw--

--===============7602249951327986875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7602249951327986875==--
