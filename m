Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F428C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 15:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF9E3812D6;
	Sun, 26 Nov 2023 15:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF9E3812D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AoT14YncaMc; Sun, 26 Nov 2023 15:38:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B6A1812D5;
	Sun, 26 Nov 2023 15:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6A1812D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D3B71BF40E
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 15:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 048FB40439
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 15:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 048FB40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wVX0hO7zTta for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 15:38:28 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60DBC403BF
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 15:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60DBC403BF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D2B4978032A;
 Sun, 26 Nov 2023 16:38:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 16:38:19 +0100
Date: Sun, 26 Nov 2023 16:38:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20231126153819.GT3177259@scaer>
References: <20231122154837.31838-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122154837.31838-1-nicolas.cavallari@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701013105;
 bh=UqhaaNRyHNveBAE0Fl7W0Q/EnBQvy0CeD7iclwBxu+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mBRHTaKngRGSSFpml28H88kGjEqYd6RpaHy9QB//V/oZTg89hpH+jWxafGLazIIEG
 vEJuBpGipL/GXKaZk/2fX4GUtWd9m1vdTU9zdOZQHtpCgrCLOJInSOegQhOQaMIId/
 jdEQjkjDntQWpagbZNl+4Z19yX+ZsNOryCfpA//HULdGmxscrXhMuDZEzpCxkmZyuL
 lpvOyoxGuPcVpJ3I6Jw8TgwtaCU3aiBfx5CNGzNVMhhfJ2xxNGSesiOdhbX/gZ+giR
 hN3PsrmrnALAMBsMoOeEd32Hq/YzDP44DJEVeOQkxGlNd3t2C7OiYU926MCYn/x8B3
 Xe6czBN4nsTQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mBRHTaKn
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: fix disabling the
 documentation
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,

On 2023-11-22 16:47 +0100, Nicolas Cavallari spake thusly:
> gcc.mk attempts to disable building the documentation by setting
> MAKEINFO=missing, but it is not working.  If makeinfo is installed
> and recent enough, gcc still uses it.  This can be checked easily:
> 
> grep BUILD_INFO='info' host-gcc-initial-*/build/gcc/config.log
> 
> It happens because the root ./configure script will check
> $MAKEINFO --version (aka 'missing --version') and will overwrite it with
> MAKEINFO='missing makeinfo' because the version does not match.
> 
> Having MAKEINFO='missing makeinfo' is a problem because
> 'missing makeinfo' will actually attempt to run 'makeinfo' before
> failing with an error message.  If makeinfo is installed on the host,
> then 'missing makeinfo' will successfully run makeinfo anyway.
> 
> Many gcc subprojects will check $MAKEINFO --version and enable building
> the documentation if it is recent enough.  This patch overrides these
> checks by forcing gcc_cv_prog_makeinfo_modern=no.
> 
> Building the GCC documentation can fail with the wrong makeinfo version.
> It happened at least when building GCC 11.3.0 with makeinfo 7.1.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> This patch is mostly useful when backported to 2023.02
> ---
>  package/gcc/gcc.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 9a164c8374..93bc46643c 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -91,9 +91,12 @@ HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
>  endif
>  
>  # Don't build documentation. It takes up extra space / build time,
> -# and sometimes needs specific makeinfo versions to work
> +# and sometimes needs specific makeinfo versions to work. Override the check
> +# for a modern makeinfo otherwise the configure scripts will still enable it.
>  HOST_GCC_COMMON_CONF_ENV = \
>  	MAKEINFO=missing
> +HOST_GCC_COMMON_MAKE_OPTS = \
> +	gcc_cv_prog_makeinfo_modern=no
>  
>  GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
>  GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
> @@ -298,7 +301,7 @@ HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
>  # For gcc-final, the gcc logic to detect whether SSP support is
>  # available or not in the C library is not working properly for
>  # uClibc, so let's be explicit as well.
> -HOST_GCC_COMMON_MAKE_OPTS = \
> +HOST_GCC_COMMON_MAKE_OPTS += \
>  	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
>  
>  ifeq ($(BR2_CCACHE),y)
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
