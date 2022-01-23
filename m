Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BBAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60914404A1;
	Sun, 23 Jan 2022 08:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEXKRI0CE9Tb; Sun, 23 Jan 2022 08:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D1E240327;
	Sun, 23 Jan 2022 08:39:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 436411BF33D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A7D181440
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 08:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZ_bMArrmAbV for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 08:39:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 551198143C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:39:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CBEACB0053A;
 Sun, 23 Jan 2022 09:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642927191;
 bh=pfldVC9GKuac9wDb6iylLI2afDQ0dDqCEOtwES1ik1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhV+GKJdf8QRXYBG/7Ar9+SKYNuuzzCTeWl9W9dT8KHvJwAhCowTBpZeHVmJr8Hck
 Ug37U60TCM/PvS8SCksvAynN/V6bvmQ1MvQGAE+XrngORfW2wpmYWbJNcEVYO1pYyt
 l2wF8D9lunhOs6QZxDvKUXqz7Fd57/37TZ3m03h8L7N2Afml74kkyECuFv4JhuaVfG
 AP4rtvQeVfhW6vX6R+a8ednjmDWePgB6TvruVSfxPGs3adj7inEEySIiD9XZGySq6z
 gJOnCJxRC18lQxJP6PyuG6+T0bhMCU7Lgta0Y6+HCUmaA2ipqHzpFaJMp554mjdTka
 z3jrlAzeEFwsQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jan 2022 09:39:48 +0100
Date: Sun, 23 Jan 2022 09:39:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220123083948.GM3621364@scaer>
References: <20220122224935.310100-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122224935.310100-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: replace mod_compress
 by mod_deflate
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-22 23:49 +0100, Fabrice Fontaine spake thusly:
> mod_compress has been subsumed by mod_deflate since version 1.4.56 and
> https://github.com/lighttpd/lighttpd1.4/commit/dab212b5f5ee468b632f40f28699efc810f27210
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lighttpd/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index ed674a9227..99a09e9766 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -38,13 +38,13 @@ config BR2_PACKAGE_LIGHTTPD_ZLIB
>  	bool "zlib support"
>  	select BR2_PACKAGE_ZLIB
>  	help
> -	  Enable zlib support for lighttpd mod_compress.
> +	  Enable zlib support for lighttpd mod_deflate.
>  
>  config BR2_PACKAGE_LIGHTTPD_BZIP2
>  	bool "bzip2 support"
>  	select BR2_PACKAGE_BZIP2
>  	help
> -	  Enable bzip2 support for lighttpd mod_compress.
> +	  Enable bzip2 support for lighttpd mod_deflate.
>  
>  config BR2_PACKAGE_LIGHTTPD_PCRE
>  	bool "pcre support"
> -- 
> 2.34.1
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
