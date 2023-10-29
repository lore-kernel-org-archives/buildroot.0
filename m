Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E4CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 11:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBAD431D2;
	Sun, 29 Oct 2023 11:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEBAD431D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84qLyjmaTCwr; Sun, 29 Oct 2023 11:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD24A431CD;
	Sun, 29 Oct 2023 11:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD24A431CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B9FA1BF3AE
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517B2704E5
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 11:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 517B2704E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KeNlYgNCRuOM for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 11:15:10 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 384AA70352
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 384AA70352
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 736EF200589;
 Sun, 29 Oct 2023 12:15:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 12:15:05 +0100
Date: Sun, 29 Oct 2023 12:15:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231029111505.GV687180@scaer>
References: <20231029085947.234836-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231029085947.234836-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698578108;
 bh=X3gCLpqNLLYmVE1ZgSPwcirA3hBCovf0SXL1pmlNKdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yic1Cmw2WWVdqcFN3PKjroJj5L/vffezOP1Od3c5eYHknzMna70Sz07tYN3vFMqMQ
 Hs8DEKuuq6eY2xXsAfVE9gHtSR+I0vFeNRjgAKjUurjAZ7LPeLvmTUC0t2O5GaOXEx
 eXzRpi7/1xIm3jXwCNU+04IBk/Gzp0qs7a1yVlJBRSL36yl97lTxPFnUTZMvwjtNVw
 49tLEUqndg8DqX8cE4xn9Srizh0sWGwZ596JhiMQzzZfukhbNa7x9hASobvfGBr+Cl
 5GbhcNCbE+jroPgFvo73KkiYDX9NxjcC1bt7oe4FVx4LqwNhULx0Rse0VfIHxoKp16
 CjriZWJCXLtmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yic1Cmw2
Subject: Re: [Buildroot] [PATCH 1/1] package/rabbitmq-c: bump to version
 0.13.0
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-10-29 09:59 +0100, Fabrice Fontaine spake thusly:
> License file renamed and slightly updated with
> https://github.com/alanxz/rabbitmq-c/commit/83a75b3943fd4d374e98f4eb758f0a170d8c8ffc
> https://github.com/alanxz/rabbitmq-c/commit/fd51cf8fdc41c3d4f4a1e8cc7ea9aea5bfbe0a0d

What are those "slight changes"? Do they affect the licensing terms?

I've slightly reworded the commit log to state that the slight changes
have no impact on the licensing terms.

> https://github.com/alanxz/rabbitmq-c/blob/v0.13.0/ChangeLog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rabbitmq-c/rabbitmq-c.hash | 5 +++--
>  package/rabbitmq-c/rabbitmq-c.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
> index dc1406d3d5..66768ef34f 100644
> --- a/package/rabbitmq-c/rabbitmq-c.hash
> +++ b/package/rabbitmq-c/rabbitmq-c.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
> -sha256  437d45e0e35c18cf3e59bcfe5dfe37566547eb121e69fca64b98f5d2c1c2d424  rabbitmq-c-0.11.0.tar.gz
> -sha256  94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422  LICENSE-MIT
> +sha256  8b224e41bba504fc52b02f918d8df7e4bf5359d493cbbff36c06078655c676e6  rabbitmq-c-0.13.0.tar.gz
> +sha256  3111fdaa26e86dd844d7c6cbb2723d0ed31702a840978ef116c86963c2429b0f  LICENSE
> +sha256  defee723621ff1c556539af42780f449f258e47e3dcc8254bcbc095863f02b7c  README.md
> diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
> index fad6655e4e..cac0f67ddc 100644
> --- a/package/rabbitmq-c/rabbitmq-c.mk
> +++ b/package/rabbitmq-c/rabbitmq-c.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -RABBITMQ_C_VERSION = 0.11.0
> +RABBITMQ_C_VERSION = 0.13.0
>  RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
>  RABBITMQ_C_LICENSE = MIT
> -RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
> +RABBITMQ_C_LICENSE_FILES = LICENSE README.md
>  RABBITMQ_C_CPE_ID_VENDOR = rabbitmq-c_project
>  RABBITMQ_C_INSTALL_STAGING = YES
>  RABBITMQ_C_CONF_OPTS = \
> -- 
> 2.42.0
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
