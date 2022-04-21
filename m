Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B90EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF87A84183;
	Thu, 21 Apr 2022 19:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZ_OTBm60QXG; Thu, 21 Apr 2022 19:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D116B84141;
	Thu, 21 Apr 2022 19:17:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1647F1BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 043EF41995
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YreVO2TlyFL for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:16:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DC9841993
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:16:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C4E255FF3F;
 Thu, 21 Apr 2022 21:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650568616;
 bh=xB4NBfN56YHj6LCyB/kCGUHCkyfHNprcCA0F9qTFmY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=itweu1Wo3vLNwBGjnz/9qgSXA2feCQkX1bkJZ/3HOwCLpl+OKMxFBOR8tzxaWaLnX
 oT2lWV5vC8B1M4NuG8fMzJm832euIaXa2V0cybJY/4oMJn6cPedDCisGMWOZ8L0Wgj
 d8CioD4mtouCfbEwltyH9WFZnpRaWlwj7DN2qraktitfVjVz+uFw+CSoj87i1Vq+w+
 NVkRels4crjCxnehnjsr4iUhReoJy4eoxEsgg+iWemPHMJcWNN2lIubesw9f+EVOgN
 UE9DmDaTX4fcRH3TCuRXHzxccrsmsypWqcLYRb2g5iBbAnwKYpBAHdnfyGrMOAYfY2
 jFtmLeC8jah3w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 21 Apr 2022 21:16:53 +0200
Date: Thu, 21 Apr 2022 21:16:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220421191653.GO2730@scaer>
References: <20220420135549.3536397-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420135549.3536397-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/systemd: add the missing sgx group
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
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2022-04-20 06:55 -0700, TIAN Yuanhao spake thusly:
> systemd-udevd needs this group:
>   /usr/lib/udev/rules.d/50-udev-default.rules:43 Unknown group 'sgx', ignoring
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b07fac27d4..44185a35a0 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -603,6 +603,7 @@ endef
>  
>  define SYSTEMD_USERS
>  	# udev user groups
> +	- - sgx -1 * - - - SGX device nodes

This should have been in the udev virtual package, as all the
udev-related users and groups have been moved there to be common between
systemd-udevd and the stand-alone eudev, in commit d648d81dd581
(packages/{eudev, systemd}: move common users to package/udev).

Applied to master with this fixed, thanks.

Would you be kind enough to send a follow-up patch that removes the now
misleading "# udev user groups" comment, and adds a comment, in systemd
and eudev, that directs changes to the udev virtual package instead,
please?

Regards,
Yann E. MORIN.

>  	# systemd user groups
>  	- - systemd-journal -1 * - - - Journal
>  	$(SYSTEMD_REMOTE_USER)
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
