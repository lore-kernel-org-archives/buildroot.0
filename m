Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897ADC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 16:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C4A41746;
	Tue, 28 Nov 2023 16:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C4A41746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAp7ZC3wHO55; Tue, 28 Nov 2023 16:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7320341747;
	Tue, 28 Nov 2023 16:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7320341747
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E19D01BF3F9
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB37D81EAF
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB37D81EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6Igq8YNLd6K for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 16:12:10 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BB0F81EAD
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 16:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB0F81EAD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:c5a3:8084:a241:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 10A6A13FA3F;
 Tue, 28 Nov 2023 17:12:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Nov 2023 17:12:02 +0100
Date: Tue, 28 Nov 2023 17:12:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231128161202.GE3177259@scaer>
References: <20231127212558.1058376-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127212558.1058376-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701187926;
 bh=6AGZA6KrOBQvsohL8BxWoPvk2JYXErj6iPGbtWNcdyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vwm3bPlDCWxOpNnzSE7Nr7d1kBWJHnK8avr/SEH3hUm7dgDWHp6OLzZtfNt9UgJ36
 PklMBQxrzojC7B8VSSGE8nRRffZwO3up/037Q90rIzSPg8i6L0gMb3Y008KY/eUMQf
 5OrHZ9L0PnGFNC2h0XSWGM8xGfqI/ZD3XLMdmUPhBFhx3TY1/Xm3tx6x+TetwgoXMD
 T06gZujG9X5m2S9QcNEOCJlSeXDj/yZNL6dkQFwonj2M19Yfmu7hqK/Sg2lqwR84Pe
 ePEXYg56XBj2eS106I7s5wM3bxlpOJvk6ofhyDLAciG1jIWq6tioQKa4XIBCVNPHzm
 3Up9IXHwgFUlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vwm3bPlD
Subject: Re: [Buildroot] [PATCH 1/1] package/exfatprogs: security bump to
 version 1.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-27 22:25 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2023-45897: exfatprogs before 1.2.2 allows out-of-bounds memory
> access, such as in read_file_dentry_set.
> 
> https://github.com/exfatprogs/exfatprogs/blob/1.2.2/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exfatprogs/exfatprogs.hash | 4 ++--
>  package/exfatprogs/exfatprogs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
> index 49135b1da7..9f3100db7f 100644
> --- a/package/exfatprogs/exfatprogs.hash
> +++ b/package/exfatprogs/exfatprogs.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.0/exfatprogs-1.2.0.tar.xz.sha256
> -sha256  56d9a49465deafc367d428afc71c8098705a30ee19a3cdf3c5320650b8880742  exfatprogs-1.2.0.tar.xz
> +# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.2/exfatprogs-1.2.2.tar.xz.sha256
> +sha256  61d517231f8ec177eeb5955fd6edb89748d3f88ba412c48bcb32741b430e359a  exfatprogs-1.2.2.tar.xz
>  
>  # Hash for license file
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
> index fcc9ff0788..40d9072571 100644
> --- a/package/exfatprogs/exfatprogs.mk
> +++ b/package/exfatprogs/exfatprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXFATPROGS_VERSION = 1.2.0
> +EXFATPROGS_VERSION = 1.2.2
>  EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
>  EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
>  EXFATPROGS_LICENSE = GPL-2.0+
> -- 
> 2.42.0
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
