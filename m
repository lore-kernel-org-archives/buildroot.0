Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F69EC71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 19:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551D860BF0;
	Sun, 10 Sep 2023 19:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551D860BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pp6JIetttVSy; Sun, 10 Sep 2023 19:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A0FD60BA9;
	Sun, 10 Sep 2023 19:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A0FD60BA9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF7B81BF350
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2E438135E
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 19:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E438135E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33WH8L9tQC0i for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 19:39:33 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A00768133F
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 19:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A00768133F
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50079d148aeso6296097e87.3
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 12:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694374770; x=1694979570;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mbK2XKZHXar620tGquMffvPMvXD8vkOuLjW2uEq80HI=;
 b=JAlpBzfcGq6IZ/Xd6Z0hY3KM0354LzskXcf8q7HPowBFwvlUYNKNJPETTKFWaNrlmC
 YiqEK/CnvG4VcQPGirsmMnfxaQVc4i+qLufVC3G+qn/bwiow+Qf9lUPZKTrMb4xo6754
 0I84SH4hfsUBvoptuTzcMoNkqGjEiRNq/66fCct7dm7eUfVaMzYlFY7Ms/E4cZ0b+RNN
 5LjMqDklcFNQ2Pu8qNy8fuJ6D097r+cMn1EY0S8VkCU5oxVQXXxYGyl/Fnxz3jyiT5Xy
 hgR5zgLJu9ag0aiFe8ugPTbt/xxeZaF1NWPN0ki2ln8DX5iPv/28GqMpX2+Fe2duB9Nw
 eNew==
X-Gm-Message-State: AOJu0Yz8geV490y7YWJjvxUDaAoEHUmfX1q7tYcIKBOO9B+BpYHv2Ua9
 phTBRxB+7UfoywLngTaSumo=
X-Google-Smtp-Source: AGHT+IHQwr20B2aug4o4Jd9roANIVrpy2hHLhSpQUYBjOM7Ba/7nT6GvvBy7JsbyadIEFMooSz5AMw==
X-Received: by 2002:ac2:5ec8:0:b0:500:953b:d112 with SMTP id
 d8-20020ac25ec8000000b00500953bd112mr5255700lfq.27.1694374770291; 
 Sun, 10 Sep 2023 12:39:30 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 m14-20020ac24ace000000b004fbad341442sm1080097lfp.97.2023.09.10.12.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Sep 2023 12:39:28 -0700 (PDT)
Date: Sun, 10 Sep 2023 21:41:58 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZP4cBkx2VFsfsN7M@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
 <35d775ed8e08f7082c025d0c32f53bb4@free.fr>
MIME-Version: 1.0
In-Reply-To: <35d775ed8e08f7082c025d0c32f53bb4@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694374770; x=1694979570; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mbK2XKZHXar620tGquMffvPMvXD8vkOuLjW2uEq80HI=;
 b=hhBIiMEeAbk5MmzvjFL1guT9YumxitO48opMs44Quk6028ayQ4dma6iGJEaINybobf
 uFgovU9DYz6ZdQGv73DsSaUvzSjlqW/+5kntoOjODtZjwvMSTDcCQyidfhBU16MBXG5H
 vwCTnoNbKXm21N7UcdKcULdgx4NWszajppZ4fjDJoEAu5dMfH7+oHat7vyPLVpcqm9pr
 A6tkinlZts4Lfi4t1ZmyAxD5zBECqpJZ9qWrWD4EYXMzMh3OrvVZYdOK+33mEp5x3V7y
 onFvSHKlwiuEC39vekDWDuxjq08LThyVX379EoCDO96/ZgyKyMq4LwusizPEzAE+E1KG
 l6bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hhBIiMEe
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0519076530332396917=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0519076530332396917==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GVjryBuuH6cKe44R"
Content-Disposition: inline


--GVjryBuuH6cKe44R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sat, Sep 09, 2023 at 11:16:27PM +0200, Julien Olivain wrote:
> Hi Thomas, Marcus,
>=20
> On 09/09/2023 15:55, Thomas Petazzoni wrote:
> > On Sat, 9 Sep 2023 15:03:13 +0200
> > Marcus Folkesson <marcus.folkesson@gmail.com> wrote:
> >=20
> > > Thank you for your solid review.
>=20
> [...]
>=20
> > One good thing would be to have a runtime test for criu, in
> > support/testing. Julien Olivain (in Cc) can probably provide some
> > guidance here.
>=20
>=20
> Marcus, you should be able to reproduce that with the command:
>=20
>     utils/test-pkg -p criu

I've sent out a v2 where the comments from Thomas is addressed. But I am
not able to reproduce the errors you got with test-pkg.

I'm not sure why it skips my tests. Could you please provide some
guidance?

>=20
> Ideally, the package should have no failure (i.e. only OK or SKIPPED)
> when testing all toolchains, with:
>=20
>     utils/test-pkg -a -p criu
>=20
> Then, you should be able to see the end of build logs with:
>=20
>     tail ~/br-test-pkg/*/logfile
>=20
> For the details, see:
> https://nightly.buildroot.org/manual.html#testing-package
>=20
> Best regards,
>=20
> Julien.


Best regards
Marcus Folkesson

--GVjryBuuH6cKe44R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmT+HAAACgkQiIBOb1ld
UjKnjBAAmKBCIpTVS7EiV+erMkHliaB1qu7AJC1U/4//AJK1yF30TDOgzf5AMkS/
lAssf7DWmsysc8GjXGX7UscucsaA7L90Zb1VMPxNbLAz44IZn0GlENaOJbqpXuiz
C9LVF88gvo2XexrlJGNc/KCP2wvLSVnHOEpBta4Ed+DhbSCxoKjAZLAhokWqTaYI
p99FiD+veJWUXzMhk6u2bGupE7O+R2nsam2R1H/bJkDkrjA/FmRjoyGrzQyubdj+
KhAIS7OMHNH5BCsjaYpawPEyr/Qsb5dgCXH+hIcEuBTwzb2SS0WEWkXQN4B6LhhE
17simgtKimyKAVeN9/EwBOh1C2ErcrsYAtDUF3t34MIB0x2xQZI4cbDMg9XKGRdK
HwRIgkqxb0TWKLaJR/1gYVseynzxE0fPGtAbRNn+HEJ6jZWIujGYz33QTSWRkul3
Swz0xaaxuYbB5w3VA4DSmCtS8xjoNYssqejQCyr+wdM159GAbRqQ2i9VtO9/OwFP
VI3UY8RFFbXpFUD6VPQ24wQZY92i0yLffN1+YfiZP2aJ8MmpGSBpmf/RE9ZtDH5M
la6oTUe3R4l9vlEYY9bUAzKCjt70jiAF9rJLjc94jfTTj6MiOfNRckw1HvdG/hwr
AHuS3NzpglTH2JzOHZOzb1j1KBJuC17de3ga/onL2MJW5Hwwoio=
=ZGCR
-----END PGP SIGNATURE-----

--GVjryBuuH6cKe44R--

--===============0519076530332396917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0519076530332396917==--
