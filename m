Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F2CC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 895A140AA1;
	Sat, 20 Jan 2024 23:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 895A140AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RahJ-C5_T8K; Sat, 20 Jan 2024 23:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B08A940A93;
	Sat, 20 Jan 2024 23:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B08A940A93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 326DD1BF27E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 196EE6076C
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:13:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 196EE6076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sf-gPJqjLpGE for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:13:24 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39B6960A97
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B6960A97
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 70DB213F86A;
 Sun, 21 Jan 2024 00:13:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 00:13:19 +0100
Date: Sun, 21 Jan 2024 00:13:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaxTjwcOXPHz4LlW@landeda>
References: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120172839.763337-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705792402;
 bh=jqBeHMSNlIaZzxpPDamAKFzDhDdsV3DU1lB5cDI/QJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNaCLc0/RLorhezAbP+KGBAGIrob+WTc45TiPy6xU/ooow+PeL/yrxd2GB2Vh588S
 0s17BCEmbtAwLNUgiRKn52KjSQkyD9uJ+mEh5CUbLlK1qfGr5ZVNXxoZ2i8hz+Cwqw
 6TohFbBVF1U24TWO0x0mKVfx5CkDp9vo/xp8wQ7qX23p7ZBvxCOn0B8SC25u5B5yry
 bLsJ1yZRJ4lN69r9z7OJmdj6Az+WNQNULY8TEW0qazNSadK7ubqgPd0YPqAfvP1ULW
 C9s/B7urhgSuuiSeiy1GsChNyswQSemh3oBqLS8iLgllked9NCjYRtiB95CnkF6WH7
 6OMed9dzz5qgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aNaCLc0/
Subject: Re: [Buildroot] [PATCH 1/1] package/petitboot: fix NLS build
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-20 18:28 +0100, Fabrice Fontaine spake thusly:
> Fix the following NLS build failure on musl raised commit
> bf9583a50276f52edbc37d9f85df5f2cc7fdb5dc:
> 
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/mips64el-buildroot-linux-musl/13.2.0/../../../../mips64el-buildroot-linux-musl/bin/ld: discover/pb_discover-pb-discover.o: undefined reference to symbol 'libintl_textdomain'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6d440d96e811674041b5a1fdae96d4c377824c2a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/petitboot/petitboot.mk | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index c4eb20b44d..2087f01b09 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -7,10 +7,18 @@
>  PETITBOOT_VERSION = 1.14
>  PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
>  PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
> -PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
> +PETITBOOT_DEPENDENCIES = \
> +	elfutils \
> +	ncurses \
> +	udev \
> +	host-bison \
> +	host-flex \
> +	lvm2 \
> +	$(TARGET_NLS_DEPENDENCIES)
>  PETITBOOT_LICENSE = GPL-2.0
>  PETITBOOT_LICENSE_FILES = COPYING
>  
> +PETITBOOT_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
>  PETITBOOT_CONF_OPTS = \
>  	--enable-crypt \
>  	--enable-platform-auto \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
