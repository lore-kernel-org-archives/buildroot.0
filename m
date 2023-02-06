Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B952FC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 09:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D44840360;
	Mon,  6 Feb 2023 09:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D44840360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sK4wyWaksr-e; Mon,  6 Feb 2023 09:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6200E402E4;
	Mon,  6 Feb 2023 09:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6200E402E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B12A71BF2BD
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AA5481449
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 09:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AA5481449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPNN-zy6dOEb for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 09:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2579281445
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2579281445
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 09:59:39 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u27so11469770ljo.12
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 01:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNFN8/0heit35Gip1bYToSiQtqvgqIWOJnxshRBxtYk=;
 b=ivDOBEhBiboaqC0xwa7F3u+W5LMMAyyC8wCZsBsogCq5CTFbUa0qR192LuZATL2tZz
 gFVxaIElP3sFGR8yuqAeYK5fazsBQE8PisZS/rOgXVTU3TXXA2O/o9L3w0Zx/YK07sZI
 /xsrkBCkXvhwk7f3hRtRIIrRMErpHXC4xV0FHl2G7Iyl0NfoTUvl2HaKp+FzQW63bKJe
 9c+lCIsEme/AI7hAs3jWdSsQk2h8pYcY3DzC4/B8PK3CFWCnm3lLfUvO0IeVXw6q/zsF
 mmGDrWqWQyFs0dL8YY43PUJ08MIwZG/JVdDjR1o39lOTxBj9dHSfrFrgTPiVEbDPZ7Yo
 a/XA==
X-Gm-Message-State: AO0yUKUGPfXGXrW/bzb3NrMczb5PAxtrSMmFKHRuy4oUlE7GWaxSJYdW
 41aLU4h9IwC8UU0PtG82Lqd0L4joXtUMRQVS/2sxE/iuVeI=
X-Google-Smtp-Source: AK7set+YQbpbmys/XMLEbG+rYNcgf4K4pentVOG0G40RZtesLW7JHyieb0K9nDI3cxQ3KwUqKT0kO0UpwuKArnbdXCw=
X-Received: by 2002:a2e:87d0:0:b0:290:70d1:7157 with SMTP id
 v16-20020a2e87d0000000b0029070d17157mr2648104ljj.172.1675677576818; Mon, 06
 Feb 2023 01:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20221126003807.462157-1-pevik@seznam.cz>
In-Reply-To: <20221126003807.462157-1-pevik@seznam.cz>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Feb 2023 10:59:24 +0100
Message-ID: <CAEyMn7Z_WKh+4Zch3DtDFwOTXA9iQ-A0hT37vZg0pEasBGgWSw@mail.gmail.com>
To: Petr Vorel <pevik@seznam.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oNFN8/0heit35Gip1bYToSiQtqvgqIWOJnxshRBxtYk=;
 b=CpDw5bUA4Bvaw9Jc+fRzyOQOZ5uZcZgB8MUCeVy/42xuFfGCaXNJwz0zBYMBYb87l8
 rBh2+NFs6Ugyg2papFZsp42ZoshjSJBLtcfS39fcGLyQ0hNPUxjc5DLIYql6ld80lsOB
 pCDyehoPw2wdKJIDQz4a7G1j2tryPi+hOjTMYli0v/ZKCsemWlaZlgSBa18YOE8AMoIB
 +BcoSeYDk7Si35dDmNCroPdPu7VykNyt6EQD9h5bzZTnHRF+vFJI3d4LadtODX3Mv5yx
 lxgIMCW8NSOGUkRJBpuRqGz24rzKZ0c86YKB0HW6pU/S3B/2bsIFYaxMZQFlRWCU70BY
 VL0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CpDw5bUA
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20221126
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

