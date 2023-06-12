Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C20C7EE2F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 14:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7158040BF0;
	Mon, 12 Jun 2023 14:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7158040BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9p1WW4xrav5p; Mon, 12 Jun 2023 14:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E0A340B08;
	Mon, 12 Jun 2023 14:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E0A340B08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47F061BF86B
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 14:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BDF2418D8
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 14:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDF2418D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E9oTseh5PvB4 for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 14:44:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC046418B5
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC046418B5
 for <buildroot@uclibc.org>; Mon, 12 Jun 2023 14:44:54 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1q8imp-0009Aq-Ud
 for buildroot@uclibc.org; Mon, 12 Jun 2023 16:44:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Jun 2023 16:44:15 +0200
Message-ID: <pan$50e82$a6989011$af09b958$8f4b943d@ID-313208.user.individual.net>
References: <20230508160516.1750486145__13816.8369465106$1683561965$gmane$org@busybox.osuosl.org>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [git commit] package/at-spi2-core: bump to version
 2.48.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 8 May 2023 17:17:47 +0200 schrieb Yann E. MORIN:

> commit: https://git.buildroot.net/buildroot/commit/?
id=d1757fdfb0010d29f20cd68cb6e16f019e236424
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/
Config.in
> index f56c5b93c4..2a1b21d375 100644
> --- a/package/at-spi2-core/Config.in
> +++ b/package/at-spi2-core/Config.in
> @@ -1,12 +1,13 @@
>  config BR2_PACKAGE_AT_SPI2_CORE
>  	bool "at-spi2-core"
> -	depends on BR2_PACKAGE_XORG7 # xlib-libxtst
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
>  	depends on BR2_USE_MMU # glib2
>  	depends on BR2_USE_WCHAR # glib2
> +	depends on !BR2_STATIC_LIBS # dlopen()

Hi,

this commit lacks propagation of this new dependency to its reverse 
dependencies leading to build errors:
http://autobuild.buildroot.net/results/b3b/
b3ba3533286c8a0cacdc8553f61a868a05797ea8//

For example:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_AT_SPI2_CORE
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && 
BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=y]
  Selected by [y]:
  - BR2_PACKAGE_ATKMM2_28 [=y] && BR2_INSTALL_LIBSTDCPP [=y] && 
BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && 
BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
