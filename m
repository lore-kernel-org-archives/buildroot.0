Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93088C25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 10:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C9A41624;
	Sun, 22 Jan 2023 10:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C9A41624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5O19fYx5Qn7I; Sun, 22 Jan 2023 10:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 033EA415E2;
	Sun, 22 Jan 2023 10:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 033EA415E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF191BF36C
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F3B415E2
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 10:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F3B415E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jec09zIsPEQo for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 10:01:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3DE0415DF
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3DE0415DF
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 10:01:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mp20so23753716ejc.7
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 02:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FpYJYTvgdNIH6QARg6VRK8ZaO8cc+lpTeYQB09qIqQ=;
 b=8D6mx/lDRZXkDkzApF9xXKxzocKZQUNeIMJnlg/U8ckJsEE8BslKhZRR+BfTOQCJqk
 XdsdQ/ChBW6a8qHCFHaOMVMWA/dnBPYxfwBDpgbIj0MN6ToK22Blq8YEa3L/ZSXhz0Bo
 TthodYu5UnQhbfd6iew19l+DQiVGo5tRG01bDoxEGmkhCDxliPRyoH+cx1vx2ZVW+Fpt
 M8BRBXkSHJElE9KJnYvmzLEqUPh7CMkAKIV3ePseBIkrrN/5vMgyxvkBZT10b+UU9s+g
 K9y0XxBth8M5K1JhB5fFZIMUIR+/5qy179+TyMVAqNIFzwymR/F2/n5ROlmUKDTq6Td3
 RTRw==
X-Gm-Message-State: AFqh2kqxsWEZfwfn/mcSE6Wa0UkXpsW3g+ytJ9bGURJTFJ2nuQ32WYzn
 bCYznX29A9exPAY6mF1uBlD254aAjCBdhA==
X-Google-Smtp-Source: AMrXdXu6VLhtHsKlpgdu3Fa4mn2Z4AVZIjGODgGB9EAQaZaHCZpy+Rxp945dg5do0LuOmdH2zgGIIw==
X-Received: by 2002:a17:907:2587:b0:847:410:ecf0 with SMTP id
 ad7-20020a170907258700b008470410ecf0mr19723211ejc.20.1674381676745; 
 Sun, 22 Jan 2023 02:01:16 -0800 (PST)
Received: from gmail.com (82-209-154-112.cust.bredband2.com. [82.209.154.112])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a1709061c9200b007c1675d2626sm20964152ejh.96.2023.01.22.02.01.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 02:01:15 -0800 (PST)
Date: Sun, 22 Jan 2023 11:02:13 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Message-ID: <Y80JpRvsXgAmfzwS@gmail.com>
References: <20230112114754.82405-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230112114754.82405-1-marcus.folkesson@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2FpYJYTvgdNIH6QARg6VRK8ZaO8cc+lpTeYQB09qIqQ=;
 b=Kus9cuZg07tj5piHfPWHWp1QIXja2Q05UkzNGzD4UBddl1+C8NfW7r6A5kitaIy5LP
 7rjrtJO79TnRqdR1sPAXn/QhsvgMIGblWkT8sOnjSDT6g90BF+TTsXAHpiGn1GggCiQw
 5sCToyxFjI7j7aZ+rkVEVwozRX/IUjtg0CRtCK/0+tBbynwuXcUg6nxW5Mc99PGeX3nH
 DSit4wIpy8CnEPHxxTFhGL3ArJqlr2AaEgolVaRQLaMMH9p1daItAlWwm+IUrNKj+nNj
 in6C/HUk0zKetTk0OfXVWDPbrOga3JOzi6aiDqfQCipqi/2x6plehH5sFXnnUIBJwi8z
 vRGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Kus9cuZg
Subject: Re: [Buildroot] [PATCH] package/pkg-kconfig.mk new
 <pkg>-show-fragment target
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
Content-Type: multipart/mixed; boundary="===============0817285383924135628=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0817285383924135628==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wO0uuku56WZEnOqT"
Content-Disposition: inline


--wO0uuku56WZEnOqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 12:47:54PM +0100, Marcus Folkesson wrote:
> This patch introduce the new target to simplify the generation of
> configuration fragments as the output could be directly copied into a
> fragment file as-is.
>=20
> It is *heavily* based on the <pkg>-diff-config target, but serves a
> different purpose.
>=20
> Output from linux-diff-config:
> -CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y
> -CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n
> -CONFIG_GCC_PLUGIN_LATENT_ENTROPY n
> -CONFIG_GCC_PLUGIN_RANDSTRUCT n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n
> -CONFIG_STACKPROTECTOR_PER_TASK y
> CONFIG_CRYPTO_DH n -> y
> CONFIG_CRYPTO_KPP m -> y
> CONFIG_GCC_PLUGINS y -> n
> CONFIG_KEY_DH_OPERATIONS n -> y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER n -> y
> CONFIG_VIDEO_IMX274 n -> m
>=20
> Output from linux-show-fragment:
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=3Dy
> CONFIG_VIDEO_IMX274=3Dm
>=20
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Ping

--wO0uuku56WZEnOqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmPNCaEACgkQiIBOb1ld
UjK9cw/+PNxejOLjpPOh5NDzKg1aMkXoNTDkL4AMT10K/v89K7F/nstTZn/iLosY
U6TYG8Dxax+gBHTQ/iM4/h6xRSbcmM6JwmHp2ma4HzmdJgG4x8ZUqqy2eXXTaHK9
17R1XL20zVPSfxmAH0HhoSko035ZKfdLVIM5XaIXZmO5KHQmcX8TBACi3volIGor
+Du0IeZYZfPXUrMR/3y+h/oGIjSvpA9rWGS1YpfT0ZMBnYE8x761d8Gu+E3U6CoG
uclef3+SVhuSdskxDugSu6tNcRGvddTNZ/5OUWBszV2jfrRCdY/p1RcKowkUR0bl
XU49nmKvZVuEysXiB/YmN22wMJN5WIqjcFQw/Y+bFuWASOSUGG2lLyjHZpvKEWcz
r/ZKq0mT40S1c2Oos8mh+NCeKMvzb7T315fbWP+s032TpB5bfIev3KMFlnVDD2MB
r4+YomtGV2LskFGXFyjvAE4Jb/EciPWAuD4a0gXm33Kv77zGbPTG/lpdAmTAj5zM
pOk9Z738TS8aj9qyrhy8O1O+YOICyaAt/RxYTRy0A2nNkVK1Tpvk9OEgUO8wx2Ss
4g0rHJQUW3wwjVXr4Dnc9ksP46XG7zCLBc6TSKnNhUY0oUqqa7Otum2VKv7eQnB6
g0c5JHJfrsK18M1MoeKymPCIRpnaN+1VnSk6HNYKM4iwc6cml0Y=
=aySZ
-----END PGP SIGNATURE-----

--wO0uuku56WZEnOqT--

--===============0817285383924135628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0817285383924135628==--
