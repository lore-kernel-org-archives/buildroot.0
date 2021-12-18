Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EBCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920D760B34;
	Sat, 18 Dec 2021 21:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8aeMD4lFHxgh; Sat, 18 Dec 2021 21:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEB8160B1F;
	Sat, 18 Dec 2021 21:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94BB21BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90261400C0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVRzvB7AOdIQ for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:17:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C84140022
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:17:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E22AD5FF6C;
 Sat, 18 Dec 2021 22:17:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639862255;
 bh=PqQ8zATEsZEPHOeuXgAmwXnrVvG0mg9CgKIDhGfecaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rQhhB17vldyaiIglSMRafU+w/jGW7zdydytJ8iM/peA+Fd/59h5yElx3mvWN2FMbQ
 sfVtajOFj9nnNWLw13Ffd+PC0vPUYK3rBAD+Hqv67yI+DRDnkp1PwTrokgCjR8w2K7
 P+zp0ufNFERN13YYDJNcvg7PEccTvA94Sy290QBI/LXk1aKQdVQ0buHZTIVm8UFbvU
 wHiB9N5A66NRQ3YC6B3YFQoo/tL6jN0gYTwpc+Qow09ph95mslQwevDXXoPjaaky8c
 GrYso3qcd0+Ki6s9cF/WiDbSgYc4K8Cdzt3PmHUkf9X8rL5FC3HmCnUfaneZSFY54c
 he7axFatUDg7w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:17:26 +0100
Date: Sat, 18 Dec 2021 22:17:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218211726.GO2603@scaer>
References: <20211218095655.521317-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218095655.521317-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: fix build with glibc
 >= 2.34
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-18 10:56 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with glibc >= 2.34:
> 
> In file included from timerobj.c:32:
> In function 'threadobj_set_current',
>     inlined from 'server_prologue' at timerobj.c:94:2:
> ../../include/copperplate/threadobj.h:252:9: error: 'pthread_setspecific' expecting 1 byte in a region of size 0 [-Werror=stringop-overread]
>   252 |         pthread_setspecific(threadobj_tskey, thobj);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ed93f916eda304b30f320816c85d1b0d4488c699
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...id-addresses-for-pthread_setspecific.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
> 
> diff --git a/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch b/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
> new file mode 100644
> index 0000000000..0c39a4ecf7
> --- /dev/null
> +++ b/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
> @@ -0,0 +1,57 @@
> +From 627d488db3aa71406e32d4d8934629e8b0f35905 Mon Sep 17 00:00:00 2001
> +From: Jan Kiszka <jan.kiszka@siemens.com>
> +Date: Sat, 16 Oct 2021 15:46:33 +0200
> +Subject: [PATCH] lib/{cobalt,copperplate}: Use valid addresses for
> + pthread_setspecific
> +
> +glibx 2.34 and newer annotated pthread_setspecific in a way that gcc-11
> +complains about non-NULL pointers that are outside of what is considered
> +valid. So use dummy addresses instead. namely the related pthread keys.
> +Those pointers will never be dereferenced in both use cases.
> +
> +See also https://sourceware.org/bugzilla/show_bug.cgi?id=28458.
> +
> +Reported-by: Vitaly Chikunov <vt@altlinux.org>
> +Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> +
> +[Retrieved from:
> +https://source.denx.de/Xenomai/xenomai/-/commit/627d488db3aa71406e32d4d8934629e8b0f35905]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + include/copperplate/threadobj.h | 6 +++++-
> + lib/cobalt/printf.c             | 2 +-
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/copperplate/threadobj.h b/include/copperplate/threadobj.h
> +index 7e6904f4c..c8363415b 100644
> +--- a/include/copperplate/threadobj.h
> ++++ b/include/copperplate/threadobj.h
> +@@ -173,7 +173,11 @@ void threadobj_save_timeout(struct threadobj_corespec *corespec,
> + #define __THREAD_M_SPARE6	(1 << 22)
> + #define __THREAD_M_SPARE7	(1 << 23)
> + 
> +-#define THREADOBJ_IRQCONTEXT    ((struct threadobj *)-2UL)
> ++/*
> ++ * We need to use a valid address here. The object will never be dereferenced
> ++ * when it is identified as IRQ context, so the pthread key itself is fine.
> ++ */
> ++#define THREADOBJ_IRQCONTEXT	((struct threadobj *)&threadobj_tskey)
> + 
> + struct traceobj;
> + struct syncobj;
> +diff --git a/lib/cobalt/printf.c b/lib/cobalt/printf.c
> +index 8982ddc93..0aa5940c6 100644
> +--- a/lib/cobalt/printf.c
> ++++ b/lib/cobalt/printf.c
> +@@ -729,7 +729,7 @@ done:
> + 	pthread_cond_init(&printer_wakeup, NULL);
> + 	spawn_printer_thread();
> + 	/* We just need a non-zero TSD to trigger the dtor upon unwinding. */
> +-	pthread_setspecific(cleanup_key, (void *)1);
> ++	pthread_setspecific(cleanup_key, &cleanup_key);
> + 
> + 	atexit(rt_print_flush_buffers);
> + }
> +-- 
> +GitLab
> +
> -- 
> 2.33.0
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
