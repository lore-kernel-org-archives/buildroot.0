Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C73C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 18:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21A7F404B7;
	Mon, 21 Nov 2022 18:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A7F404B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6-C69h-Xmnw; Mon, 21 Nov 2022 18:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48D95405AA;
	Mon, 21 Nov 2022 18:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48D95405AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB2D1BF34E
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 18:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 736CD40632
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 18:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 736CD40632
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q68oJI7a2cF3 for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 18:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1D640544
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA1D640544
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 18:09:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 870FB13F85F;
 Mon, 21 Nov 2022 19:08:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 19:08:57 +0100
Date: Mon, 21 Nov 2022 19:08:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221121180857.GJ2516@scaer>
References: <20221116171156.112638-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116171156.112638-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669054140;
 bh=ZqbgsHHLwmW/G0cRe3BCNvERuYFkw4vkGIaGQOpHMew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0VX2xC3MOX8FgESI0jJlZqmAmgRS1AGH22iDZzvWqb/2nIDWnFjngCiWqeFn8erN
 Df3CPGF55iJyO/FP8jOLI+R5UQHn9PKrDnqTC0jbrPoMkFajz5DJvKdIyR4JwKtJYB
 Ey6DY8Oz5tYFIHEGRlRoNLgrqWtngB9qEyC4n+GtLiIZBZlK+Lp0IdYY/QLP99JlPk
 eJ2bWU0VDEi3lF+p3YNUpFn3a9g/4PycsmuSccDA5udNI7w9ut3x113EB3x4pvGzt3
 I1RXJWsSSrRm0PRo0LKlRbY++KBGzirxQfXO1vORNelP2UMckXbCdggqZmsbeZGaPc
 L4oZstzpyV/FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d0VX2xC3
Subject: Re: [Buildroot] [PATCH 1/1] package/gptfdisk: fix runtime failure
 with popt 1.19
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-11-16 18:11 +0100, Fabrice Fontaine spake thusly:
> Fix the following runtime failure raised since bump of popt to version
> 1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:
> 
> Problem opening  for reading! Error is 2.
> The specified file does not exist!
> 
> Fixes:
>  - No autobuilder failure
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...h-of-sgdisk-when-compiled-with-lates.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
> 
> diff --git a/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
> new file mode 100644
> index 0000000000..bdeedd95cc
> --- /dev/null
> +++ b/package/gptfdisk/0002-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
> @@ -0,0 +1,60 @@
> +From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
> +From: Rod Smith <rodsmith@rodsbooks.com>
> +Date: Fri, 15 Apr 2022 18:10:14 -0400
> +Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest
> + popt (commit 740; presumably eventually release 1.19)
> +
> +[Retrieved from:
> +https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + NEWS      | 8 ++++++++
> + gptcl.cc  | 2 +-
> + support.h | 2 +-
> + 3 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/NEWS b/NEWS
> +index c7add56..9e153fd 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -1,3 +1,11 @@
> ++1.0.10 (?/??/2022):
> ++-------------------
> ++
> ++- Fixed problem that caused sgdisk to crash with errors about being unable
> ++  to read the disk's partition table when compiled with the latest popt
> ++  (commit 740, which is pre-release as I type; presumably version 1.19 and
> ++  later once released).
> ++
> + 1.0.9 (4/14/2022):
> + ------------------
> + 
> +diff --git a/gptcl.cc b/gptcl.cc
> +index 34c9421..0d578eb 100644
> +--- a/gptcl.cc
> ++++ b/gptcl.cc
> +@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
> +    } // while
> + 
> +    // Assume first non-option argument is the device filename....
> +-   device = (char*) poptGetArg(poptCon);
> ++   device = strdup((char*) poptGetArg(poptCon));
> +    poptResetContext(poptCon);
> + 
> +    if (device != NULL) {
> +diff --git a/support.h b/support.h
> +index 8ba9ad1..f91f1bc 100644
> +--- a/support.h
> ++++ b/support.h
> +@@ -8,7 +8,7 @@
> + #include <stdlib.h>
> + #include <string>
> + 
> +-#define GPTFDISK_VERSION "1.0.9"
> ++#define GPTFDISK_VERSION "1.0.9.1"
> + 
> + #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
> + // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
> +-- 
> +2.35.1
> +
> -- 
> 2.35.1
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
