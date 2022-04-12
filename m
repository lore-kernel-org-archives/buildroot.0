Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD77C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 20:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC97740B54;
	Tue, 12 Apr 2022 20:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T5xidj5si-m; Tue, 12 Apr 2022 20:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBBCB40B48;
	Tue, 12 Apr 2022 20:02:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C08571BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADFA740B48
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LgK3zN4v_II for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 20:02:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C265E40B47
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 20:02:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1F49B13F87E;
 Tue, 12 Apr 2022 22:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793773;
 bh=Nyk8FM3STzOMBpSvPKGoBpAlCMVtoqe19h09+sL9V74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ob13VgaBBZ40HxK4D8V4vZo+jJKI7/DR/jonCN6UEdxwrzUfATiatsXAsjvR36b0Y
 kSVZmFHIaWpvdrhdFP4td69TaaQIGa5UdGh/MIWCE41/D2hvlmCmA3ZrRIUe6kJkoN
 e4aOBB9acksnNqCSZVvjt/B/lwVRHh+Le9ABxK5IOhtiE5XFBMWeweKw3aKWJTajKE
 fSe/+fQL1qMerPbsygkpZuexuPBW+LbbpL8AUzBwkkAcfKnejXb1yCpVEbgpmQYqP5
 XcQQwFbFm1dw+7dQSXHSr88wFNKxG/tvX5m3fcBxfF8hCUG1Qz7As/FFRRjOeQFFuh
 kCBO7oBM/9kZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 22:02:49 +0200
Date: Tue, 12 Apr 2022 22:02:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220412200249.GM4029883@scaer>
References: <20220412132753.89827-1-giulio.benetti@benettiengineering.com>
 <20220412132753.89827-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412132753.89827-2-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mali-driver: fix build failure with
 archs different from aarch64 and arm
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
Cc: =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-04-12 15:27 +0200, Giulio Benetti spake thusly:
> Actually this kernel module can be built by any architecture and this
> leads to many failures. Sintce it's very unlikely that Mali will be part
> of architectures other than aarch64 and arm let's depend on BR2_aarch64
> and BR2_arm only.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f94885ef76865c3888d6cc52b35c93a742f92f3a
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, after slightly rewording the commit log thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mali-driver/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mali-driver/Config.in b/package/mali-driver/Config.in
> index fee67096c8..4c1a96d05c 100644
> --- a/package/mali-driver/Config.in
> +++ b/package/mali-driver/Config.in
> @@ -3,6 +3,7 @@ comment "mali-driver needs a Linux kernel to be built"
>  
>  config BR2_PACKAGE_MALI_DRIVER
>  	bool "mali-driver"
> +	depends on BR2_aarch64 || BR2_arm
>  	depends on BR2_LINUX_KERNEL
>  	help
>  	  This package builds and installs the Linux kernel driver for
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
