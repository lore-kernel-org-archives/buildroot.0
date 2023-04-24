Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299BDC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 15:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 828144158B;
	Mon, 24 Apr 2023 15:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 828144158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DcgldrvphKQk; Mon, 24 Apr 2023 15:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 930204158E;
	Mon, 24 Apr 2023 15:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 930204158E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77AD61BF86B
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 15:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EDF84158B
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 15:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EDF84158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8UQGAc0pMeY for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 15:48:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C780340439
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C780340439
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 15:48:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:786a:5f81:2188:6ed4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EB05160138;
 Mon, 24 Apr 2023 17:48:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 24 Apr 2023 17:48:28 +0200
Date: Mon, 24 Apr 2023 17:48:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: JiangXin <mc.xin@foxmail.com>
Message-ID: <20230424154828.GP2696@scaer>
References: <tencent_E605AD09EB02769EC2D19F376A1239F80406@qq.com>
 <20230423164025.GL2696@scaer>
 <tencent_475A705644EC2785AB3F5ED47572AF096207@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_475A705644EC2785AB3F5ED47572AF096207@qq.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682351315;
 bh=3ev3xkwvwNYxa4L0KeE6TJBqbnRms8yfVDzaqxWSxuI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tNafxq6MGu81Lnd7HCP+aZFINx/MiEYi8Si6nkkV7ZdOMUwzuwv8UxmLdiRSexqdY
 l2X7liQm0KibQMLuK4BvICxkPeA1JdypxO+qApWB91EcAJJ5G60vJuPJTSfHTeDZRt
 bUfIEXagSdjI5J93WqVC2ZB0xPClqvMMPok5FH4N3V4iBx/mtR9S1T8NlOMH2qWDVt
 szicSQeKSQnBX4RSk9SjWnUgE6JlInPTAIIktFeK+MCZz5nKD58K/h2vMA4h57kR4D
 OdBLfSSiuYAW9e6dOD47w3K0hPv3k37vrdTQ5y6t4YwmpcSrxEuNM+YecxWaJu7Mok
 yPuJNlWj9Sbqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tNafxq6M
Subject: Re: [Buildroot] 
 =?utf-8?b?5Zue5aSN77yaICBbUEFUQ0ggMS8xXSB0b29sY2hh?=
 =?utf-8?q?in/helpers=2Emk=3A_add_the_processing_when_LIBPATH_is_a_directo?=
 =?utf-8?q?ry?=
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

JiangXin, All,

On 2023-04-24 15:56 +0800, JiangXin spake thusly:
> I build rootfs in docker container based on ubuntu22.04, host arch is x86_64.
> I chose the gcc downloaded by apt to build. 

Ah, we do not support distro toolchains, see the manual, chapter 6.1.2.
External toolchain backend:

    https://buildroot.org/downloads/manual/manual.html#external-toolchain-backend

    We also do not support using the distribution toolchain (i.e. the
    gcc/binutils/C library installed by your distribution) as the
    toolchain to build software for the target. This is because your
    distribution toolchain is not a "pure" toolchain (i.e. only with
    the C/C++ library), so we cannot import it properly into the
    Buildroot build environment.

> After the shell command in helpers.mk is excuted, the following content is output:
> root@824b1b82dfae:~/buildroot-2022.02.11# find /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot -name
> "ld*.so.*"
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/etc/ld.so.conf.d
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/etc/ld.so.cache
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/etc/ld.so.conf
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/ld-linux-x86-64.so.2
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/lib/ld-linux-x86-64.so.2
> root@824b1b82dfae:~/buildroot-2022.02.11# ls -l
> /root/buildroot-2022.02.11/output/host/x86_64-buildroot-linux-gnu/sysroot/etc/ld.so.conf.d
> total 12
> -rw-r--r-- 1 root root  38 Mar  5  2022 fakeroot-x86_64-linux-gnu.conf
> -rw-r--r-- 1 root root  44 Sep 24  2021 libc.conf
> -rw-r--r-- 1 root root 100 Sep 28  2021 x86_64-linux-gnu.conf
> I added the echo on lines 753-756 of the top-level Makefile, and the build 
> log shows it doesn't get there.

This is weird, because that part should be unconditional. So, it looks
like the build may in fact not be finished successfully. Could you share
the last 50-or so last lines of the log?

> Should the processing of directories be added
> in toolchain/helpers.mk?

As I explained previously, and as confirmed above, support for
ld.so.conf should not be added, and thus the real solution is to
exclude directories in toolchain/helpers.mk line 13:

    find $(STAGING_DIR)/ -name "$${LIBPATTERN}" -not -type d 2>/dev/null

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
