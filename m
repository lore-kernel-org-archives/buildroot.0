Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7A3D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27B5E400B9;
	Sat, 16 Nov 2024 18:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOhkb2m8eUiN; Sat, 16 Nov 2024 18:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE644249F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAE644249F;
	Sat, 16 Nov 2024 18:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3CA01EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D3C4249F
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOUdI1Z4rQX3 for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0BBFD40D7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BBFD40D7B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BBFD40D7B
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:51:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F36D8B00548;
 Sat, 16 Nov 2024 19:51:14 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54418])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 19:51:14 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 19:51:14 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20241112181350.2559743-1-dario.binacchi@amarulasolutions.com>
References: <20241112181350.2559743-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ba4363f09fe487436a800ddb9bcbd3e6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731783077;
 bh=kR7aQNB+h6a8dAbQQN99wEskwkP0kw0UsAXp8UBxTwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XujUS4grelFCsY3Md2CzQBPWuCgyYQL10zyJYCLrjOZf2Qdzz0WRBae/r91bR/7Ji
 gPlKfTiR7nFWLa14+7FeL9SPHk3Dw3oErrjA7GGE3loRaxUB8BGGFjQ0YQflJm5GmA
 6WJiGKDODQM4WvTTaxayKb8ciOQ/BLXDRgLwgZB+T/oGLGEuWaVfzgrKwb4cjKhCZq
 HgmYBCKA/6dMXOXYNZo/+27N4E6SDtUFOvE5eSczUdJqXB6L8/P583T7BMvz7oQxUE
 C3fofZkK86NV3Jat2aavDi9Fu32XjhV2UsrkuXErJdhweeRZyzpb3PzuciFUAfxS4C
 OyOm9h0cXxZYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XujUS4gr
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.191
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 12/11/2024 19:13, Dario Binacchi wrote:
> Add python binding
> 
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.191
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to next, thanks.

> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
> index 9dc286c41ffc..8460481e0ff0 100644
> --- a/package/uuu/uuu.hash
> +++ b/package/uuu/uuu.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  
> 723d3da358e6af974a056e3adbcb105fac9dad4b87544de0d22b8c974a8037aa  
> uuu_source-uuu_1.5.182.tar.gz
> +sha256  
> 28792a9776d1ee73f6f20f7c49a7b81dcab10311733c5becac8928145fc86170  
> uuu_source-uuu_1.5.191.tar.gz
>  sha256  
> cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  
> LICENSE
> diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
> index e57828a0ca6e..8faadc0201a1 100644
> --- a/package/uuu/uuu.mk
> +++ b/package/uuu/uuu.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -UUU_VERSION = 1.5.182
> +UUU_VERSION = 1.5.191
>  UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
>  UUU_SITE = 
> https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
>  UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
