Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E395C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1853340227;
	Sun, 12 Dec 2021 15:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVR9E0bYbjns; Sun, 12 Dec 2021 15:08:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA27401B9;
	Sun, 12 Dec 2021 15:08:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D08E91BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C03D241EFC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goIRdI_gUbRG for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:08:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7202941EF9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:08:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6ADCF20039C;
 Sun, 12 Dec 2021 16:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639321709;
 bh=6QjrVybd24+RvYcgP6tJo2lM3zAzV/LzlnCXYpzvn6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jjp6Zo5llbivEawifeK2nyhJM09u1YFSSPQnb9LoQjUOesn+VuCB9fpB50JgEHuLi
 9n8J7l0/iAguca38T2kuB8tuJccDxWWev34MFXcA/16p7iDJSXjInquY8Wvw+3YhPr
 3uemrmxJGVI5j58NJ8Gm4AxFEDiGXejKOQUoxRG7mffZWvVZZUUqNGRhFp1OUOZsux
 wAhiho5ssbRICLrIplkMET9n2Rqrus32V0zt5e2ncUlUF+Vr2a5wPoM9FTLlfS3ROd
 0N4FfKZ2+7VAQfGqNyqyFq0AlvxLFCNEtXySd9i18Z7iCteQrHbDoKNpkBAO4esLG3
 PWjrg0ckZ6zTA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 16:08:24 +0100
Date: Sun, 12 Dec 2021 16:08:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dariobin@libero.it>
Message-ID: <20211212150824.GQ2603@scaer>
References: <20211212120753.6732-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211212120753.6732-1-dariobin@libero.it>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/davinci-bootcount: add BR2_arm
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2021-12-12 13:07 +0100, Dario Binacchi via buildroot spake thusly:
> Like the other packages for AM335x platform.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/davinci-bootcount/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/davinci-bootcount/Config.in b/package/davinci-bootcount/Config.in
> index 58f83bb98c..e34adde570 100644
> --- a/package/davinci-bootcount/Config.in
> +++ b/package/davinci-bootcount/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DAVINCI_BOOTCOUNT
>  	bool "davinci-bootcount"
> +	depends on BR2_arm # only relevant for TI am335x
>  	help
>  	  U-Boot implements a boot count scheme that can be used to
>  	  detect multiple failed attempts to boot Linux. On Davinci
> -- 
> 2.17.1
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
