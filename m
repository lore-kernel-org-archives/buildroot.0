Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BBFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F2AC4023B;
	Thu, 17 Feb 2022 20:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvJpUtUOWtDW; Thu, 17 Feb 2022 20:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77741401A4;
	Thu, 17 Feb 2022 20:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24E291BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A3283F81
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4ZjBmIFc9fb for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:45:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1470A83F7D
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:45:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 734E213F838;
 Thu, 17 Feb 2022 21:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645130709;
 bh=BNC3NOucW4xGiYFE2IdztU3GHXtRiMnM3zxsSu7fmAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rWwdw37dQBnf4Y8eOBvjmEgO1XT3r9qdHL5Qtk0i3Nx275o+4C55TPpucEdwas+rg
 d+hV7gT+BKIConsLlEW5eN26clvqhj3YCoSosoYoHnCNr3dVGQYEKr6r9wCxaRJv1H
 BhJloN62BJQF1nm3UYb4X5tE9bgnFxkoVnL3OhjYczw6oR/PlEdkW00jIa0bOupX3c
 ogNZAqw2aOaBWeRd37bM3vxbHV/fhQBeY6QtFwV6QZqIl0VTrZcw9dkqQXl2m8TN8H
 C1aPxbc+TactIEFup17Cfhjgs58MWyZ5o/c9Xo01pyNPRKy9WD2aLJGRDzyKVEYqj8
 AKjoWPbebZIKw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 21:45:06 +0100
Date: Thu, 17 Feb 2022 21:45:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220217204506.GJ522310@scaer>
References: <20220213210504.1416861-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220213210504.1416861-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: set
 CRYPTSETUP_AUTORECONF
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-13 22:05 +0100, Fabrice Fontaine spake thusly:
> Commit 683e8387d05cb506c30592ab43a3e7534d7cf56e forgot to set
> CRYPTSETUP_AUTORECONF resulting in the following build failure:
> 
> configure: error: You need the gcrypt library.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f6cead0cf1089bbbe52457d379764a0aa9add408
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry but I applied another patch (I cc-ed you on the reply).

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/cryptsetup.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 2e06047c56..55cc70576c 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -17,6 +17,8 @@ CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
>  CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
>  CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
>  CRYPTSETUP_INSTALL_STAGING = YES
> +# We're patching configure.ac
> +CRYPTSETUP_AUTORECONF = YES
>  CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
>  CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
>  
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
