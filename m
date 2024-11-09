Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F08D5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 15:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A5980F5A;
	Sat,  9 Nov 2024 15:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_4QgvHVwUvX; Sat,  9 Nov 2024 15:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBDCC80EF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBDCC80EF9;
	Sat,  9 Nov 2024 15:51:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1A2C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 15:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 301B140176
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 15:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFQby-OzNJtZ for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 15:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D368940167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D368940167
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D368940167
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 15:51:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D6A082003B4;
 Sat,  9 Nov 2024 16:51:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43058])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Nov 2024 16:51:47 +0100
MIME-Version: 1.0
Date: Sat, 09 Nov 2024 16:51:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20241108-dtc-1-7-2-v1-1-1141a7b163e9@gmail.com>
References: <20241108-dtc-1-7-2-v1-0-1141a7b163e9@gmail.com>
 <20241108-dtc-1-7-2-v1-1-1141a7b163e9@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <829065017b7583e2f1be817b878de683@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731167510;
 bh=TPQl1wrsH3NvOdYG/C8HDM9//U3QjpFPVoFCp6Hvbb4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p/tqPHME3jCQNpp1EutWi+tGuBk2KO/c1mZxaoUdXwPH2WZhhO29T0YQH9VgIdt93
 Ac2doX0rSTV+YLJl2x45wdD4Ws9j4QYgG+ydYbwiMECDC2hiHFe8Qv/eMwSO0w0JY2
 OE/1hmgF//8J87EepXTY0jVwu9d0FPUN1XkjWatf0TpFl/tdPrwzhQHyKKmt9Oki/u
 NmVDAz8o7jsAvvf0023Ful0LwDyhViLLrIAbqZ1Xihlb7nvMrn0l+9ix+mLz8hkR2J
 B/tjDoT73xtVOtBZS4vnriyCYZZ4jyeaoDr6Sc52MeYR4yE47V8kZ4hOW653tQLqyf
 V5qvhTabIoTxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p/tqPHME
Subject: Re: [Buildroot] [PATCH 1/2] package/dtc: update to dtc 1.7.2
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

On 09/11/2024 01:23, Brandon Maier wrote:
> Release notes: https://github.com/dgibson/dtc/releases/tag/v1.7.2
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

Series applied to master. Thanks!

> ---
>  package/dtc/dtc.hash | 2 +-
>  package/dtc/dtc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
> index 
> 325a80880918146ec2bf08da0d2d0b1813acdc64..f05e902df0817d1ead1cb43a8f7e2c8316316a43 
> 100644
> --- a/package/dtc/dtc.hash
> +++ b/package/dtc/dtc.hash
> @@ -1,5 +1,5 @@
>  # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
> -sha256  
> 398098bac205022b39d3dce5982b98c57f1023f3721a53ebcbb782be4cf7885e  
> dtc-1.7.1.tar.xz
> +sha256  
> 92d8ca769805ae1f176204230438fe52808f4e1c7944053c9eec0e649b237539  
> dtc-1.7.2.tar.xz
> 
>  # Hash for license files
>  sha256  
> 78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  
> README.license
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 
> ce5ea05da7882fcd0affaacdb73654db2168cbc6..5b810c6e659c39bbdac177052f0cbab7f9b740be 
> 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -DTC_VERSION = 1.7.1
> +DTC_VERSION = 1.7.2
>  DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
>  DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
>  DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
> 
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
