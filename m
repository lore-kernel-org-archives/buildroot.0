Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8622EC77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180BC83B62;
	Sun, 14 May 2023 12:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180BC83B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lf7r2xwXUtYq; Sun, 14 May 2023 12:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4130C83C9E;
	Sun, 14 May 2023 12:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4130C83C9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B08C1BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13EEB60AAE
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13EEB60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCZ6gHNox_rV for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDAA607B5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDAA607B5
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:51:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 13A26B00576;
 Sun, 14 May 2023 14:51:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:51:13 +0200
Date: Sun, 14 May 2023 14:51:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230514125113.GA2582048@scaer>
References: <20230319194403.450205-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230319194403.450205-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684068676;
 bh=n/1RmK2KlOxOY4vWoKVekiHzUq4mn3EZ09sfVcl+ssA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3XFZ9t5ZYTN8X31qWdjBgLBFSzoU+MyDZjuxgnqK33u1pnBv5Pim9xbUu9NKmwE6
 7FVFnWoHYE0tfKTop5KLe/ZLZ2oQOWLriD8ZmGRXIr0sLeIYzT1PlJeys0D21j/pd6
 n7uDxhVC4W/vSiD9omjhzWIit5xtIvtaldWJb9iiZfTP4GWxiFzF6Xn29WarvdolbG
 u90tV2LlihiJXZlbqvNWTC6h08KFSo3PB24AYQglEd+NjhCD/3hDbXK9lrdlAK1oKd
 0fyQdKQTeIO4HjQOxtoBIvh8FPO5KnrMTuIyhuwd6CY+2kDbrsYH9MbbdUUQZzW2LM
 RRFum4UFHAxNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M3XFZ9t5
Subject: Re: [Buildroot] [PATCH] package/rtl8821cu: bump to version
 2023-03-19 on main branch
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

Giuilo, All,

On 2023-03-19 20:44 +0100, Giulio Benetti spake thusly:
> With this bump Linux 6.3 is supported.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rtl8821cu/rtl8821cu.hash | 4 ++--
>  package/rtl8821cu/rtl8821cu.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
> index e2d83adc0f..45460d6d12 100644
> --- a/package/rtl8821cu/rtl8821cu.hash
> +++ b/package/rtl8821cu/rtl8821cu.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1d090da292c3f9322603846467a80278670211fcde3354dcabfe32c449992493  rtl8821cu-69c903b75bde36293c66b25c051916a74dbadf58.tar.gz
> -sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
> +sha256  32589c3ac3ffde6de3ecaca83570ab07a2b92a66e3265294b0469375b007a480  rtl8821cu-80781de376007ecd778dfb2bef05533e3a6cc7c6.tar.gz
> +sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
> diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
> index 5a93376c20..953da1f01c 100644
> --- a/package/rtl8821cu/rtl8821cu.mk
> +++ b/package/rtl8821cu/rtl8821cu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8821CU_VERSION = 69c903b75bde36293c66b25c051916a74dbadf58
> +RTL8821CU_VERSION = 80781de376007ecd778dfb2bef05533e3a6cc7c6
>  RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
>  RTL8821CU_LICENSE = GPL-2.0
>  RTL8821CU_LICENSE_FILES = LICENSE
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
