Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D759EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:33:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8183A61261
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8183A61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE7383BB7;
	Sat, 16 Oct 2021 08:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3Yr31z2MP3t; Sat, 16 Oct 2021 08:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7494283BDA;
	Sat, 16 Oct 2021 08:33:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 781D51BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 748E783B80
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jup4V6z6fzxK for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:32:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8962B83B7A
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:32:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 10BFB780316;
 Sat, 16 Oct 2021 10:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373163;
 bh=x5LgqQ+czqvgGc4rdHoIE2sQ60aYvdi6v+5ERPSl95o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e/xzen4ErcmaT/XRa5y5lb8GhNbyODq8IBkgKDKeH4hyPNk6MWeqi2ClFLTH9HSBk
 ISd/3FeU3kFimTD5qj/dv4EBBbSwaB0ShK3ztdOAbcZdK+pTBsDbZvGPbCrieXV9EM
 yqY4KsVp/GkTa6JaCmOOxlrrsvjRSRlAZ42onMDmdhG86x0oE/5yRo44oNHTQ7TxgA
 IAfGTvoj8/iI3+usi/+v5Jcm/vFjmnKx6JZ0vJacTqu1cy2kJ9tD7aUYUPRyVAWRKE
 OIXNq08mxdFvAbN4B6Mq68VmiCvJil1mcGl04261X41GqJtk68OfyE+6cDhhoaaRju
 lvuaajQC0lr5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:32:38 +0200
Date: Sat, 16 Oct 2021 10:32:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211016083238.GN4165837@scaer>
References: <20211015152644.1008907-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015152644.1008907-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libhdhomerun: bump version to
 20210624
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

Bernd, All,

On 2021-10-15 17:26 +0200, Bernd Kuhls spake thusly:
> Changelog:
> https://www.silicondust.com/support/downloads/software-changelog/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libhdhomerun/libhdhomerun.hash | 2 +-
>  package/libhdhomerun/libhdhomerun.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
> index 8abce42eb9..66edd6a0d3 100644
> --- a/package/libhdhomerun/libhdhomerun.hash
> +++ b/package/libhdhomerun/libhdhomerun.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  b996389aa6f124a6d9dc1e75ec749e86d06102e2b3e7359d57163d4cc6e633f8  libhdhomerun_20210224.tgz
> +sha256  deaf463bbcc3eefa72f97199efb6213f7b0e2c8e91f1b3d2cbf52056a8715d15  libhdhomerun_20210624.tgz
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
> index eaa60a062a..4bc584e622 100644
> --- a/package/libhdhomerun/libhdhomerun.mk
> +++ b/package/libhdhomerun/libhdhomerun.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHDHOMERUN_VERSION = 20210224
> +LIBHDHOMERUN_VERSION = 20210624
>  LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
>  LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
>  LIBHDHOMERUN_LICENSE = LGPL-2.1+
> -- 
> 2.30.2
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