Am Sa., 26. Nov. 2022 um 01:38 Uhr schrieb Petr Vorel <pevik@seznam.cz>:
>
> From: Petr Vorel <petr.vorel@gmail.com>
>
> This release removed: ninfod, rarpd, rdisc
> => add entries to Config.in.legacy.
>
> LICENSE file got updated (just to use SPDX)
> => update checksum.
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  Config.in.legacy             | 24 ++++++++++++++++++++++++
>  package/iputils/Config.in    | 25 -------------------------
>  package/iputils/iputils.hash |  6 +++---
>  package/iputils/iputils.mk   |  9 ++-------
>  4 files changed, 29 insertions(+), 35 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b3c35d6b07..6d20092ca4 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,30 @@ endif
>
>  comment "Legacy options removed in 2022.11"
>
> +config BR2_PACKAGE_IPUTILS_NINFOD
> +       bool "iputils 20221126 removed ninfod"
> +       select BR2_LEGACY
> +       help
> +         iputils 20221126 removed ninfod.
> +
> +config BR2_PACKAGE_IPUTILS_RARPD
> +       bool "iputils 20221126 removed rarpd"
> +       select BR2_LEGACY
> +       help
> +         iputils 20221126 removed rarpd.
> +
> +config BR2_PACKAGE_IPUTILS_RDISC
> +       bool "iputils 20221126 removed rdisc"
> +       select BR2_LEGACY
> +       help
> +         iputils 20221126 removed rdisc.
> +
> +config BR2_PACKAGE_IPUTILS_RDISC_SERVER
> +       bool "iputils 20221126 removed rdisc"
> +       select BR2_LEGACY
> +       help
> +         iputils 20221126 removed rdisc.
> +
>  config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
>         bool "libopenssl rc5 was never enabled"
>         select BR2_LEGACY
> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index 1a8b555570..ec7bc5418d 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -28,37 +28,12 @@ config BR2_PACKAGE_IPUTILS_PING
>         help
>           Installs ping.
>
> -config BR2_PACKAGE_IPUTILS_RARPD
> -       bool "rarpd"
> -       help
> -         Installs rarpd.
> -
> -config BR2_PACKAGE_IPUTILS_RDISC
> -       bool "rdisc"
> -       default y
> -       help
> -         Installs rdisc.
> -
> -config BR2_PACKAGE_IPUTILS_RDISC_SERVER
> -       bool "rdisc (server code)"
> -       default y
> -       depends on BR2_PACKAGE_IPUTILS_RDISC
> -       help
> -         Builds rdisc with server code.
> -
>  config BR2_PACKAGE_IPUTILS_TRACEPATH
>         bool "tracepath"
>         default y
>         help
>           Installs tracepath.
>
> -config BR2_PACKAGE_IPUTILS_NINFOD
> -       bool "ninfod"
> -       default y
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
> -       help
> -         Installs ninfod.
> -
>  comment "ninfod needs a toolchain w/ threads"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index db52d990f2..ea23f27f3c 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,6 +1,6 @@
> -# https://github.com/iputils/iputils/releases/download/20211215/sha256sum.asc
> -sha256  b6f67fc705490673ff4471d006221b4a2f1b1180b929d9fefd771352621ccedf  iputils-20211215.tar.gz
> +# https://github.com/iputils/iputils/releases/download/20221126/sha256sum.asc
> +sha256  745ea711fe06d5c57d470d21acce3c3ab866eb6afb69379a16c6d60b89bd4311  iputils-20221126.tar.gz
>  # Locally computed
> -sha256  973281334c2da6364fa6bdc44c1f0f8d60d80d73c782982ffc5d53b0a31aa042  LICENSE
> +sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
>  sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 84059de330..fe4468ec19 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -11,7 +11,7 @@
>  # and IPv6 updates.
>  # http://www.spinics.net/lists/netdev/msg279881.html
>
> -IPUTILS_VERSION = 20211215
> +IPUTILS_VERSION = 20221126
>  IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
>  IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>  IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
> @@ -21,19 +21,14 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  # Selectively build binaries
>  IPUTILS_CONF_OPTS += \
>         -DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
> -       -DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
> -       -DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
> -       -DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
>         -DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
> -       -DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
>         -DSKIP_TESTS=true
>
>  # Selectively select the appropriate SELinux refpolicy modules
>  IPUTILS_SELINUX_MODULES = \
>         $(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
>         $(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
> -       $(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
> -       $(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
> +       $(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
>
>  #
>  # arping
> --
> 2.38.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
