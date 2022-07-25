Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47190C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 09:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E498740A79;
	Mon, 25 Jul 2022 09:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E498740A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id el1XBCGFxqus; Mon, 25 Jul 2022 09:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E522D405AF;
	Mon, 25 Jul 2022 09:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E522D405AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE3D1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034DA418CC
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 09:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 034DA418CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id entFnEwcdxY3 for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 09:05:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC90418A8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AC90418A8
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 09:05:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 010FC19F74F;
 Mon, 25 Jul 2022 11:05:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 11:05:47 +0200
Date: Mon, 25 Jul 2022 11:05:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220725090547.GB3168@scaer>
References: <20220725001736.695275-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725001736.695275-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658739951;
 bh=Ly4iGSIYSkd7LNMZdFyoOvbOjR+pVeSZNjRCfoyeaTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQ2VbVYBKIsZGTRMD3sknUaT8bXciyqKXJsaUPrfyipWvxXuVUtg/KSMSV0Of1Sf4
 tX79rrFYd7TVnLG1/GKYQp5lAscSmFkjOZ4UykCRlNQ8iCPrPK5zPGHQkY6TLl1C4n
 1Lca/FiRrKtPuxIpokd8/WE4yp0TJjkBX2ZoW9vhE2AsC4xRhYk5mrEyOjSy2OZcl/
 zars3rFdDuvH+46NUs2AG5IIzXirtPrexfdTnoZjjz47ahf+d7GZnG/dZ2QLx4TBRj
 KQz0uNqxZrlK27djDGExiA3uLi5szniZy/ElQU1NXKVcaEmNAR8MsajMLOhsg8edgW
 CpJUUBg3m9ivQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eQ2VbVYB
Subject: Re: [Buildroot] [PATCH 1/1] package/runc: fix typo: OCP to OCI
 specification
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-07-24 17:17 -0700, Christian Stewart via buildroot spake thusly:
> The Config.in has a typo: "OCP specification"
> 
> It should be OCI for Open Container Initiative.
> 
> https://opencontainers.org/
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/runc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/runc/Config.in b/package/runc/Config.in
> index 66203896a8..fe527b1954 100644
> --- a/package/runc/Config.in
> +++ b/package/runc/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_RUNC
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
>  	help
>  	  runC is a CLI tool for spawning and running containers
> -	  according to the OCP specification.
> +	  according to the OCI specification.
>  
>  	  https://github.com/opencontainers/runc
>  
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
