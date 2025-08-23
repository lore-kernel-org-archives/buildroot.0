Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0DDCA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 13:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A91E60B66;
	Sat, 23 Aug 2025 13:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLz9qLPm6p19; Sat, 23 Aug 2025 13:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC1D360C30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC1D360C30;
	Sat, 23 Aug 2025 13:18:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA06D19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 13:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB32E4144B
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 13:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QquOdb25P6L3 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 13:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8F83F4092C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F83F4092C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F83F4092C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 13:17:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id DDFF92003E8;
 Sat, 23 Aug 2025 15:17:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 Aug 2025 15:17:52 +0200
MIME-Version: 1.0
Date: Sat, 23 Aug 2025 15:17:52 +0200
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org
In-Reply-To: <20250823045411.255895-1-dalang@gmx.at>
References: <20250823045411.255895-1-dalang@gmx.at>
User-Agent: Webmail Free/1.6.11
Message-ID: <a6515c77e63d83c38f3f99e4d3eef5aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755955074;
 bh=flWWqqCEjLZ+TebApWO0C8pdTnQJNKx9rThMyYjzDfg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oySl0mOgqtgqQaCjUQ5fPGZhlFM7SoGC4Kmt1YPotHTFd4otOqbihdjH1gh5arL5p
 9BNtlyJU7x+BUrE5Pf84z23kKFy3bnl3X8TXY2HvGaW3uTvjYFBhRWizhQ8XV0UN65
 SQaoVfGRTsa4f+89gL+kqp5w3+pdJnZNDjBcPgnL40w6wPc2ygWglnpQKcROwQcE1F
 1vXXYVYnZ+iRVRZPYjESyntFmJVcPhNKYkTOtwEiKBGDG9iEhTioq24ziVMSJH7bJk
 aWUz/7QzEj2JM2iEEIKzBE1LVQyzcnvyn6G8TNGTQFUU6uoMAhWzqM3a34HWhrSPyq
 TE53EpWn2239Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oySl0mOg
Subject: Re: [Buildroot] [PATCH] package/vim: security bump to version
 9.1.1665
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Daniel,

Thanks for the patch.

On 23/08/2025 06:54, Daniel Lang via buildroot wrote:
> Fixes the following CVEs:
> - CVE-2024-41957
> - CVE-2024-41965
> - CVE-2024-45306
> - CVE-2024-47814
> - CVE-2025-1215
> - CVE-2025-22134
> - CVE-2025-24014
> - CVE-2025-26603
> - CVE-2025-29768
> - CVE-2025-53905
> - CVE-2025-53906
> 
> README.txt got updated three times since the last bump:
> - [0] updated some wording regarding who the developers are.
> - [1] updated the link to the release archives
> - [2] updated the goals of the project
> 
> [0]: 
> https://github.com/vim/vim/commit/b75825f749cf87feb9ae8e7e5327bd2efe707c86
> [1]: 
> https://github.com/vim/vim/commit/4225f28855c5d3023662b3a90a70b22caf9b6ade
> [2]: 
> https://github.com/vim/vim/commit/2bfd1ee161e26ece8e5a72cdca4fff22d11728a2
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/vim/vim.hash | 4 ++--
>  package/vim/vim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 194bcb4378..e432f40a53 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  
> 0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  
> vim-9.1.0145.tar.gz
> +sha256  
> 596c75a5a2d6f93c129cc53c46fbe9fa0dcad1aab67421dc707eb945d22afa24  
> vim-9.1.1665.tar.gz
>  sha256  
> 0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  
> LICENSE
> -sha256  
> 7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  
> README.txt
> +sha256  
> ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  
> README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 7d51a6ddab..31ea637a8e 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -VIM_VERSION = 9.1.0145
> +VIM_VERSION = 9.1.1665

When testing this vim version in qemu_aarch64_virt_defconfig,
starting vim now show the error:

```
Error detected while processing 
/usr/share/vim/vim91/plugin/netrwPlugin.vim:
line    7:
E919: Directory not found in 'packpath': "pack/*/opt/netrw"
Press ENTER or type command to continue
```

Is there something missing?

>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src

It would be preferable that "vim" could start without error.
Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
