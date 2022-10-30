Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F159C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 18:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDBCB403EA;
	Sun, 30 Oct 2022 18:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDBCB403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLLtrKnmevwE; Sun, 30 Oct 2022 18:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 382AE403A2;
	Sun, 30 Oct 2022 18:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 382AE403A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C24181BF473
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E39880A4F
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 18:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E39880A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmVSjoGNr4zR for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 18:23:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8ABB812A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8ABB812A3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 18:23:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D643613F8B7;
 Sun, 30 Oct 2022 19:23:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 19:23:27 +0100
Date: Sun, 30 Oct 2022 19:23:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pedro Aguilar <paguilar@paguilar.org>
Message-ID: <20221030182327.GY1058960@scaer>
References: <20221030172639.199134-1-paguilar@paguilar.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030172639.199134-1-paguilar@paguilar.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667154209;
 bh=2EpDbqRpjmel8H3ff5MBvihph7KktTM+cfcx8QSfRXY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OkjBKS1H/syNdjDQcStHyrLhIVW6cpQ8y0gaCm0Bk8sg1cxrYu7Al+TYt895NoFk8
 8Rr/1dtVFh1yL4F7gDi3RR79mElZsECZY29/s7S8nYL81x/s/DWqAKoVW/Mue/dzVX
 Rna9R/4FSo6/dSuR2VmGBJGoBWWxHs/wNtJJ5Hu9tBGS0pTWPf/mdP3xbjPWM/jGkO
 7yRKx7vYaEl0FC3I8NaNm+2MYDdp5H/dV7NEvj8/jbzxebI4FTokdeAAfsQvGKMN2m
 1vakAFxmHEj9uTgoVX/ZYTUXQGz3XIoDYfYm1y14Wr8YkeZnm9XoC4I8dTlFxGq/+2
 GaLK1LS7GdSOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OkjBKS1H
Subject: Re: [Buildroot] [PATCH v2 1/1] package/bdwgc: bump to version 8.2.2
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

Pedro, All,

On 2022-10-30 18:26 +0100, Pedro Aguilar spake thusly:
> The license in file README.QUICK remains unchanged, but some
> C++ instructions change along with a few small typos/fixes.

... and the copyright years too, so I added that to the list, and
applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
> Changes v1 -> v2:
>  - Update license file hash (pointed out by Yann)
> 
> ---
>  package/bdwgc/bdwgc.hash | 4 ++--
>  package/bdwgc/bdwgc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
> index 4276939083..917089da08 100644
> --- a/package/bdwgc/bdwgc.hash
> +++ b/package/bdwgc/bdwgc.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3b4914abc9fa76593596773e4da671d7ed4d5390e3d46fbf2e5f155e121bea11  gc-8.0.6.tar.gz
> -sha256  0aab7a56a92ed878c4a5464cf282d65f38bcdee64fe9cf213e26254bddb3f340  README.QUICK
> +sha256  f30107bcb062e0920a790ffffa56d9512348546859364c23a14be264b38836a0  gc-8.2.2.tar.gz
> +sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
> diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
> index cefa975998..e776fb7458 100644
> --- a/package/bdwgc/bdwgc.mk
> +++ b/package/bdwgc/bdwgc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BDWGC_VERSION = 8.0.6
> +BDWGC_VERSION = 8.2.2
>  BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
>  BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
>  BDWGC_INSTALL_STAGING = YES
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
