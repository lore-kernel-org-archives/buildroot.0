Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6814DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 09:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F35CD6101A;
	Wed, 20 Apr 2022 09:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbvVWf-hUHM6; Wed, 20 Apr 2022 09:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF42460BD3;
	Wed, 20 Apr 2022 09:14:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 971881BF29D
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 09:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 851EA41E44
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 09:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=email.cz
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvzneYre2QBr for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 09:13:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8E9F41E00
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 09:13:57 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc19b.ng.seznam.cz (email-smtpc19b.ng.seznam.cz [10.23.18.23])
 id 7f97f538ff709fa57de3cb56; Wed, 20 Apr 2022 11:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1650446035; bh=XlWlUFJwiebG5aC3KvS0Fe2cO4GyVco1iNW5POA1Eq8=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To:X-szn-frgn:X-szn-frgc;
 b=Aq5Zy9W1xzLB6LSgtJv+3Sjr+fOPiI4fRBy1S+O+mz+Bd//ao89GrOv5ibnxyP9m9
 GuJo3e5/fhb2WxPjGhmtfds5vNYUgAAf9G/po5kYMKlE2C8X6oRfowga+rfswgVFfg
 CI/oOG/wzwLTldJRovyaDAX4hguYtwdG1X/9/pzw=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay9.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
 Wed, 20 Apr 2022 11:13:50 +0200 (CEST)  
Date: Wed, 20 Apr 2022 11:13:45 +0200
From: Jan Havran <havran.jan@email.cz>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Yl/OyX6uV/Fegje3@arch-zen.localdomain>
References: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419161130.3431492-1-fontaine.fabrice@gmail.com>
X-szn-frgn: <8f514b2a-4215-4e5f-85a0-a5c31fc0cfa6>
X-szn-frgc: <0>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: untar internal bind
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V=A0Tue, Apr 19, 2022 at 06:11:30PM +0200,=A0Fabrice Fontaine napsal(a):
> Untar internal bind so libtool patches will be applied on bind's
> libtool. This will fix:
>  - installation of some libraries such as libisccfg. Indeed, if libtool
>    is not patched those libraries will be "relinked" and so not
>    installed.
>  - build failures with riscv and or1k:
> =

>   Invalid configuration `riscv64-buildroot-linux-musl': machine `riscv64-=
buildroot' not recognized
> =

>   Invalid configuration `or1k-buildroot-linux-uclibc': machine `or1k-buil=
droot' not recognized
> =

> Fixes:
>  - http://autobuild.buildroot.org/results/d25b76e628ffe5293c6bc1fd467a6b8=
966cb1bc2
>  - http://autobuild.buildroot.org/results/ba3258d8df00a7626784189125f0202=
fb161c40e
> =

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

With this patch I no longer get following error and dhcp works for me:
dhclient: error while loading shared libraries: libisccfg.so.163: cannot op=
en shared object file: No such file or directory

Tested on ARM/PineCube.

Tested-by: Jan Havran <havran.jan@email.cz>

> ---
>  package/dhcp/dhcp.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index e6f4c419f4..f815c6c802 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -14,6 +14,13 @@ DHCP_CPE_ID_VENDOR =3D isc
>  # internal bind does not support parallel builds.
>  DHCP_MAKE =3D $(MAKE1)
>  =

> +# untar internal bind so libtool patches will be applied on bind's libto=
ol
> +define DHCP_UNTAR_INTERNAL_BIND
> +	$(TAR) xf $(@D)/bind/bind.tar.gz -C $(@D)/bind/
> +endef
> +
> +DHCP_POST_EXTRACT_HOOKS =3D DHCP_UNTAR_INTERNAL_BIND
> +
>  # use libtool-enabled configure.ac
>  define DHCP_LIBTOOL_AUTORECONF
>  	cp $(@D)/configure.ac+lt $(@D)/configure.ac
> -- =

> 2.35.1
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
