Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B8CC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCE60404B3;
	Sun, 29 Jan 2023 16:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCE60404B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzqRsruiE6PM; Sun, 29 Jan 2023 16:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D54ED4026F;
	Sun, 29 Jan 2023 16:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D54ED4026F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 307701BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A49E410A0
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A49E410A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4LR6zMBamsL for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:27:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2BF74109B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2BF74109B
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:27:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B2E405FFA6;
 Sun, 29 Jan 2023 17:27:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 17:27:06 +0100
Date: Sun, 29 Jan 2023 17:27:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20230129162706.GJ2632@scaer>
References: <20230129074509.246281-1-dimi@tpm.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129074509.246281-1-dimi@tpm.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675009629;
 bh=qgc4OJNR1f/uM939ecaPLPpOXhzxdTpoiazn5AGqXdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uUR++8//kFpPTFqkNUyUDOvjeRvYaQxWxpzWz6W3LzguJInfaqGWoP+PYmSWzP9Kx
 UAVSzne7dTVt0If25aPYPOjnIIERbF792C2B29kOObtpsV6uoESJNxfdx49tMUxgjJ
 WfjrLL5vUW3Ls/XJSeR9qB+FI6TYKRXmjbSpI6KvJWcndaEIbPfdgbFy5B5GxsVlFx
 Jr/v08igi6xEXSqPL9l2cl+CxBlA2MBFRrLw/5aQzABVuQ3ZxDDsGvIa9GgTrHZMU9
 upkZSddguPe1IWfS4tWecz5Q+a7q6chKYs6jwLaUDWnm7WKhqr8S/BpxYbrrgY0WW4
 4tpKm0Newczmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uUR++8//
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: bump version to v2.7.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dimi, All,

On 2023-01-29 09:45 +0200, Dimi Tomov spake thusly:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wolftpm/wolftpm.hash | 2 +-
>  package/wolftpm/wolftpm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
> index 735c731a53..3329528095 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  78331cc2d98339247857f5ceb3e7cd3c4f5773e3d81bf1d73e8df9446e37472b  wolftpm-2.6.0.tar.gz
> +sha256  d8e06e77893f104be7eb9421cac50518552ad9c5fc7fe8a9c1cdfaf4f11b92df  wolftpm-2.7.0.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index 398fa668af..db332712f5 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WOLFTPM_VERSION = 2.6.0
> +WOLFTPM_VERSION = 2.7.0
>  WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>  WOLFTPM_INSTALL_STAGING = YES
>  WOLFTPM_LICENSE = GPL-2.0+
> -- 
> 2.27.0
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
