Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81FED6101A;
	Sun, 29 May 2022 21:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RziFpPEKB05a; Sun, 29 May 2022 21:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A11760F3B;
	Sun, 29 May 2022 21:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BFC21BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28CA58439D
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZMxDClp1_Tj3 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:17:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E8F84397
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:17:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 47594780313;
 Sun, 29 May 2022 23:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653859058;
 bh=Pmt2evXvzhI28u4TkNpOuq4KicDjn8iD/m/HM+JVen0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jIfxL8d4J6s0Af5YRUYv0Am0FrZP+podpvzQFObKHKkg7o+u6Cxq5eqQLDPe50LoB
 8w7pfgcq0FGlm0damBmBaqb8wn+eyV7gqte5Yp/FkzPIGEjier0t/vaGkO2DGIoIdh
 oR1wLfjE+wggtsx2Bc2TTElrSf90qCKut8Ge4E7xKCay5VcfkcvQGCvR5oJC3MUR4i
 jIKrgNzgHaRxSzfIl6j72GNsCtga1YOZclNFgYFStmAFhjFjGNQnQ8IVvLj+7wk0Ot
 RUT4E2pn8kcqB8uabjmm2inG1UvfYhiS3aUA80b12JoaZ5mjrJG7X6uKFTgMGp6RBW
 A8gdiK/HqC+Mg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:17:35 +0200
Date: Sun, 29 May 2022 23:17:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220529211735.GH993669@scaer>
References: <20220523211416.1500310-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523211416.1500310-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix musl and uclibc-ng
 build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-23 23:14 +0200, Fabrice Fontaine spake thusly:
> Fix the following musl and uclibc-ng build failure raised since bump to
> version 7.0.0 in commit 3fa79c038ec75228015ea0022de80c5e7a2003f8 and
> https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
> 
> ../linux-user/syscall.c: In function 'target_to_host_resource':
> ../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
>  1057 |         return RLIMIT_RTTIME;
>       |                ^~~~~~~~~~~~~
>       |                RLIMIT_NOFILE
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ll.c-fix-build-without-RLIMIT_RTTIME.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
> 
> diff --git a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
> new file mode 100644
> index 0000000000..729c2e9be8
> --- /dev/null
> +++ b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
> @@ -0,0 +1,48 @@
> +From 84863e007d4ef0858e74a1250e2472954924c617 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 14 May 2022 16:10:16 +0200
> +Subject: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
> +
> +RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
> +1.2.0 and
> +https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
> +resulting in the following build failure since
> +https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
> +
> +../linux-user/syscall.c: In function 'target_to_host_resource':
> +../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
> + 1057 |         return RLIMIT_RTTIME;
> +      |                ^~~~~~~~~~~~~
> +      |                RLIMIT_NOFILE
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://patchwork.ozlabs.org/project/qemu-devel/patch/20220523105239.1499162-1-fontaine.fabrice@gmail.com]
> +---
> +Changes v1 -> v2 (after review of Laurent Vivier):
> + - Use an ifdef block instead of defining RLIMIT_RTTIME
> +
> + linux-user/syscall.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> +index dd0d92ba4e..488facb356 100644
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
> +         return RLIMIT_RSS;
> +     case TARGET_RLIMIT_RTPRIO:
> +         return RLIMIT_RTPRIO;
> ++#ifdef RLIMIT_RTTIME
> +     case TARGET_RLIMIT_RTTIME:
> +         return RLIMIT_RTTIME;
> ++#endif
> +     case TARGET_RLIMIT_SIGPENDING:
> +         return RLIMIT_SIGPENDING;
> +     case TARGET_RLIMIT_STACK:
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
