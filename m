Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CF9C40B1D;
	Sun, 29 May 2022 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPTlAaPj8fnO; Sun, 29 May 2022 21:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67EC4408DB;
	Sun, 29 May 2022 21:02:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A345E1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9129D408DB
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BImw1ONqKnW for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:02:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F4A400FF
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:02:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DA211780316;
 Sun, 29 May 2022 23:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653858143;
 bh=mW5W1AJrI/RgO+L9W6r78CrKBz4Gk5rnxLIOCaKxJBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DU+oMCRP2JYryQdLQrQIMXfZ8tfTi+zQUsIdpmE45rAMac/Hhz8x5xHWtNpOXNQfx
 ShdADYqHbbbK/PvjJ0JGAKwYVAtzTdN+5sQbNs9DrS73hgsIqKAnLeu8nAOeUiHhcZ
 gezYQdauoj5bpJ12HWa/+Jl05xP9ec7nDEEsAUZE8A0Sdfd604Wvsgkh3SndmjoLfT
 HaiDYS5bFxYu24SmE4+FRS433FMBzOSCiHIFmtj4qFU5Pa1fW8rI0YRocJwqqjlsVb
 bKO7RI/U0wcdXCQp0y/btwYqyoRli4GUpDZx0BY7Zgegj+1LTLqLFhtZNita3Dw/SX
 lqavODd7lNlpg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:02:19 +0200
Date: Sun, 29 May 2022 23:02:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220529210219.GG993669@scaer>
References: <20220527122710.1296005-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527122710.1296005-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix uclibc build
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-27 14:27 +0200, Fabrice Fontaine spake thusly:
> Fix the following uclibc build failure:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
> /home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This patch is marked "Superseded" in patchwork, is that expected?

Regards,
Yann E. MORIN.

> ---
>  .../0001-fix-build-without-reallocarray.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/pipewire/0001-fix-build-without-reallocarray.patch
> 
> diff --git a/package/pipewire/0001-fix-build-without-reallocarray.patch b/package/pipewire/0001-fix-build-without-reallocarray.patch
> new file mode 100644
> index 0000000000..ee80dfb3bb
> --- /dev/null
> +++ b/package/pipewire/0001-fix-build-without-reallocarray.patch
> @@ -0,0 +1,46 @@
> +From 0708a39b439cec2871cfe3b705191028397e5b8b Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 27 May 2022 10:57:50 +0200
> +Subject: [PATCH] src/pipewire/utils.h: fix build without reallocarray
> +
> +Fix the following build failure without reallocarray (e.g. on uclibc):
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.351.0.p/introspect.c.o: in function `pw_node_info_merge':
> +/home/buildroot/autobuild/instance-0/output-1/build/pipewire-0.3.51/build/../src/pipewire/introspect.c:216: undefined reference to `reallocarray'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/374582f75713c4116ae23f972c5bc55214879502
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/0708a39b439cec2871cfe3b705191028397e5b8b]
> +---
> + src/pipewire/utils.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/pipewire/utils.h b/src/pipewire/utils.h
> +index 351216eb3..5a0dc6fd2 100644
> +--- a/src/pipewire/utils.h
> ++++ b/src/pipewire/utils.h
> +@@ -29,6 +29,7 @@
> + extern "C" {
> + #endif
> + 
> ++#include <stdlib.h>
> + #include <string.h>
> + #include <sys/un.h>
> + #ifndef _POSIX_C_SOURCE
> +@@ -86,6 +87,10 @@ pw_strip(char *str, const char *whitespace);
> + #endif
> + 
> + ssize_t pw_getrandom(void *buf, size_t buflen, unsigned int flags);
> ++
> ++#if !defined(reallocarray)
> ++# define reallocarray(ptr, nmemb, size)		realloc(ptr, nmemb * size)
> ++#endif
> + /**
> +  * \}
> +  */
> +-- 
> +GitLab
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
