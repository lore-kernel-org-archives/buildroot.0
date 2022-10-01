Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CDEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 15:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3081416E3;
	Sat,  1 Oct 2022 15:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3081416E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmBpY7DlVA1I; Sat,  1 Oct 2022 15:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42D35415EF;
	Sat,  1 Oct 2022 15:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D35415EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68BE21BF355
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 15:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 442F883F76
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 15:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442F883F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9JzUhuJZWZk3 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 15:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEE2583F0C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEE2583F0C
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 15:56:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 76583780306;
 Sat,  1 Oct 2022 17:56:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 17:56:15 +0200
Date: Sat, 1 Oct 2022 17:56:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
Message-ID: <20221001155615.GA30794@scaer>
References: <20221001020445.1458953-1-buildroot@athaariq.my.id>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221001020445.1458953-1-buildroot@athaariq.my.id>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664639780;
 bh=zm2R3GXwBm7ccaNj375MZogZyBX+kcb7UksCzH5a854=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OCICYfaADO6otlqcqp1Zr1WWVW8ScwluwLjA7aHAYmjoln5Aum0auD4U+87AbOAcD
 3kcVP0RRDCrLih8SS0UIbuUnne3Ax+hMZmqlnDR70DP0ymKivFB6rEGQCEYDI1CvXe
 nosZUMfQFP3fZb567UQj3fkBZB1/chjN3cYKH733oX9wuuMv5Fty4IDiQAyJUkUozZ
 Q+oZgn2YXsJltUWCz8ZJIe19OsZzeztbfXb8HHJteql8ekZ9aCLRW/4tZpLsj2+PXI
 f0h6kvb0EHWxMJgOq6gFXXHRt3pRey4dq4RFfeBz7SgeLIRBKU/DaCRNGJZi36PWFQ
 CvvJw1PNeNo8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OCICYfaA
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: fix fsconfig_command
 redeclaration bug
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Athaariq, All,

On 2022-10-01 02:05 +0000, Athaariq Ardhiansyah spake thusly:
> Temporary fix for buildroot-specific bug.

How is this a buildroot-specific bug? Can you elaborate on that part? If
it is really a buildroot-related bug, then we want to understand it, and
fix it, not work around it.

> Ideally, we should install linux-headers first then glibc. Is this actually possible on Buildroot?

This is exactly what we are doing already, and for as long as Buildroot
has supported building a glibc-ased toolchain, as the kernel headers are
required to build glibc; see package/glibc/glibc.mk@28:

   26 # Before glibc is configured, we must have the first stage
   27 # cross-compiler and the kernel headers
   28 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \

> If yes, then we can also fix bug #15021 simultaneously if linux-headers being installed first as possible.

This part does not apply (or makes sense), as linux headers *are*
installed before glibc is even configured.

This issue is really weird, because the glibc commit we are using is
supposed to contain the related fixes:

    $ git los --oneline 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
    2628500f5d m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
    [...]
    3bd3c612e9 Linux: Fix enum fsconfig_command detection in <sys/mount.h>
    bb1e8b0ca9 linux: Fix sys/mount.h usage with kernel headers
    d48813227b linux: Use compile_c_snippet to check linux/mount.h availability

(There are two new commits on the release/2.36/master branch, but they
seem unrelated to the issue:
    76e05613ee (origin/release/2.36/master) stdlib: Fix __getrandom_nocancel type and arc4random usage (BZ #29638)
    227c903587 get_nscd_addresses: Fix subscript typos [BZ #29605]
)

To be noted, and as Thomas noticed, OpenEmbeded is also using a glibc
2.36 commit, and even one older than ours, but they do not seem to have
issues.

So, we'd like to understand why this is causing an issue for us. Hence,
if you could elaborate on the firt part of your message, above, that
would be extermely useful!

Regards,
Yann E. MORIN.

> Signed-off-by: Athaariq Ardhiansyah <buildroot@athaariq.my.id>
> ---
>  .../0002-fsconfig_command-workaround.patch      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/glibc/0002-fsconfig_command-workaround.patch
> 
> diff --git a/package/glibc/0002-fsconfig_command-workaround.patch b/package/glibc/0002-fsconfig_command-workaround.patch
> new file mode 100644
> index 0000000000..27dd25b244
> --- /dev/null
> +++ b/package/glibc/0002-fsconfig_command-workaround.patch
> @@ -0,0 +1,17 @@
> +diff --git a/sysdeps/unix/sysv/linux/sys/mount.h b/sysdeps/unix/sysv/linux/sys/mount.h
> +index 19841d0738..43a681d097 100644
> +--- a/sysdeps/unix/sysv/linux/sys/mount.h
> ++++ b/sysdeps/unix/sysv/linux/sys/mount.h
> +@@ -27,11 +27,7 @@
> + #include <stddef.h>
> + #include <sys/ioctl.h>
> + 
> +-#ifdef __has_include
> +-# if __has_include ("linux/mount.h")
> +-#  include "linux/mount.h"
> +-# endif
> +-#endif
> ++#include "linux/mount.h"
> + 
> + 
> + #define BLOCK_SIZE_BITS	10
> -- 
> 2.37.3
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
