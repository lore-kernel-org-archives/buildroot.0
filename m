Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33CEC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 07:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7348940312;
	Mon, 29 Jul 2024 07:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15Lw9h2B3HSs; Mon, 29 Jul 2024 07:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25BCC40398
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BCC40398;
	Mon, 29 Jul 2024 07:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93B9B1BF267
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 07:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 800068115F
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 07:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3VnH1phbmrr for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 07:07:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=marcus.folkesson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B7AB80CB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B7AB80CB8
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B7AB80CB8
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 07:07:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so4748256e87.2
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 00:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722236856; x=1722841656;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IMtkF07cHC5glpwTKHZgUhvGC9yFdxsf98UVGv+ZnI=;
 b=CBxITwvWdulcBMeU2fNIEgC+26TTQ9SZ1yUwRmDsJh/H2OxROG4SspPeEA2sqV5Fmh
 GPB3o8PQbgqcZuLZGwmwIaqcqijKVwtJGpEK2hvpNmoEQTvJb4xYCNjonA2XrtISgAc8
 b0DST0WOyuRf1JZSPvoq1G6jGlmjGtmpAXpgpJE2npy3xhA9mVOGJ7ZBL9aLV1tKtUQs
 ggVDoapSigpPJx1aY6ACKZ1byyeCjlYI++VralT6gmsYs9paicQWHaWF1a7xB0BwkI5g
 cBqH/Eoa1KLbX0EJ7SesPES72c9TB7YoAmpvC38k65V+06OlwzyiEiGCPtTwzfRtIh2z
 SuOA==
X-Gm-Message-State: AOJu0YyxU+kwJM8Tpr1wkEALXf/OE9AYzF0TXkmRwPPK4cRkpzoAswr4
 +8mei0uJHnAuMHW4M73Hbj6V/AI+MNmqPG5ok6OTmmkFQChk3X7K
X-Google-Smtp-Source: AGHT+IFdwSJSb/Ipj1jkSU8JDCzbyMwnN3f8i3vLDgLQ3kgzbtw2PijYiZ/une5rpRe5RVkXhNpDMw==
X-Received: by 2002:ac2:4c05:0:b0:52c:f55d:44a3 with SMTP id
 2adb3069b0e04-5309b27bf42mr5170134e87.19.1722236855555; 
 Mon, 29 Jul 2024 00:07:35 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19a40sm1369534e87.199.2024.07.29.00.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 00:07:35 -0700 (PDT)
Date: Mon, 29 Jul 2024 09:07:33 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zqc_tZukfxHNkgvN@gmail.com>
References: <20240723171435.1231918-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240723171435.1231918-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722236856; x=1722841656; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7IMtkF07cHC5glpwTKHZgUhvGC9yFdxsf98UVGv+ZnI=;
 b=L8LT9amKkOkR/a+NhZNXKRvXf07FTZD31+oE/1bKYnvcgLqcAcNJOTdco1uJweGCnv
 eNCplHFjJBgA8KtYL0vMIS+jUg7DMJczZ/idTutuVbltPZ+FyNge2qOZkl6k33CB5WkY
 qDHAsF2/u7rIfpxwPpVNmB38+hvvcoShwuf37o4o5UyLKdvqeNySPmLnKDxzqSCB69aM
 9HEtRSa2JhBWNGVH05NjeUwIPN3dK7incOZP7yw/8rU9Y5jJMrOrzwCMOUi9w6dzxrMt
 hGqPc25m7losfMTF0YKqSFl0dyCReqWe0A9wSpJmH8bX42qG3OeX9kugGd3tKu5HYWbF
 E19g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=L8LT9amK
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera-apps: bump to version
 1.5.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2529112075757987851=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2529112075757987851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sJbNJk2A94+zAuef"
Content-Disposition: inline


--sJbNJk2A94+zAuef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fabrice,

On Tue, Jul 23, 2024 at 07:14:35PM +0200, Fabrice Fontaine wrote:
> - Use official tarball
> - Switch to meson-package
> - libcamera-apps unconditionally uses linux/dma-heap.h since version
>   1.3.0 and
>   https://github.com/raspberrypi/rpicam-apps/commit/11338687635cc5564c348=
c2f60c8c58c5779151d
>   which is only available since kernel >=3D 5.5 and
>   https://github.com/torvalds/linux/commit/a69b0e855d3fd278ff6f09a23e1edf=
929538e304
> - This bump will fix the following build failure raised since bump of
>   libcamera to version 0.3.0 in commit
>   82efc2faa923e8881748738963be1fbe3cb2bb45:
>=20
> /workdir/instance-1/output-1/build/libcamera-apps-1.2.1/core/libcamera_ap=
p.cpp: In member function 'void LibcameraApp::ConfigureViewfinder()':
> /workdir/instance-1/output-1/build/libcamera-apps-1.2.1/core/libcamera_ap=
p.cpp:327:25: error: 'class libcamera::CameraConfiguration' has no member n=
amed 'transform'
>   327 |         configuration_->transform =3D options_->transform;
>       |                         ^~~~~~~~~
>=20
> It shall be noted that upstream changed its name from libcamera-apps to
> rpicam-apps perhaps the package shall also be renamed on buildroot side
>=20
> Fixes: 82efc2faa923e8881748738963be1fbe3cb2bb45
>  - http://autobuild.buildroot.org/results/18bb6d9c88c1a813a350658b2512937=
44e161916
>=20
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---

Unfortunately, I've currently no setup to test it, but the patch is LGTM.

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--sJbNJk2A94+zAuef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmanP7AACgkQiIBOb1ld
UjKt+A//UIaEN7H1X+8U4PQdS8W1Suv0dLHSoPojfGz5OIWTQrOxida4adAa6y13
xhPgJyIwDk5JdIYlk92+xzdmgTyKju81H99L/brLOMmz6V348jkDKRPs2kt7YRjO
FgrkTYnTUYfz7TFFxH4qareFAE1MDyzzBvUt3x9TTo5+Bj9dVBXae1wx0QR2YkTw
3be/zaCqiEmH2hqqJBBVOaRxFX6V7/Ws4hHB5P3whAw7o2iOPx1cjwaCZbnlG57E
DFCoL4kPiedTMOc9D2r7EwbhqDARIzXhLhAMlrGidbYfzErpup+RQlO/Bne4Eckp
HtZ6O8nSC3bzDZoKM/V6OSHRhXQmBiVBx8AhxJ1dS1sO1k8xqdpnoLfIhZ8CoCA9
9cXSuDRe/LhirQ+GDF45bbymKAgSrhwz9ResJ7NWWMj4gHGYHCIc4ZYhjHL6DOIm
ms0MBloxgcNLgAahymfdWRwjK7tuy8d6CLFUNXBrf0q3J7pN5mgkBFk1ImK008N6
t5iRy+RPVKtcdp0g1tcCRmsJOCw5kTInxTTwCTYcrxO/vhQfoAXm8sNSHNr+F/Rj
LhRIsNNa31KKajonhwSdj06geWuq0a/n9HlU0YFoCX872YW2L/BPrjcwg2QQ1JQ6
O1j20D/wPIo71aq/0ebsbIa82bHtdidvXp4fHBKcjDmx+8jXs44=
=Id9e
-----END PGP SIGNATURE-----

--sJbNJk2A94+zAuef--

--===============2529112075757987851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2529112075757987851==--
