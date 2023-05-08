Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D839C7EE25
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30BF4288E;
	Mon,  8 May 2023 20:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30BF4288E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSL9k0v7igJv; Mon,  8 May 2023 20:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 742F14202E;
	Mon,  8 May 2023 20:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742F14202E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89A461BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 632DC84421
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 632DC84421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OAR2_nCrxZr for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:56:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5202F8441A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5202F8441A
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:56:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 475FC78031A;
 Mon,  8 May 2023 22:56:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:56:46 +0200
Date: Mon, 8 May 2023 22:56:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230508205646.GS252090@scaer>
References: <20230508181001.18771-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508181001.18771-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683579408;
 bh=pcjeR9GLHLq2WRvhSrzQBwWXFnFUIGm4fD2vBbD4d5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWdm4Qa8hl+8fHwcz8wwUx9ruiD+E3hBE2u7TTyXA4DcxkXj1ssfS4paApntahXrY
 veUapdfqa9sUWkpEj4csK9btNuBif/4XJeZfOWbcO1wtZREPi3HmtQNuLi9zwDYVem
 IkuY/53mhmWEh5UPVXeb0qFS++Pi3HlgPJ3VWhhqcEaTGjYToZzNgwD81YGeH5Brwv
 88qJrsCWzcqafH8Sdor3tPKx4ZYr0pFkoiiyufSUqHmzmzhkdUBx8hgAP8D57rhejL
 RnrUDDaM4OoUCPel0MzN60Mf2cGEC9UahRKCKIgsUp815KK7mUqLlwgJRh5bxWo5bN
 h45kkWcIBhckA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MWdm4Qa8
Subject: Re: [Buildroot] [PATCH 1/2] package/openblas: add a new option to
 install tests
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

On 2023-05-08 20:10 +0200, Julien Olivain spake thusly:
> This option can be used for runtime testing or package debugging.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Following our IRC discussion, and the various quick tests I did, it
looks like tests are always built, in fact. The only reason a test would
not be built, would be if BUILD_SINGLE et al. would be disabled.

We do not offer that possibility in Buildroot, but maybe that is
autodetected by openblas, where it would disable some stuff based on the
target processor (or whatever).

So, I tweaked the comment. It does not change much rom what you wrote.
in the end...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openblas/Config.in   |  5 +++++
>  package/openblas/openblas.mk | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/package/openblas/Config.in b/package/openblas/Config.in
> index 0144e93a3f..58976e657a 100644
> --- a/package/openblas/Config.in
> +++ b/package/openblas/Config.in
> @@ -94,4 +94,9 @@ config BR2_PACKAGE_OPENBLAS_USE_LOCKING
>  	  function calls from multiple threads, then locking is
>  	  mandatory for correct operation.
>  
> +config BR2_PACKAGE_OPENBLAS_INSTALL_TESTS
> +	bool "install tests"
> +	help
> +	  Install C test programs on target.
> +
>  endif
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index f7a50d7bc7..3fa0bbfce7 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -77,4 +77,22 @@ define OPENBLAS_INSTALL_TARGET_CMDS
>  		-C $(@D) install PREFIX=$(TARGET_DIR)/usr
>  endef
>  
> +ifeq ($(BR2_PACKAGE_OPENBLAS_INSTALL_TESTS),y)
> +# The actual test list depends on the architecture and/or some build
> +# options. This macro installs all the test programs and input data
> +# found in the ctest build directory.
> +define OPENBLAS_INSTALL_TESTS
> +	mkdir -p $(TARGET_DIR)/usr/libexec/openblas/tests
> +	find $(@D)/ctest \
> +		-type f -name "x[sdcz]cblat[123]" -perm -0100 \
> +		-exec $(INSTALL) -m 0755 {} \
> +			$(TARGET_DIR)/usr/libexec/openblas/tests \;
> +	find $(@D)/ctest \
> +		-type f -name "[sdcz]in[123]" \
> +		-exec $(INSTALL) -m 0644 {} \
> +			$(TARGET_DIR)/usr/libexec/openblas/tests \;
> +endef
> +OPENBLAS_POST_INSTALL_TARGET_HOOKS += OPENBLAS_INSTALL_TESTS
> +endif
> +
>  $(eval $(generic-package))
> -- 
> 2.40.1
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
