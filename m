Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79462C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 14:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3389B41912;
	Sat, 18 Nov 2023 14:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3389B41912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9lC5jh-a9Bil; Sat, 18 Nov 2023 14:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C82B4182D;
	Sat, 18 Nov 2023 14:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C82B4182D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 695851BF2C2
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 436D7821B1
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 14:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 436D7821B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2B6AZI3tulyE for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 14:00:54 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C9AA821E5
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C9AA821E5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 55999780383;
 Sat, 18 Nov 2023 15:00:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 15:00:50 +0100
Date: Sat, 18 Nov 2023 15:00:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20231118140050.GU996011@scaer>
References: <20231117184734.139978-1-kazemi.ms@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231117184734.139978-1-kazemi.ms@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700316052;
 bh=JHOeYXQX3K/7kje4rBiOLm1XS5axyAqevs3AkNOX7Tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P07krQBwWskRPvWjOlziqt7jQRruCPrFmk+xFfuPsKYq6Zu+ZOtW9Lsp3/gddA2Ay
 Vg0bUknEQCdk1WwV9/Q3YrbtwTmFJo/dnmtvaVWp8AibCAmXg+U0DLt78Lh9HsZVC4
 u+5H1YaKiEgBrIMM4YlAHDE/Jb7CRallgU834R9ZUfAI1E52kVeIns8A9yRpYy+FPB
 gwajacteLDqG32E/a1hQnfaqsQp7NpjgdEfDZ18GYiy6U4DzFraYrQhZQtadYr9XU2
 AHTxVUTf2aCSd/EAk7uyfh/otxYYRK5O8evhr/Zrco8h2raa1w8RLHzybNFIi1UZdX
 suuvPBpklP44A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P07krQBw
Subject: Re: [Buildroot] [PATCH 1/1] package/procs: bump to version 0.14.3
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

Saeed, All,

On 2023-11-17 19:47 +0100, Saeed Kazemi spake thusly:
> Release notes:
> https://github.com/dalance/procs/releases/tag/v0.14.3
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/procs/procs.hash | 2 +-
>  package/procs/procs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/procs/procs.hash b/package/procs/procs.hash
> index 1c2fb5c3d5..19832e3897 100644
> --- a/package/procs/procs.hash
> +++ b/package/procs/procs.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  643b7ba4b769ee9f336d441ecdac779c3d52e5719a15c14bb0acb3609ce1cd99  procs-0.14.0.tar.gz
> +sha256  2f9fdbcf7324952e22565ded58148fa40387b5a5f8723996620d6c4588925713  procs-0.14.3.tar.gz
>  sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
> diff --git a/package/procs/procs.mk b/package/procs/procs.mk
> index a074ee1311..8567bf3da3 100644
> --- a/package/procs/procs.mk
> +++ b/package/procs/procs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PROCS_VERSION = 0.14.0
> +PROCS_VERSION = 0.14.3
>  PROCS_SITE = $(call github,dalance,procs,v$(PROCS_VERSION))
>  PROCS_LICENSE = MIT
>  PROCS_LICENSE_FILES = LICENSE
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
