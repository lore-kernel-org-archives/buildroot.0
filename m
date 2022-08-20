Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C07C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 09:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D03E7405A0;
	Sat, 20 Aug 2022 09:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D03E7405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPNdIrK2tIqu; Sat, 20 Aug 2022 09:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B47494059C;
	Sat, 20 Aug 2022 09:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B47494059C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA271BF2C5
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B02D4059C
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B02D4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_q0qJ1TsM6H for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 09:24:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E18E640448
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E18E640448
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 09:24:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id ECD8D60142;
 Sat, 20 Aug 2022 11:24:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 11:24:19 +0200
Date: Sat, 20 Aug 2022 11:24:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220820092419.GH2167049@scaer>
References: <20220817213724.10547-1-ju.o@free.fr>
 <20220817213724.10547-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817213724.10547-2-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660987462;
 bh=ZBH0hidfBw1fdbX/3M9qWwCC2IZ7IdbyelHdKzKVN4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YtSzU/ULt75WOkd7MC00mEi8x6kpcbKeBhLtcs7IilOZp1rXK5+/K23+xZ5/MK+ty
 AKTvpXhXvA1biKxQOYrhCmxIVwlQ2Vk/0hCuHma/+iATLOsTaUVdhS5fNutnpD9VmG
 f7+4GvKkpWnBxCn0JZOTkmiCXd46tHoDvWzk5i4Zp6XJCAnOzptSSdG/D8n/Gvyg+I
 KXvsu9RoF9Bkbof3UTUg5oXHYRDxE7EqT/6NQ5dtcbkCddNhJv3Wc9VMHnClObUlWq
 DyctT2UabyQexNLEOm4vGYFLb670Ky3fc6ZXSdC46f2qcQOeF97tyizDO7Fk0f0Ulh
 ZCwh6A3PrNhLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YtSzU/UL
