Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A9CD37AE
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E7141989;
	Fri, 15 Sep 2023 21:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E7141989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8SFctdvPIsZ; Fri, 15 Sep 2023 21:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DCC5419B7;
	Fri, 15 Sep 2023 21:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DCC5419B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 828D51BF29D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ACC942174
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACC942174
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0X8T1fhpgDU for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:24:11 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 216FD42160
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 216FD42160
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2096D2003CA;
 Fri, 15 Sep 2023 23:24:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:24:05 +0200
Date: Fri, 15 Sep 2023 23:24:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230915212405.GF2571@scaer>
References: <20230915171631.896844-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915171631.896844-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694813048;
 bh=zMVD/eu1o94MLViaRR0wO+keRe00jGwnzyqCl8AgBug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ryjWzOn2tFedTw9OjkRmeB8LD11F2XOtv9WBywkPMIMiBYYnseZVTWIqEt5tzCMpO
 v47hzRhaOVdSArobinL6ZxhDNmwb/ZR30TgyB5/pDhA1/LTjh1j+WUFY23DuqiE9Iq
 P3TvGwaau1wMRRA5S3vCK7vqfw75G1FR9bn9HpNRTSw2TeTUH2Vchb6vZ/J6DEJUj5
 V/GdZM+JfQsQ7M8xGzyupV29/arcMn6dHJw5+NUsorVRYb8LiApKlZgv/AwXXHlTMA
 gakNTcZX0U8g4GbOEITKJMNsbWlOxBRtUC9LXjKL8+a4kHCRbgOyNS/TtMsW/cUFx/
 xUl2FJ5hbQkuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ryjWzOn2
Subject: Re: [Buildroot] [PATCH 1/1] package/sngrep: security bump to
 version 1.7.0
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

On 2023-09-15 19:16 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2023-31981 and CVE-2023-31982
> 
> https://github.com/irontec/sngrep/blob/v1.7.0/ChangeLog
> https://github.com/irontec/sngrep/compare/v1.6.0...v1.7.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sngrep/sngrep.hash | 6 +++---
>  package/sngrep/sngrep.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
> index 60a32022e6..c9b9c8be8d 100644
> --- a/package/sngrep/sngrep.hash
> +++ b/package/sngrep/sngrep.hash
> @@ -1,6 +1,6 @@
> -# From https://github.com/irontec/sngrep/releases/download/v1.6.0/sngrep-1.6.0.tar.gz.md5sum
> -md5  1519ca6cd1167c0722debfb96e2ac173  sngrep-1.6.0.tar.gz
> +# From https://github.com/irontec/sngrep/releases/download/v1.7.0/sngrep-1.7.0.tar.gz.md5sum
> +md5  ee3cc7bd75adeb713411aa678e45ae4c  sngrep-1.7.0.tar.gz
>  
>  # Locally computed
> -sha256  fd80964d6560f2ff57b4f5bef2353d1a6f7c48d2f1a5f0a167c854bd2e801999  sngrep-1.6.0.tar.gz
> +sha256  2e5ba3a4d6486ea00bd73d2cceff383ba162dcd6d0170ae74cfa3b1c206e2cb1  sngrep-1.7.0.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
> diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
> index 0e344550d3..b86d7e83f0 100644
> --- a/package/sngrep/sngrep.mk
> +++ b/package/sngrep/sngrep.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SNGREP_VERSION = 1.6.0
> +SNGREP_VERSION = 1.7.0
>  SNGREP_SITE = \
>  	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
>  SNGREP_LICENSE = GPL-3.0+
> -- 
> 2.40.1
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
