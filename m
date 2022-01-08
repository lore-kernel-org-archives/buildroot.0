Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF91C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7537400E3;
	Sat,  8 Jan 2022 18:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcCpK9ZqvbNX; Sat,  8 Jan 2022 18:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A46B040127;
	Sat,  8 Jan 2022 18:22:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F05D1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AE3B40127
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wT7LGJEtkXKn for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85BBC400E3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:22:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 888D113F80A;
 Sat,  8 Jan 2022 19:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641666143;
 bh=wsZazck9abTNyIJc38lY+BwWGoeMVV/epuHwVLW3wfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sJGqF9WIajFB02MxM27ze9kKtWZyHv0j7kwWQ4YMnMsPJBVEBA8XCcLEzL4c5F5lI
 NSN9hye9OM5O1ngNaFD0WGc6xfRmdI4/JNknYUKew/dLs//ypohpNb5+8vdN4UhKGt
 bhrJgoRIGaCXAWCEnO3AwEso3veYfo7wLKBLjHD+BFl+2qGmqOMBv28L4V/RX7U4G0
 DmcP+U7oWDlpu5/Ded1DLsu33AS7VHFaRfAUbdC+D01CN7GwKUB86p9kid13FgV94n
 smSPbo5KLt2MxKPSwy8rqTVB34fQ3QZX7a9eU1VuJg+Bmn3eeAdL7L9biPWkkBFlYX
 YksbDu/43Em6Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jan 2022 19:22:19 +0100
Date: Sat, 8 Jan 2022 19:22:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20220108182219.GE1881783@scaer>
References: <20220106171720.12857-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106171720.12857-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 1/1] package/pkg-generic.mk: fix absolute
 paths in per-package config files
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2022-01-06 09:17 -0800, Adam Duskett spake thusly:
> Some packages (notably qmake packages) generate .cmake, .pc, and .pri files
> with absolute paths. Unfortunately, doing so breaks per-package builds because
> the paths in those files point outside the per-package sysroot for packages
> that have rsynced those same files.
> 
> - Rename FIXUP_PYTHON_SYSCONFIGDATA to FIXUP_PER_PACKAGE_FILES in pkg-generic.mk
>   to avoid more calls to ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> 
> - Add .cmake, .pc, and .pri files to the files of which to find to sed the
>   per-package paths.
> 
> This simple fix allows qt5 submodule packages to build with per-package enabled.
> 
> Based off of Louis-Paul's earlier work found here:
> https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/
> 
> And Yann Morin's feedback found here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Thanks for this iteration!

While discussing with the otehr maintainers int he room, we concluded
that we did want an even more generic soltuion, so I've sent a further
series;

    https://lore.kernel.org/buildroot/cover.1641663315.git.yann.morin.1998@free.fr/T/#t

Thanks for your persistence! ;-)

Regards,
Yann E. MORIN.

> ---
> changes v3 -> v4:
>   - Further compress the method by simply adding the files to the already
>     existing find command. (Yann)
> 
> changes v2 -> v3:
>   - Rename FIXUP_PYTHON_SYSCONFIGDATA to FIXUP_PER_PACKAGE_FILES in
>     pkg-generic.mk (Yann)
>   
>   - Combine FIXUP_CONFIG_FILES_ABSOLUTE_PATHS with FIXUP_PER_PACKAGE_FILES (Yann)
> 
> changes v1 -> v2
>   - Drop patches 2 and 3 and combine them into a single macro in pkg-generic.mk
>   - Move the PRE_CONFIGURE_HOOK to inner-generic-package so it actually runs
>   - Rename FIXUP_PC_FILES_ABSOLUTE_PATHS to FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
>   - Use $(HOST_DIR) instead of $(STAGING_DIR) to cover both stagin and host
>     directories in a single step.
> 
>  package/pkg-generic.mk | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a5fe5507b..9952ff1963 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -113,8 +113,16 @@ endif
>  # fail.
>  # So we just use HOST_DIR as a starting point, and filter on the two directories
>  # of interest.
> +#
> +# When per-package is enabled, packages may generate files with absolute paths
> +# that point to the packages per-package sysroot. However, this breaks
> +# per-package isolation when the files are rsynced to a new package that depends
> +# on the first package. because the hard-coded paths point to directories
> +# outside the packages sysroot. Run sed on all .cmake, .pc, and .pri files in a
> +# given packages sysroot containing the word "per-package" and replace the path
> +# with the appropriate per-package directory.
>  ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> -define FIXUP_PYTHON_SYSCONFIGDATA
> +define FIXUP_PER_PACKAGE_FILES
>  	$(Q)find $(HOST_DIR) \
>  		\(    -path '$(HOST_DIR)/lib/python*' \
>  		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
> @@ -122,6 +130,9 @@ define FIXUP_PYTHON_SYSCONFIGDATA
>  		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
>  		   -o \( -name "_sysconfigdata*.py" -print0 \) \
>  		\) \
> +		-o -name "*.cmake" -print0 \
> +		-o -name "*.pc" -print0 \
> +		-o -name "*.pri" -print0 \
>  	| xargs -0 --no-run-if-empty \
>  		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
>  endef
> @@ -836,7 +847,7 @@ $(2)_EXTRACT_CMDS ?= \
>  		$$(TAR_OPTIONS) -)
>  
>  # pre/post-steps hooks
> -$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
> +$(2)_POST_PREPARE_HOOKS += FIXUP_PER_PACKAGE_FILES
>  
>  ifeq ($$($(2)_TYPE),target)
>  ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
> -- 
> 2.33.1
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
