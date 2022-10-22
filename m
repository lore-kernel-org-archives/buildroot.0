Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D3C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 21:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50E9340142;
	Sat, 22 Oct 2022 21:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E9340142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mYTNEVyPqXP; Sat, 22 Oct 2022 21:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E650B40155;
	Sat, 22 Oct 2022 21:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E650B40155
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D82B31BF3BC
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0D6A607B4
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D6A607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XfnHNu-IVY-A for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 21:15:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 137F3607AA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 137F3607AA
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 21:15:26 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.231]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1p6U5K0B2X-00tX1q; Sat, 22
 Oct 2022 23:15:23 +0200
Date: Sat, 22 Oct 2022 23:15:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221022231522.1d63bec4@gmx.net>
In-Reply-To: <20221022201052.28903-1-fontaine.fabrice@gmail.com>
References: <20221022201052.28903-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:B1LpO3gMMkHfHSpMyys/vtpfaZ7cLDuIMpB73k6YMIhzPYsoKcG
 7GCEZjIBV2H9nOosTRQ0otWVNUvF6iEDul1s2O8a91rPy4EPNZfCwCAV+mrybEXv0Wad9lm
 +D85S6pnwcrhfdukC5UMuqKXjtZ54Ep1qbkJ3eQjibE8yDiCL5OM5sWbL01dIVEVHucC4ZI
 BvE+A66qfuKsKDnbOmN4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T2Kxum9GvyA=:jXzxcGQPaKusTlNBpsozx4
 lMx2A6Jgs0nJCSfmLp/EZNCxgCKGoEf7/gry3Pc0GzPLhwhWhe2MxEqVUXYjZsRqHukqRULdI
 qHteuobytx6qTMdBIwWQlvFR0ktMGlVkSjC8LoKYDmkG0jP9QoEy9ryZ8FP/wD+MvXQ6SmYFm
 rqzPtDaUpN2QflN79jF73MAEIFFeEUazVxR66vxw5ruNIs3oBF7dwpFrsXnSiJ3LDs2PVhMy0
 wHKH4wduBuwX9GJFYdsFvuXIJtzX+sVW5e6tumLQ0KlriXREqD8eQOQJ6wqB/8WW86K/r4UD/
 Fxe8MsOfi8gmaqaUPu99vafj/D3D3ePDR5kzpsfIGRGvHZUUdUCiz3U4b7fIxRP7ijOWSA1S/
 toFmJtUxrcuUQi+vEUlterfpSVvgu+cuw3zf3j/vT52aV/TpL7oV9XBNlYclhyEEsUMdk8+ua
 vEXoFWN5/7AXamLDCRavKgIzSZJgzZLvJOISwn60YESRZHyOr/wZxG6FJI8tX84h1m5wD6kyA
 jBTe3K99PSGv+mqA4jRwFGjPMC2HXuhy1wunPUatD1wLsq779En12lNNCWBmxPix0/YcvwfFq
 HXl5WHnuMQUmD9ZY+X4eoPzv6lhUkrmoDKxkItNV2snH659Db8czO5RIPgATaSbj5yP2KIXeJ
 CMZVYDozIb7fVHZpWJyFygz/rBPS68zAA56s4zzFIf9GnqO0mRsAE86/OzhJobeWtv07WsmWD
 pAQhABdtHz8tucVqieM3t/ry2s+p54skZRDRYNBeM9FVZLTSMt3hviYRCs+REfZG7F4TePeEM
 3sRBqB9J4aCNCOLUCnc9MkvJm7mq46Xj7SHHmWJoyWles307P69/ipttg6fB8KD6RpTypcvx+
 apXQyajfTXmlBdw9xiRuTLxV72NJqrBrpMd88UhXjvtUyaB6HkcC+Nrd33VGZW/CKPoOJPwjl
 lhjAzMQmhWrt0cacK5woVH+j2XK8LBYd3ukzyy2nngO2qYgbEIWDqTsEH8U6RVUllgP4gR3Bk
 dIkTa8RqZiRoTxYsyxX7P3cmHKhCYmougjs2rAQRPwFK+xwr9dxN5uhQJchGZ9T6yk89OOUyK
 +r31GXbGyUIw9TFmv8EBUb/uGJyS6TgI2i/zpsyBRhHeGvWWE6asRPJA1lxGSJNLL6UNU08ZQ
 7qJVYoFvitzCfqJOwl6xWt7+eiXqlvsQBp2ef/i/svTPkzIT7syjHEzvlBVh6T1PRRj2IM+Yb
 Fd4Bv+WeCENFqd7ahRVtAW+iWnL5lG3tOycV/oRDEmTvlZK7/VsSH4Y4APwQjlNuNG+g8pHfc
 OAvEPC78PFvJCq4TPVrwdghus5Ykmc4Q+HbjlDoBL+bqkHSF3NkVisDVIddCt7nkg/Qa0oUbv
 42jW8DJezw7Fpk8p7/GSnzodURkjj6t5xXrUjbAUJUbObqxNJNVhkAA1ChwWAjx+KE2z0f2pF
 swRvn4lAPvkTylVuZJjjt7DSo3eOoSYPe4fQ2yR6wxzZgAh95lxEQVhuOeqT8aR2Ct6IGI4Bb
 6/mZ4QfJ3hL0CrFrNhhlH1oW9ZYkhOAVP3Bsd9Hy62s+3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1666473323;
 bh=x++Rc2sfVpXkg3tnHHnvuSRjq/Lk3pdwYEcxquvWkv0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=D7g9nhEwrs66ymqIWYUPJg28Xq0gLKvV2J1KF6PSZe9VtaahqHzG0zWgID0TgbwMt
 wVah2iblbbuNzJx5pyt2+llk6M3xeoft0kCrco0WNpFJgx+WwuXn7TDD67i5VvWbdc
 eCXg5j5ZnzuQQHUATCvmL/MRJ5FFQzqu4m+hh5SM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=badeba3b8450 header.b=D7g9nhEw
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: bump to version 0.13.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 22 Oct 2022 22:10:52 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> usbredirserver was dropped by
> https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da2803684776f7659083a530819

