Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E37AC4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3601E851D7;
	Sun,  4 Feb 2024 10:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3601E851D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7uB1Op1Gjapm; Sun,  4 Feb 2024 10:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA2C851A8;
	Sun,  4 Feb 2024 10:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA2C851A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDC941BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C65188518D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C65188518D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPPM4GOccW6W for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:07:28 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 738F085186
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 738F085186
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B835AB005A3;
 Sun,  4 Feb 2024 11:07:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 11:07:20 +0100
Date: Sun, 4 Feb 2024 11:07:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb9h2IPMdo8qJykU@landeda>
References: <20240201174205.180556-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201174205.180556-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707041245;
 bh=obHK4ansvuoKJ0dhANEekbWDYyvJCf6Z6n9cIoY3XFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E9LvUmUAeteZD6P8/8fHF7Kf3LhmpU+6yDT/dv36o5Wlq7UYCYCQ7knv3eOTumjIS
 QRlcUwINnqR/j/ISmfR69kpK9c/uC6dFXD76DsOtFJVFW7oQaiWW3jYsQFiatTHN9n
 dyeWtsxFRNcr0k5y90bMpgobYX2LCHvXG+X4DNtRdhD+cN/MC1CmrsBCcpInjkyZDU
 wY4f+nOlVhURDszftlr6Ax8uqPWlz7L4Y13BPjJ0dS0eZnaLc67TTII9PBEGWCsay7
 VWbvReFTLUr+gIPo5dSoKBofvPWTkR5QIO7XDHxT1GqGhpZnsvoU8uAF75OkNS/N7i
 rkNG0V+35QMDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E9LvUmUA
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: drop
 WIRELESS_REGDB_CPE_ID_VENDOR
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
Cc: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-01 18:42 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:kernel:wireless-regdb added by commit
> 63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
> for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:kernel:wireless-regdb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wireless-regdb/wireless-regdb.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index e9003ce2e6..5c8ef96398 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -9,7 +9,6 @@ WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>  WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
>  WIRELESS_REGDB_LICENSE_FILES = LICENSE
> -WIRELESS_REGDB_CPE_ID_VENDOR = kernel
>  
>  ifeq ($(BR2_PACKAGE_CRDA),y)
>  define WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
> -- 
> 2.43.0
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
