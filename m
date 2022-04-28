Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F11C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55DF83EDD;
	Thu, 28 Apr 2022 22:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXp1q7UIxxjh; Thu, 28 Apr 2022 22:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C0883403;
	Thu, 28 Apr 2022 22:04:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4BB1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AA2C4049A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTDSh8DfXxyR for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:04:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D78140004
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:04:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dcb4:7861:786a:5693])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1CDAB19F576;
 Fri, 29 Apr 2022 00:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651183495;
 bh=2JcxswlKRr1q5ZIsqsRQZuFsuPgs5uq8iO55MjYPIJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p6iWIkd5+yNX6Xhud0Fkc5D9DOpKjDPNeAzy6TKh70djxhubLQuEOUg9Z9abEwebe
 Is1Zd4/LuLU7trgqWZMD4F+Gix0jyg0R4eXBUYa7dc9BFjjRgj0Tu9zg76K1fIjk/n
 +dgItxA7WjYKDV7IrCN4ATF2gwcnMZH+liks+puI9cCf0QLiw1xa+rc6fxjWBOTwgP
 KEQT1F5Fv9iNtmVDnrlJrizQYfhJB9IwHoqeDcu+G1qcuLpL0LfPxgfl2HXK8bz2RW
 TexWrxMh4PepLZvZS46JhYRAG4YGJ9K0pFTKgjYdcoJW0mgfWlNS6alAyRw9g2myTI
 9tDWTwwi7odSw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Apr 2022 00:04:45 +0200
Date: Fri, 29 Apr 2022 00:04:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220428220445.GJ3624965@scaer>
References: <20220428212011.534725-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428212011.534725-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] Revert "toolchain/toolchain-external: error
 if BR2_TOOLCHAIN_EXTERNAL_PATH is not set"
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Kristof Havasi <havasiefr@gmail.com>, Buildroot List <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-28 23:20 +0200, Thomas Petazzoni via buildroot spake thusly:
> This reverts commit 8945ba49480a7885d104445ca855ef7681a374ff.

I've changes this to the corresponding sha1 on master.

> This commit is incorrect, as it is perfectly valid for
> BR2_TOOLCHAIN_EXTERNAL_PATH to be empty. The help text of
> BR2_TOOLCHAIN_EXTERNAL_PATH even documents it as a supported case:
> 
>           If empty, the compiler will be searched in $PATH.
> 
> Commit 392b0a26f5fd8d3aedce7e0c15f9762a79312f01 ("toolchain-external:
> default BR2_TOOLCHAIN_EXTERNAL_PATH to empty") even made that the
> default saying "In addition, it in fact works correctly when it is
> empty. In that case, the toolchain will be searched in PATH."
> 
> A user has reported that commit
> 8945ba49480a7885d104445ca855ef7681a374ff breaks his use-case:

And here I kept that hash and added a comment that it's a backpor of the
commit on master.

>   https://lore.kernel.org/buildroot/CADBnMvhgaozAgZgy3njckjL1i0U6bZ0fLrq-kdFF-qpGhFWgmw@mail.gmail.com/
> 
> Reported-by: Kristof Havasi <havasiefr@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> ---
> This should be backported to 2022.02.x

Ah, I missed that post-cpmmit-log mesage earlier.

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c7f4175c9e..299b6008aa 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -69,12 +69,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>  TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
>  else
>  TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL)$(BR_BUILDING),yy)
> -ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
> -$(error No external toolchain path set, check your BR2_TOOLCHAIN_EXTERNAL_PATH setting)
> -endif
>  endif
> -endif # BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
>  
>  ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
>  ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
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
