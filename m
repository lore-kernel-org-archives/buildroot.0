Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C55C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A50860BBE;
	Sun, 25 Sep 2022 12:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A50860BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHjOirp_BOKo; Sun, 25 Sep 2022 12:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1979860761;
	Sun, 25 Sep 2022 12:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1979860761
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD7161BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 851748331B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 851748331B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FN90xAkgxkPL for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:18:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F2B832FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83F2B832FF
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:18:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 98D6E13F8C6;
 Sun, 25 Sep 2022 14:17:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 14:17:55 +0200
Date: Sun, 25 Sep 2022 14:17:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220925121755.GW1419013@scaer>
References: <20220925095024.306230-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925095024.306230-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664108278;
 bh=oWpljliNUJgc7FSLJRs0cTEQcrFbvS6M54vQH538VKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tJCxw48UL1yMHqEAyWIHrw9glsy/5Z0V6rd4bEiYsWG0jqhKoWUDnnT1zB194xUVL
 IKPLrXbjXl0VlEzT/HDxvvzFVItnKheolIjjrS/RnvjAzx+Y5Pm+7gEh/Vxefrj9dk
 yIc+YSZ4G3oaqVC2yjfNzF+pAuA7JBAFWn0dadfRDRUGT0v//AXSmYKjBaHjFwVA+P
 2fXzo9NxXXQ4w/mFAzf1OvZmxDGoVMBjz5O0rSSvmaVCCN4UsgFvmVp+GdolGL99rO
 +q/LQJgEOhq7ucrKsRiszELPUkIROAOspgRbiLQIivQNU7aYfse9OUFdvTW5ET0G5s
 0hfQ5hVC2sM8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tJCxw48U
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: fix sparc build
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-25 11:50 +0200, Fabrice Fontaine spake thusly:
> Fix the following sparc build failure raised since bump to version 0.24
> in commit 9b5caa2ab45d7ec01e1657b10f94c2f60c7afe8e and
> https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:
[--SNIP--]
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-iiod-serial.c-fix-sparc-build.patch  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
> 
> diff --git a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
> new file mode 100644
> index 0000000000..b1cdb767eb
> --- /dev/null
> +++ b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
> @@ -0,0 +1,79 @@
> +From 8ee3fd8487b84dda11651bcdddfe3f83105c42b6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 25 Sep 2022 11:19:18 +0200
> +Subject: [PATCH] iiod/serial.c: fix sparc build
[--SNIP--]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/analogdevicesinc/libiio/pull/908]
> +---
> + iiod/serial.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/iiod/serial.c b/iiod/serial.c
> +index f829361..58b5c31 100644
> +--- a/iiod/serial.c
> ++++ b/iiod/serial.c
> +@@ -19,6 +19,22 @@
> + #include <sys/ioctl.h>
> + #include <termios.h>
> + 
> ++#ifndef B2500000
> ++#define B2500000 2500000
> ++#endif
> ++
> ++#ifndef B3000000
> ++#define B3000000 3000000
> ++#endif
> ++
> ++#ifndef B3500000
> ++#define B3500000 3500000
> ++#endif
> ++
> ++#ifndef B4000000
> ++#define B4000000 4000000
> ++#endif

The problem I can see with this, is that the kernel explicitly does not
define them for sparc:

    https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cb

    These have totally bogus values and nobody uses them
    so far. Later on we'd have to use say 0x10000x and
    adjust CBAUD constant and drivers accordingly

So, I believe the proper solution would be that the case clauses be
guarded by a condition that the corresponding value is defined:

    #ifdef B2500000  /* Not available on all archictectures, i.e. sparc */
        CASE_BPS(2500000, &tty_attrs);
    #endif

and so on...

Regards,
Yann E. MORIN.

> + struct serial_pdata {
> + 	struct iio_context *ctx;
> + 	bool debug;
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
