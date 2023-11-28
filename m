Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B724C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 16:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7BF04174E;
	Tue, 28 Nov 2023 16:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7BF04174E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zoj1gVXdxnSj; Tue, 28 Nov 2023 16:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8DE741753;
	Tue, 28 Nov 2023 16:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DE741753
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB071BF3F9
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED79841745
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 16:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED79841745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Q_pawvGSEoJ for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 16:12:21 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 683984173A
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 16:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 683984173A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:c5a3:8084:a241:9d13])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 61E4A13F86A;
 Tue, 28 Nov 2023 17:12:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Nov 2023 17:12:17 +0100
Date: Tue, 28 Nov 2023 17:12:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231128161217.GF3177259@scaer>
References: <20231127212712.1059242-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127212712.1059242-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701187939;
 bh=SIUd1xP+jSrmTqs19zL9SZENwO+9f5rKPaRFnpr+3is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kKZIwUqpIeDmq7/6nTkJZkUDJC7w1m7wbiTh+7Bc/BpdEMr2IFH6TBnR4Vc/an3p3
 MH+C1b+YxTrOCScrla48bd7H0ZpJMHsGERFusPFSFVHhVQDcklvNcrcgQP551Wjzno
 znOt+nTQY8cv7ye9N0t37EoXv1YN6rco0rRb/sk04d1jhNIdeO3SU5oR3RhwU5VVa2
 r7+0hHj+IidjqbwnAFfUimL2yF6BSRhSaI1OCKIeZAI/Od0QgwDrYp/QmqVuI+IRSc
 jMglSYMFBeAQokUEq4jE3foVS8XD+jlzvsEgm7Ve7tqGdnvCdzeuIACfMIYVO0Lp+1
 p737CaS4WAH8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kKZIwUqp
Subject: Re: [Buildroot] [PATCH 1/1] package/motion: fix webp build
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

Fabrice, All,

On 2023-11-27 22:27 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of webp to version
> 1.3.2 in commit c88c1d3319dd24fa833455a2e7d96bc4585bab7f:
> 
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: picture.o: undefined reference to symbol 'WebPMemoryWriterClear'
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/aarch64_be-buildroot-linux-uclibc/13.2.0/../../../../aarch64_be-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/aarch64_be-buildroot-linux-uclibc/sysroot/usr/lib64/libwebp.so.7: error adding symbols: DSO missing from command line
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9b859a701debeaddf1f9909e16adc6811a620576
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...Include-libwebp-when-WEBP-is-enabled.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
> 
> diff --git a/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
> new file mode 100644
> index 0000000000..a1536a7d2f
> --- /dev/null
> +++ b/package/motion/0002-Include-libwebp-when-WEBP-is-enabled.patch
> @@ -0,0 +1,26 @@
> +From 40ecd71ff361442f1579089481619dd7cae90ffd Mon Sep 17 00:00:00 2001
> +From: Piotr Mionskowski <piotr.mionskowski@gmail.com>
> +Date: Sun, 9 Jul 2023 01:44:49 +0200
> +Subject: [PATCH] Include libwebp when WEBP is enabled
> +
> +Upstream: https://github.com/Motion-Project/motion/commit/40ecd71ff361442f1579089481619dd7cae90ffd
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index ce588f65..ee45ac37 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -191,8 +191,8 @@ AS_IF([test "${WEBP}" = "yes" ], [
> +     AS_IF([pkg-config libwebpmux ], [
> +         AC_MSG_RESULT(yes)
> +         AC_DEFINE([HAVE_WEBP], [1], [Define to 1 if WEBP is around])
> +-        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux`
> +-        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux`
> ++        TEMP_CFLAGS="$TEMP_CFLAGS "`pkg-config --cflags libwebpmux libwebp`
> ++        TEMP_LIBS="$TEMP_LIBS "`pkg-config --libs libwebpmux libwebp`
> +       ],[
> +         AC_MSG_RESULT(no)
> +       ]
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
