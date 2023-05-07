Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABCBC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967CB822B1;
	Sun,  7 May 2023 12:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967CB822B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsCrMSJoj9qw; Sun,  7 May 2023 12:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7ECF82237;
	Sun,  7 May 2023 12:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7ECF82237
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6397F1BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A85B404F5
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A85B404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kgHM8xI8kWJR for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:36:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51FB440192
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51FB440192
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:36:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6FF0819F74D;
 Sun,  7 May 2023 14:36:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:36:07 +0200
Date: Sun, 7 May 2023 14:36:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507123607.GN252090@scaer>
References: <20230507091149.30495-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507091149.30495-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683462970;
 bh=PvW5r59iCU6W88Wxtco7wT4ZtAjQV7tCa/JCF47g7qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i74E+V7lTuJse6O0LsN39LOhN2i6r2GM/ohBhIBmDuwyrAQzPfKmdMJbI/viVg4AX
 04cRFo7T3ZrqJ8wyeMWKZxf+HOiyU1yHVtWrbY0DxhNs+SnUSw3YGJapCY8npJQ+zk
 HU+3MfJN+9PVS7+PUMtoSozcX08YrKOZaw+6RzNe6uxgWAgHKbcc80rIYccHK5McpN
 eS4D9bkotCYa6Y+B4gZly4GtayfQpAUpUFhd5d51vQFI8HE1jGnCl/t7uiYGo1zt+P
 XeXOIK3F4Aj1H0bAkzNl9Mt9ZCR+mw8Sl6AKeSYL3gcFM3yc1OjgjBjYgFtfjMv12o
 V2AoJ4GbdRgOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i74E+V7l
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 23.2.1
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

On 2023-05-07 11:11 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of two patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>  package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 7425c388c2..b4129eb3bf 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c7f79f0534e9832d22faf0ab7efedac75fb8726698f49877ca965d8255a9c38d  intel-media-23.2.0.tar.gz
> +sha256  3796fea4201e24310b3d100b64cfb288fb92b93ce9de54526efa43e2ea68853a  intel-media-23.2.1.tar.gz
>  sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index 0dc1ef6908..ec0fa72538 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>  
>  # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>  
> -INTEL_MEDIADRIVER_VERSION = 23.2.0
> +INTEL_MEDIADRIVER_VERSION = 23.2.1
>  INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
>  INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>  INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
> -- 
> 2.39.2
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