Time to enable tools/usbredirect as it seems to be the replacement for usbredirserver
(according to [1])?

Regards,
Peter

[1] https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/2


>
> https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  Config.in.legacy               |  7 +++++++
>  package/usbredir/Config.in     | 12 ------------
>  package/usbredir/usbredir.hash |  4 ++--
>  package/usbredir/usbredir.mk   | 16 +---------------
>  4 files changed, 10 insertions(+), 29 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0e63d59a98..39b00547c8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>
>  comment "Legacy options removed in 2022.11"
>
> +config BR2_PACKAGE_USBREDIR_SERVER
> +	bool "usbredirserver removed"
> +	select BR2_LEGACY
> +	help
> +	  usbredirserver has been dropped by upstream since version
> +	  0.13.0
> +
>  config BR2_KERNEL_HEADERS_5_17
>  	bool "kernel headers version 5.17.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
> index 8ce180a884..2190cb88ac 100644
> --- a/package/usbredir/Config.in
> +++ b/package/usbredir/Config.in
> @@ -18,15 +18,3 @@ config BR2_PACKAGE_USBREDIR
>  	  'y' below if you want the server too.
>
>  	  http://www.spice-space.org/page/UsbRedir
> -
> -if BR2_PACKAGE_USBREDIR
> -
> -config BR2_PACKAGE_USBREDIR_SERVER
> -	bool "usbredirserver on target"
> -	help
> -	  If you want to serve usbredir requests on your target, say
> -	  'y' here to have the usbredir server on the target.
> -
> -	  Note: the server is not required to use the library.
> -
> -endif
> diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredir.hash
> index f738c36690..577e08efba 100644
> --- a/package/usbredir/usbredir.hash
> +++ b/package/usbredir/usbredir.hash
> @@ -1,5 +1,5 @@
> -# https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum
> -sha256  fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d  usbredir-0.12.0.tar.xz
> +# https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum
> +sha256  4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e  usbredir-0.13.0.tar.xz
>
>  # Hash for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> index 6792a3e758..6d5a80cbf9 100644
> --- a/package/usbredir/usbredir.mk
> +++ b/package/usbredir/usbredir.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -USBREDIR_VERSION = 0.12.0
> +USBREDIR_VERSION = 0.13.0
>  USBREDIR_SOURCE = usbredir-$(USBREDIR_VERSION).tar.xz
>  USBREDIR_SITE = http://spice-space.org/download/usbredir
>  USBREDIR_LICENSE = LGPL-2.1+ (libraries)
> @@ -17,18 +17,4 @@ USBREDIR_CONF_OPTS = \
>  	-Dtests=disabled \
>  	-Dtools=disabled
>
> -ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
> -
> -USBREDIR_LICENSE += , GPL-2.0+ (program)
> -USBREDIR_LICENSE_FILES += COPYING
> -
> -else # BR2_PACKAGE_USBREDIR_SERVER != y
> -
> -define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> -	rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
> -endef
> -USBREDIR_POST_INSTALL_TARGET_HOOKS += USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> -
> -endif # BR2_PACKAGE_USBREDIR_SERVER
> -
>  $(eval $(meson-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
