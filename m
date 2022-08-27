Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7369DC0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 09:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E651740204;
	Sat, 27 Aug 2022 09:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E651740204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0yQi_gjDs4xh; Sat, 27 Aug 2022 09:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2637400EE;
	Sat, 27 Aug 2022 09:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2637400EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC251BF32D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 09:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B52400EE
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 09:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B52400EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8Q_VtqW5mf2 for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 09:18:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A350E40055
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A350E40055
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 09:18:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4ABEE19F740;
 Sat, 27 Aug 2022 11:18:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 11:18:20 +0200
Date: Sat, 27 Aug 2022 11:18:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andrea Daoud <andreadaoud6@gmail.com>
Message-ID: <20220827091820.GS37358@scaer>
References: <20220825152609.158953-1-andreadaoud6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825152609.158953-1-andreadaoud6@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661591905;
 bh=dnrg2ywdvFGdHm5GLrCqPZfkIgFyKj80HQkjgUGMKrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FStKwdC1nHcuNIAKKb+RI2jOduKUUYYyYoUhFA9AADary2H+Mjjqt4LbuhdLObsnJ
 FrmUxVYwgxH66Zu3LUGLV5o0KzHbp0Gw+zFkI77+76PHNAmJRb9bdiafIbeeMzIJ9J
 uN9mJGVCJmg3kED+iOm055BeUctDOTO2OirQna5JQ8mWuCLvx0eBq5ZW/E51WvAUwK
 Nmv+RBue6rGkKs20+tXSm2B137H5Pzu9KceOMp6UeqkyQU/1Z+f/IaB5VBkRi+cACn
 wpKhoCiLIaOnuPn69heucUNUI79lU1mEuBPgP+/4Ke+WxqtB/KSJuqEnG+8du/OQyP
 NlQbOM3iFGGrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FStKwdC1
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.65
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andrea, All,

On 2022-08-25 23:26 +0800, Andrea Daoud spake thusly:
> bluez 5.65 contains various fixes.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Andrea Daoud <andreadaoud6@gmail.com>
> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> index 2f3a290ea8..565511120f 100644
> --- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
> +++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils
> -BLUEZ5_UTILS_HEADERS_VERSION = 5.64
> +BLUEZ5_UTILS_HEADERS_VERSION = 5.65
>  BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> index 0324dd2d77..e0c9f3cdb9 100644
> --- a/package/bluez5_utils/bluez5_utils.hash
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> -sha256  ae437e65b6b3070c198bc5b0109fe9cdeb9eaa387380e2072f9de65fe8a1de34  bluez-5.64.tar.xz
> +sha256  2565a4d48354b576e6ad92e25b54ed66808296581c8abb80587051f9993d96d4  bluez-5.65.tar.xz
>  # Locally computed
>  sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index 8e2c657899..76070dc3a9 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # Keep the version and patches in sync with bluez5_utils-headers
> -BLUEZ5_UTILS_VERSION = 5.64
> +BLUEZ5_UTILS_VERSION = 5.65
>  BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>  BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ5_UTILS_INSTALL_STAGING = YES
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
