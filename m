Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5495FC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 10:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD48A40125;
	Sun,  5 Feb 2023 10:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD48A40125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfwTi2pD7wuh; Sun,  5 Feb 2023 10:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2CDE4010D;
	Sun,  5 Feb 2023 10:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2CDE4010D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97AF21BF3BE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E99840106
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 10:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E99840106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LoGGRX1U6Lb for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 10:19:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80B7440125
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80B7440125
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 10:19:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.161])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C8360780350;
 Sun,  5 Feb 2023 11:19:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Feb 2023 11:19:10 +0100
Date: Sun, 5 Feb 2023 11:19:10 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230205101910.GC2960@scaer>
References: <20230205081617.113018-1-bernd.kuhls@t-online.de>
 <20230205081617.113018-2-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230205081617.113018-2-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675592355;
 bh=MA2bY7w+yYnw7Lkx7L2BWax62TN3nFvDPHf9HXeINug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJ8T8+SJDQTXmxCgImlj5JvVzDibA5clNcPIzSff6Hnn/YwgNeETpsSYPBXcmdbCQ
 u+oJCsFKzuun7/1+aQWbHKzLmSKTbMPn9sGnZ94TVCHccZMr8lZg2NLxXzbkOiKESW
 sskHnw6iq3gIEJj52izZL7cd6pFvDCgu0jbiA+Cwl8Ujal6oCOTfQYazxevHEryCrl
 vrgcRnrBDw2XlIUnbW3rmLTao6Sle83EeMikPwVgMPLiJ5g1qQZbtD92K4TEaSO7ea
 oM3PAQi+W/KLvF6CK3jQ28aHwuiBuFPknP7Q/aMBTia3+0OyLqFQUV3OwNE9nvPaRe
 EdfaFpUg5B+Aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qJ8T8+SJ
Subject: Re: [Buildroot] [PATCH 2/3] package/sofia-sip: bump version to
 1.13.12
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-02-05 09:16 +0100, Bernd Kuhls spake thusly:
> Switch to github helper due to lack of upstream-provided tarball.
> 
> Needed for upcoming bump of freeswitch to version 1.10.9.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sofia-sip/sofia-sip.hash | 2 +-
>  package/sofia-sip/sofia-sip.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
> index 776136bb15..4617725571 100644
> --- a/package/sofia-sip/sofia-sip.hash
> +++ b/package/sofia-sip/sofia-sip.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  daf75c41408c559c2d58a8fd4d39be4a8ff5144bc1db220d4dbc28deeed6670a  sofia-sip-1.13.9-f6ee306084.tar.gz
> +sha256  03dda8653367501b7b1188a6b6513416902372e27475553de9318ee89ac390ff  sofia-sip-1.13.12.tar.gz
>  sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
>  sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> index 9071d964e4..59c365365b 100644
> --- a/package/sofia-sip/sofia-sip.mk
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -4,10 +4,11 @@
>  #
>  ################################################################################
>  
> -SOFIA_SIP_VERSION = 1.13.9
> -SOFIA_SIP_SOURCE = sofia-sip-$(SOFIA_SIP_VERSION)-f6ee306084.tar.gz
> -SOFIA_SIP_SITE = https://files.freeswitch.org/downloads/libs/sofia-sip
> +SOFIA_SIP_VERSION = 1.13.12
> +SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
>  SOFIA_SIP_INSTALL_STAGING = YES
> +# Fetched from github, no pre-generated configure script provided
> +SOFIA_SIP_AUTORECONF = YES
>  SOFIA_SIP_DEPENDENCIES = host-pkgconf
>  SOFIA_SIP_LICENSE = LGPL-2.1+
>  SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
> -- 
> 2.39.1
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
