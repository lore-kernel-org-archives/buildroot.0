Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C45DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F029B610D1;
	Sat, 28 May 2022 20:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KuDvqpEcFuQ2; Sat, 28 May 2022 20:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF63A600C4;
	Sat, 28 May 2022 20:06:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A71D21BF3C1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 916E7610CB
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 20:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Q8wNHjF9kDQ for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 20:06:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D50F60EBA
 for <buildroot@buildroot.org>; Sat, 28 May 2022 20:06:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 796DD19F4B5;
 Sat, 28 May 2022 22:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653768391;
 bh=T1riV47c6x8pXt8D/QE8+wuEpAuGNQGt2+m0O94HsHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhQW8/AKw6DoNfROvfWrvsfCsxHE536/YdUmkddX59+xWLqe7s9PkwyvLEc2IJoeJ
 AgIDIjczo1pUoRoDebvX/Q/Lm/7AJEZ/7ub5cAHwo8S3Ulg2sbjGdgwkUObXBlvdKi
 CdXujpatUkRyqIQDbuoPHUai36CgdxHY4tiE+Y4HZFCo9L1X5+V1nkQJHLB9yptpds
 0IZdyAaSAyzxr3+o4AmPMbGwod1PeFwhWHb7a34PkyyOr3efF4F1BLpWi8ir2uJ46l
 MNMT5v3yNXVNdITzj0artxXjmGgHdQsQlnl55d3uaVGs5el26QB1bEvTvVX/wqm2b1
 WH0m0hVg+Skaw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 22:06:27 +0200
Date: Sat, 28 May 2022 22:06:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220528200627.GH301044@scaer>
References: <20220524220734.93556-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524220734.93556-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure on
 Aarch64 host for powerpc64 target
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-05-25 00:07 +0200, Giulio Benetti spake thusly:
> When building on Aarch64 host for powerpc64 we get this error:
> gcc: error: unrecognized command-line option '-m64'
> 
> This happens because we don't have the flexibility to override the LDFLAGS
> when linking nsinstall host tool that is built in libnss. Also libnss uses
> the same LDFLAGS it uses for target and that is not correct.
> So let's add a patch to add NATIVE_LDFLAGS variable to override LFDFLAGS
> when building nsinstall utility and set it to HOST_LDFLAGS in libnss.mk
> 
> Fixes:
> http://autobuild.buildroot.net/results/67500395f19aa698b98404cde8d20463e55504bf/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> Patch is pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1771036

We need that information in the patch itself, so that we handily have it
where we need it when we bump the version and can check whether the
patch still makes sense or not.

Applied to master, thanks.

(And upstream seemed to be happy with the patch, even if it has not yet
been applied.)

Regards,
Yann E. MORIN.

> ---
>  ...36-Fix-build-failure-on-Aarch64-host.patch | 36 +++++++++++++++++++
>  package/libnss/libnss.mk                      |  4 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
> 
> diff --git a/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
> new file mode 100644
> index 0000000000..2ca373cd21
> --- /dev/null
> +++ b/package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch
> @@ -0,0 +1,36 @@
> +From 9d5900c1ee9000906a90923e861b0fd7f1061cde Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Tue, 24 May 2022 23:40:45 +0200
> +Subject: [PATCH] Bug 1771036 - Fix build failure on Aarch64 host
> +
> +If trying to build on Aarch64 host for powerpc64 target we can't override
> +the LDFLAGS leading to this build failure:
> +gcc: error: unrecognized command-line option '-m64'
> +
> +So let's add NATIVE_LDFLAGS check and use it to link nsinstall. This way
> +any build environment can pass LDFLAGS that fits better for host
> +architecture.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + coreconf/nsinstall/Makefile | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
> +index 08dfbc2fe..5061789ff 100644
> +--- a/nss/coreconf/nsinstall/Makefile
> ++++ b/nss/coreconf/nsinstall/Makefile
> +@@ -34,6 +34,10 @@ ifdef NATIVE_FLAGS
> + OS_CFLAGS=$(NATIVE_FLAGS)
> + endif
> + 
> ++ifdef NATIVE_LDFLAGS
> ++LDFLAGS=$(NATIVE_LDFLAGS)
> ++endif
> ++
> + include $(DEPTH)/coreconf/rules.mk
> + 
> + # Redefine MAKE_OBJDIR for just this directory
> +-- 
> +2.34.1
> +
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 540092dfcf..0d0f1d84b9 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -92,7 +92,9 @@ define LIBNSS_BUILD_CMDS
>  		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>  		DIST=$(@D)/$(LIBNSS_DISTDIR) \
>  		CHECKLOC= \
> -		$(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX"
> +		$(LIBNSS_BUILD_VARS) \
> +		NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX" \
> +		NATIVE_LDFLAGS="$(HOST_LDFLAGS)"
>  endef
>  
>  define LIBNSS_INSTALL_STAGING_CMDS
> -- 
> 2.34.1
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
