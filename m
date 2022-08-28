Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C914ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E43F140465;
	Sun, 28 Aug 2022 09:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E43F140465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw1p3W6vv-44; Sun, 28 Aug 2022 09:41:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08BFD4040D;
	Sun, 28 Aug 2022 09:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08BFD4040D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCCA1BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27D1E81D4D
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D1E81D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PjlXRGCxG32o for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:41:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3593A81D19
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3593A81D19
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:41:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7ACB278050D;
 Sun, 28 Aug 2022 11:41:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 11:41:43 +0200
Date: Sun, 28 Aug 2022 11:41:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828094143.GH37358@scaer>
References: <20220828061038.36755-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220828061038.36755-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661679705;
 bh=USYaiPqhWJSao2nAJywJvoVer0ZQ5bWtKJspUSbaGAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N+hPnaBsEfQxsPP5B/5YdqoXM36wAtaxEVkspNPzbw89wk8sn5hcpX/lLqZU5AKty
 yQ0/evOaDJtQxGf2N/eAl6eOes2l0p8DUQpq+QjEu3H592wg2DjIYHRf+JjYcF1nf6
 kgt7rDJfwxzbO8VAvBgi9X/mtnckToC2O5/w1DmElvW2nFNHukrmHZhx8dWS3STUJm
 5s2p5gjcpGsO/Unh75egkeWo4dZGOF4zc3UkOYz7UzCYX3mF3tiRrDJzqsfrSaGwyj
 0yoTjqIHfdPEOIJULkcK6msRdeQGTy7vg9w8zRYmDn6Wn6BFh1lYohFBqMj6oXk8AK
 rCCZcF02q3bsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N+hPnaBs
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.0292
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

Fabrice, Al,

On 2022-08-28 08:10 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2022-2257, CVE-2022-2264, CVE-2022-2284, CVE-2022-2285,
> CVE-2022-2286, CVE-2022-2287, CVE-2022-2288, CVE-2022-2289,
> CVE-2022-2304, CVE-2022-2343, CVE-2022-2344, CVE-2022-2345,
> CVE-2022-2522, CVE-2022-2571, CVE-2022-2580, CVE-2022-2581,
> CVE-2022-2598, CVE-2022-2816, CVE-2022-2817, CVE-2022-2819,
> CVE-2022-2845, CVE-2022-2849, CVE-2022-2862, CVE-2022-2874,
> CVE-2022-2889, CVE-2022-2923, CVE-2022-2946, CVE-2022-2980
> CVE-2022-2982
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
> index 62b11fea7b..f06d084cb3 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  86aa403632beea5827f305e471a245d14ee9c79072f67ce8e9536169a1deaad9  vim-9.0.0008.tar.gz
> +sha256  7c97f8e8cc56157cad7d461633beb347472e134e96b5545d24d1fe451dfaecc2  vim-9.0.0292.tar.gz
>  sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
>  sha256  4afae7c984ab1a4ccd0b474a695f316e7435ab6ed46537648af925c18835d853  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index c3308b4542..5e7c34abbb 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 9.0.0008
> +VIM_VERSION = 9.0.0292
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
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
