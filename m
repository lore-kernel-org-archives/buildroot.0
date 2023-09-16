Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B581CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E0B440B48;
	Sat, 16 Sep 2023 12:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E0B440B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQCOrnFoC9G1; Sat, 16 Sep 2023 12:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FEFE40B7C;
	Sat, 16 Sep 2023 12:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FEFE40B7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3131BF860
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66FF140B24
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FF140B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72jk0xQJBWg0 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:09:12 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2132B40AFA
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2132B40AFA
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5A8DA200402;
 Sat, 16 Sep 2023 14:09:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 14:09:08 +0200
Date: Sat, 16 Sep 2023 14:09:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20230916120908.GV2571@scaer>
References: <20230916091831.13118-1-egorenar-dev@posteo.net>
 <20230916091831.13118-2-egorenar-dev@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916091831.13118-2-egorenar-dev@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694866150;
 bh=G5uzVKcT23+nR02TzPz5suQB/hHa2j/dx7sBlLuMLWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bmi3auqSMhIgLFySfnAwQQrNYm+uKiXSQlUKImsNp4hexF+fopRNjMReGNb5ZZgn1
 V34qXAqf3cU1EJK/2ePBeOgCzvgBPTunog2PUw4HKifgPk49ApaGbvXWuWDVdRNLGA
 luSp8/P41qsSv7zwVmUs5W+ull0n2IEU1GqSkOUf8Ol1MTQGttskZsXSTSs5/P3u3r
 U2apFlqMopmK5WIdcjRmZWUpBFRgK1NqUhi/6fPIIwaho+V6cMAXKO36eSCOcGJWhY
 G/0uX+dWyboCvkwZnH4EfCzTBUhg2ai8LowneMIMk2fUcKQOZsNulAlEjMenpKErta
 JJo1DxAFgCMpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bmi3auqS
Subject: Re: [Buildroot] [PATCH 2/2] package/makedumpfile: bump version to
 1.7.3
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

Alexnader, All,

On 2023-09-16 09:18 +0000, Alexander Egorenkov spake thusly:
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/makedumpfile/makedumpfile.hash | 2 +-
>  package/makedumpfile/makedumpfile.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/makedumpfile/makedumpfile.hash b/package/makedumpfile/makedumpfile.hash
> index f38d93c04aa4..665023d87be5 100644
> --- a/package/makedumpfile/makedumpfile.hash
> +++ b/package/makedumpfile/makedumpfile.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  748583ea4c0b32346008aa53b313e9708f60a8481959c25c76e5c94740032d9b  makedumpfile-1.7.2.tar.gz
> +sha256  f059dbebf5156a9ab97cd3c1f41ad5df3436c7ab4dd6dbffa234fc4e93cfa2ce  makedumpfile-1.7.3.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
> index 8dc60b043e21..6102c92bd8bb 100644
> --- a/package/makedumpfile/makedumpfile.mk
> +++ b/package/makedumpfile/makedumpfile.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MAKEDUMPFILE_VERSION = 1.7.2
> +MAKEDUMPFILE_VERSION = 1.7.3
>  MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/$(MAKEDUMPFILE_VERSION)
>  MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
>  MAKEDUMPFILE_LICENSE = GPL-2.0
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
