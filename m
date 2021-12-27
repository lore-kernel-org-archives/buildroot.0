Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D289C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AADB4032A;
	Mon, 27 Dec 2021 21:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2RO9UxJ18fY; Mon, 27 Dec 2021 21:27:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 311FF402A6;
	Mon, 27 Dec 2021 21:27:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6CEB1BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEFD6401AF
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c05UAvdmiqQV for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:27:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2205401A3
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:27:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:918:ad60:2814:bc16])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 802E1B004EC;
 Mon, 27 Dec 2021 22:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640640441;
 bh=4/8keG1yVxM6z18f8TOe9rlVt+RgDWw4cAASqk89QnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=naPlWbF4Xjit0TqkqYg6z9fwlvdncJJ0HiYiHBVpJ+fOVSj/IBSKHIfEmRKKMFbhs
 XkxZ4Cue6SmWsEoN25gpZfH6g2EJRx3T7mc4O0k/ti4/brJGk+mRRcTnzUghSdvLLp
 f3cQSioPPyM8mcOgwFho6fswTZqxqDTecxS/8pm+XU876isYlQAfathwc3eGA2VmOS
 B4NGC6BAaKEHgxOoEGjaSQUmOTAuzsubcC8SGC+Rk5QkAjo5IPKAgFqrWCJVSaL12b
 o/zoqJA3MrXLdzQkOcaGJ/9A0mSMtwqUOR6zeNuCONpKnWUHFsCDSfWuohh//uMkHy
 EXRhyZq2D/qwA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Dec 2021 22:27:18 +0100
Date: Mon, 27 Dec 2021 22:27:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211227212718.GA3390456@scaer>
References: <20211226104520.663206-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211226104520.663206-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/glibc: add a patch to fix build
 issue in kernels >= 3.15 and < 5.1 on Microblaze
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

Thomas, All,

On 2021-12-26 11:45 +0100, Thomas Petazzoni spake thusly:
> As explained in the patch itself, there is a bug in the handling of
> __pselect32() in glibc for the Microblaze architecture. There a
> special Microblaze variant that was added to support kernels older
> than < 3.15, but it "hides" a generic implementation that is needed to
> support kernels newer than 3.15 but older than 5.1 (which is when the
> time64 support for 32-bit architectures was added, making __pselect32
> no longer needed).
> 
> This bug causes a glibc build failure for kernels >= 3.15 but < 5.1,
> on Microblaze.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...v-linux-microblaze-pselect32.c-add-m.patch | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
> 
> diff --git a/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
> new file mode 100644
> index 0000000000..3597cd6a11
> --- /dev/null
> +++ b/package/glibc/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
> @@ -0,0 +1,85 @@
> +From af06fe63f9babb6d0179ae5d7d9245daada6bf56 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 26 Dec 2021 10:30:01 +0100
> +Subject: [PATCH] sysdeps/unix/sysv/linux/microblaze/pselect32.c: add missing
> + implementation when !__ASSUME_TIME64_SYSCALLS
> +
> +In commit a92f4e6299fe0e3cb6f77e79de00817aece501ce ("linux: Add time64
> +pselect support"), a Microblaze specific implementation of
> +__pselect32() was added to cover the case of kernels < 3.15 which lack
> +the pselect6 system call.
> +
> +This new file sysdeps/unix/sysv/linux/microblaze/pselect32.c takes
> +precedence over the default implementation
> +sysdeps/unix/sysv/linux/pselect32.c.
> +
> +However sysdeps/unix/sysv/linux/pselect32.c provides an implementation
> +of __pselect32() which is needed when __ASSUME_TIME64_SYSCALLS is not
> +defined. On Microblaze, which is a 32-bit architecture,
> +__ASSUME_TIME64_SYSCALLS is only true for kernels >= 5.1.
> +
> +Due to sysdeps/unix/sysv/linux/microblaze/pselect32.c taking
> +precedence over sysdeps/unix/sysv/linux/pselect32.c, it means that
> +when we are with a kernel >= 3.15 but < 5.1, we need a __pselect32()
> +implementation, but sysdeps/unix/sysv/linux/microblaze/pselect32.c
> +doesn't provide it, and sysdeps/unix/sysv/linux/pselect32.c which
> +would provide it is not compiled in.
> +
> +This causes the following build failure on Microblaze with for example
> +Linux kernel headers 4.9:
> +
> +/home/thomas/buildroot/buildroot/output/host/lib/gcc/microblazeel-buildroot-linux-gnu/10.3.0/../../../../microblazeel-buildroot-linux-gnu/bin/ld: /home/thomas/buildroot/buildroot/output/build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/libc_pic.os: in function `__pselect64':
> +(.text+0x120b44): undefined reference to `__pselect32'
> +collect2: error: ld returned 1 exit status
> +
> +To fix this, we take a crude approach: replicate in
> +sysdeps/unix/sysv/linux/microblaze/pselect32.c the
> +!__ASSUME_TIME64_SYSCALLS implementation that is already in
> +sysdeps/unix/sysv/linux/pselect32.c.
> +
> +Upstream: https://sourceware.org/pipermail/libc-alpha/2021-December/134635.html
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + .../unix/sysv/linux/microblaze/pselect32.c    | 22 +++++++++++++++++--
> + 1 file changed, 20 insertions(+), 2 deletions(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/microblaze/pselect32.c b/sysdeps/unix/sysv/linux/microblaze/pselect32.c
> +index 70b7b52a48..6b6b3e8a2e 100644
> +--- a/sysdeps/unix/sysv/linux/microblaze/pselect32.c
> ++++ b/sysdeps/unix/sysv/linux/microblaze/pselect32.c
> +@@ -22,7 +22,25 @@
> + #include <sys/poll.h>
> + #include <sysdep-cancel.h>
> + 
> +-#ifndef __ASSUME_PSELECT
> ++#if !defined(__ASSUME_TIME64_SYSCALLS)
> ++int
> ++__pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
> ++	     fd_set *exceptfds, const struct __timespec64 *timeout,
> ++	     const sigset_t *sigmask)
> ++{
> ++  struct timespec ts32, *pts32 = NULL;
> ++  if (timeout != NULL)
> ++    {
> ++      ts32 = valid_timespec64_to_timespec (*timeout);
> ++      pts32 = &ts32;
> ++    }
> ++
> ++  return SYSCALL_CANCEL (pselect6, nfds, readfds, writefds, exceptfds,
> ++			 pts32,
> ++			 ((__syscall_ulong_t[]){ (uintptr_t) sigmask,
> ++						 __NSIG_BYTES }));
> ++}
> ++#elif !defined(__ASSUME_PSELECT)
> + int
> + __pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
> + 	     fd_set *exceptfds, const struct __timespec64 *timeout,
> +@@ -57,4 +75,4 @@ __pselect32 (int nfds, fd_set *readfds, fd_set *writefds,
> + 
> +   return ret;
> + }
> +-#endif /* __ASSUME_PSELECT  */
> ++#endif
> +-- 
> +2.31.1
> +
> -- 
> 2.31.1
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
