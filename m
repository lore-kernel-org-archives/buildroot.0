Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3CBC5ACB3
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 15:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C74A440482;
	Sat, 18 Nov 2023 15:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C74A440482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmYRMx-65sLV; Sat, 18 Nov 2023 15:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5008F404A1;
	Sat, 18 Nov 2023 15:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5008F404A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18C471BF47E
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E541A8215A
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 15:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E541A8215A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1IpgoCkWyhh for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 15:11:32 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EBB582155
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 15:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EBB582155
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D6489780371;
 Sat, 18 Nov 2023 16:11:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 16:11:27 +0100
Date: Sat, 18 Nov 2023 16:11:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Hanyuan Zhao <hanyuan-z@qq.com>
Message-ID: <20231118151127.GF996011@scaer>
References: <tencent_757F73E3FFB48495C31F20C1B8F0CBDBD205@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_757F73E3FFB48495C31F20C1B8F0CBDBD205@qq.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700320291;
 bh=WjJznzK1BRkH55v47STaNIWZlAr0qgX22lLGN3zgyOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oOMw9hyFWG2IPbuRuvIOZUwhIxPjplX9rtgarqQkGOf2mmWyYcA58mVmAAlzYgcSg
 b9vRXnLYx9MmEHHjOjKFgbu8nVzdkRtAsKxPnkyrcZva5Y4CkcybzONYKxs0+Yz8vC
 azG0qoexC4jJjy6OBb76y0dpAmLtqDfkW1UemVyDmDZR6m5ThmLfwW+H0jnMTbbq9s
 LfNKxdQ+B6PiC61pBpH1yunLC+ugsvVfk9Ci6/5+VssRSzAeOg/WGrVHtKx9XCN8vF
 ljhLkTnWBY/dPezdePEiSclWLihdMudqOyIpfkMD8r2Kq1a7IgwiRAt4xOLyb5k9Tw
 TQBQSbeJh2dOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oOMw9hyF
Subject: Re: [Buildroot] [PATCH 1/1 RESEND] package/wiringX: add GPIO
 library wiringX
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hanyuan, All,

On 2023-11-18 22:53 +0800, Hanyuan Zhao via buildroot spake thusly:
> wiringX is a cross-platform GPIO interface that allows
> developers to control the GPIO of various platforms with
> generic and uniform functions. By using wiringX, the same
> code will run on all platforms supported by wiringX.
> 
> https://github.com/wiringX/wiringX
> 
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>

There is no need to resend, as the patch is still pending for review on
our patchowrk:
    https://patchwork.ozlabs.org/project/buildroot/list/
    https://patchwork.ozlabs.org/project/buildroot/patch/tencent_0D8E30000E63F8AF28CBDFCD8FFFBE122007@qq.com/

However, if this new iteration has changes from the previous, then;
  - it should be marked v2, not RESEND
  - the changes fromn the previous iteration should be (briefly) listed
    after the three-dash line [0]

> ---

[0] here.

As far as I could see, there was no change between the two iterations,
so I marked this one as not-applicable, and left the initial one open.

Regards,
Yann E. MORIN.

