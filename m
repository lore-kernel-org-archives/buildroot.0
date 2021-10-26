Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17984C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 06:19:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB6361074
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 06:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DB6361074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC1D4404D1;
	Tue, 26 Oct 2021 06:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJWt4BzVSxy7; Tue, 26 Oct 2021 06:19:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18CC0404CF;
	Tue, 26 Oct 2021 06:19:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 435A41BF3AD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 06:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FCA8404A6
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 06:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FE-0WHZynASA for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 06:19:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9E91402E2
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 06:19:48 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.56.235]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1wdd-1mpwBE0rs1-012E9g; Tue, 26 Oct 2021 08:19:45 +0200
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <post@lespocky.de>)
 id 1mfFoE-0005op-1U; Tue, 26 Oct 2021 08:19:43 +0200
Date: Tue, 26 Oct 2021 08:19:40 +0200
From: Alexander Dahl <post@lespocky.de>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211026061940.lwh7gc6h4c7ixfuw@falbala.internal.home.lespocky.de>
Mail-Followup-To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20211025220026.3713785-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211025220026.3713785-1-fontaine.fabrice@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 09af0b23b5b967e4a9b70abe2712470c
X-Provags-ID: V03:K1:0exl/KfOWtQugsfz5WbRzmAli2+MCop9P9oTD5ezwrciqqCdDyg
 XCqXCa6neXTIRUtNv3R2tmDsml5oG3Dl+bqG4IRVbIdzpqnLM7RAtaqY9qbSCIC0o8lZ38a
 36xqAxGvvxfx2Ztt3di11I9sUhCHkrZ1oqUG6WJ+1w6fmiel8c6pGspE6MCLNTpEWpqEJj3
 WveTMSUMEXRdwtQsEAseg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P3SDmKxHwiU=:TFdD8YK8qKWOM5WGz7l2K5
 2kkX0I2pZP/LGrgSUJeoo8XvEDlQWDNdqMqee/v2IBRxt1RQX9AiLkJXGtZ4RpYQ3EjKSSb+5
 xAeVW4Rx+YO24JtbfDkPHE/0kAtjrl94ndpTBbhGrGMp33EofyC/cpk4ZrJv+SHy1qQ07d1Xu
 oFoeZycn0kvuBW+6i0Phlw/Uhh05ejiwDZUXp8Dbh7tIYgW6F6/iOUV97yA5Z/qtF/GIRkCOr
 VyHLZKYku0f5TeLI0/280cpAyaIfhRWhJ81+KPbSt+ajH5dTmEj3m4+MA0Wtnpx9Wdz7Y9hj2
 FoF3Qjw2UJZm/keoLZrgyhLiCe2HpJv2k3vBpRpW798uRzDRqoS9myhvtXYaEfTwp0r1ftA99
 xPfVGCoqdsIC3kHK6X3wM2rZAQe/YZnzti+1P/Y3AYW2JHNMTAxmuvxpVMRWeRvmTPeAGUrd6
 Ob+ZxJ4abAZYvBZRpX+a957rZrcln+TMPLNFjz9VgrWbcKCq8V3lbjZk7hVx4Dx1CQnwh6wWz
 hBeHl0Xf8Hhl8JQHN4btqGsB/6XPdOlE7El4iS70N+r2lW/9v9Ug8p6FZ51AByVnv4zRJMg/O
 JgEKhKPgHtAym6RdrMxddobwAA6QQKygDL4CQtjWml6dSDfgN+DgW+hD26UaeDmHthGEnF0+r
 TlgMNgsk4NiTYy0i8CMd/D5qPYBGIgYZ9rLk/sYI3U/b+6aWq5jSITiTyuUlusplymbc=
Subject: Re: [Buildroot] [PATCH 1/1] package/apcupsd: don't override
 dependencies
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
Content-Type: multipart/mixed; boundary="===============6780763706437157650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6780763706437157650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubibgrbb57nxs467"
Content-Disposition: inline


--ubibgrbb57nxs467
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Oct 26, 2021 at 12:00:26AM +0200, Fabrice Fontaine wrote:
> Don't override APCUPSD_DEPENDENCIES in a conditional
>=20
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/apcupsd/apcupsd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
> index 502d1b7152..80ed0b0832 100644
> --- a/package/apcupsd/apcupsd.mk
> +++ b/package/apcupsd/apcupsd.mk
> @@ -34,7 +34,7 @@ endif
> =20
>  ifeq ($(BR2_PACKAGE_APCUPSD_MODBUS_USB),y)
>  APCUPSD_CONF_OPTS +=3D --enable-modbus-usb
> -APCUPSD_DEPENDENCIES =3D libusb libusb-compat
> +APCUPSD_DEPENDENCIES +=3D libusb libusb-compat
>  else
>  APCUPSD_CONF_OPTS +=3D --disable-modbus-usb
>  endif
> @@ -65,7 +65,7 @@ endif
> =20
>  ifeq ($(BR2_PACKAGE_APCUPSD_USB),y)
>  APCUPSD_CONF_OPTS +=3D --enable-usb
> -APCUPSD_DEPENDENCIES =3D libusb libusb-compat
> +APCUPSD_DEPENDENCIES +=3D libusb libusb-compat
>  else
>  APCUPSD_CONF_OPTS +=3D --disable-usb
>  endif

Reviewed-by: Alexander Dahl <post@lespocky.de>

Greets
Alex

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--ubibgrbb57nxs467
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAmF3nfgACgkQNK3NAHIh
XMbuGBAApSLGBwQh7u414x5aKmL7Q8aFaXUBkMqyEJwuWZAjhXqu7wkn+QQdC3gF
ZhBG7DGUrtIRsWEjO9ZFfCxQcgzFsLnK9D5tNBDV3hSvuKTIwq4nXfn8FlGgwa6V
RERjuzH8XMYdlho97Lna0W8ejoTt9cnpZcVOHVN773WVbhnP0F1bH1eq/QB9YMDQ
3zuOfJOREmsO2GtD/kUMMy6dZw6uF37TNsSTpXumNH1mY0gXCo/WAZKC5jIeOKA0
dmyplIjRFCsY3KA2IX2DGs4Fwy/pIt1EhIM+hsszIakkQ8on+DDfb+Xc9/kZTvkq
j0dWw3sLqS+/M1ZFYZfBAhiOUM33SIUGSAMq9WZFeZWlTPDvC4osuJ3HtIscdHiN
5/dElgKTE7kYlPTZLrLb8yRLKgao7P2Mkpp6NwjHtVrHklmc7lj6qaGNhnN81CpY
30nMYoYLNhgvJpiK+JPBfadRvzwqED94ChbwffkFs3H11oekyXelECVC4YvGLPJ5
Fzs7u6+gGuDfaD5eGOCLlqop/hY6ZK+pWQ/RE7O2Jtjnd+8S5/1XeNKVPbt0nsJt
0U5b2sSVG4e1lsvdkMxai2//HZuxAlCnt7YR+x4nh777lZU2iHf3OGfS2SZbgoK2
QUnwQltT72ptQWGKIphylLlXSo5thASwKT7vVTudJXyH7uKUydQ=
=PElE
-----END PGP SIGNATURE-----

--ubibgrbb57nxs467--

--===============6780763706437157650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6780763706437157650==--
