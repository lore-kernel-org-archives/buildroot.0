Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021CDC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 10:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FC214012F;
	Sat,  1 Jan 2022 10:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1r5Mcdso_tg; Sat,  1 Jan 2022 10:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845D5404A9;
	Sat,  1 Jan 2022 10:28:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE6171BF5A4
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE4B4024D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 10:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOpH753evaKS for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 10:28:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3E5940247
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 10:28:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E8A745FF9D;
 Sat,  1 Jan 2022 11:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641032902;
 bh=8jxIhhFTAFAsbEO3TDUWroYmJJ3kBLt4H6RnKu+f2eo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UEQpiRASc0IR2eAiqHP8bVtH4fpRWLidBzawavn9+5F00aFJMSMJy4hMJDqE074Du
 eK04E9sELWUICRlqsTqG1CaBmpxfNhrVLL9asRYPUCIDDHhEyODbd8KbcUMwL4Q+RT
 DevTChB/YWT5efvybHe2gtu3RjwA8EIJQMtw1SYqztR8vi5FDEuhUdenQ/xp/X3H/4
 /L6OlXVR+xz6m/xktn6qvM70RP5Z3sYMidSk27Hqpmpb8QForqX6ET3+CbuevEQnXK
 tbf2IW2L0T1OwUe726aiAYhAN2w2ULL3PQLTEqCoJHwgU57Dw1Yp/YqUTNxBUWMJ8h
 3AUdBGze4RjTQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 11:28:13 +0100
Date: Sat, 1 Jan 2022 11:28:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220101102813.GC3390456@scaer>
References: <20211231100725.3662078-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211231100725.3662078-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 14.18.2
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021-12-31 11:07 +0100, Fabrice Fontaine spake thusly:

Fabrice, All,
> This bump will fix the following build failure raised since bump of
> python3 to version 3.10.1 in commit
> 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> 
> Please use python3.9 or python3.8 or python3.7 or python3.6 or python3.5 or python2.7.
> 	/usr/bin/python3.7 ./configure
> 	/usr/bin/python3.5 ./configure
> 	/home/peko/autobuild/instance-1/output-1/host/bin/python2.7 ./configure
> Node.js configure: Found Python 3.10.1...
> 
> https://github.com/nodejs/node/releases/tag/v14.18.2
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9e2ebb9c3681ec0485eaa042fa838c8ee62f649b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 3a4571e8e5..f330757341 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
> -sha256  3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed  node-v14.18.1.tar.xz
> +# From https://nodejs.org/dist/v14.18.2/SHASUMS256.txt
> +sha256  3e8a9ce10f8bcd3628eb6dd049f7f03c84ba9219be6f9743e2221154b9cc680b  node-v14.18.2.tar.xz
>  
>  # Hash for license file
>  sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 322eed6d19..7d5c93eb93 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NODEJS_VERSION = 14.18.1
> +NODEJS_VERSION = 14.18.2
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
> -- 
> 2.33.0
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
