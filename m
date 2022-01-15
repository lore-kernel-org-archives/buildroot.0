Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3597CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C827D40569;
	Sat, 15 Jan 2022 09:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xl1BALHXkxoo; Sat, 15 Jan 2022 09:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C72FA4010E;
	Sat, 15 Jan 2022 09:21:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E44E91BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2FA5827FB
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JY21XqyKlS69 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:21:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A4C823E0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:21:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BFBA919F54D;
 Sat, 15 Jan 2022 10:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642238478;
 bh=GBL7XNT2wgvUIiG+QfTlLLU91lGwguj/XcHsABgX5x8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hj8J/hBnkKfggZ5gE7CBCZTY7LaVOFVmHZy1q/Nfq2HjVQDpQW+85KkeQk0qBaIOS
 HU2xsztOTuG/UoIc5wZXhrvFHsY4OgoDawQXHy+n3QeNH2rSnERHgA1FMtNIbRxW7K
 wOC9gCwKW3GUADZWuyX/BB6ohiwW0TQJMX77By+WVKXjBQ3lEvYg5Dk8lHkPaeERqa
 za6vI+m1hOC5e8wntVyQ+Ta0d/aI8m5VkIUzyK91HPUoaYOwUc3Rqhfep/B9ejbXh9
 nmvQw8GSdoUIzKo9K9eRYWVfwBb4rOUgwi5bsuLYj2HAvWU2MmtT8kw70sP1Z+zHzQ
 kdp044g0HtSoQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 10:21:16 +0100
Date: Sat, 15 Jan 2022 10:21:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115092116.GC1945846@scaer>
References: <20220114222055.1202119-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114222055.1202119-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4092
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

On 2022-01-14 23:20 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2021-4192: vim is vulnerable to Use After Free
> Fix CVE-2021-4193: vim is vulnerable to Out-of-bounds Read
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/vim/vim.hash | 2 +-
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 6fa5d1bef0..fff5072063 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  39579f7d50a6e8d7c13105a288fd85f4cdfad7f11df49706bd8f16ab37fe43b8  vim-8.2.3930.tar.gz
> +sha256  2464110940c3d8d53bfef6d16912653c85187132fc0f87e937a382cafc4c6370  vim-8.2.4092.tar.gz
>  sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
>  sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 6643ef0841..408b33a409 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 8.2.3930
> +VIM_VERSION = 8.2.4092
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
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
