Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE9FC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:46:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7549E601FA
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7549E601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BDD881A15;
	Thu,  4 Nov 2021 20:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nk6UbNteWco4; Thu,  4 Nov 2021 20:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C29E819F5;
	Thu,  4 Nov 2021 20:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB8D01BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6DCE819F5
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sr5r4C5Mw3BM for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF0DA819D6
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:46:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d011:289f:59c0:9f5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B1FCD13F880;
 Thu,  4 Nov 2021 21:46:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636058802;
 bh=sVjKIShbyIxECU/Dmi1hud2SiLSmH2+WOOsHzB6074Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g6NuzeJCoB2vvDx9Yjc1NBGGhipuZlZt3X8yVL9eviamR0e9OPnQyq4zycmM6hwsd
 bOIFmTbAzZR1U/NScohDHBxTbggRjmG+dLJwc6/0KQ9CoklnG59oVwf4pUMb+9IMYD
 zghJ73mTcV4jIhhVvu0N5+ov1B+g9NmMSU9ubnv7TtT9YlvB5Kv+hkLfoB1l8Xlnf9
 6+OgtIk7Wb/xtj4MJ1SO6DOBmz9dpwDUTjfsbZPuK/0dCaaL5QYYgjb/n4ztHi/cG5
 EKP8y9qxT4VXx7A/kSbYo8W+emgcYVPEqICS7V+ytkKKGc9dlEpMiNzKQtZOO98Uq4
 M47HR6w8uzo8w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 21:46:36 +0100
Date: Thu, 4 Nov 2021 21:46:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20211104204636.GB2400@scaer>
References: <20211006204133.465875-1-arnout@mind.be>
 <20211006204133.465875-2-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006204133.465875-2-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC 2/2] Config.in: move toolchain menu before
 build options
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
Cc: Raul Cabello <raul.cabello@suse.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2021-10-06 22:41 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Many of the build options depend on the toolchain configuration. In
> addition, it's pretty logical that you select first target architecture,
> then the toolchain, and only then things like debug and pic/pie.
> Therefore, move the "Toolchain" menu before the "Build options" menu
> instead of after.

I think a much better solution would be to move the toolchain-related
build options to the "Toolchain" menu, and keep in the "Build options"
menu focused on the actual generic build "infra" (arg, I can't find a
proper word...). Parallel jobs, download tools, patch directories et al.
really are related to the build infrastructure, while static, -Os et al.
are more about the toolchain "configuration".

Regards,
Yann E. MORIN.

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 8ed11c994d..efdf397c01 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -87,6 +87,8 @@ config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
>  
>  source "arch/Config.in"
>  
> +source "toolchain/Config.in"
> +
>  menu "Build options"
>  
>  menu "Commands"
> @@ -908,8 +910,6 @@ comment "Fortify Source needs a glibc toolchain and optimization"
>  	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
>  endmenu
>  
> -source "toolchain/Config.in"
> -
>  source "system/Config.in"
>  
>  source "linux/Config.in"
> -- 
> 2.31.1
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
