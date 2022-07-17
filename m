Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28CCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F14283F14;
	Sun, 17 Jul 2022 13:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F14283F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqC6e0uNDY5h; Sun, 17 Jul 2022 13:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3716F83EFC;
	Sun, 17 Jul 2022 13:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3716F83EFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 282841BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01A1D4177C
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A1D4177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJxL5IDdBSOD for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:20:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFB041779
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAFB041779
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:20:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1A6087804FD;
 Sun, 17 Jul 2022 15:20:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:20:30 +0200
Date: Sun, 17 Jul 2022 15:20:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220717132030.GC2249625@scaer>
References: <20220713212235.717229-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713212235.717229-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064033;
 bh=pemGTcJMRUKSmT+M9fnKLNtZGs6Ym/Lk6qUIv2HmR6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kmapHGiObq5ECsu0WAqYbEdgWW583KeUGlytOGWoiNRch94VhCXW/uXmN5ayoTS98
 azSHutrJOIg5V5aBR3fRQdjIAEzxlNJgjUcCvEzfrtEwChHSY28OEUy/NbVufllvT9
 DRzk85FK6Lqu5YGQBZGESpYYx07hQKBP1M64iFxPuW7GNVmHDg/xgWDMKBL6Tl45O0
 OCjc/JoNb8Fyds3YCge7jcpqw66/KIpUPe7rfIz9en09qkoIeZGI8F9j7JDSs4FhoQ
 JLl06aMfj6tQOQOtN+qMai0GTkkEB53EncnIVrqu7NgM4skF5CcyJZODDMZ12GkbOt
 j25dpuKP8ADOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kmapHGiO
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.2.8
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

On 2022-07-13 23:22 +0200, Julien Olivain spake thusly:
> For change log since v2.2.7, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.8
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Tested with:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     ./utils/test-pkg -p fluidsynth
>     ...
>     6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
> index 12e67404fa..25f9c4f07e 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  460d86d8d687f567dc4780890b72538c7ff6b2082080ef2f9359d41670a309cf  fluidsynth-2.2.7.tar.gz
> +sha256  7c29a5cb7a2755c8012d941d1335da7bda957bbb0a86b7c59215d26773bb51fe  fluidsynth-2.2.8.tar.gz
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index c4c9883102..3ae005f85f 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUIDSYNTH_VERSION = 2.2.7
> +FLUIDSYNTH_VERSION = 2.2.8
>  FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>  FLUIDSYNTH_LICENSE = LGPL-2.1+
>  FLUIDSYNTH_LICENSE_FILES = LICENSE
> -- 
> 2.37.1
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
