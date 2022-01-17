Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB3CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 10:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E42D813D9;
	Mon, 17 Jan 2022 10:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwCHSpYD5OrG; Mon, 17 Jan 2022 10:07:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48ED813E3;
	Mon, 17 Jan 2022 10:07:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7671BF3D7
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B50E40517
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id indfjOPiNfBx for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 10:07:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B08840186
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 10:07:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bu18so32573111lfb.5
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 02:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fw7WxMkAphTKEpZocalV7O0LIIp3CMTdxbuZPn+3so8=;
 b=cnKx1ztCSyc42JDyOvpWJZCAUkAZz4raclUyZnOJQD2SeuwOWtYeHOLrrO8ZoWJW/5
 xKPeUYOQoED8OWh+bYLZKOW1SDe2/phCpFF7jgQqqNRu0h9qB8MpomSZ9Nz2Ij1hidPT
 ACQc3E7H/HEukra5P7y71MKHFkbOksZdoa6+2XV0lCsamt9ocisLHI3RAHln2SvK+3gf
 2QN7vgBXvnl3yRUkiAWpdij86TgZyGXp8TBZJov1rV8tDrs8W7wvSZrNI7keIUezGS9/
 16mGRiDWY3mAQz4Lv4J76+KUYf9ZJdAL56lek91cirAOGfm4ahvg+XnAOMH/GiITmk5R
 SiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fw7WxMkAphTKEpZocalV7O0LIIp3CMTdxbuZPn+3so8=;
 b=ce0WiOXGsCxU63U8DoWGMkB89AahMnETWMv2GWVkK9Ib2ih+jC7Eza9pe5oqPRHLj6
 VAk0TYrkZhzAoXUlA5YZJQzLN4APYDgsAuZirRZHC8l1d1ARo5GtRZItMrltzytbMH8A
 AQqEMIb+sK04+NULPdfyFIsM2+5OVAUwaa8HPpbOuX+9/YHmzlS0z8xJSMlGaz8zTLuO
 gBm+bMV+WN4qkrHg8YlDw1XgpShL4s4/b3UDK/I7aOtbGaQ0F8LEarHf0h4sbcybt+MP
 AyG1AbESTndv4s5yICkQLk1mIAEUMb3aWXwXhEVMIebocwJ97b2cLVAeTgzB7SwzFQzt
 o0vQ==
X-Gm-Message-State: AOAM532doGSYFPY8yftnj1sBGGLRuGYtKeRtBqQZLU25pybgOJX2/LfW
 /jgeMb8RYcgpknBFqG6I4thNOh2sTqc=
X-Google-Smtp-Source: ABdhPJzB+SnpMLh12jvPh+HZGQKVhxrMuqx7qTerRYQ1OYYul0IQtfb6T8cgzVqRmm6l50Ys96BQ4Q==
X-Received: by 2002:a19:8c55:: with SMTP id i21mr16982450lfj.627.1642414044276; 
 Mon, 17 Jan 2022 02:07:24 -0800 (PST)
Received: from gmail.com (82-209-154-112.cust.bredband2.com. [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id
 m7sm1324744ljb.59.2022.01.17.02.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 02:07:23 -0800 (PST)
Date: Mon, 17 Jan 2022 11:07:50 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <YeU/9slJuw7BG8ue@gmail.com>
References: <2209e11a-bda9-5193-9b4d-20a5f0fa34e3@linatsea.fr>
 <20220105142924.4b11ed83@windsurf>
 <5d0600a1-eb8c-8d69-cf9a-fee4fbca0c73@smile.fr>
MIME-Version: 1.0
In-Reply-To: <5d0600a1-eb8c-8d69-cf9a-fee4fbca0c73@smile.fr>
Subject: Re: [Buildroot] candidate packages : ros2 and wxwidgets
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0820637722480620451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0820637722480620451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jOztRmLQsobXNVOw"
Content-Disposition: inline


--jOztRmLQsobXNVOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jan 05, 2022 at 02:40:47PM +0100, Romain Naour wrote:
> >=20
> > I'll be happy to help in the review of such packages.
>=20
> Same here, I'll try to help.
>=20

Count me in as well.

/Marcus

--jOztRmLQsobXNVOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmHlP/EACgkQiIBOb1ld
UjKTMhAAgnO03vy6v0rQHKz1Dh3gPdmnwt42O5m7/qpf1KGUaTnceOKatIEWgxjL
F+VYDi7vzpNjo0ex8NEabz1Amnt0XnwNVzF5rD0XQBNUq8322ooNg7cM6ujwD4wn
mBZdud3jJ87JZCD0XCmnmwExo2Kl/9VV91BCR2KGmIk95dSUwhbF79oJKItav8j/
AmZI+fi6zXdYCHEa8GnnATKX8zUXKKcpaI3b2Dyg8yDEW0ZjFO+y/leopv6Ohp6W
AeCVdd0UQp0werwPUPSTETPsDMrnLIhRiwQTwdSaZaqIcnR1ZS1IhBdMRYsPCDl3
f9ltGA1ksZPhMuGkqCisisHS/LxItDHx6k7f9/88njIwflIFNVPIbVS11sfxKmTn
WYlKYVlYQq6/7mqHr26Vups31Opcflu35rwWjvbmDJbqGyFGZg6mTA612Aoh60+Q
hUM7JCZEqqWeqsRxHApxyPrKPdS2yG4+32a9k6VzZcy2QNV3AvWC03o7ApRiCO2I
wLswBEvs3xyld2N8DUFLS9KycntwCVHzzvruB6Q6NHWqoPhLnSnQ3/sZRQ5xwHxX
yQBz0DUg6FpgULp8t0sKojBFQ2F5wOFiG2JIZxfH3+YFjCzW29XgnyG/8VlaZOZ8
6771DBAaKYaUUyX1aAk+fmD3vyMgfyBS5iDCt9RIsuXN1ltZeqc=
=P9Nr
-----END PGP SIGNATURE-----

--jOztRmLQsobXNVOw--

--===============0820637722480620451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0820637722480620451==--
