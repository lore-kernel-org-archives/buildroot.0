Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEDCC433FE
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:50:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2E46103B
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D2E46103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1ABC80C4F;
	Sun, 17 Oct 2021 07:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6NHNxrexOMT; Sun, 17 Oct 2021 07:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7CA81BFA;
	Sun, 17 Oct 2021 07:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E93D1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B32E402A1
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXuT7NQeNoKP for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 460C640080
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:50:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6052:794b:b800:c2f1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id AB264200385;
 Sun, 17 Oct 2021 09:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634457013;
 bh=PxBSNUsgdFf8eHM2xkXs0cnP1lzLOtqULqDMbEnu2K0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oNCU0T1iDzGlWpI6Eu8DSJmwTk2nzPt69LErQ42uX+3MC4Qe0toeW1nh2tWYW94s9
 cqhEVUingBn/qpwizY1quvngBdQY+rK/KLDMpz4lzeOG8rLuK2S1qczIt9gTzZLBdn
 B6xyuH665xJwiLNTTwLABqM5nA3temQG5j8TUtiarM7f4Yh7ncemhHavW3k61tVpPl
 WpMlgW3sSc9KdWRWYbJjHvjGZ6EocatpGj5ebqb7W0b4t8ox/QPDdgH8wDbpmQkJ3l
 /iVp1FLcHl6kFgTc8Nv28KyQA56OmvNl1RiUbC3U01r6BsJZc9krcfnsqPIGjugR/K
 cwtUf6VvK6FYA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 09:50:09 +0200
Date: Sun, 17 Oct 2021 09:50:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211017075009.GC2400@scaer>
References: <20211016084223.2475372-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211016084223.2475372-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wf111: add missing comment
 about kernel dependency
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

Fabrice, All,

On 2021-10-16 10:42 +0200, Fabrice Fontaine spake thusly:
> Add a comment when kernel is not enabled (missing since the addition of
> the package in commit 5b13fc05b37386e64b9f46515b57b5887ee357d9)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wf111/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/wf111/Config.in b/package/wf111/Config.in
> index 8dd20a7cc5..bb4b1a5d03 100644
> --- a/package/wf111/Config.in
> +++ b/package/wf111/Config.in
> @@ -19,6 +19,10 @@ config BR2_PACKAGE_WF111
>  
>  	  https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules/device.wf111
>  
> +comment "wf111 needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
> +
>  comment "wf111 needs a glibc toolchain"
>  	depends on BR2_LINUX_KERNEL
>  	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
> -- 
> 2.33.0
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
