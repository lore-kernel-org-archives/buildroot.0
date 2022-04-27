Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D392C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 08:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E5A82CDE;
	Wed, 27 Apr 2022 08:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BP7aFFMgARd0; Wed, 27 Apr 2022 08:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1AF98261C;
	Wed, 27 Apr 2022 08:22:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E831F1BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D556141938
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jEWJA2pD7Ea for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 08:22:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B696C418AB
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SO2q1M0cuymuYlsKOABxF8l3BSz4H8CpvqgQfRbwUFE=; b=BL5u0SGrYyW4eY0Fl8U/un9Xdm
 UlsMRj7CS1QAdaP6CM8cO0iM3GLOetETms++FXJP8girfxH1G2U7bT97Cfa5pDUmhrL7x3zQMQpnx
 ABUPKcCUwsDbkFBSFl+iCFHSFIywJNaqloakcOP57195GmSHfyademJfn6ePjg/BeKCnGxBEDtagf
 jXpEg41WLjpvgn2ivxwzociT6ua6ae/jqkjSKD8tBIK3lJyiZ/CnybS1ZLk5AD6dIc8P3AF4MJrn5
 VALuyOVA28nadfrn2N91wCLrRQORYFcr0ns7F8QLlIRo9G8JIHcpX2KAJMNCJuRMkF5H1mQ8QLrKm
 iK80UI7A==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1njcwD-00034Q-36; Wed, 27 Apr 2022 10:22:17 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 22d672c6;
 Wed, 27 Apr 2022 08:22:06 +0000 (UTC)
Date: Wed, 27 Apr 2022 11:22:01 +0300
Message-ID: <20220427112201.GB584565@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220427044100.5EBFF60E53@smtp3.osuosl.org>
References: <20220427044100.5EBFF60E53@smtp3.osuosl.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-04-26
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
Content-Type: multipart/mixed; boundary="===============9222252745665546150=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9222252745665546150==
Content-Type: multipart/signed; boundary="AUrAxMB3Ed72bx/B"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--AUrAxMB3Ed72bx/B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBXZWQsIDI3IEFwciAyMDIyIDA0OjQwOjU1ICswMDAwIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBEZXRh
aWwgb2YgZmFpbHVyZXMgZm9yIG1hc3Rlcgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gCj4gICAgIGFyY2ggICAgIHwgICAgICAgICAgICAgcmVhc29uICAgICAgICAgICAgIHwgT0s/
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cmwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IG9ycGg/Cj4gLS0tLS0tLS0tLS0tLSstLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLQo+Cj4gWy4uLl0KPgo+ICAgICBtNjhrICAgICB8ICAgICAgICAgIGJyb3RsaS0xLjAu
OSAgICAgICAgICB8IE5PSyB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRz
LzJmMjIyZDVhODZiNDIzN2I4MWNhMzFkYmE4OWY1OGIwZTZlODc5ZGIgfCAgICAgCgpBcyB3aXRo
IHByZXZpb3VzIG02OGsgcmVsYXRlZCBmaXh1cHMsIHRoaXMgY2FuIGJlIHdvcmthcm91bmRlZCBi
eQpzd2l0Y2hpbmcgZnJvbSAtTzIgKHByb2JsZW1hdGljKSB0byAtT3MgKGFuZCBnZW5lcmF0ZWQg
Y29kZSBzdGlsbApsb29rcyByZWFzb25hYmx5IGdvb2QgdG8gbWUsIHRob3VnaCBJIGFtIHZlcnkg
ZmFyIGZyb20gYmVpbmcgYW4KZXhwZXJ0IHdpdGggdGhpcyBhcmNoaXRlY3R1cmUpLgoKRml4IHN1
Ym1pdHRlZCBoZXJlOgoKICBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjIwNDI3MDgxNzQ0LjExNjc2Ni0xLWFwZXJlekBpZ2FsaWEuY29tLwoK
CkNoZWVycywK4oCUQWRyacOhbgo=

--AUrAxMB3Ed72bx/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYmj9KQAKCRCRxVnb5MkS
O7zuAJ9iHP6Z+mriuje5OfMKiPWrKqztygCdH+FoJSHYruuusuDAvGwFkXwmQHs=
=VVyt
-----END PGP SIGNATURE-----

--AUrAxMB3Ed72bx/B--

--===============9222252745665546150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9222252745665546150==--
