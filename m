Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE097C47DAF
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 13:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 834FD6059B;
	Thu, 18 Jan 2024 13:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 834FD6059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsbgR1YUvTMG; Thu, 18 Jan 2024 13:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56476F4A8;
	Thu, 18 Jan 2024 13:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56476F4A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3A41BF429
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 13:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F271140120
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 13:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F271140120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_VKjJDsCq1j for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 13:43:07 +0000 (UTC)
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAD08400A4
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 13:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAD08400A4
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id D19B64801048;
 Thu, 18 Jan 2024 14:43:02 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id b2cb2517
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Thu, 18 Jan 2024 14:43:02 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id a92a8982;
 Thu, 18 Jan 2024 13:43:01 +0000 (UTC)
Date: Thu, 18 Jan 2024 14:43:01 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240118134301.GA81291@mort>
References: <20240118002834.76578-1-stefan@ott.net>
 <20240118135820.6fcfebb5@windsurf>
MIME-Version: 1.0
In-Reply-To: <20240118135820.6fcfebb5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1705585382; bh=6kIHLmSC2RzBytCfxm7SNdOqFGY8aEmFshuRQM1y9KQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RBB1E8csjCjwNif723FLO5MM11ohExVf6v6XPmhqAlZoiZThLzSretdFeuZ5Lxv4S
 fe5JIfvJgHeaA5O27/WuVs4i/ylS9Y9mlaCagQ6L6fmBIP8zC7rcVH0N9wCcoZhUme
 4c0fd5S2gEn1yokCovT5yNHT+HbNlGs17JyVe5a5FJZevjDkF6x/1Z5gTq+fEXL8HJ
 wXQiRnYq0X2vRCuZmXm8CU2lSF5Mu24p753XYnH5jqmzF278wd69/nTxbTmbK4mFtB
 sSnROaYbjLihuC99+0zUZAsTGlqVWjRY15q4ryOCYkUkYWI4e5EyR0tz00h6Wbvsvo
 eIb5wHxNum2SQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=RBB1E8cs
Subject: Re: [Buildroot] [PATCH] package/sway: make systemd optional
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
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Stefan Ott via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============9183170626431071228=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9183170626431071228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8xVJcu2ivdBbomcp"
Content-Disposition: inline


--8xVJcu2ivdBbomcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, Jan 18, 2024 at 01:58:20PM +0100, Thomas Petazzoni wrote:
> Thanks for your patch! I am wondering if adding an option for
> this is needed. Can't we just enable systemd support when
> BR2_PACKAGE_SYSTEMD=3Dy?

That would indeed seem to be a more reasonable approach. The
reason I chose to turn it into an option was to make the user
aware of the fact that there is such an option at all and that
they might get additional features when using systemd.

Whether this is relevant or not, I cannot say. But if you think
it would be acceptable to do it automatically, I'll update the
patch accordingly.

> Is there another sd-bus-provider option value that should be
> set when systemd is not available?

To be quite honest, I can't tell you what benefits you get from
this in combination with systemd or any of the other options. All
I know is that in my case sway does work with the default value
(which is 'auto').


cheers
--=20
Stefan Ott
https://www.ott.net/

--8xVJcu2ivdBbomcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEyaEbhLau0NTQCkPo2VNtOclmpigFAmWpKuEACgkQ2VNtOclm
piiBjBAAgsuXrtHK7OZEVOSBrSxKz+DyuyjpK/RJFp/x0erelcbmdiyfyKEHRaIN
Y7GqSkgO/kUvwgqqzl+MR2glziV5j+IfRkoTrVxaD+ZE8U677D1R1mBx+iaY5HEc
GiKRoE2VwyiCCCbI/eP3uR+cLp3RuhAu7wqnwl49pjgQsUJbifLDR01kqUXDOWz4
Ve/XivEto0gvlvSGN8bQBhD1hnsVix3GbA21NTq/o8UfDbu65a6+eBRFKU8NGQkp
faXz01PKelDghLIGmtX1jxgOWVWpg227NC1U1+7fRUM7G9Ehd7P3Cr3LPuqsJu0D
rgSUOQjIW/ySL8WmSdCUbhjjBMT2DfQqnHtfM/lOhkK4Ziq/csi7mKiUyRBTdMre
xgCF5fI/UyTA67nt7G/EJcwyJ+nwo71r0Lgi+B4UBR0r8k8BUOmx/+tOCtqzjEgD
DTmakSw0t0eGJ0uoICdxCoOWziXJz+t/lUWobUaShsot1Xmcsm5tJFHMmTQedMiF
KeNA9ih0wiGtti7TqEWawm6pyHKsqFtzRTz1tffH/SnzVgxd3GM+DZ7/aOTXWmUu
CMGZ+zfEIrkZGLgWsGQbolJiynAsdnXuD0+hETLSkd0cquft2fA1/izhUxJ2KX/Y
xVK6whxEZ95m3aEYbFnrmmKB5qDmy2uMzNpzbcqm4b++XusMxXM=
=fkyL
-----END PGP SIGNATURE-----

--8xVJcu2ivdBbomcp--

--===============9183170626431071228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9183170626431071228==--