Subject: Re: [Buildroot] [PATCH next 2/2] package/linux-backports: add
 version 5.15.58
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2022-08-17 23:37 +0200, Julien Olivain spake thusly:
> This commit add a new package version, while keeping the previous one.
> 
> This was suggested in:
> https://lists.buildroot.org/pipermail/buildroot/2022-August/649398.html
> 
> This is because linux-backports increased its minimal requirements on
> kernel version. Since Buildroot want to support a wide range of kernel
> versions, this package now supports several backport versions, one for
> each kernel version era (backports v5.10.110 for kernels down to version
> 3.10, backports v5.15.58 for kernels down to version 4.4).
> 
> For detailed release commit log, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/log/?h=v5.15.58-1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I've modified and simplified the help text for the choice, and applied
to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-backports/Config.in            | 20 ++++++++++++++---
>  package/linux-backports/linux-backports.hash |  2 ++
>  package/linux-backports/linux-backports.mk   | 23 +++++++++++++++-----
>  3 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/package/linux-backports/Config.in b/package/linux-backports/Config.in
> index 251d202fd2..bdc1074ebd 100644
> --- a/package/linux-backports/Config.in
> +++ b/package/linux-backports/Config.in
> @@ -8,13 +8,27 @@ config BR2_PACKAGE_LINUX_BACKPORTS
>  	  The linux-backports package includes many Linux drivers from
>  	  recent kernels, backported to older ones.
>  
> -	  This version of linux-backports supports kernels starting
> -	  from 3.10.
> -
>  	  https://backports.wiki.kernel.org
>  
>  if BR2_PACKAGE_LINUX_BACKPORTS
>  
> +choice
> +	prompt "Linux Backports version"
> +	default BR2_PACKAGE_LINUX_BACKPORTS_5_15_X
> +	help
> +	  Newer Linux Backports version increased the minimal kernel
> +	  version requirement. This package has several versions, to
> +	  keep support for older kernels. Select the higher version
> +	  that will support the kernel version.
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_5_15_X
> +	bool "5.15.x (for kernels back to 4.4)"
> +
> +config BR2_PACKAGE_LINUX_BACKPORTS_5_10_X
> +	bool "5.10.x (for kernels back to 3.10)"
> +
> +endchoice
> +
>  choice
>  	prompt "Linux kernel driver backports configuration"
>  	default BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG
> diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
> index 83a3e54cd7..ce4278dffa 100644
> --- a/package/linux-backports/linux-backports.hash
> +++ b/package/linux-backports/linux-backports.hash
> @@ -1,5 +1,7 @@
>  # From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.10.110/sha256sums.asc
>  sha256  3d958154080c059adaf26512430fd1a8888d65a2228e5e70e48d028201e148b1  backports-5.10.110-1.tar.xz
> +# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.15.58/sha256sums.asc
> +sha256  a3c2a2b7bbaf8943c65fd72f4e7d7ad5e205aeae28b26c835f9d8afa0f9810bf  backports-5.15.58-1.tar.xz
>  # Locally computed
>  sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
>  sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> index a39891336d..dd3ff8271e 100644
> --- a/package/linux-backports/linux-backports.mk
> +++ b/package/linux-backports/linux-backports.mk
> @@ -4,7 +4,17 @@
>  #
>  ################################################################################
>  
> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_5_10_X),y)
>  LINUX_BACKPORTS_VERSION_MAJOR = 5.10.110
> +LINUX_BACKPORTS_MINIMAL_KVER_MAJOR = 3
> +LINUX_BACKPORTS_MINIMAL_KVER_MINOR = 10
> +else
> +# use default the latest version as default
> +LINUX_BACKPORTS_VERSION_MAJOR = 5.15.58
> +LINUX_BACKPORTS_MINIMAL_KVER_MAJOR = 4
> +LINUX_BACKPORTS_MINIMAL_KVER_MINOR = 4
> +endif
> +
>  LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
>  LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
>  LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
> @@ -93,8 +103,8 @@ $(eval $(kconfig-package))
>  # can't use it as a stamp file. We use the LINUX_KCONFIG_STAMP_DOTCONFIG
>  # instead.
>  #
> -# Furthermore, we want to check the kernel version, since linux-backports
> -# only supports kernels >= 3.10. To avoid overriding linux-backports'
> +# Furthermore, we want to check the kernel version is compatible with
> +# linux-backports. To avoid overriding linux-backports'
>  # KCONFIG_STAMP_DOTCONFIG rule defined in the kconfig-package infra, we
>  # use an intermediate stamp-file.
>  #
> @@ -107,11 +117,14 @@ $(LINUX_BACKPORTS_DIR)/$(LINUX_BACKPORTS_KCONFIG_STAMP_DOTCONFIG): $(LINUX_BACKP
>  .SECONDEXPANSION:
>  $(LINUX_BACKPORTS_DIR)/.stamp_check_kernel_version: $$(LINUX_DIR)/$$(LINUX_KCONFIG_STAMP_DOTCONFIG)
>  	$(Q)KVER=$(LINUX_VERSION_PROBED); \
> +	MIN_KVER_MAJOR=$(LINUX_BACKPORTS_MINIMAL_KVER_MAJOR); \
> +	MIN_KVER_MINOR=$(LINUX_BACKPORTS_MINIMAL_KVER_MINOR); \
>  	KVER_MAJOR=`echo $${KVER} | sed 's/^\([0-9]*\)\..*/\1/'`; \
>  	KVER_MINOR=`echo $${KVER} | sed 's/^[0-9]*\.\([0-9]*\).*/\1/'`; \
> -	if [ $${KVER_MAJOR} -lt 3 -o \( $${KVER_MAJOR} -eq 3 -a $${KVER_MINOR} -lt 10 \) ]; then \
> -		printf "Linux version '%s' is too old for linux-backports (needs 3.10 or later)\n" \
> -			"$${KVER}"; \
> +	if [ $${KVER_MAJOR} -lt $${MIN_KVER_MAJOR} -o \
> +		\( $${KVER_MAJOR} -eq $${MIN_KVER_MAJOR} -a $${KVER_MINOR} -lt $${MIN_KVER_MINOR} \) ]; then \
> +		printf "Linux version '%s' is too old for linux-backports (needs %s.%s or later)\n" \
> +			"$${KVER}" "$${MIN_KVER_MAJOR}" "$${MIN_KVER_MINOR}"; \
>  		exit 1; \
>  	fi
>  	$(Q)touch $(@)
> -- 
> 2.37.2
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
