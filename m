Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88949C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 21:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD0966FE9B;
	Thu, 13 Apr 2023 21:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD0966FE9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDHPEZjILFBG; Thu, 13 Apr 2023 21:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122166FE95;
	Thu, 13 Apr 2023 21:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 122166FE95
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D287D1C3AFB
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 21:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6BBF42732
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 21:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6BBF42732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRu17g0aJKgj for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 21:54:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458A542710
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 458A542710
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 21:54:50 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pn4ty-000FdA-CP; Thu, 13 Apr 2023 23:54:46 +0200
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 92f1f4d1;
 Thu, 13 Apr 2023 21:54:38 +0000 (UTC)
Date: Fri, 14 Apr 2023 00:54:34 +0300
Message-ID: <20230414005434.GB370828@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <CACXRmJjkgX6iek7DyuqDbc29QF+N0ALjS5w7qfPEaU=O-fmw+A@mail.gmail.com>
References: <CACXRmJjkgX6iek7DyuqDbc29QF+N0ALjS5w7qfPEaU=O-fmw+A@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PemgqaXG9mOPPVaHdcqetcsIZsmD8/YQcAHRZDHiZHY=; b=r/DGsPHafr20euBtU0RyBMpZlU
 lHbz7D7CH424hQRK6ggsFC28zw6ZkEIggf5Z7kpuqhmTAGYqNk0LXOGgTgst3603VseLF4zq4jB4s
 d+CW2aYYiD8xfAEkL0Dvyu4SHKAwkU0djmvAXAjqGzLR/04W7wAJZYGW0++EXl30/GsNMfpg3ARGn
 0HcFcrnIJHi/fcnq/lFccpH9UFzKw9wqssXBfqQdUFIi4SRw9sS7KPvzv4yE+iGXazKWBpvjenjJG
 VLb+oZ+M1eCjiYEbLPYknKsxqnKxhpKiFBd74wx8lMXlLggcNak2GqcA+oErALQA81gCxAcWT+Ppc
 5fdJkmyA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=r/DGsPHa
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: allow both X11 and
 Wayland
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
Content-Type: multipart/mixed; boundary="===============4075054552165188058=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4075054552165188058==
Content-Type: multipart/signed; boundary="NWNJp2XjSaA0zbn0"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--NWNJp2XjSaA0zbn0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLAoKT24gVGh1LCAxMyBBcHIgMjAyMyAyMzoxNDoyMyArMDIwMCBUaG9tYXMgRGV2
b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiBJIGhhdmUgYSBzZXJpZSBvZiBw
YXRjaGVzIHdoaWNoIGFyZSBzdGlsbCBvcGVuLCByZWxhdGVkIHRvIHRoYXQgYXRrIGJyaWRnZS4K
PiAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3Qv
P3Nlcmllcz0zNDM4MDEKCkFoLCBpbnRlcmVzdGluZywgSSB3aWxsIHRha2UgYSBsb29rIHRvbW9y
cm93LgogCj4gSSB3YXMgYWxzbyBwbGFubmluZyB0byBtYWtlIGEgcGF0Y2ggd2l0aCB3ZWJraXRn
dGsgMi40MCwgYnV0IGRpZG4ndCBkbyB0aGF0Cj4gc2luY2UgbXkgb3RoZXIgcGF0Y2hlcyBhcmVu
J3QgbWVyZ2VkIHlldC4gSWYgeW91IGRvIGl0LCBrbm93IHRoYXQgSSBhbHJlYWR5Cj4gdXBzdHJl
YW1lZCB0aGUgaG9zdC11bmlmZGVmIHBhY2thZ2UgYW5kIHRoYXQgdGhlIG1pbmltdW0gcmVxdWly
ZWQgR0NDCj4gdmVyc2lvbiBuZWVkIHRvIGJlIGJ1bXBlZCBhcyB3ZWxsLgoKTmljZSwgeW91IHNh
dmVkIG1lIGZyb20gaGF2aW5nIHRvIGRvIGhvc3QtdW5pZmRlZiBteXNlbGYuIEkgaGF2ZSBhbHJl
YWR5IGEKcGF0Y2ggWzFdIGZvciB0aGUgMi40MC4wIHVwZGF0ZSwgd2hpY2ggaXMgbm93IHJlY2Vp
dmluZyBhIHJvdW5kIG9mIHRlc3RpbmcKYmVmb3JlIEkgc3VibWl0IGl0IDopCgpDaGVlcnMsCuKA
lEFkcmnDoW4KCi0tLQpbMV0gaHR0cHM6Ly9naXQuc3IuaHQvfmFwZXJlemRjL2J1aWxkcm9vdC9j
b21taXQvMTVlM2ZmZWFiZWM1MTVmMDcxMDgwNzk2NjBhMjZhYmEwMjVhMzlmNgo=

--NWNJp2XjSaA0zbn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZDh6GgAKCRCRxVnb5MkS
Ox23AJ47zGc2Zvf7Asf5+0wCaskeKO0kSgCfWecw+wqNidyM1/GnqsQeIUk0j90=
=qNor
-----END PGP SIGNATURE-----

--NWNJp2XjSaA0zbn0--

--===============4075054552165188058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4075054552165188058==--
