Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036EBC433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 14:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 376744089A;
	Sun, 20 Nov 2022 14:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 376744089A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8b7BwWgFPGWf; Sun, 20 Nov 2022 14:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D548F40884;
	Sun, 20 Nov 2022 14:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D548F40884
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89F9C1BF475
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 14:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B92340884
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 14:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B92340884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiglj_twmDgp for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 14:03:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781A44086B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 781A44086B
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 14:03:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:78ad:17ab:4254:8d91])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3BF622003B4;
 Sun, 20 Nov 2022 15:03:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 15:03:52 +0100
Date: Sun, 20 Nov 2022 15:03:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221120140352.GD2516@scaer>
References: <20221119120518.645972-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119120518.645972-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668953035;
 bh=3AXUw/I58MMQRvzPpt+AHosJAeqHvcGkyVn8BKkGYy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+YS7z+DO+dcL23U6n2vIL7trvQbdnXllb8EpKjCEDlm231R6F6jaRCOPKJ/H1zSu
 miNL//ldC9NLvf/1jvmG9RWdfWtiZUkWi1tCgp2FUS0vGCL3IH5uLMqWhvNsk/b2EY
 AsObOHhqLYDdDEbE4yckE2+svt83AN91PyXSE3zRf8kzHQQR35LLuwzghUZgBoFEJr
 ypEnWlBdib4jqnq7V57p25VbqIEgT/mgMHaVedf3IDnArZFJWpAIsVM/OJs5np4gsy
 E6m8s4whHicPURTMxZMenf679eCwRMUz1QiHCTGZKGNiQ6cldhLbExlufG4ETHf6KO
 pWr/fqIu+8EGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m+YS7z+D
Subject: Re: [Buildroot] [PATCH next 1/1] package/z3: new package
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

Julien, All,

On 2022-11-19 13:05 +0100, Julien Olivain spake thusly:
> Z3, also known as the Z3 Theorem Prover, is a cross-platform
> satisfiability modulo theories (SMT) solver.
> 
> https://github.com/Z3Prover/z3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
[--SNIP--]
> diff --git a/package/z3/Config.in b/package/z3/Config.in
> new file mode 100644
> index 0000000000..a3f57f7f88
> --- /dev/null
> +++ b/package/z3/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_Z3
> +	bool "z3"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # c++17
> +	# z3 needs fenv.h which is not provided by uclibc
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
> +	depends on !BR2_nios2
> +	help
> +	  Z3, also known as the Z3 Theorem Prover, is a cross-platform
> +	  satisfiability modulo theories (SMT) solver.
> +
> +	  https://github.com/Z3Prover/z3
> +
> +if BR2_PACKAGE_Z3
> +
> +config BR2_PACKAGE_Z3_PYTHON
> +	bool "Python bindings"
> +	select BR2_PACKAGE_PYTHON3 # runtime

To me, it makes more sense that python bindings depend on python being
enabled, rather than forcing it. Indeed, if the python is not enabled
(either manually or because it is not selected by an application), then
there is no reason to enable it just to provide bindings.

And we do have that construct in at least a few other packages that
provide python bindings: libftdi1, libiio, ola... So I changed it to
match.  (yes, there are other packages that use select, but that's not a
reason to do things better nowadays! ;-) )

[--SNIP--]
> diff --git a/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py b/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py
> new file mode 100755
> index 0000000000..6ac53b98c5
> --- /dev/null
> +++ b/support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py
> @@ -0,0 +1,21 @@
> +#! /usr/bin/env python3
> +
> +from z3 import *

Not all of check-package/flake8 tests are run against files in the
runtime test-suite, but I have a hook that does it, and it reports:

    WARNING: support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py:3:1: F403 'from z3 import *' used; unable to detect undefined names
    WARNING: support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py:5:5: F405 'Real' may be undefined, or defined from star imports: z3
    WARNING: support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py:6:5: F405 'Real' may be undefined, or defined from star imports: z3
    WARNING: support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py:7:5: F405 'Real' may be undefined, or defined from star imports: z3
    WARNING: support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py:8:5: F405 'Solver' may be undefined, or defined from star imports: z3
    WARNING: support/testing/tests/package/test_z3/rootfs-overlay/root/z3test.py:20:17: F405 'sat' may be undefined, or defined from star imports: z3
    WARNING: 1     F403 'from z3 import *' used; unable to detect undefined names
    WARNING: 5     F405 'Real' may be undefined, or defined from star imports: z3

So I changed the test to import the whole z3 module, and to prefix
objects with z3.:

    x = z3.Real('x')

and so on...

Applied to next, thanks.

Regards,
Yann E. MORIN.

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
