Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135CC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 17:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EFED60D63;
	Sun, 29 Jan 2023 17:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFED60D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTtu_dHFVLWq; Sun, 29 Jan 2023 17:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4207E60C1C;
	Sun, 29 Jan 2023 17:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4207E60C1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10B761BF35F
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 17:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEE2041581
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 17:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEE2041581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RARDzURionpQ for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 17:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9710A41525
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9710A41525
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 17:18:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E3BD35FFA1;
 Sun, 29 Jan 2023 18:18:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 18:18:38 +0100
Date: Sun, 29 Jan 2023 18:18:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230129171838.GQ2632@scaer>
References: <20230129163953.56236-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129163953.56236-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675012721;
 bh=hNl88UhqU2DfuE90zXD8LJXGXZOI5+gZyyXPkJx8cw4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yci1bKqAZ0HSsvKQ69Zy705ruBY69H9qc9fU2048QWQbIbqx7JCnwBVdIlqEewMv1
 +goE9eS3Lpps+aES71q2Oi8BwH1XpGiOViZ2BtbDnZI4fWbOutLOUBETyq2VDbIeq2
 o6INO0kcAcTZLsiJAzkBnnubE1IG/Eq4yE6PjEyUAPik+o1UW6MoPBxrl63b8DpJZ3
 RnnPqTr83jPe90KkVZM9QPf0TsziHkornOi+NFeR5pXDRKM/u9UM4nz30H1Dnpiouh
 CUwS6WfLFsKGUfRLbJjzfjWFTRdRrnjUUvp27zN8iURl22aWXXg7s2bvTzkHWaniVR
 kCjS+5fDzqToA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yci1bKqA
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.1260
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

On 2023-01-29 17:39 +0100, Fabrice Fontaine spake thusly:
> - Fix CVE-2023-0049, CVE-2023-0051, CVE-2023-0054 and CVE-2023-0288
> - Update hash of README.txt: typo fixed by
>   https://github.com/vim/vim/commit/f1dcd14fc5d4370476cd82895a4479ca2d252e54
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/vim/vim.hash | 4 ++--
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 03ee908db4..4000beedc1 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  c95c9abcf024bd6293ad199e4efa1c09452a9c6456c9cbaf53d896cf7b9f4d08  vim-9.0.0951.tar.gz
> +sha256  bcaf9b21ab00ab49de4f3bdfda1bcda82533ec16c412824226544a3fce6506ff  vim-9.0.1260.tar.gz
>  sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
> -sha256  de04910387a62ad4f9b36b91457c8d5ef32733ac5d768a128071b93f4821fcd1  README.txt
> +sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index d814c68630..e3648bfab9 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 9.0.0951
> +VIM_VERSION = 9.0.1260
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
> -- 
> 2.39.0
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
