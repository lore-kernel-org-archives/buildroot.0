Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C844C04A6A
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 14:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7D6606F2;
	Sat, 12 Aug 2023 14:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD7D6606F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YO7vB9E5L8-C; Sat, 12 Aug 2023 14:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CAD060B1F;
	Sat, 12 Aug 2023 14:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CAD060B1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08CC21BF344
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 14:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E343881DEF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 14:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E343881DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDf6sxzwtsnl for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 14:26:49 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA88081D9F
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 14:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA88081D9F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a00a:6044:1314:a80a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1B20119F59C;
 Sat, 12 Aug 2023 16:26:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Aug 2023 16:26:45 +0200
Date: Sat, 12 Aug 2023 16:26:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812142645.GN421096@scaer>
References: <ZNWRuw83P+HDmpjP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNWRuw83P+HDmpjP@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691850408;
 bh=HZfpUhV/n3yV1KRuJF1CJLjzDZmPq1adEBczbScJQ60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NtlyEIdzo6YNpTrXrOtbXYaDzgrmO3Fdq2ZNefO518N2v3/Gen96SxRIp5ajIqABH
 /B5ikOXfOaqQ3h9H7QnzDGW31I9f7xo5MVjPbn3APt0dZ0QFAe7oY1Jev65KI2Xm/D
 P/nEHTMgscGa/YHFxoOUDrZSYfJRzReLXbGYiqX+WbBKk3PzFY6tiIg7GkWt6fbYSu
 6yFnWkFBlLX4y/lS10SJPMiuDMwyIxlqTtwAen+XShRG14LIKd6UehZjzJeHypkWsU
 vRXhuarE5pjxP1K+FaUVehhQRWCM+3+qbOfmMxMM7oCN5LcHdATXPod/1jF3koLXEz
 OLVsDOfR5sssQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NtlyEIdz
Subject: Re: [Buildroot] [PATCH] package/uclibc: add upstream patch to fix
 missing f_owner_ex
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

Waldemar, All,

On 2023-08-11 03:41 +0200, Waldemar Brodkorb spake thusly:
> This was previously only defined for aarch64, define the missing
> stuff for all architectures.
> This is required for the zeek package.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/f32/f32777b27c6b4f5a41c255df53502164d21b0fd4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...are-f_owner_ex-for-all-architectures.patch | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
> 
> diff --git a/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch b/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
> new file mode 100644
> index 0000000000..da0135a5e3
> --- /dev/null
> +++ b/package/uclibc/0002-fcntl.h-declare-f_owner_ex-for-all-architectures.patch
> @@ -0,0 +1,85 @@
> +From 98576ab8de710507419b016fbcfc82ed7c57f9c3 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Wed, 9 Aug 2023 10:31:28 +0200
> +Subject: [PATCH] fcntl.h: declare f_owner_ex for all architectures
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=98576ab8de710507419b016fbcfc82ed7c57f9c3
> +---
> + include/fcntl.h                         | 20 ++++++++++++++++++++
> + libc/sysdeps/linux/aarch64/bits/fcntl.h | 21 ---------------------
> + 2 files changed, 20 insertions(+), 21 deletions(-)
> +
> +diff --git a/include/fcntl.h b/include/fcntl.h
> +index 136f64d70..ce15ceaf6 100644
> +--- a/include/fcntl.h
> ++++ b/include/fcntl.h
> +@@ -296,6 +296,26 @@ int name_to_handle_at(int dirfd, const char *pathname,
> + int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);
> + #endif
> + 
> ++#ifdef __USE_GNU
> ++# define F_SETOWN_EX	15	/* Get owner (thread receiving SIGIO).  */
> ++# define F_GETOWN_EX	16	/* Set owner (thread receiving SIGIO).  */
> ++/* Owner types.  */
> ++enum __pid_type
> ++  {
> ++    F_OWNER_TID = 0,		/* Kernel thread.  */
> ++    F_OWNER_PID,		/* Process.  */
> ++    F_OWNER_PGRP,		/* Process group.  */
> ++    F_OWNER_GID = F_OWNER_PGRP	/* Alternative, obsolete name.  */
> ++  };
> ++
> ++/* Structure to use with F_GETOWN_EX and F_SETOWN_EX.  */
> ++struct f_owner_ex
> ++  {
> ++    enum __pid_type type;	/* Owner type of ID.  */
> ++    __pid_t pid;		/* ID of owner.  */
> ++  };
> ++#endif
> ++
> + __END_DECLS
> + 
> + #endif /* fcntl.h  */
> +diff --git a/libc/sysdeps/linux/aarch64/bits/fcntl.h b/libc/sysdeps/linux/aarch64/bits/fcntl.h
> +index c143ba9c9..dbe929351 100644
> +--- a/libc/sysdeps/linux/aarch64/bits/fcntl.h
> ++++ b/libc/sysdeps/linux/aarch64/bits/fcntl.h
> +@@ -94,8 +94,6 @@
> + #ifdef __USE_GNU
> + # define F_SETSIG	10	/* Set number of signal to be sent.  */
> + # define F_GETSIG	11	/* Get number of signal to be sent.  */
> +-# define F_SETOWN_EX	15	/* Get owner (thread receiving SIGIO).  */
> +-# define F_GETOWN_EX	16	/* Set owner (thread receiving SIGIO).  */
> + #endif
> + 
> + 
> +@@ -170,25 +168,6 @@ struct flock64
> +   };
> + #endif
> + 
> +-
> +-#ifdef __USE_GNU
> +-/* Owner types.  */
> +-enum __pid_type
> +-  {
> +-    F_OWNER_TID = 0,		/* Kernel thread.  */
> +-    F_OWNER_PID,		/* Process.  */
> +-    F_OWNER_PGRP,		/* Process group.  */
> +-    F_OWNER_GID = F_OWNER_PGRP	/* Alternative, obsolete name.  */
> +-  };
> +-
> +-/* Structure to use with F_GETOWN_EX and F_SETOWN_EX.  */
> +-struct f_owner_ex
> +-  {
> +-    enum __pid_type type;	/* Owner type of ID.  */
> +-    __pid_t pid;		/* ID of owner.  */
> +-  };
> +-#endif
> +-
> + /* Define some more compatibility macros to be backward compatible with
> +    BSD systems which did not managed to hide these kernel macros.  */
> + #ifdef	__USE_BSD
> +-- 
> +2.30.2
> +
> -- 
> 2.39.2
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
