Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3077EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:24:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE8C60F3A
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 20:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CCE8C60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B32401DC;
	Sun, 10 Oct 2021 20:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-xX_X1XPINd; Sun, 10 Oct 2021 20:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 676FE401F0;
	Sun, 10 Oct 2021 20:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCD0B1BF41E
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACAC7817C0
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 20:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axwuorKQilE3 for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 20:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C871E817BA
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 20:24:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9E22219F595;
 Sun, 10 Oct 2021 22:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633897469;
 bh=0RmfaCsTQa1QzsZHhB3bh3MEEzwYmpPvFbJa0SeoiqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A9c9OSOItDvRMYPyI0VeyxprD+TfcnszeCVCtooHwSvz0grZ4xQeQY3doP6oE90rc
 fZDI2BuBUowECb6+DkG4qFKX1hfe30nGit/xE53H0Y1HglxS7ZUvl1LP05CykJZNhO
 7G1JT6O9tpmcgNBr3kH/ypBkDyRaMazKySsMoc6YC+Pw1CmNNBS4aROI6mbcS3WpVa
 Mh/xnlXT8Y+t/ILjMKMvcJADyYUPkZVqdMM1R0cSSo10HkQ1bacW31suyNgG5UnHuR
 LjsD1zIPt7eGW08kksD/lLx2nKfArOEAnobiyNLQ84esRxvrwQMjEndhGGoj1WRQL0
 IdNbgqC3fhB0Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 22:24:25 +0200
Date: Sun, 10 Oct 2021 22:24:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211010202425.GQ2081069@scaer>
References: <20211010201541.1422863-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211010201541.1422863-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/triggerhappy: use git tag
 instead of hash
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

Fabrice, All,

On 2021-10-10 22:15 +0200, Fabrice Fontaine spake thusly:
> Use release/0.5.0 tag instead of commit hash so
> http://autobuild.buildroot.org/stats will report package as up to date
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/triggerhappy/triggerhappy.hash | 2 +-
>  package/triggerhappy/triggerhappy.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/triggerhappy/triggerhappy.hash b/package/triggerhappy/triggerhappy.hash
> index ab736cada3..0bb53f9455 100644
> --- a/package/triggerhappy/triggerhappy.hash
> +++ b/package/triggerhappy/triggerhappy.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1b3221963b9adca26eacc5442d8c2422cf2072f8adde1dbd691a69b37a583fb1  triggerhappy-b822888066129350e51ad79f1cf307fa38dae4f7.tar.gz
> +sha256  af0fc196202f2d35153be401769a9ad9107b5b6387146cfa8895ae9cafad631c  triggerhappy-0.5.0.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
> index f83a557804..bb30e7ce1d 100644
> --- a/package/triggerhappy/triggerhappy.mk
> +++ b/package/triggerhappy/triggerhappy.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -TRIGGERHAPPY_VERSION = b822888066129350e51ad79f1cf307fa38dae4f7
> -TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
> +TRIGGERHAPPY_VERSION = 0.5.0
> +TRIGGERHAPPY_SITE = \
> +	$(call github,wertarbyte,triggerhappy,release/$(TRIGGERHAPPY_VERSION))
>  TRIGGERHAPPY_LICENSE = GPL-3.0+
>  TRIGGERHAPPY_LICENSE_FILES = COPYING
>  TRIGGERHAPPY_DEPENDENCIES = host-pkgconf
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
