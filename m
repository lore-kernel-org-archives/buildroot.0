Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4481C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 18:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E1B84159E;
	Wed,  2 Feb 2022 18:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjwcDYrz6Oal; Wed,  2 Feb 2022 18:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 651F04095F;
	Wed,  2 Feb 2022 18:25:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20F191BF39C
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0867A4095F
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixjdYpylYzOf for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 18:25:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 080A54093F
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 18:25:18 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s9so248989wrb.6
 for <buildroot@buildroot.org>; Wed, 02 Feb 2022 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=bC9shlei9IGv3q+U1s+4FORKvoHZpl6Qei8xy+5R5/8=;
 b=SozdWwFrOnx+FcAmHtVCVNDEyT9mBkQZeNqN9dNGCHjbWhUeiCjCHhp9xT93KVpE1B
 RXPukuemtCc2R7fZN6FTDgscT3ZaOUnRJfuxA4VzloD9rvT7l6AZu79HyNdRVN6qifm6
 m0Tp56fm97mA6VKw48Hz2hR8h7FPfeyRpaxwqR2UHX/MEJN1eEYJNt/7FHNih7zz+WyJ
 CynhdcrxiYnPZq70Sw2A5qL3l1VMsGNYDV6tBdOymGVASEuUuwy68q/9sHm9+EkhtsqO
 ukaFoaJ376eBmqIRX9N3NOh7bjmCq7k9yiKOm8hJlAnrKEl0JhzVUy491hsKksr7Dkb2
 dllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=bC9shlei9IGv3q+U1s+4FORKvoHZpl6Qei8xy+5R5/8=;
 b=JumeaCNfypJct9NXDhbhsmoyQhGhsHlG9qQ5xIcb5nz1ObrDWvfCLvQFXBbtqqpC2k
 LD6nBNa/NQ895whf0IZgSgccwXR52A/q5knc/7Z1I6FvEVsRp9+3b2fvhubjtA24ZZYT
 emwbua0Q1ZebQ6JgmdwRZDdbqel0euyhk+K9BKjBEGkCcPmAbwpOxsI7lUeN705ydwI6
 /K2KfgyWZB1zmnFj9w9NGnQYGlootL1fOFzta5hUjiznqFxGfway19Mf05fo+7unoU0P
 gZiX26dnRajPExgH0Ku4KwDngvs5bzOoS7zezVEY7BzgATW2k/OD+DzbXRI+2Q5br0Nn
 Ub3g==
X-Gm-Message-State: AOAM532ua29Ht+0NxEwpHmJZVvKXPmLA4PNQACYNkPPICeBgvxgZ2VPm
 4XbBr0SC7TK0gJqR5ttMOYclCEpVHN8GXgrB
X-Google-Smtp-Source: ABdhPJw2+fLt4Eszvyp1I2EmQT3mMa39DpkcKLVX02qB0juhD1JwsOlIu9lX40zUsyOmkRuLsGKsIA==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr26034408wro.519.1643826316890; 
 Wed, 02 Feb 2022 10:25:16 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id m187sm5285092wme.25.2022.02.02.10.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 10:25:16 -0800 (PST)
Date: Wed, 2 Feb 2022 19:25:13 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YfrMibbfBeN85noC@pevik>
References: <20220126235652.25712-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126235652.25712-1-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20220121
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

gentle ping for a review.

Kind regards,
Petr

> LTP now builds metadata directory as host target.
> It's mandatory, therefore adding HOST_CFLAGS and HOST_LDFLAGS to make
> (adding to configure does not work) to avoid adding -mlongcalls
> -mauto-litpools for some targets (e.g. bootlin-xtensa-uclibc).

> Drop patches from this release.

> Refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
> (still safe to carry it).

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Add missin g HOST_LDFLAGS to fix br-arm-full-static (cannot find -lc
> when compiling host target)

> Kind regards,
> Petr

>  ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 45 ++++++--------
>  .../0002-lib-fix-MemAvailable-parsing.patch   | 36 -----------
>  ...-lapi-rtnetlink.h-Fix-include-guards.patch | 37 ------------
>  ...f_addr.h-and-reuse-it-in-rtnetlink.h.patch | 58 ------------------
>  ...0005-lapi-if_addr.h-Define-IFA_FLAGS.patch | 60 -------------------
>  package/ltp-testsuite/ltp-testsuite.hash      |  6 +-
>  package/ltp-testsuite/ltp-testsuite.mk        |  6 +-
>  7 files changed, 25 insertions(+), 223 deletions(-)
>  delete mode 100644 package/ltp-testsuite/0002-lib-fix-MemAvailable-parsing.patch
>  delete mode 100644 package/ltp-testsuite/0003-lapi-rtnetlink.h-Fix-include-guards.patch
>  delete mode 100644 package/ltp-testsuite/0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
>  delete mode 100644 package/ltp-testsuite/0005-lapi-if_addr.h-Define-IFA_FLAGS.patch

