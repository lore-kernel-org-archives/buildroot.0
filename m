Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ABCC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 08:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09EA4155F;
	Sun,  3 Apr 2022 08:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIe2fX4j0MWo; Sun,  3 Apr 2022 08:33:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F40409BE;
	Sun,  3 Apr 2022 08:33:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB7F91BF2AA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 08:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA4B60634
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 08:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNNNdqmRw-og for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 08:33:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58C9E605B7
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 08:33:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bcfa:8d59:a850:4621])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 40E4D780316;
 Sun,  3 Apr 2022 10:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648974803;
 bh=23aMqnMDkrF2V0mV7wHeB1kwa+caYIMr9zpwlE+407w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K+3gmymQISf/lq8pQpT40mcDR69k9/PfWSuXPn9Q3prc0kZjSSCbhHQLf19u8YIkX
 1P0u72Zjvsw4r+xHkD//xHiQjWQgSQoKyFxGpTtBxx1Nf2pgcgoIeTmjRX4es0AmCA
 5kIoIYP43ajX+et+ajEST1EI+fxxJaR1ls6mifUbqc309mubrN/FoB+ePllJ/J75JJ
 vwGJ0lDLWLxY3FM64abRAF9hHw44o+3xW7IoJSoBMuF2tlxWUfiqlzbnc7GIi2ERAl
 5GVcnj3iUyQz0fmdXHpBCrUMnGtWTjhISmNDt9W+KcNBB6+TwaDJATPmbpiq9AZ5P0
 RPQdxX3dV8A7Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 10:33:18 +0200
Date: Sun, 3 Apr 2022 10:33:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220403083318.GE1811301@scaer>
References: <20220330224521.4142504-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330224521.4142504-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python.mk: fix PEP517
 paths
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
Cc: Emile Cormier <emile.cormier.jr@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, Emile, All,

On 2022-03-30 16:45 -0600, James Hilliard spake thusly:
> From: Emile Cormier <emile.cormier.jr@gmail.com>
> 
> Use /usr target/staging prefix and / host prefix.
> 
> This allows the Python interpreter to find packages built via the new
> Flit infrastructure and fixes bug #14721.

Hint: if you reference bug fixes on their own line with:
    Fixes: #14721

then it automatically gets picked up when doing the release email, and
helps closing the referenced bug.

> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - fixup formatting
>   - fix all pep517 prefix paths
> ---
>  package/pkg-python.mk | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..867341fc7b 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -127,16 +127,16 @@ PKG_PYTHON_PEP517_ENV = \
>  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>  	--interpreter=/usr/bin/python \
>  	--script-kind=posix \
> -	--purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> -	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> +	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>  	--scripts=$(TARGET_DIR)/usr/bin \
>  	--data=$(TARGET_DIR)/usr
>  
>  PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>  	--interpreter=/usr/bin/python \
>  	--script-kind=posix \
> -	--purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> -	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> +	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>  	--scripts=$(STAGING_DIR)/usr/bin \
>  	--data=$(STAGING_DIR)/usr
>  
> @@ -147,12 +147,12 @@ HOST_PKG_PYTHON_PEP517_ENV = \
>  	$(HOST_CONFIGURE_OPTS)
>  
>  HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> -	--interpreter=/usr/bin/python \
> +	--interpreter=/bin/python \
>  	--script-kind=posix \
>  	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> -	--headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> -	--scripts=$(HOST_DIR)/usr/bin \
> -	--data=$(HOST_DIR)/usr
> +	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> +	--scripts=$(HOST_DIR)/bin \
> +	--data=$(HOST_DIR)
>  
>  ################################################################################
>  # inner-python-package -- defines how the configuration, compilation
> -- 
> 2.25.1
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
