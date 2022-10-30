Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5247C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED8740355;
	Sun, 30 Oct 2022 11:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED8740355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8K8mwjyq8dze; Sun, 30 Oct 2022 11:45:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A3B540334;
	Sun, 30 Oct 2022 11:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A3B540334
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5813F1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C12E40390
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C12E40390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZiDYqFNORUR for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:45:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA9D0402F7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA9D0402F7
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:45:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 731E913F846;
 Sun, 30 Oct 2022 12:45:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 12:45:06 +0100
Date: Sun, 30 Oct 2022 12:45:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221030114506.GD1058960@scaer>
References: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221026183427.3933387-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667130311;
 bh=4DyJjUZSYdeRDBvvxHZcooQslIvezDJhRxrnq9Hh+qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OdWDlHqDhYrNuaEADfnoJpv0XC82X3B+wZFVEagR8z4tKH5sFIMX6WAIE5lqHwuRK
 W1+i/tfOMCVyN0KRK2Zjlg/aHNaWWjhsGgh+HzWPte4l2ss0Zzidhuk4X66lU3z2Ul
 j5H2VbCG9pj3iIIT7S0RKLoFoDXhJgUFfRV/1rj48Qr0vvpCAYRE57gyoEUEGFfhAQ
 QnWUIJpmmyT9s0hXfu2+cAfHGeb6yfaRUzciyZub3EyfJoaKalkZsoCvJkocTf7WAE
 5W7OECEIMm6ksQH112g4Sz1cFAO1JshDVPq+xS4TqECW8jXITmXPxljmPBX0tPRnAQ
 6+rLPL4ICB2yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OdWDlHqD
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot:
 introduce BR2_TOOLCHAIN_BUILDROOT_NONE
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-10-26 20:34 +0200, Thomas Petazzoni via buildroot spake thusly:
> In the internal toolchain backend, we have a choice..endchoice block
> to allow the user to select the C library, between glibc, uClibc and
> musl.
> 
> However, there are situations were no C library at all is
> supported. In this case, the choice does not appear, and does not
> allow to see the Config.in comments that are within the
> choice..endchoice block and that may explain why no C library is
> available.
> 
> For example, on RISC-V 32-bit, the only C library supported is glibc,
> and the minimum kernel header version required by glibc on this
> architecture is 5.4.0. In a future commit, we are going to add this
> dependency on glibc (to fix build issues on configurations that have
> headers < 5.4.0). But since glibc is the only supported C library on
> RISC-V 32-bit, it means that the choice..endchoice for the C library
> contains no entry, preventing from seeing the Config.in comment.
> 
> To address this issue, this commit adds a "dummy"
> BR2_TOOLCHAIN_BUILDROOT_NONE option that shows up in the
> choice..endchoice only when no C library is available. Thanks to this,
> the choice..endchoice is never empty, and the Config.in comments can
> be seen.
> 
> If the user keeps BR2_TOOLCHAIN_BUILDROOT_NONE selected, then the
> build will anyway abort early because package/Makefile.in has a check
> to verify that a C library is selected, and aborts the build if not.
> 
> Some could say that the problem should be resolved by instead
> preventing the selection of headers < 5.4.0 on RISC-V 32-bit, but that
> is difficult to do as the user can choose a custom header version, or
> simply specific that (s)he wants to use the headers of the kernel
> being built. In those situations, it's difficult to prevent selecting
> headers < 5.4.0.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

As discussed on IRC, I added an exclusiong in genrandconfig.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-buildroot/Config.in | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 6d55f87435..26d731d976 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -80,6 +80,18 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>  
>  	  https://www.musl-libc.org/
>  
> +config BR2_TOOLCHAIN_BUILDROOT_NONE
> +	bool "none"
> +	depends on !BR2_PACKAGE_UCLIBC_SUPPORTS && \
> +		!BR2_PACKAGE_GLIBC_SUPPORTS && \
> +		!BR2_PACKAGE_MUSL_SUPPORTS
> +	help
> +	  This option is visible if no C library is available for the
> +	  currently selected configuration. If you select this option,
> +	  the build will refuse to start as Buildroot needs a C
> +	  library to build a toolchain. Change your configuration
> +	  settings to make sure one of the C libraries is selected.
> +
>  endchoice
>  
>  config BR2_TOOLCHAIN_BUILDROOT_LIBC
> -- 
> 2.37.3
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
