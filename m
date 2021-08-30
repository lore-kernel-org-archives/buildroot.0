Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF48C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 08:27:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA7260FE8
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 08:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFA7260FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F7C605C1;
	Mon, 30 Aug 2021 08:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u60eqQwLc9Hk; Mon, 30 Aug 2021 08:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D28E86075F;
	Mon, 30 Aug 2021 08:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DEA81BF28D
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 08:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C01980E0F
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 08:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYggNPkvnA6U for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 08:27:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA05780DC8
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 08:27:32 +0000 (UTC)
Date: Mon, 30 Aug 2021 09:27:20 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <KT8NYQ.GU3EA9CGFU0J3@crapouillou.net>
In-Reply-To: <20210829215738.2160383-1-fontaine.fabrice@gmail.com>
References: <20210829215738.2160383-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libiio: drop unrecognized
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

Le dim., ao=FBt 29 2021 at 23:57:38 +0200, Fabrice Fontaine =

<fontaine.fabrice@gmail.com> a =E9crit :
> MATLAB_BINDINGS and WITH_MATLAB_BINDINGS_API have been dropped since
> version 0.21 and
> https://github.com/analogdevicesinc/libiio/commit/b968f81375b8e3e03467e27=
65173434dc6e1922c
> =

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Thanks!

Cheers,
-Paul

> ---
>  package/libiio/libiio.mk | 2 --
>  1 file changed, 2 deletions(-)
> =

> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index aec251e9a1..b36ea3bafe 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -13,8 +13,6 @@ LIBIIO_LICENSE_FILES =3D COPYING.txt
>  LIBIIO_CONF_OPTS =3D -DENABLE_IPV6=3DON \
>  	-DWITH_LOCAL_BACKEND=3D$(if =

> $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
>  	-DWITH_NETWORK_BACKEND=3D$(if =

> $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
> -	-DWITH_MATLAB_BINDINGS_API=3DOFF \
> -	-DMATLAB_BINDINGS=3DOFF \
>  	-DINSTALL_UDEV_RULE=3D$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
>  	-DWITH_TESTS=3D$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
>  	-DWITH_DOC=3DOFF
> --
> 2.32.0
> =



_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