>  package/Config.in                             |  1 +
>  ...ed-time-type-error-when-compiling-by.patch | 47 +++++++++++++++++++
>  package/wiringx/Config.in                     | 18 +++++++
>  package/wiringx/wiringx.hash                  |  3 ++
>  package/wiringx/wiringx.mk                    | 12 +++++
>  5 files changed, 81 insertions(+)
>  create mode 100644 package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
>  create mode 100644 package/wiringx/Config.in
>  create mode 100644 package/wiringx/wiringx.hash
>  create mode 100644 package/wiringx/wiringx.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9c037f2ef4..b46bb4654e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -654,6 +654,7 @@ endmenu
>  	source "package/wf111/Config.in"
>  	source "package/wilc-driver/Config.in"
>  	source "package/wipe/Config.in"
> +	source "package/wiringx/Config.in"
>  	source "package/xorriso/Config.in"
>  	source "package/xr819-xradio/Config.in"
>  endmenu
> diff --git a/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch b/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
> new file mode 100644
> index 0000000000..fe0fd56f82
> --- /dev/null
> +++ b/package/wiringx/0001-Fix-the-undeclared-time-type-error-when-compiling-by.patch
> @@ -0,0 +1,47 @@
> +From 3185311331f8fb90ce5dd9376e8b35bff4bb083f Mon Sep 17 00:00:00 2001
> +From: Hanyuan Zhao <hanyuan-z@qq.com>
> +Date: Sat, 14 Oct 2023 14:46:15 +0800
> +Subject: [PATCH] Fix the undeclared time type error when compiling by
> + buildroot
> +
> +Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> +---
> + src/wiringx.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/wiringx.c b/src/wiringx.c
> +index e831caa..b424c5b 100644
> +--- a/src/wiringx.c
> ++++ b/src/wiringx.c
> +@@ -119,8 +119,8 @@ static void delayMicrosecondsHard(unsigned int howLong) {
> + 	tLong.tv_sec  = howLong / 1000000;
> + 	tLong.tv_usec = howLong % 1000000;
> + #else
> +-	tLong.tv_sec  = (__time_t)howLong / 1000000;
> +-	tLong.tv_usec = (__suseconds_t)howLong % 1000000;
> ++	tLong.tv_sec  = (time_t)howLong / 1000000;
> ++	tLong.tv_usec = (suseconds_t)howLong % 1000000;
> + #endif
> + 	timeradd(&tNow, &tLong, &tEnd);
> + 
> +@@ -135,7 +135,7 @@ EXPORT void delayMicroseconds(unsigned int howLong) {
> + 	long int uSecs = howLong % 1000000;
> + 	unsigned int wSecs = howLong / 1000000;
> + #else
> +-	long int uSecs = (__time_t)howLong % 1000000;
> ++	long int uSecs = (time_t)howLong % 1000000;
> + 	unsigned int wSecs = howLong / 1000000;
> + #endif
> + 
> +@@ -147,7 +147,7 @@ EXPORT void delayMicroseconds(unsigned int howLong) {
> + #ifdef _WIN32
> + 		sleeper.tv_sec = wSecs;
> + #else
> +-		sleeper.tv_sec = (__time_t)wSecs;	
> ++		sleeper.tv_sec = (time_t)wSecs;
> + #endif
> + 		sleeper.tv_nsec = (long)(uSecs * 1000L);
> + 		nanosleep(&sleeper, NULL);
> +-- 
> +2.34.1
> +
> diff --git a/package/wiringx/Config.in b/package/wiringx/Config.in
> new file mode 100644
> index 0000000000..04b944b217
> --- /dev/null
> +++ b/package/wiringx/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_WIRINGX
> +	bool "wiringX"
> +	help
> +	  wiringX is a cross-platform GPIO interface that allows
> +	  developers to control the GPIO of various platforms with
> +	  generic and uniform functions. By using wiringX, the same
> +	  code will run on all platforms supported by wiringX.
> +
> +	  Supported vendors:
> +
> +	  allwinner = <a10, a31s, h3, h5>
> +	  amlogic = <s805, s905>
> +	  broadcom = <bcm2711, bcm2835, bcm2836>
> +	  nXP = <imx6dqrm, imx6sdlrm>
> +	  rockchip = <rk3399>
> +	  samsung = <exynos5422>
> +
> +	  https://wiringx.org/
> diff --git a/package/wiringx/wiringx.hash b/package/wiringx/wiringx.hash
> new file mode 100644
> index 0000000000..b98e707326
> --- /dev/null
> +++ b/package/wiringx/wiringx.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  62a0bae8f749ad934f1309cdb9df1dbc79a6ce2abc8c6da11040673564c8fb0b  wiringx-54030cd9b68ef895439e1444f418524e16cbb4c1.tar.gz
> +sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
> diff --git a/package/wiringx/wiringx.mk b/package/wiringx/wiringx.mk
> new file mode 100644
> index 0000000000..b72046ab60
> --- /dev/null
> +++ b/package/wiringx/wiringx.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# wiringX
> +#
> +################################################################################
> +
> +WIRINGX_VERSION = 54030cd9b68ef895439e1444f418524e16cbb4c1
> +WIRINGX_SITE = $(call github,wiringX,wiringX,$(WIRINGX_VERSION))
> +WIRINGX_LICENSE = MPL-2.0
> +WIRINGX_LICENSE_FILES = LICENSE
> +
> +$(eval $(cmake-package))
> -- 
> 2.39.3 (Apple Git-145)
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
