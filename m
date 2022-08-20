Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F6C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 09:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE158131B;
	Sat, 20 Aug 2022 09:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE158131B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1zG8_lsKMzx; Sat, 20 Aug 2022 09:23:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 408EA812F7;
	Sat, 20 Aug 2022 09:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 408EA812F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3F391BF2C5
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89E3441847
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E3441847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfGrvXjesRbY for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 09:23:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B354183A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13B354183A
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 09:23:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BF2386013B;
 Sat, 20 Aug 2022 11:23:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 11:23:38 +0200
Date: Sat, 20 Aug 2022 11:23:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220820092338.GG2167049@scaer>
References: <20220817213724.10547-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817213724.10547-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660987421;
 bh=13+HnucrJEMd3q73BolLWKsBnAEZo6gjkjTfrlJh92k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sAqtsY4G89JZiFSXqweYwXm51Y5uUyUUCkkEuEx9a22tJI8rmKV7Rr91p2HivDVg6
 gx1g8sUqMq/l5dAq7OhPaoq/Y2T5Jqa8mW75hJ8QhDZV9O78CvJl+BA1upDYDmMtFK
 bIINPwVtV7indYji4Vt4aPTN2osf5hK/VRQWoQidrjiPRjbjOR8zJm9osKFSrmaIO3
 i3/FnvsPtbkuot0zN4kfGxFEoKuuLus1gd7pJ8/TiYBEdfSBydHED6MVAmqWeRB/hy
 zcbh1862SAUgEBNX/3D098ACF4LwTOyprBEivbWUuCc+1kV57ABVl3+P/lTsmzTMZp
 4sgAZcLl6wcyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sAqtsY4G
Subject: Re: [Buildroot] [PATCH next 1/2] package/linux-backports: bump
 version to 5.10.110
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

Julien, All,

On 2022-08-17 23:37 +0200, Julien Olivain spake thusly:
> Note:
> This is not the latest package version to date. This is the latest
> linux-backports version which is not changing the minimal kernel version
> requirement, which is kept to kernels version >= 3.10.
> 
> For commit log details, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/log/?h=v5.10.110-1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-backports/linux-backports.hash | 4 ++--
>  package/linux-backports/linux-backports.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
> index 3e103424f5..83a3e54cd7 100644
> --- a/package/linux-backports/linux-backports.hash
> +++ b/package/linux-backports/linux-backports.hash
> @@ -1,5 +1,5 @@
> -# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.8/sha256sums.asc
> -sha256  19b4174d89bf11ee221458e11f1e8dace26558498774b823051156f522d2036b  backports-5.8-1.tar.xz
> +# From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v5.10.110/sha256sums.asc
> +sha256  3d958154080c059adaf26512430fd1a8888d65a2228e5e70e48d028201e148b1  backports-5.10.110-1.tar.xz
>  # Locally computed
>  sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
>  sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
> diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
> index 068dcffcc8..a39891336d 100644
> --- a/package/linux-backports/linux-backports.mk
> +++ b/package/linux-backports/linux-backports.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINUX_BACKPORTS_VERSION_MAJOR = 5.8
> +LINUX_BACKPORTS_VERSION_MAJOR = 5.10.110
>  LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
>  LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
>  LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
> -- 
> 2.37.2
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
