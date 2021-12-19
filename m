Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE7DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 15:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA6060B61;
	Sun, 19 Dec 2021 15:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQSz3BzOLMzj; Sun, 19 Dec 2021 15:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CA960B5F;
	Sun, 19 Dec 2021 15:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFEC31BF475
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 15:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C8E240368
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 15:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuRhjxalRPDL for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 15:38:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9DE040364
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 15:38:19 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 31DD3440406;
 Sun, 19 Dec 2021 17:38:11 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1639928291;
 bh=LLEmtUzz9BwWFJ40ExBm1xhRP/PPJ6DFGKBTDV77oOI=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=arBOmmprGMvhhlcHEHI9k0t+xrobNbzXssg0JQSyRSjy+OJU0UQRmgEcbPBNwYZPv
 8pOQ2tprvTC0ZtirZ3r49jhWYXDfGmNYCIbbJhfTMnRlurXWAC/3l5ZN1ukw8n/O/V
 1/f9WyD8od0hma9gSOs/lqWFPcaSjhix//G1kD4yNkt8cJZCUT7idLhTcaIr2Dbapk
 EZLNdr56TTPQ9zlwkL0EFdYRDdkwclx98/HI+FdRHP/1woQCmU1g2Bxnn7H9J8OIOE
 irwdMUHU8J5wLxoFZJLVIkqsvdidQWcE1PFm15q4+LwNvMHhayEODBBWlMuq2/Z5Ye
 ekQR1eYZoYOnw==
References: <20211219153207.1084655-1-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Dec 2021 17:36:48 +0200
In-reply-to: <20211219153207.1084655-1-fontaine.fabrice@gmail.com>
Message-ID: <87h7b4ehaw.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jitterentropy-library: fix
 build without stack-protector
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Sun, Dec 19 2021, Fabrice Fontaine wrote:
> Fix the following build failure without stack-protector raised since
> bump to version 3.3.1 in commit 3965f09cb427af411055a783cd14b501b2b28285
> and
> https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
>
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
> jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/8de/8dee462d16d934dd173d58f17933c6911e4336bf/build-end.log
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Makefile-add-ENABLE_STACK_PROTECTOR.patch | 52 +++++++++++++++++++
>  .../jitterentropy-library.mk                  |  2 +-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
>
> diff --git a/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
> new file mode 100644
> index 0000000000..c4388663b0
> --- /dev/null
> +++ b/package/jitterentropy-library/0001-Makefile-add-ENABLE_STACK_PROTECTOR.patch
> @@ -0,0 +1,52 @@
> +From 272ee47892563e849f6b1bf59b0173f8aa33b631 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 19 Dec 2021 11:36:13 +0100
> +Subject: [PATCH] Makefile: add ENABLE_STACK_PROTECTOR
> +
> +Add ENABLE_STACK_PROTECTOR as build on embedded toolchains without
> +stack-protector is again broken since
> +https://github.com/smuellerDD/jitterentropy-library/commit/5b3cb7f35e41ba2f34a75d004cf095c965a1a0c4:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: src/jitterentropy-base.o: in function `jent_fips_enabled':
> +jitterentropy-base.c:(.text+0x131): undefined reference to `__stack_chk_fail_local'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/8dee462d16d934dd173d58f17933c6911e4336bf
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Signed-off-by: Stephan Mueller <smueller@chronox.de>
> +[Retrieved from:
> +https://github.com/smuellerDD/jitterentropy-library/commit/272ee47892563e849f6b1bf59b0173f8aa33b631]
> +---
> + Makefile | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index dfb96a8..c999ef5 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,6 +2,7 @@
> + 
> + CC ?= gcc
> + #Hardening
> ++ENABLE_STACK_PROTECTOR ?= 1
> + CFLAGS ?= -fwrapv --param ssp-buffer-size=4 -fvisibility=hidden -fPIE -Wcast-align -Wmissing-field-initializers -Wshadow -Wswitch-enum
> + CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv -Wconversion
> + LDFLAGS +=-Wl,-z,relro,-z,now -lpthread
> +@@ -13,10 +14,12 @@ else
> +   GCC_GTEQ_490 := $(shell expr `$(CC) -dumpfullversion | sed -e 's/\.\([0-9][0-9]\)/\1/g' -e 's/\.\([0-9]\)/0\1/g' -e 's/^[0-9]\{3,4\}$$/&00/'` \>= 40900)
> + endif
> + 
> +-ifeq "$(GCC_GTEQ_490)" "1"
> +-  CFLAGS += -fstack-protector-strong
> +-else
> +-  CFLAGS += -fstack-protector-all
> ++ifeq "$(ENABLE_STACK_PROTECTOR)" "1"
> ++  ifeq "$(GCC_GTEQ_490)" "1"
> ++    CFLAGS += -fstack-protector-strong
> ++  else
> ++    CFLAGS += -fstack-protector-all
> ++  endif
> + endif
> + 
> + # Change as necessary
> diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
> index 830da0e065..4cdebf46a3 100644
> --- a/package/jitterentropy-library/jitterentropy-library.mk
> +++ b/package/jitterentropy-library/jitterentropy-library.mk
> @@ -26,7 +26,7 @@ endif
>  
>  define JITTERENTROPY_LIBRARY_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> -		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
> +		ENABLE_STACK_PROTECTOR=0 $(JITTERENTROPY_LIBRARY_BUILD_TARGETS)

Why disable stack protector unconditionally instead of making it depend
on BR2_TOOLCHAIN_HAS_SSP?

baruch

>  endef
>  
>  define JITTERENTROPY_LIBRARY_INSTALL_STAGING_CMDS


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
