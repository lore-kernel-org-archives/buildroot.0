Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC7FC433FE
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 23:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025DB60E78;
	Sun, 15 May 2022 23:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoKxEGmrjO6p; Sun, 15 May 2022 23:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFBC460B2C;
	Sun, 15 May 2022 23:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6DDB1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 23:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B532B40408
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 23:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cosmos-ink.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3bJd1keF6hy for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 23:56:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net [95.217.104.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 501F7401ED
 for <buildroot@buildroot.org>; Sun, 15 May 2022 23:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 438331C5B139; Mon, 16 May 2022 01:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652659003;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-language:in-reply-to:references;
 bh=qlIjk4sll269TdxfSOm0m2EaS9q6/RG6GMVX8qWDiF4=;
 b=fqf3AOEIC45Zj6qpLMve7g7DHB8wvmXvRk9Trguzl5flpiKeiXn32FAo4gvU84h6JB3STQ
 XBUs62oPqX+ror4Gb43ASAMwcnbxy6xdrlHggAo3iHED9Fw1pHoKg9f9md1X4PK60rvVE3
 k2U8tsL4rxBOBl0cs3siiaI6LRhlIoCBEGITEF5UvQcFie3FTV6vjfGufxcIlHzftgoKS7
 GLzifn2iiJCsEEa48YnemIei1yaPbqqOzHzKeIkbyVeOudVFtIMfHGaPJgIBKqqn6dfrAp
 z7eiMY6Jt6IVMZ8bzh5wMnRok5R+c9bIUYjwOgXLdpIu3XAxDLX5m/l08BIHbw==
Message-ID: <5027e8d8-02e3-b5ed-e1a6-8f9804d68d68@cosmos-ink.net>
Date: Mon, 16 May 2022 01:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220515145441.3682-1-linus@cosmos-ink.net>
 <20220515205235.GG1597494@scaer>
In-Reply-To: <20220515205235.GG1597494@scaer>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: add more options to
 customize creation
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
From: Linus via buildroot <buildroot@buildroot.org>
Reply-To: Linus <linus@cosmos-ink.net>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1742163456107794846=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1742163456107794846==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Op3PvOk0KY05bIkcmifAEU2N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Op3PvOk0KY05bIkcmifAEU2N
Content-Type: multipart/mixed; boundary="------------g0Pp39t7U1iC7MJoUAY3EMSN";
 protected-headers="v1"
From: Linus <linus@cosmos-ink.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <5027e8d8-02e3-b5ed-e1a6-8f9804d68d68@cosmos-ink.net>
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: add more options to
 customize creation
References: <20220515145441.3682-1-linus@cosmos-ink.net>
 <20220515205235.GG1597494@scaer>
In-Reply-To: <20220515205235.GG1597494@scaer>

--------------g0Pp39t7U1iC7MJoUAY3EMSN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWWFubiwgQWxsLA0KDQo+IFR3byBjaGFuZ2VzLCB0d28gcGF0Y2hlcy4gOy0pDQpObyBw
cm9ibGVtLiBUaG91Z2h0IHRoZSB0d28gY2hhbmdlcyB3b3VsZCBiZSBmaW5lIGFzIG9uZS4N
CldpbGwgc3BsaXQgdGhlbS4NCg0KIyMgQmxvY2tzaXplDQoNCj4gU28sIEkgdGhpbmsgdGhp
cyBpcyBnb29kIHRvIGhhdmUgdGhvc2UgYWRkaXRpb25hbCBvcHRpb25zLCBob3dldmVyIEkN
Cj4gdGhpbmsgd2Ugc2hvdWxkIHJlc3RyaWN0IHRoZW0uIEZvciBleGFtcGxlLCBhcmJpdHJh
cnkgc3RyaW5nIG9wdGlvbnMgaXMNCj4gbm90IHZlcnkgbmljZS4NCj4NCj4gSW5zdGVhZCwg
aGVyZSdzIHdoYXQgSSBzdWdnZXN0Og0KPiBbLi4uXQ0KSSBoYXZlIGFscmVhZHkgcHJlcGFy
ZWQgdGhlIHBhdGNoIGZvciBibG9ja3NpemUsIHVzaW5nIGNob2ljZXMNCmZyb20gNGssIDhr
LCAuLi4sIDUxMmssIDEwMjRrLiBUaGF0IG9uZSBzaG91bGQgYmUgcHJldHR5IHN0cmFpZ2h0
DQpmb3J3YXJkLg0KDQpJIGFsc28gZmluZCAxayB0byBiZSBwcmV0dHkgcmlkaWN1bG91cy4g
Tm90IGV2ZW4gc3VyZSBpZiBpdCB3b3VsZA0Kd29yay4gVGhpcyBzaXplIHNlZW1zIHRvIGJl
IHByZXR0eSBvbGQgYW5kIGFsc28gb25seSBzdGFydCBhdCA0azoNCmh0dHBzOi8vdGxkcC5v
cmcvSE9XVE8vU3F1YXNoRlMtSE9XVE8vbWtzcW92ZXJ2aWV3Lmh0bWwNCg0KSSd2ZSB1c2Vk
IHRoZSBzYW1lIHN0eWxlIHRoYXQgd2FzIHVzZWQgZm9yIHNwZWNpZml5aW5nIHRoZSBjb21w
cmVzc2lvbi4NCk5vdCBzdXJlIHdoZXRoZXIgdGhlIGxhdGVyIHN0cmluZyB3aXRob3V0IGEg
bmFtZSBpcyBoaWRkZW4sIGJ1dCBJJ3ZlDQpzbyBmYXIgbmV2ZXIgZW5jb3VudGVyZWQgdGhh
dC4gSSBjYW4gYWRkIHRoaXMgb2YgY291cnNlIGlmIHRoaXMgaGFzDQpzb21lIGJlbmVmaXQg
KG1heWJlIGJlaW5nIGFibGUgdG8gc3BlY2lmeSBhIHNwZWNpZmljIHNpemUgaW4gcmF3DQpj
b25maWcgdmFsdWVzPz8pLg0KDQojIyBDb21wcmVzc2lvbg0KDQpGb3IgdGhlIGNvbXByZXNz
aW9uIGFyZ3VtZW50cywgSSdtIHVwIHRvIGFueXRoaW5nIGhlcmUgYXMgd2VsbC4NCkknbSBu
b3Qgc3VyZSBpZiB3ZSBzaG91bGQgdXNlIGFsbCBleHRyZW1lIG9wdGlvbnMgYnkgZGVmYXVs
dA0KDQo+IEFsc28gbm90ZSB0aGF0IGx6NCBhbHJlYWR5IHVzZXMgLVhoYyB1bmNvbmRpdGlv
bmFsbHksIGFuZCBjb21taXQNCj4gICAgICAwN2UzN2JjYzQyZiBub3RlcyB0aGF0IGFuIGV4
dHJhIG9wdGlvbiB3YXMgZHJvcHBlZCwgc28gbWF5YmUgd2UNCj4gICAgICBzaG91bGQganVz
dCB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlIGFsbCB0aG9zZSBvcHRpb25zIHdoZW4gcG9zc2li
bGU/DQoNClNlZW1zIGxpa2UgYSBlYXN5IHdheSB0byBjb25mdXNlIHBlb3BsZSBvciBjYXVz
ZSBlcnJvcnMgc2hvdWxkDQphIG9wdGlvbiBzb21laG93IG1ha2UgcHJvYmxlbXMuIE9yIGlz
IGl0IGEgbWFqb3IgcHJvYmxlbSB0byBicmVhaw0KdGhlIGFzc3VtcHRpb24gdGhhdCBvbmx5
IGx6NCBpcyBhbHJlYWR5IG9wdGltaXplZD8NCg0KPiAgICAtIGZvciB0aGUgY29tbnByZXNz
aW9uIG9wdGlvbnMsIEkgdGhpbmsgYSBnZW5lcmljIGJvb2xlYW4gd291bGQgYmUNCj4gICAg
ICBiZXR0ZXI6DQpJIGFncmVlIHdpdGggdGhhdC4gV2lsbCB0cnkgdG8gZ2V0IHRoaXMgZG9u
ZSB0b21vcnJvdyBhbmQgZG8gYSBjb3VwbGUNCm9mIHRlc3RzIHRvIGVuc3VyZSB0aGVyZSBh
cmUgbm8gb2J2aW91cyBwcm9ibGVtcy4NCg0KIyMgSW4gY29uY2x1c2lvbg0KDQpJZiB0aGF0
J3Mgb2theSB3aXRoIHlvdSBJIGNhbiBwcmVwYXJlIGEgcGF0Y2gtc2V0IHRvbW9ycm93IGFu
ZA0Kc2VuZCB0aGVtIGluIGZvciByZXZpZXcgKGhvcGVmdWxseSBhbHNvIHRvbW9ycm93KS4N
Cg0KR3JlZXRpbmdzLA0KTGludXMgS2FzY2h1bGxhDQoNCg==

--------------g0Pp39t7U1iC7MJoUAY3EMSN--

--------------Op3PvOk0KY05bIkcmifAEU2N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWBBDrQEf5WmoR7mj8vKwZKh6i8QFAmKBkzkACgkQ8vKwZKh6
i8Tb3ggAhq44hJHb5AdQwQXl2SMDCYYpPGycXLKYW96aJUzchyy0De331vUksrEv
2Ped7g1GlyHQs+DYt2V4FobljnCVJEf1u5V4VKE563xsWG8UEmOfeThEDy72NPxY
90zqm74mWCZkPxbay2r0FBcr4r9HezULA31/D1ZbkMAkeqJnCx5RdBlSFEr4R5Ta
ukbuQ+we4jVqDwlIQLwOxU2Y7+Ut+3Sp9NOEBO4BZiJMmIMmOm8fzkLge9voNLJl
LPe5AIfix3GvrzwqpVi9pm/NhK4qHfOnjsWNS4CCSUMq3pckboCIiW/dIeS4mMQj
0Kd894LU3Wsz+moJE0ooV5Xq8vXaYw==
=j2HJ
-----END PGP SIGNATURE-----

--------------Op3PvOk0KY05bIkcmifAEU2N--

--===============1742163456107794846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1742163456107794846==--
