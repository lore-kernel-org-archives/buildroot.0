Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2843C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DF4F61250
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DF4F61250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB3683B8D;
	Sat, 16 Oct 2021 08:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCCmFcSfUY-A; Sat, 16 Oct 2021 08:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BDF83B80;
	Sat, 16 Oct 2021 08:32:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5209D1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40574401EF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Pk55rSQPN9k for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:32:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BC7D401DF
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:32:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 70845780326;
 Sat, 16 Oct 2021 10:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373151;
 bh=Cxu3H2Tp1p2eT5KW7Q0jmD0gHe4W2V3Xo+2xlI/ngkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nlM+rCV3trrh2fnQr03dx7I+G66tQD+yY6awrMYTx2RKvhEIYaMTNAeGQ82q3Mdnj
 5vCK7ZsIVbeT4ZWSQloPeQiMpS5/O8x3YSYJpx3WBkgNxGqI6GhS5pL3paPbHKEhuW
 c28ajy3ZLD3v4R3INARERyDEBZPksGdSy/qEbnn0UjOphXwocXOaGhEA1ZpbAPKRHa
 EQTnGy8lYlDf+Sw48Cx//qf/ixItKLJFmDudZVDOaSBZR/wuHLy/aBsu+ivogKFxc7
 r09xSTmYspL+8ucHQ2DTRz17BeCMQu2/2PgV1qrsCXv4g9v9yL4iWf/4EB8V117XYP
 fkNG5JXjRz4Hg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:32:25 +0200
Date: Sat, 16 Oct 2021 10:32:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211016083225.GM4165837@scaer>
References: <20211015152915.1018670-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015152915.1018670-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediasdk: bump version to
 21.3.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2021-10-15 17:29 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://github.com/Intel-Media-SDK/MediaSDK/releases/tag/intel-mediasdk-21.3.5
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-mediasdk/intel-mediasdk.hash | 2 +-
>  package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
> index 0108f56e77..8143867995 100644
> --- a/package/intel-mediasdk/intel-mediasdk.hash
> +++ b/package/intel-mediasdk/intel-mediasdk.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  593ec057ba619e55af8c0b1fcd265a567f2846748ad6aedcc0838425c0339163  intel-mediasdk-21.3.3.tar.gz
> +sha256  3f13869298d3946d7d91e58846e274ef62cd5af2473f59f36b57b2c27ebfd87c  intel-mediasdk-21.3.5.tar.gz
>  sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
> diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
> index 5475a0e8b1..a0492412e8 100644
> --- a/package/intel-mediasdk/intel-mediasdk.mk
> +++ b/package/intel-mediasdk/intel-mediasdk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MEDIASDK_VERSION = 21.3.3
> +INTEL_MEDIASDK_VERSION = 21.3.5
>  INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
>  INTEL_MEDIASDK_LICENSE = MIT
>  INTEL_MEDIASDK_LICENSE_FILES = LICENSE
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
