Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4716C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9185560BAC;
	Tue, 17 May 2022 20:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaIlDqCo58no; Tue, 17 May 2022 20:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 942EB60AE9;
	Tue, 17 May 2022 20:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1D41BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59F0460AE9
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:45:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tr4H1rr8KPnJ for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:45:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CA5B60A9C
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:45:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:38de:5f35:431:927e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D300A13F814;
 Tue, 17 May 2022 22:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652820352;
 bh=2pAGz4lMghWlUF3t7jEIEu41lhGwJEoPuM4WRVvyH3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePZvo1MCgocIQJMnYjwS80gjD/6Mg1zqSm5uSt8hwLAndYXb5fDpQHUAdjhl3teqN
 kkBqvyMuYoVAXg35/TCyihO4dKDbZ3UUeFU969oW0wRU7ZM6NkD/zMa4xdhq2fcLD0
 FsLPrCyrfNLSUnLVaa6zGnYFw+h4QlNRi361ihbeRpjPorBjzCm/X2F//dV846DaDK
 2sm0Zg7zYBWk6ucyg/Ub5+1Vw56+fiVsKCMmX9BP60g2jl3IjC38B0cJINrNYENk07
 4h3rSU25gtYHmxJhqMTiujFcvVK7GxZWWPyKSZGyQ+RxBcNhxFEQEi4vekYZm4Ot+c
 Xxo7Wntg6oCUg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 22:45:48 +0200
Date: Tue, 17 May 2022 22:45:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220517204548.GT1597494@scaer>
References: <20220513202855.752024-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513202855.752024-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/alchemy: add host-pkgconf
 dependency
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
Cc: =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-13 22:28 +0200, Fabrice Fontaine spake thusly:
> host-pkgconf is a mandatory dependency since the addition of the package
> in commit 7f1f3f87868fa333833dbba9f4f07adc338b34ed resulting in the
> following ulog build failure:
> 
> /home/buildroot/autobuild/run/instance-0/output-1/per-package/ulog/host/opt/alchemy/check.mk:36: *** 'pkg-config' is required.  Stop.
> 
> An other option would be to set TARGET_OS to baremetal but it could have
> unexpected side-effects such as removing -fPIC for arm targets
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c731fe0e9bdbfce0823f9c48641f1ed710fa6125
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/alchemy/alchemy.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
> index 18cdd0a645..10d1068ac4 100644
> --- a/package/alchemy/alchemy.mk
> +++ b/package/alchemy/alchemy.mk
> @@ -8,7 +8,7 @@ ALCHEMY_VERSION = d95b3c38cd37814a1b98d0bbf813de7adaaecfbc
>  ALCHEMY_SITE = $(call github,Parrot-Developers,alchemy,$(ALCHEMY_VERSION))
>  ALCHEMY_LICENSE = BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)
>  ALCHEMY_LICENSE_FILES = COPYING README
> -HOST_ALCHEMY_DEPENDENCIES = host-python3
> +HOST_ALCHEMY_DEPENDENCIES = host-pkgconf host-python3
>  
>  ALCHEMY_HOME = $(HOST_DIR)/opt/alchemy
>  ALCHEMY_SDK_BASEDIR = $(STAGING_DIR)/usr/lib/alchemy/sdk
> @@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV = \
>  	ALCHEMY_HOME=$(ALCHEMY_HOME) \
>  	ALCHEMY_WORKSPACE_DIR="$(@D)" \
>  	ALCHEMY_TARGET_OUT=alchemy-out \
> +	PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
>  	TARGET_OS=linux \
>  	TARGET_OS_FLAVOUR=buildroot \
>  	TARGET_CROSS="$(TARGET_CROSS)" \
> -- 
> 2.35.1
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
