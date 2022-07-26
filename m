Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF4CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 09:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5EEF4104D;
	Tue, 26 Jul 2022 09:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EEF4104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPdFhc9qVgg5; Tue, 26 Jul 2022 09:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4800405DD;
	Tue, 26 Jul 2022 09:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4800405DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 624B01BF5AE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 09:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BC22405DD
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 09:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC22405DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMqh08YswvWq for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 09:30:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C37F3403E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C37F3403E7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 09:30:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E8BDA780524;
 Tue, 26 Jul 2022 11:30:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 11:30:09 +0200
Date: Tue, 26 Jul 2022 11:30:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Colin Foster <colin.foster@in-advantage.com>
Message-ID: <20220726093009.GJ3168@scaer>
References: <20220125190714.30785-1-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220125190714.30785-1-colin.foster@in-advantage.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658827813;
 bh=l0y/4eOPwjarcwWc7ckWJTM2o7uau03+3set430mFW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecSJ5Wr9v/E/d0VLhaiR5O6cl1LhsmEUzd0ZePxmBR282Xwh8+SIZgd9243QxE4n2
 rhkXhucHd4Fu6/+MmmB4xDSQMQ5QFWQkN1ZDyrxZPPhvr1dugqnrCT/APJIYKmuWwi
 Pm6pA4IyzqaojJ+6g2SWk5WVtFQbp78oeX7v0rdcqPLtzUqQvhMHPYfxOwONQQBbYZ
 AQSslH2/Hb6Ax70DwbFSR2Ol9qp/SGw8Ir8RAvL3XaB+Vob8Vy2Ieg5eujPCLmW7nc
 WCKcM1bwsNUq7Xp+C/4Lne1QPeYOad5maQFzR+I3aivEBLayBDUeh1/alfbNcieL7L
 5lNH9G3Jtt37Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ecSJ5Wr9
Subject: Re: [Buildroot] [PATCH] support/dependencies: add suggested regex
 to sanitize PATH variable
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

Colin, All,

Sorry for the long delay in reviewing this change...

On 2022-01-25 11:07 -0800, Colin Foster spake thusly:
> WSL typically has /mnt/c/Program Files/... in the PATH variable. The
> suggested command will remove anything that has spaces in PATH, which
> should probably be good enough for most users who see this error.

We have many other sanity checks, like current directory in PATH or
LD_LIBRARYPATH, or Perl stuff, and so on, and we do not explain for
each of them how to solve the problem. Especially, the space-in-PATH
is relatively easy to fix.

We assume that the user is knowledgeable enough to fix those on their
own.

Regards,
Yann E. MORIN.

> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  support/dependencies/dependencies.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index c604a9efcc..e49dfb84a5 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -41,7 +41,8 @@ case ":${PATH:-unset}:" in
>  (*" "*|*"${TAB}"*|*"${NL}"*)
>  	printf "\n"
>  	printf "Your PATH contains spaces, TABs, and/or newline (\\\n) characters.\n"
> -	printf "This doesn't work. Fix you PATH.\n"
> +	printf "This doesn't work. Fix your PATH. You can try running:\n"
> +	printf "export PATH=\$(echo \$PATH | grep -Po \"(?::|^)[^\ :]+(?=(?::|$))\" | tr -d '\\\n'; echo)\n"
>  	exit 1
>  	;;
>  esac
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
