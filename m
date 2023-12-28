Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC160C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 20:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 624464161C;
	Thu, 28 Dec 2023 20:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624464161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l30mkoiji33h; Thu, 28 Dec 2023 20:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C344163E;
	Thu, 28 Dec 2023 20:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C344163E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D692F1BF84C
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEE168124F
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE168124F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6C8kyiQKbkg for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 20:23:37 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B44AD811FC
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 20:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44AD811FC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 895C5B0053D;
 Thu, 28 Dec 2023 21:23:32 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Dec 2023 21:23:32 +0100
Date: Thu, 28 Dec 2023 21:23:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZY3ZRIOIIoFGX4Zd@landeda>
References: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703795015;
 bh=5BqyP4OI3PusArJSY55QLrCxYmFwbopu3JEVfuK94DM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nKb7obxF8Lc53psWHl2UoeYX1QXudf3+tSBcTv5wgCM/G/pNxvyAMeLlPS1Lr7bdm
 ku4vNWDbo6vORcZnuKj831+s1oH1q0gQmv9VCeme8fd+A85p6tAvzDx/aATuxrC89C
 ZydeSEMVJQpPHRtXRtWQBzzZe8tTu6VX71/DY7RbtgkgZa+dqYtgl+DDQvmp8l4OxF
 NLFz9FB4CjcY03NZoSqJpnAxdVp9v/K81tDKO1RM/bOWPfWgVBQtGGsHx2DFYWcCVl
 D/pW+FqMoI3HpLqPAMnOfUTsU/gzN3m8LXyTco7VjAdN1kH3TePQbE0tthwoo11ghy
 BR5BQfTmYa3fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nKb7obxF
Subject: Re: [Buildroot] [PATCH] Config.in: rework
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-27 18:07 +0100, Thomas Petazzoni via buildroot spake thusly:
> BR2_DOWNLOAD_FORCE_CHECK_HASHES currently has the following
> dependency:
> 
> 	depends on BR2_GLOBAL_PATCH_DIR != ""
> 
> However, strictly speaking checking all hashes does not necessarily
> require using BR2_GLOBAL_PATCH_DIR, as long as you don't use custom
> versions.
> 
> But more importantly:
> 
> - Having this dependency means that this options is hidden when people
>   don't use BR2_GLOBAL_PATCH_DIR. Instead the option should always be
>   made visible, encouraging people to turn it on.
> 
> - The Config.in comment was there to mitigate this previous argument,
>   but this comment then shows up all the time when you have an empty
>   global patch dir.
> 
> This seems over-complicated, and it sounds much easier to have the
> option unconditionally available, and visible, and clarify in its help
> text that in order to this to work fully with custom package versions,
> BR2_GLOBAL_PATCH_DIR can be used to provide extra hash files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master,i after fixing the typo noticed by Peter, and after
rewording the last sentence to avoid the can/must dilemma. Thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 554b4062eb..75f699154d 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -711,20 +711,18 @@ config BR2_FORCE_HOST_BUILD
>  
>  config BR2_DOWNLOAD_FORCE_CHECK_HASHES
>  	bool "Force all downloads to have a valid hash"
> -	depends on BR2_GLOBAL_PATCH_DIR != ""
>  	help
> -	  For packages where a custom version or location can be set,
> -	  Buildroot does not carry a hash for those custom versions or
> -	  locations, so the integrity of such downloads is not verified.
> -
>  	  Say 'y' here to enforce downloads to have at least one valid
>  	  hash (and of course, that all hashes be valid).
>  
> -	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
> -	  see above.
> +	  By default, Buildroot checks hashes of all packages
> +	  downloaded, except those for which a custom version is
> +	  used.
>  
> -comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
> -	depends on BR2_GLOBAL_PATCH_DIR = ""
> +	  With this option turned on, Buildroot will check hashes of
> +	  all packages, including those have use a custom version. In
> +	  order to provide hashes for such packages, additional hash
> +	  files can be placed into BR2_GLOBAL_PATCH_DIR directories.
>  
>  config BR2_REPRODUCIBLE
>  	bool "Make the build reproducible (experimental)"
> -- 
> 2.43.0
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
