Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98B3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 20:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95DA94267C;
	Fri, 10 Dec 2021 20:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKrca9uJXPyS; Fri, 10 Dec 2021 20:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D96B2425DE;
	Fri, 10 Dec 2021 20:43:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC0611BF28E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A809641324
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 20:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qx-7RPv4qW2D for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 20:43:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EEF840129
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 20:43:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 227D0B004EE;
 Fri, 10 Dec 2021 21:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639168983;
 bh=ZiiVa59HN+hVxJbygN6I7OUTdf6xeggHkSrOpi1yZ5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ityTFIhbgPOatIhif93v2PT4Bmk/owlkVGwWwYxDNW8+h9X74Rrnh64u7rGh3GAsy
 GGngkXc1r9IXsyDiQ9V4fBIXbj5V5YHLYKF31ZxFizuzsOHGi7hlYfYahD13Ks41MO
 8nt6Du7QoAsp0U2eArkt2iJ1NveDcaurUH8ZCjmd/svXzTYXOPlLSCHE6QFqFVdiYI
 GWSSoUryULJz2mC2FR6TikJKzIyaQda/HXcGqwGZCOp9BaSFagV97nUA2MbVok4Mzn
 4MBOx/gNZPNwPf0eg42MufQsy1f06pfEBDrJs8+lTEcN5TNY7W1lkkYqGd3ivd2gkg
 McBCS33CtmtiA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Dec 2021 21:43:00 +0100
Date: Fri, 10 Dec 2021 21:43:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211210204300.GN2603@scaer>
References: <20211210181838.4013689-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210181838.4013689-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.3775
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

On 2021-12-10 19:18 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2021-4069: vim is vulnerable to Use After Free
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
> index 6ab309fd9a..9fb162d798 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  16ff13ea2a11da96080510fdfccf5f3a05f82e2c7027494bd8c98704bbf14428  vim-8.2.3690.tar.gz
> +sha256  acddd083c44a3a62194b73bb2fd1327af2adf256b5978c64f97d2656dda24d07  vim-8.2.3775.tar.gz
>  sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
>  sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 1fd090b4fc..e0079d3468 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 8.2.3690
> +VIM_VERSION = 8.2.3775
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
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
