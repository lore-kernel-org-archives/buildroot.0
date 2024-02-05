Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E999C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0638A41B71;
	Mon,  5 Feb 2024 22:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0638A41B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwsTb2inPgv8; Mon,  5 Feb 2024 22:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB2B41B51;
	Mon,  5 Feb 2024 22:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB2B41B51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09E3A1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3544641B71
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3544641B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sg3uYW_bqYQ3 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:22:21 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D08D41B7F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D08D41B7F
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7744619F5C6;
 Mon,  5 Feb 2024 23:22:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 23:22:15 +0100
Date: Mon, 5 Feb 2024 23:22:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <ZcFfl7qCM9_NYuHJ@landeda>
References: <20240130215628.884512-1-troglobit@gmail.com>
 <20240130215628.884512-2-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130215628.884512-2-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707171739;
 bh=vj1NXPUetp29PGPsG0U7HFBqcCbFUF9z6j1s/Hk+Pro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EjqYjTnrDbxBHHkciZPsBWGhVpjZ6mGIiX5I5zwtSIm+/3HujkpKwrZhrhVh5qkgT
 CoDGb26vh8uhQTBv5IwHlwqMuc5riXhYDmUeGvAGmjI4p24bokthHI57cJDahtpL1g
 79lOK1s8kNN1SWsIS9t43FiPGUSoHtUo1DG0faKrBoBCRx9vMXZZzZLtNJ2VP3xKAk
 /V6WmSoKin2DMhTEM4Szjy/pPspZ35b0MyZ8K8UyR7EOuGzsKQu1KiDnj6qrH7tUmx
 mO0BxfTQo9iK1gQcez1PUkKRA/DsCuuxMBX+iizLaZZSVWEaRhLbcgmC4JCaRxzD/d
 qbkggvkOO9tlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EjqYjTnr
Subject: Re: [Buildroot] [PATCH v2 1/2] package/watchdogd: bump to version
 4.0
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

Joachim, All,

On 2024-01-30 22:56 +0100, Joachim Wiberg spake thusly:
> For details, see https://github.com/troglobit/watchdogd/releases/tag/4.0
> 
>  - Major feature upgrade, command line and .conf files compatible
>  - LICENSE hash update due to update in copyright years
>  - Enabling system monitor plugins have changed syntax upstream.  The
>    `--with-foo=SECONDS` is now just `--with-foo`
> 
> This last upstream change require converting affected Config.in options
> from int -> bool.  Legacy _WRAP:ers have been added to Config.legacy.in,
> modeled on BR2_TARGET_ROOTFS_EXT2_BLOCKS.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
> index ea033b4e71..2e67c2847e 100644
> --- a/package/watchdogd/watchdogd.mk
> +++ b/package/watchdogd/watchdogd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WATCHDOGD_VERSION = 3.5
> +WATCHDOGD_VERSION = 4.0
>  WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
>  WATCHDOGD_LICENSE = ISC
>  WATCHDOGD_LICENSE_FILES = LICENSE
> @@ -20,28 +20,29 @@ else
>  WATCHDOGD_CONF_OPTS += --enable-builtin-tests
>  endif

I also added explicit --without-XXX options for the new monitors, by the
way.

Regards,
Yann E. MORIN.

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
