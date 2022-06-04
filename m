Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B45C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 08:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FC341CB7;
	Sat,  4 Jun 2022 08:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hqxvqe4Dkrt6; Sat,  4 Jun 2022 08:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32B241CA8;
	Sat,  4 Jun 2022 08:00:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40A1C1BF429
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE009600BB
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 08:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65jTkv9uZrwg for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 08:00:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6150E60F0D
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 08:00:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D364C5FFAD;
 Sat,  4 Jun 2022 10:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654329636;
 bh=Sl+6Ku5PnbOmoWY3ZBi4bDJySR/XyT+SClc7PFAr7lI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDtqkrWMhafERENEZZaI+wEarlQnjdrFrlDfVD4CAa55OCgaQTTfEkTvtnfMk7U7B
 bOrpyXth6kmEZuzfwzCA5PUi5EgXcyHdz9s+dvNI+uTQgZFsQjYfT+fH+GQTODXHbL
 g4N+OS3lXnZTJCNDu4smQeKI37s1tVWjNAmZAIxeGj7hXzYVWaIqkN0ia01OaI/dVV
 k9rqDmCNJFoSf/TNgskECRNSLVJYmaLSAciFvFm1b5iUTcJs1Uudi+lfcJkE7/x7aQ
 hf/YV0wZ5VM+2njjc92k43YXWpec5CVQnx2Uzb7IwkAvNvC7EpuJF1txU1H2sJ/UaI
 ZzFOEIeX1aXqQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 10:00:33 +0200
Date: Sat, 4 Jun 2022 10:00:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220604080033.GB427639@scaer>
References: <20220603171253.314118-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603171253.314118-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: fix uclibc build on
 aarch64
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

On 2022-06-03 19:12 +0200, Fabrice Fontaine spake thusly:
> Fix the following uclibc build failure on aarch64:
> 
> crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
>   277 | #include <sys/auxv.h>
>       |          ^~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../memcached/0002-check-for-sys-auxv.h.patch | 50 +++++++++++++++++++
>  package/memcached/memcached.mk                |  2 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 package/memcached/0002-check-for-sys-auxv.h.patch
> 
> diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
> new file mode 100644
> index 0000000000..49b12ef7d7
> --- /dev/null
> +++ b/package/memcached/0002-check-for-sys-auxv.h.patch
> @@ -0,0 +1,50 @@
> +From 58b6de2135c10b64918f25c48f69f144d08a9c0d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 3 Jun 2022 19:10:15 +0200
> +Subject: [PATCH 2/2] check for sys/auxv.h
> +
> +Check for sys/auxv.h to avoid the following uclibc build failure on
> +aarch64:
> +
> +crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
> +  277 | #include <sys/auxv.h>
> +      |          ^~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + configure.ac | 1 +
> + crc32c.c     | 2 +-
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0985f07..3337fe7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -516,6 +516,7 @@ AH_BOTTOM([#ifdef HAVE_INTTYPES_H
> + #include <inttypes.h>
> + #endif
> + ])
> ++AC_CHECK_HEADERS([sys/auxv.h])
> + 
> + dnl **********************************************************************
> + dnl Figure out if this system has the stupid sasl_callback_ft
> +diff --git a/crc32c.c b/crc32c.c
> +index 26df879..05e61ff 100644
> +--- a/crc32c.c
> ++++ b/crc32c.c
> +@@ -273,7 +273,7 @@ void crc32c_init(void) {
> +     }
> + }
> + 
> +-#elif defined(__aarch64__) && defined(__linux__)
> ++#elif defined(__aarch64__) && defined(__linux__) && defined(HAVE_SYS_AUX_H)
> + #include <sys/auxv.h>
> + 
> + #if defined(HWCAP_CRC32)
> +-- 
> +2.35.1
> +
> diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
> index 8f3506f9d4..842c0b42fa 100644
> --- a/package/memcached/memcached.mk
> +++ b/package/memcached/memcached.mk
> @@ -13,6 +13,8 @@ MEMCACHED_LICENSE = BSD-3-Clause
>  MEMCACHED_LICENSE_FILES = COPYING
>  MEMCACHED_CPE_ID_VENDOR = memcached
>  MEMCACHED_SELINUX_MODULES = memcached
> +# We're patching configure.ac
> +MEMCACHED_AUTORECONF = YES
>  
>  ifeq ($(BR2_ENDIAN),"BIG")
>  MEMCACHED_CONF_ENV += ac_cv_c_endian=big
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
