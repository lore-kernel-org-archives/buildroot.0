Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7344DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 11:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67D540299;
	Mon, 14 Feb 2022 11:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Klol1id8EKUK; Mon, 14 Feb 2022 11:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5DD401DD;
	Mon, 14 Feb 2022 11:59:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1DA1BF20B
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3821F827D9
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABJtWAz4O13z for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 11:59:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95C9581D9F
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:59:22 +0000 (UTC)
Date: Mon, 14 Feb 2022 11:59:11 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Peter Korsgaard <peter@korsgaard.com>
Message-Id: <NMMA7R.6PHCSWRM9I1N1@crapouillou.net>
In-Reply-To: <20220209165213.4498-25-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209165213.4498-25-peter@korsgaard.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 024/107] package/libiio: drop python2 support
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

Le mer., f=E9vr. 9 2022 at 17:50:50 +0100, Peter Korsgaard =

<peter@korsgaard.com> a =E9crit :
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  package/libiio/Config.in |  2 +-
>  package/libiio/libiio.mk | 10 +++-------
>  2 files changed, 4 insertions(+), 8 deletions(-)
> =

> diff --git a/package/libiio/Config.in b/package/libiio/Config.in
> index 0d89331c89..98d663e203 100644
> --- a/package/libiio/Config.in
> +++ b/package/libiio/Config.in
> @@ -91,7 +91,7 @@ config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
> =

>  config BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON
>  	bool "Install Python bindings"
> -	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3
>  	help
>  	  Install the Python bindings.
> =

> diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
> index a4fe0d4541..48e2f385e3 100644
> --- a/package/libiio/libiio.mk
> +++ b/package/libiio/libiio.mk
> @@ -73,14 +73,10 @@ LIBIIO_CONF_OPTS +=3D -DHAVE_DNS_SD=3DOFF
>  endif
> =

>  ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
> -ifeq ($(BR2_PACKAGE_PYTHON),y)
> -LIBIIO_DEPENDENCIES +=3D host-python-setuptools python
> -LIBIIO_CONF_OPTS +=3D -DPYTHON_EXECUTABLE=3D$(HOST_DIR)/bin/python
> -else ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  LIBIIO_DEPENDENCIES +=3D host-python3-setuptools python3
> -LIBIIO_CONF_OPTS +=3D -DPYTHON_EXECUTABLE=3D$(HOST_DIR)/bin/python3
> -endif
> -LIBIIO_CONF_OPTS +=3D -DPYTHON_BINDINGS=3DON
> +LIBIIO_CONF_OPTS +=3D \
> +	-DPYTHON_BINDINGS=3DON
> +	-DPYTHON_EXECUTABLE=3D$(HOST_DIR)/bin/python3
>  else
>  LIBIIO_CONF_OPTS +=3D -DPYTHON_BINDINGS=3DOFF
>  endif
> --
> 2.20.1
> =



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
