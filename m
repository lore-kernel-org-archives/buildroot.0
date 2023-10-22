Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A411ECDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 18:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42BEC41570;
	Sun, 22 Oct 2023 18:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42BEC41570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsayjTsim1iK; Sun, 22 Oct 2023 18:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631374154E;
	Sun, 22 Oct 2023 18:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 631374154E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5101BF385
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15FFB40135
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15FFB40135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAvajKYcD70g for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 18:33:37 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAC0640012
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 18:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAC0640012
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:9668:e224:b510:3431])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 99A62B00571;
 Sun, 22 Oct 2023 20:33:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 20:33:31 +0200
Date: Sun, 22 Oct 2023 20:33:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231022183331.GS2607@scaer>
References: <20231019213756.635868-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019213756.635868-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697999613;
 bh=u/E6UUEY0UJuD9J1VJV0xEI2Cuvw54zWV98GGtOqKJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bClooi3OWZb+ZQBg+7rkALRoFnSJ1Lc380fBDjW/g7EaVnwvUPc5a/nDW6R2XUaJh
 moyUA5ZLH9Hbv0yOsnN/bnvD2JkOZJQSIf5O1B0OPBMrNdwqV/rc8XjOCVbut5AGf/
 ay7tivoHrT/+e7nvTaACKDCGR1rST9jNZUD1vvqlJ9COeeB/cOPAdr1NH6gvzZ/f9G
 4P72pxAWRLFE128/Dv2x2WYW6Otz0PU3wS5huoQXxaP7PfmWZJZYP/s/XGMIUTanbF
 11DwnFFxC4kEy78qsXP6NlaCnbaLjjb7jqsFFQlgvyE6Ws0ApbYFFrpO1ljmIVaxOM
 +RCmO0tjVuPCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bClooi3O
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.2053
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

On 2023-10-19 23:37 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2023-5344, CVE-2023-5441 and CVE-2023-5535
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
> index 024c014bc9..8fdb6998c9 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  ba769f8513f2f75d71518f817f945809a5cb1310fd58cd86daca96e658cccf7d  vim-9.0.1903.tar.gz
> +sha256  29d0e5212daedbff1b781edba1b66f549b1a226020271f20aa9884abfdf39fc7  vim-9.0.2053.tar.gz
>  sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
>  sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index b8b50cb91a..37684e0aa3 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 9.0.1903
> +VIM_VERSION = 9.0.2053
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
> -- 
> 2.42.0
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
