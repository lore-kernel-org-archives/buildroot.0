Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE0C3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 11:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46172408EC;
	Sun, 15 Jan 2023 11:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46172408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsK47tCEvfDG; Sun, 15 Jan 2023 11:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62C94408CD;
	Sun, 15 Jan 2023 11:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62C94408CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88E181BF29F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9CCE60A9F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 11:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CCE60A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeUxVPk74g5s for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 11:10:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2A8D60E5F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2A8D60E5F
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 11:10:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EBC425FFA1;
 Sun, 15 Jan 2023 12:10:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 15 Jan 2023 12:10:04 +0100
Date: Sun, 15 Jan 2023 12:10:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230115111004.GI199036@scaer>
References: <20230109025201.1939360-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109025201.1939360-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673781009;
 bh=DiIJp4Q6CBOnFTOnVCLl30GEl+kPmkrBWEg5IC2bdas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JN5FgmiCOkCA2cIlbnUbMu4FN8BZ870HYHkrNYzXNvOKf0w/9fsu6/PJtRXdgi9YW
 PMsXmuHpZmQ6QzFZAfxtKhTD8ZWWoNdzuOBrOxafMPT1YRVDSS2+UnjtunYNRbL85R
 T0I0z07/rICPDjcG8Gq5iOnNx7UGYalL1u0tbHzNP8jxS3LdqJhSSXXRAPGifdROvm
 43m0fblUkxU3daeWY+0mgZXIrAeE8FjNwKaieaViC9a5B7hot0RaBJhFBzLmqJmYjk
 9W0d/PAmWVq9eWYYwbPgrYmG4yBehsVARGA+DEcIuCjFEOVOjlyGw5idy6aXwXoR83
 dSow2TDToCaHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JN5FgmiC
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioblescan: bump to
 version 0.2.14
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-08 19:52 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Since you sent a lot of such python bumps in rapid-fire, I'll only reply
to this one, and the ones I have special comments above; otherwise,
consider them to be applied as they are no longer in patchwork.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/python-aioblescan/python-aioblescan.hash | 4 ++--
>  package/python-aioblescan/python-aioblescan.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aioblescan/python-aioblescan.hash b/package/python-aioblescan/python-aioblescan.hash
> index 9a40ca4560..c754325fb1 100644
> --- a/package/python-aioblescan/python-aioblescan.hash
> +++ b/package/python-aioblescan/python-aioblescan.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/aioblescan/json
> -md5  0601cf9335e5d89166a88f53597c79bf  aioblescan-0.2.13.tar.gz
> -sha256  28632e32c8180ea4b792f4cf9b88968dd100f4d3cee0cf16d27c193cf954422a  aioblescan-0.2.13.tar.gz
> +md5  10014cfd24b8f9f54099bbf7e2ea528a  aioblescan-0.2.14.tar.gz
> +sha256  3a47c5292186ee87fc49cb076a5271c766510f44749b93ac4a32bbb4cb5258a0  aioblescan-0.2.14.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c2066cd44079e0c706234001af18cb6ad4b62fc68d0d08d29fdc7319916647e0  LICENSE.txt
> diff --git a/package/python-aioblescan/python-aioblescan.mk b/package/python-aioblescan/python-aioblescan.mk
> index f0e277d528..7e0cde6c85 100644
> --- a/package/python-aioblescan/python-aioblescan.mk
> +++ b/package/python-aioblescan/python-aioblescan.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_AIOBLESCAN_VERSION = 0.2.13
> +PYTHON_AIOBLESCAN_VERSION = 0.2.14
>  PYTHON_AIOBLESCAN_SOURCE = aioblescan-$(PYTHON_AIOBLESCAN_VERSION).tar.gz
> -PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/bd/04/c6798c76704d57da22f19c2e47485821d4b23144ef75f9c0e18dbfe47565
> +PYTHON_AIOBLESCAN_SITE = https://files.pythonhosted.org/packages/45/15/faf503083bc5a2d81f1b17fbbe30d15f35217b6c5e944c771c8760354d59
>  PYTHON_AIOBLESCAN_SETUP_TYPE = setuptools
>  PYTHON_AIOBLESCAN_LICENSE = MIT
>  PYTHON_AIOBLESCAN_LICENSE_FILES = LICENSE.txt
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
