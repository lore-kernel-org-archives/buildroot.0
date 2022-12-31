Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CD9C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C9F60ADD;
	Sat, 31 Dec 2022 16:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61C9F60ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrJtIi2HJpJS; Sat, 31 Dec 2022 16:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A129860AC4;
	Sat, 31 Dec 2022 16:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A129860AC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A35541BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C3FD403A9
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3FD403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLLhYun32Agi for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:21:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC4C40393
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CC4C40393
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:21:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E931313F895;
 Sat, 31 Dec 2022 17:21:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 17:21:42 +0100
Date: Sat, 31 Dec 2022 17:21:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221231162142.GP2498764@scaer>
References: <20221230200332.6598-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221230200332.6598-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672503705;
 bh=9Ir51lPDv7p+WoIGCcuFdIkKIGkUnOD+3fYvgWjr9rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=axAa3kQcJCVr6SyEvnNWg+6QT6MwpOx5MaLTOpMOrRjc/kru5pSqFfLSTrkYUfNwj
 hOjMuiBeAJv2m7OD/yZhJDMItoguBTQhxUcnEFdTRZKBwR03eK82CqI+hO6f59YPlO
 61FP1XvWYkk7aZx08DC0ryF1K2DmPPycY/6vINaweUPHQYI2qLxwhtMSgL+hxmfc7a
 IOblUnJEh8pj8jIRfjly0eNY6FWb8/Y+PrB9wnWqqqJA+ZryXJlGG7E4VrTtodaPQ1
 xZJKQ8Ex0iFbkoZlivWlUFrCOCh3mzPrwh0G8r3t8H4zukMLM9HPreurgm4bbasDnb
 5D6eqge3Q3XTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=axAa3kQc
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.1
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

On 2022-12-30 21:03 +0100, Julien Olivain spake thusly:
> For change log since v2.3.0, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.1
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 44be514 with commands:
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
> index fdb0cf4117..3de41b1682 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  1df5a1afb91acf3b945b7fdb89ac0d99877622161d9b5155533da59113eaaa20  fluidsynth-2.3.0.tar.gz
> +sha256  d734e4cf488be763cf123e5976f3154f0094815093eecdf71e0e9ae148431883  fluidsynth-2.3.1.tar.gz
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index 20fbb644f5..ad1ed7df11 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUIDSYNTH_VERSION = 2.3.0
> +FLUIDSYNTH_VERSION = 2.3.1
>  FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>  FLUIDSYNTH_LICENSE = LGPL-2.1+
>  FLUIDSYNTH_LICENSE_FILES = LICENSE
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
