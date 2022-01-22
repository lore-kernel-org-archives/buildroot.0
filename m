Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF447C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5231A60BBF;
	Sat, 22 Jan 2022 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q05UiLLZK8vR; Sat, 22 Jan 2022 19:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88D4460AB2;
	Sat, 22 Jan 2022 19:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8F3D1BF2C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7BE782CF1
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYxAqmgUufXD for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:59:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBD1D82B34
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:59:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 40F03B0051E;
 Sat, 22 Jan 2022 20:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642881548;
 bh=1+hBOHUOJSu71j0GtjpW00jmEafkZCGE/geehfnFJRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QwofyHGmoxPjY5W7NFE3IYGQUhEM5I4nmiKf6vpy/2rvnn/bTdcRjrUHB/E6rSrwX
 JkzS9ShlLxjuQN2BzF8nz/lHguDWjr3JgGGqsq9oC7D8n2SiC6PZ4BVAt0oIp+3m6x
 H/jlY1XEsPg5CfzXckeJiW3ZBUpYuAw7c01bv0eTiSa7X42tkIkjZGxdHkTarca8Ty
 rBLz21jp9TvuOLsKeRvvC1LWbbUpKhl0Eny2q8P99xtCbNzUmECqda2C1pBJ9wzwCj
 +LuWJfwdWWEbodqKlP4yZ0mlTpzbvKGveB5SVLxz28BD6yP2TNANKgcyw1O+Ih9TDW
 +cmT52XT211sA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 20:59:05 +0100
Date: Sat, 22 Jan 2022 20:59:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220122195905.GF3621364@scaer>
References: <20220122153629.1378404-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122153629.1378404-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-vdr-vnsi: bump version
 to 19.0.3-Matrix
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

On 2022-01-22 16:36 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash | 2 +-
>  package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
> index 4cd1f7ad6b..e3dc5585d2 100644
> --- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
> +++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  2471b4c0a22bd3382b7b7e68974d5b6c08a757737086faf82609ebe5dfb5625a  kodi-pvr-vdr-vnsi-19.0.2-Matrix.tar.gz
> +sha256  317442cdfd333f47dfe95d05057a682340dd5ba53efc8894e892ee565b8aaece  kodi-pvr-vdr-vnsi-19.0.3-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
> index 65e69d2b23..f0d61d9d2e 100644
> --- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
> +++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_VDR_VNSI_VERSION = 19.0.2-Matrix
> +KODI_PVR_VDR_VNSI_VERSION = 19.0.3-Matrix
>  KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
>  KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
>  KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
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
