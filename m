Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F75C4167B
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 15:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2404418AF;
	Sat, 25 Nov 2023 15:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2404418AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9C4SKTxQXizo; Sat, 25 Nov 2023 15:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093FA418A4;
	Sat, 25 Nov 2023 15:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093FA418A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1AF1BF423
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5310B403BE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 15:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5310B403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTcKDRPMHzFC for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 15:42:13 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E63C400C6
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 15:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E63C400C6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5B8CE13F8D5;
 Sat, 25 Nov 2023 16:42:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 16:42:07 +0100
Date: Sat, 25 Nov 2023 16:42:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231125154207.GM3177259@scaer>
References: <20230930221727.1458825-1-arnout@mind.be>
 <20230930221727.1458825-4-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930221727.1458825-4-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700926931;
 bh=E2Z1k8xPJtZURnl2YNBUU+dQaXFwYXkDuu2aL34gBbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u4rnr6ZAJNf10ohH+szWSZ47YeLH7t8Y26YJELSEu9sn4mOct0Om68bMZB5lsAiC/
 y35b407fq3bCas19Y3rNgjypYl1xKxDx0lwqeFhxAOlGW3SK5J/hur82095gUKyPG8
 1uxy1hGKZ9Esl6OQPEP5eFez5wAg+TFkj/QcHBecxlJjFIptUOv+Zu10f5fMNRhFah
 uATkn4EBZ4GHurkSEuB8Gwxw+ewc0HpzUAsQ8+zOc83Z3eu36TMoE7hfhAELsOE8Vw
 0p60Q7RqkyomgW70s8Fs2n5XfMjNp1jZvpdeOIbRvySZ8vr66jcu5n16TDcvlMlt7u
 tIK6dRohapfmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u4rnr6ZA
Subject: Re: [Buildroot] [PATCH 03/10] package/pkg-python.mk: split the
 commands in a target and host section
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Signed-off-by : Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-10-01 00:16 +0200, Arnout Vandecappelle via buildroot spake thusly:
> Only define the _CMDS variables that are relevant for the target resp.
> host variant. Duplicate the _BUILD_CMDS. This will allow us to
> differentiate part of the _BUILD_CMDS definition in a follow-up patch.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 47 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index eacf75c165..c1640d71bb 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -324,6 +324,7 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
>  $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
>  endif # SETUP_TYPE
>  
> +ifeq ($(4),target)
>  #
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> @@ -338,20 +339,6 @@ define $(2)_BUILD_CMDS
>  endef
>  endif
>  
> -#
> -# Host installation step. Only define it if not already defined by the
> -# package .mk file.
> -#
> -ifndef $(2)_INSTALL_CMDS
> -define $(2)_INSTALL_CMDS
> -	(cd $$($$(PKG)_BUILDDIR)/; \
> -		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> -		$$(HOST_DIR)/bin/python3 \
> -		$$($$(PKG)_BASE_INSTALL_CMD) \
> -		$$($$(PKG)_INSTALL_OPTS))
> -endef
> -endif
> -
>  #
>  # Target installation step. Only define it if not already defined by
>  # the package .mk file.
> @@ -380,6 +367,38 @@ define $(2)_INSTALL_STAGING_CMDS
>  endef
>  endif
>  
> +else # host
> +
> +#
> +# Host build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	(cd $$($$(PKG)_BUILDDIR)/; \
> +		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +		$$(HOST_DIR)/bin/python3 \
> +		$$($$(PKG)_BASE_BUILD_CMD) \
> +		$$($$(PKG)_BUILD_OPTS))
> +endef
> +endif
> +
> +#
> +# Host installation step. Only define it if not already defined by the
> +# package .mk file.
> +#
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +	(cd $$($$(PKG)_BUILDDIR)/; \
> +		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +		$$(HOST_DIR)/bin/python3 \
> +		$$($$(PKG)_BASE_INSTALL_CMD) \
> +		$$($$(PKG)_INSTALL_OPTS))
> +endef
> +endif
> +
> +endif # host / target
> +
>  # Call the generic package infrastructure to generate the necessary
>  # make targets
>  $(call inner-generic-package,$(1),$(2),$(3),$(4))
> -- 
> 2.41.0
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
