Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08FFC433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 15:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45E04403EA;
	Fri,  6 May 2022 15:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fSVE-UdE-ouF; Fri,  6 May 2022 15:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BAEC400E4;
	Fri,  6 May 2022 15:37:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 759371BF299
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 638EF402E1
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 15:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n42aqF4SW_Rp for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 15:37:01 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5DC840269
 for <buildroot@buildroot.org>; Fri,  6 May 2022 15:37:00 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.59.18]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N6KpF-1ntT3h3pPt-016dV6; Fri, 06 May 2022 17:31:53 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1nmzvm-0006Yg-Kj; Fri, 06 May 2022 17:31:51 +0200
Date: Fri, 6 May 2022 17:31:45 +0200
From: Alexander Dahl <post@lespocky.de>
To: Remi Jouannet <remijouannet@gmail.com>
Message-ID: <20220506153144.GD19726@falbala.internal.home.lespocky.de>
Mail-Followup-To: Remi Jouannet <remijouannet@gmail.com>,
 buildroot@buildroot.org, Remi Jouannet <remi.jouannet@outscale.com>
References: <1651848863-30178-1-git-send-email-remi.jouannet@outscale.com>
MIME-Version: 1.0
In-Reply-To: <1651848863-30178-1-git-send-email-remi.jouannet@outscale.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scan-Signature: 7af19da85ad859a41b3be88a3c47722c
X-Provags-ID: V03:K1:lGTc+iPZ/0XzkWUKxD6CU1WSuXSn+Y83MLWtXjWcXwAFk8qSB6u
 RSaQmhD1cGJ5it20mOmKgo69uRfzEid0k0LIVwEuPFj0CSgD0e9DAFuI2MPZmU/NQ1qr5Qt
 950/zdKroyLtheK4i3FbKUJchPXML94qZL6B4GSvCa69KeB11sVDR4E+KGPmyrc6UPFkaVV
 ELrm82IQS0PXdrfEQMRMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hZEOIQJzHjg=:TcFBIy4i9WOecf+uSHUe1n
 KaGqBdMfCi0Ry4lkZbmgJwjKJsTSuyt2cE1ARVyfHNbCp5OS0BYJJRhlQEla0vl0hjZMEQAeD
 fT8YMsYUSzawdY0cwvPlvDv+j6OrBo9KvrwYVXGZWdXr01uyAmKI442iqhaP/y7cDFoRmdCAr
 Lbo19nbw+yvuPksgYhb6XzmN7TVqYZ/73pwlGQO4v/qB5pgcHdG0QnN2ukzwEKq0rgDIuYTk9
 U+ZNuZZfHifTsl5v2fvRv1Bn8YscoeCfM5Yag1nJ+CY2TxA90ubqadkpA7oTtgHEYfabUI5yn
 xAj2eAa4dLNhfTuhJb3DCR1MTeH0CCeHFrg8OHacDm+CTkWxsiJov591TSoCgWXq0FwJqJ0sf
 kjoNneOGoyXlbK8JzTji0LDFQ4+BN5GWCS+ws8kWQrgcDM1lp9E0vionxcir2VuksXBEhPqT2
 IMiyhAEiDKW/It9Eqia9BpDZILzfBja0NQiZnp1NlOLUTRoB7BorZrwZeJpjBBLiNsc487+t4
 aRitKQqKmgN9+QiiFQE+3ncr++V5RZImlWQW3mptnRGEbRJljLM47K9yvDzGJnokSrjv0nfXB
 92YhFaIADVhDpVnX7fexc7zHDp8mPPv7jCYJ2D5gb87mB27lmRyGhscZifh3wR0RiI2HuS1Cu
 JBO7o4JeoskyB3/nkVX2ciwok6wBfS7XlsWnjYZIyid7Sl0J/gKKTAAxpO7qzsgjs/Oc=
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: add -O staticroutes
 options to udhcpc udhcpc default script can handle staticroutes but it
 missing from ifupdown options
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
Cc: Remi Jouannet <remi.jouannet@outscale.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9114045269344824646=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9114045269344824646==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Content-Disposition: inline


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hei hei,

took me a while to find the reasoning for this patch. Didn't expect it
in that very long subject line. ;-)

Greets
Alex

On Fri, May 06, 2022 at 02:54:23PM +0000, Remi Jouannet wrote:
> Signed-off-by: R=E9mi Jouannet <remi.jouannet@outscale.com>
> ---
>  package/busybox/busybox.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.con=
fig
> index 52cb8ff..a614662 100644
> --- a/package/busybox/busybox.config
> +++ b/package/busybox/busybox.config
> @@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=3D0
>  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
>  CONFIG_FEATURE_UDHCP_RFC3397=3Dy
>  CONFIG_FEATURE_UDHCP_8021Q=3Dy
> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-b -R -O search"
> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-b -R -O search -O staticroutes"
> =20
>  #
>  # Print Utilities
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmJ1P1wACgkQNK3NAHIh
XMbQIg//fJCMd+1vbeaCFUpgyROG/i1igm+KURbpY7fcedg1G8rA8y7mWhnBPuxF
LWpgHauvn3bAMj5mvBwrd6Yyqx852NwxFttyiZNTDijKpaazCZLOsdSmiimaJLYv
lMZmkVvmK06QwA6lCQgwyhtSuwAqBjmsZSSv0IjIAuM76GsSUX1CuuQ79a58BXSC
Zgdrx82wdxaVvPxlLBPjaHHzy6bVTX1Na+T1B8xhxxYe4xp6YDUpxjUb1vMbCDqZ
FZg0sZxOgcFVp/dFPrhDHTLnZIrJx5DoSRh3A/FYc2eR9uJlqF/YcLOefffWpV2Y
d87cEO0PCmSDGg3mdLORuXppSGQf12N6SK+MpD9vNMU8Fw7cHkBbsZ5doG5KiO26
96Hgrv8NH88oJuw5bPR6+UGsM29LSUvnbOQwaNfc2Oa70UmwGEefNlN/SrrxpKsp
bFyOXGYZT8OCzZfk/TSLJZujAh4XzDtB/sCvxF7XLre/KLz2AUeuGLoPDaYDbrRl
1E6SDXvS8PzQVyTAMO0Vo+G6qCgSZ79b+aLH9WU8BUj4d+JSSCh584Me0IUkr5JR
9PbtiAdeItH0QcdER0PZdDz2kWDEJlXxSVDghlbHpRXCKpl2UnuXbjs2iYID1tEE
Ke2F3PpB+QSW+ueQpl6ehzH3ymahDFZr0FJU9loW7y6BuTgLsrA=
=5hDY
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--

--===============9114045269344824646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9114045269344824646==--
