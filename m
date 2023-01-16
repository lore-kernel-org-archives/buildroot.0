Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11161C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B7C40ACB;
	Mon, 16 Jan 2023 20:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B7C40ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjA3WTL28_HS; Mon, 16 Jan 2023 20:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A30B1405AC;
	Mon, 16 Jan 2023 20:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A30B1405AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A11271BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8830D400BF
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8830D400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEc7o08PBJam for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2128340066
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2128340066
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:20:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 24A2B5FF9A;
 Mon, 16 Jan 2023 21:20:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 21:20:30 +0100
Date: Mon, 16 Jan 2023 21:20:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230116202030.GC2770@scaer>
References: <20230116180550.3144425-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116180550.3144425-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673900434;
 bh=X4eq9+rjdAoA0YfFbgh4t3Nl7pByE624Voz7qmEhpOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LPUNi9z9/L1NtNsTCQ+5k4j0X3060Q0nZXLaWOHdSjTGvzX7Kuwt18C0YEG6DNhvZ
 6TNc7/wZ5CMG7PmvtVjF4obGcLThkH/Vcgj4zCD8d6yYPEdZOrt3D7RSaK8pErCZjB
 3r6fmtr/63DuVo6W8W6Sxxz7gC7KIqnpgbJlzvARVzaarPGZkS2kTrJ0Ty4KZJ2EPT
 NVeAqgZhvE+gJXwOzNvhg0pgbAAnVdKXz8qfcj0ZuoVoHQr2LPZQ6YeuNRTX60bb0L
 EVY2++Mdo1znFNn9LjqSOiTyJzW2cQOXeGHDyFvECx2Rmv4ZwatGJlog38wkzvST6S
 rZ3dmf8Zxp7KA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LPUNi9z9
Subject: Re: [Buildroot] [RESEND PATCH v2 1/1] package/sscep: fix linking
 error
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-01-16 19:05 +0100, Dario Binacchi spake thusly:
> Apply the patch to fix the following build failure raised since the
> addition of the package in commit
> 72fa60dc102679f51b228336ec38f5af78ff7646:
> 
> uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
> getopt.c:(.text+0x598): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
> 
> The patch has been submitted and accepted upstream to address this issue.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/844c7dd79f69ef2ea8f293bb73a2d4b7533aa97c
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Now that it is applied upstream, I made that an actual backport (to have
the proper sha1).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes in v2:
> - Add autobuild reference to commit message.
> - The applied patch has ben accepted, so update the commit message.
> 
>  .../sscep/0001-Fix-getopt-linking-error.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/sscep/0001-Fix-getopt-linking-error.patch
> 
> diff --git a/package/sscep/0001-Fix-getopt-linking-error.patch b/package/sscep/0001-Fix-getopt-linking-error.patch
> new file mode 100644
> index 000000000000..b32613b3cc18
> --- /dev/null
> +++ b/package/sscep/0001-Fix-getopt-linking-error.patch
> @@ -0,0 +1,55 @@
> +From c4fc8d9e282e05fcfa0cee9362c60742b26f4b33 Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Fri, 9 Dec 2022 18:18:27 +0100
> +Subject: [PATCH] Fix getopt linking error
> +
> +The buildroot project, to which the sscep application was added, has
> +configurations that raise the following linking error:
> +buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os):(.data+0x8): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
> +buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
> +getopt.c:(.text+0x5a4): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
> +buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `getopt_long':
> +getopt.c:(.text+0x5b0): multiple definition of `getopt_long'; src/getopt.o:getopt.c:(.text+0x128): first defined here
> +collect2: error: ld returned 1 exit status
> +make[2]: *** [Makefile:507: sscep] Error 1
> +make[1]: *** [package/pkg-generic.mk:293: buildroot/output/build/sscep-0.10.0/.stamp_built] Error 2
> +
> +The patch re-added a check that commit
> +81f56f635259b9 ("Replaced GNU getopt by a BSD licensed alternative")
> +removed.
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +---
> + src/getopt.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/src/getopt.c b/src/getopt.c
> +index eae36a64afff..0109406ba4ac 100644
> +--- a/src/getopt.c
> ++++ b/src/getopt.c
> +@@ -31,6 +31,16 @@
> + #include <stddef.h>
> + #include <string.h>
> + 
> ++#define GETOPT_INTERFACE_VERSION 2
> ++#if !defined _LIBC && defined __GLIBC__ && __GLIBC__ >= 2
> ++# include <gnu-versions.h>
> ++# if _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
> ++#  define ELIDE_CODE
> ++# endif
> ++#endif
> ++
> ++#ifndef ELIDE_CODE
> ++
> + char* optarg;
> + int optopt;
> + /* The variable optind [...] shall be initialized to 1 by the system. */
> +@@ -226,3 +236,5 @@ int getopt_long(int argc, char* const argv[], const char* optstring,
> +   ++optind;
> +   return retval;
> + }
> ++
> ++#endif	/* Not ELIDE_CODE.  */
> +-- 
> +2.32.0
> +
> -- 
> 2.32.0
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
