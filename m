Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993A7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3543E84CA8;
	Sat, 18 Dec 2021 21:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVtAy0ZAFLAE; Sat, 18 Dec 2021 21:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8639083E14;
	Sat, 18 Dec 2021 21:53:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 776251BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6579F41C80
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-O7i6BTTN4X for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:53:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8143741EA1
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:53:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E2E9A5FF20;
 Sat, 18 Dec 2021 22:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639864383;
 bh=qAEOwvTrzX0jFATqaIAhO1Nn0IoJf+D+txNhb0GE628=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t5LI2pR3sbfXTKOcwptyYahRx4cK42usBcnNMtajyJFNV+/f4HuIJ/fs2h7Cgidwf
 ppdE6zYFXfv62zJmbF5cY2lt8PSNmyh+hKUhDuGQvrtiCahtk+B6YZnjQ2shRKlLox
 ty6rUEPCA1KluWMI8T+ZLPF2B6r2pnqUkwOkG1+ictudm8QeNQ4JxUqTg1LPtJ9duH
 OyBYkfBHZkG39EvPylRrB0wxBoIHeqridNTwKMJb23c23IJlQi7V9huaDjVscm9J7h
 YY+t0g3+sZNQyUOqUQCdJepIAfRymWeoAtLePH9wCg5a1F3u0p1tB/u9rsU1GOTEc9
 rrjbFiHMSyZJA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:52:58 +0100
Date: Sat, 18 Dec 2021 22:52:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20211218215258.GS2603@scaer>
References: <20211218184110.725832-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218184110.725832-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.2.4
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

On 2021-12-18 19:41 +0100, Julien Olivain spake thusly:
> For change log since v2.2.3, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.4
> 
> ./utils/test-pkg --package fluidsynth
> 6 builds, 2 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
> index d1fd162fb1..4e544bc7f6 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  b31807cb0f88e97f3096e2b378c9815a6acfdc20b0b14f97936d905b536965c4  fluidsynth-2.2.3.tar.gz
> +sha256  83cb1dba04c632ede74f0c0717018b062c0e00b639722203b23f77a961afd390  fluidsynth-2.2.4.tar.gz
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index 61e0bf8396..4ca8518ae0 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUIDSYNTH_VERSION = 2.2.3
> +FLUIDSYNTH_VERSION = 2.2.4
>  FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>  FLUIDSYNTH_LICENSE = LGPL-2.1+
>  FLUIDSYNTH_LICENSE_FILES = LICENSE
> -- 
> 2.33.1
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