> diff --git a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
> index a167d938e1..2ceba64ed5 100644
> --- a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
> +++ b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
> @@ -1,4 +1,4 @@
> -From bee452dfa2a34ba7df7db677e5673cbdcd23f61e Mon Sep 17 00:00:00 2001
> +From f34c6ca3d543968e900d6327d8b5900db63f08ad Mon Sep 17 00:00:00 2001
>  From: Petr Vorel <petr.vorel@gmail.com>
>  Date: Thu, 1 Oct 2020 23:28:39 +0200
>  Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
> @@ -56,7 +56,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

>  diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
>  new file mode 100644
> -index 000000000..d0e0e93d7
> +index 0000000000..d0e0e93d7f
>  --- /dev/null
>  +++ b/include/lapi/sysinfo.h
>  @@ -0,0 +1,22 @@
> @@ -83,7 +83,7 @@ index 000000000..d0e0e93d7
>  +
>  +#endif /* SYSINFO_H__ */
>  diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> -index d99441c86..0d26e9d45 100644
> +index d99441c86f..0d26e9d455 100644
>  --- a/include/tst_safe_macros.h
>  +++ b/include/tst_safe_macros.h
>  @@ -12,7 +12,7 @@
> @@ -96,44 +96,33 @@ index d99441c86..0d26e9d45 100644
>   #include <libgen.h>
>   #include <signal.h>
>  diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> -index a5b6bc504..20d01d304 100644
> +index a5b6bc5047..87d922a928 100644
>  --- a/lib/safe_macros.c
>  +++ b/lib/safe_macros.c
> -@@ -11,7 +11,6 @@
> +@@ -11,7 +11,7 @@
>   #include <sys/wait.h>
>   #include <sys/mount.h>
>   #include <sys/xattr.h>
>  -#include <sys/sysinfo.h>
> ++#include "lapi/sysinfo.h"
>   #include <errno.h>
>   #include <fcntl.h>
>   #include <libgen.h>
> -@@ -23,6 +22,7 @@
> - #include <malloc.h>
> - #include "test.h"
> - #include "safe_macros.h"
> -+#include "lapi/sysinfo.h"
> - 
> - char *safe_basename(const char *file, const int lineno,
> - 		    void (*cleanup_fn) (void), char *path)
>  diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
> -index 69077861f..ae1cad29b 100644
> +index 4a49747613..000688f5a3 100644
>  --- a/lib/tst_memutils.c
>  +++ b/lib/tst_memutils.c
> -@@ -5,11 +5,11 @@
> - 
> +@@ -6,7 +6,7 @@
> + #include <stdio.h>
>   #include <unistd.h>
>   #include <limits.h>
>  -#include <sys/sysinfo.h>
> ++#include "lapi/sysinfo.h"
>   #include <stdlib.h>

>   #define TST_NO_DEFAULT_MAIN
> - #include "tst_test.h"
> -+#include "lapi/sysinfo.h"
> - 
> - #define BLOCKSIZE (16 * 1024 * 1024)
> - 
>  diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
> -index 9676ea4b5..33b2ac822 100644
> +index 20cb95191d..3462dc3f82 100644
>  --- a/testcases/kernel/mem/mtest01/mtest01.c
>  +++ b/testcases/kernel/mem/mtest01/mtest01.c
>  @@ -20,7 +20,6 @@
> @@ -153,7 +142,7 @@ index 9676ea4b5..33b2ac822 100644

>   #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
>  diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
> -index 263b8e78b..4fa52e6ea 100644
> +index 263b8e78bf..4fa52e6eae 100644
>  --- a/testcases/kernel/syscalls/madvise/madvise06.c
>  +++ b/testcases/kernel/syscalls/madvise/madvise06.c
>  @@ -46,7 +46,7 @@
> @@ -166,7 +155,7 @@ index 263b8e78b..4fa52e6ea 100644
>   #include "tst_cgroup.h"

>  diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
> -index 2ea44a2be..a237345ef 100644
> +index 2ea44a2beb..a237345ef7 100644
>  --- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
>  +++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
>  @@ -69,7 +69,7 @@
> @@ -179,7 +168,7 @@ index 2ea44a2be..a237345ef 100644
>   #include "test.h"

>  diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
> -index 7ad0e8bdc..61fa1ab75 100644
> +index 7ad0e8bdcf..61fa1ab757 100644
>  --- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
>  +++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
>  @@ -65,7 +65,7 @@
> @@ -192,7 +181,7 @@ index 7ad0e8bdc..61fa1ab75 100644

>   #include "test.h"
>  diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> -index af7cb6421..dc5ae65e3 100644
> +index af7cb6421e..dc5ae65e35 100644
>  --- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
>  +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
>  @@ -13,7 +13,7 @@
> @@ -205,7 +194,7 @@ index af7cb6421..dc5ae65e3 100644
>   #include "lapi/posix_clocks.h"
>   #include "tst_test.h"
>  diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
> -index 22e7c3638..572701f9f 100644
> +index 22e7c36386..572701f9fd 100644
>  --- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
>  +++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
>  @@ -43,7 +43,7 @@
> @@ -218,5 +207,5 @@ index 22e7c3638..572701f9f 100644

>   #include "../testfrmw/testfrmw.h"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
