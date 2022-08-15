Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0450C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD4E83F83;
	Mon, 15 Aug 2022 13:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD4E83F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIcSEq0sJx8x; Mon, 15 Aug 2022 13:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62BFD8254D;
	Mon, 15 Aug 2022 13:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62BFD8254D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 98EBF1BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8131240ADD
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8131240ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qGomZErlWRF for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:47:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413E24042B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 413E24042B
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:47:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E8ADD60139;
 Mon, 15 Aug 2022 15:47:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 15:47:35 +0200
Date: Mon, 15 Aug 2022 15:47:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815134735.GY2854108@scaer>
References: <20220815124348.560482-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815124348.560482-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660571259;
 bh=ST5ItMOnO14hgQgn5f3mRFq1TScfw2UXkioG31rP3Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDFJfNxV+EKP7Isn0qOPdxK8lj9YH40E9ul5mEinqpcEKB0ZbCPKCCTXE8VOz0bPB
 5AF/SJQTbi1bsGi61W/igrkZJ9cQan7Rx6M+r62+aVuZnNw+L0iy3EMWN+dIOklzhP
 2XeDydcCYlCFVFdmiCVssDzOOv/A8d+c0gO5T2cWETR5QHKL3kSJf821upBfCU90lQ
 7GnLAuKoIjwIrB2AToCe7jl0cUxBRwUHr6XjL9CxzVfYblwPAsDnd/bzzQCH52u4KO
 UGjKFhlRsrD40XDVLWCQfKNBniBrUs9fffFwVlb3cuJ3emsTR0bT3IwwsFKxY9DW6I
 ZC8yDjfScJ2gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZDFJfNxV
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: fix uclibc build
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-15 14:43 +0200, Fabrice Fontaine spake thusly:
> Fix the following uclibc build failure on aarch64 raised since bump to
> version 6.14 in commit 5292d1cf9ad0605cc264fedc75c1b9a169aa183b and
> https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:
> 
> rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
>    34 | #include <sys/auxv.h>
>       |          ^~~~~~~~~~~~
> 
> Strangely enough, there is no autobuilder failure for powerpc64le raised
> since version bump to version 6.11 in commit
> da83261c9be0484924c845bb033e2ca752556504
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...gure.ac-fix-build-without-sys-auxv.h.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
> 
> diff --git a/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
> new file mode 100644
> index 0000000000..0c15ab6b7d
> --- /dev/null
> +++ b/package/rng-tools/0001-configure.ac-fix-build-without-sys-auxv.h.patch
> @@ -0,0 +1,52 @@
> +From 6ea89861c300a732d1bbcffd085d92f5c4c9228e Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 15 Aug 2022 11:57:21 +0200
> +Subject: [PATCH] configure.ac: fix build without sys/auxv.h
> +
> +Fix the following build failure on aarch64 without sys/auxv.h (e.g. on
> +uclibc) raised since version 6.13 and
> +https://github.com/nhorman/rng-tools/commit/9070a04adfcd21ec3839ee8ff190e7130ccd5c9b:
> +
> +rngd_rndr.c:34:10: fatal error: sys/auxv.h: No such file or directory
> +   34 | #include <sys/auxv.h>
> +      |          ^~~~~~~~~~~~
> +
> +The same issue could be raised on powerpc64le since version 6.11 and
> +https://github.com/nhorman/rng-tools/commit/ade348cdb90c25b44b203fd4e9c33ec4bccff323
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/41d5ab9e67eb0d8af8d789fc94d4366f130a7fb2
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/nhorman/rng-tools/commit/6ea89861c300a732d1bbcffd085d92f5c4c9228e]
> +---
> + configure.ac | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0af64e7..411c7b8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -76,14 +76,17 @@ AC_PROG_GCC_TRADITIONAL
> + 
> + AX_PTHREAD
> + 
> ++dnl Checks for header files.
> ++AC_CHECK_HEADERS(sys/auxv.h)
> ++
> + AM_CONDITIONAL([RDRAND], [test $host_cpu = x86_64 || test $host_cpu = i686])
> + AS_IF([test $host_cpu = x86_64 || test $host_cpu = i686], [AC_DEFINE([HAVE_RDRAND],1,[Enable RDRAND])],[])
> + 
> +-AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le])
> +-AS_IF([test $host_cpu = powerpc64le], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
> ++AM_CONDITIONAL([DARN], [test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"])
> ++AS_IF([test $host_cpu = powerpc64le -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_DARN],1,[Enable DARN])],[])
> + 
> +-AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64])
> +-AS_IF([test $host_cpu = aarch64], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
> ++AM_CONDITIONAL([RNDR], [test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"])
> ++AS_IF([test $host_cpu = aarch64 -a "$ac_cv_header_sys_auxv_h" = "yes"], [AC_DEFINE([HAVE_RNDR],1,[Enable RNDR])],[])
> + AM_CONDITIONAL([JITTER], [false])
> + 
> + AC_ARG_ENABLE(jitterentropy,
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
