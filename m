Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83BAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 23:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611D7612A6;
	Tue, 24 May 2022 23:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQPji1o5yDhE; Tue, 24 May 2022 23:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6432561294;
	Tue, 24 May 2022 23:08:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 068D71BF5A7
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 23:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 022EC83216
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 23:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPjZJmPWf_Ng for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 23:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B575782A26
 for <buildroot@buildroot.org>; Tue, 24 May 2022 23:08:48 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso958162fac.10
 for <buildroot@buildroot.org>; Tue, 24 May 2022 16:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lkOM2Yte8o2lVOB34QXpJZoougEOJxYIs1LidDvBso4=;
 b=qnTdxY00WyiruEb2WTLWEun85sUzt6UwgT54G9LLW0fhPbjp9PHObsKklHPqQQ4b/8
 dbvgm9Zbb7qrOl9g8m0+VdWpQ1XxfFbR89wkUWDVSgk2MLWY0rW+nP3kDAyvehAaKZIC
 SLyuCGkiC8ZCvcp+r35hgXXD70UmzPrP1CG8zg3TwyAEVKmY7xZy7JdviRq51oacvrCK
 qORBZSbSyTADXQ0X0vro0dosgFWYGq9SG/hyOs5O+M+AoJYenTQVZYQfBikUdNHjtMFy
 8Y2G6n1BlUf6qD5Z+I4jToO1Bowpx8bT/D4Ue6Zfamh47W7/FqBi7Ty1pGgoawVDlpOe
 HHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lkOM2Yte8o2lVOB34QXpJZoougEOJxYIs1LidDvBso4=;
 b=YDzAEw56Dfve1Rp+dAZH3DCxGLqQ+UzQ09y6E2kz2KsYkJHhtOMco0lXiC5emczffb
 SJJrR3lSk3rzHTp1vDHOAMqqbR7c3vMEDjFB84sZ/iE6bfG6bcz6z5ILjnFTFTNgZidm
 kpdOtLe79Uqw6YoXOzf2uvNKi5HVJeESzmhmsI8/jmY4u20LQGjWR8UAR7icdnXTD575
 hje2WUw37pceNVNF+6DqEpr4/b+m4zXPsK0KpxdmqfOzVT3Sb05A7esHaRZCW4qGiQ8X
 zcbobSqjouigjNSWAUsnb1WQjCpsnT88rIVkW56vWYiLGpF1ToXFd0HzKudOZwk5VcHO
 qIDg==
X-Gm-Message-State: AOAM531OqGfFwhFSBHkzmmnNGlR7+9MluGvGRL8+AUIQV/zL6M3R98tl
 vDqwk6CM+dquKsIFy93bPd+KUYI7SJmhJcuDP9w=
X-Google-Smtp-Source: ABdhPJwNjzZ+jxh7Dplxh52Ngto8+5af5VKKtWJyeovHRes68NRt5tTCsOBhb1FmBB9nJ9NavTvPerjiS4bnWvXHwlI=
X-Received: by 2002:a05:6870:fb8e:b0:f1:8e9b:f3d9 with SMTP id
 kv14-20020a056870fb8e00b000f18e9bf3d9mr4048536oab.99.1653433727601; Tue, 24
 May 2022 16:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220524220734.93556-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220524220734.93556-1-giulio.benetti@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 May 2022 17:08:36 -0600
Message-ID: <CADvTj4qPzY2jxhAXL611OrREfb1=7vLwYGLRDn1Y8Q6DAEv_3w@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 24, 2022 at 4:07 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
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
Tested-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Patch is pending upstream:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1771036
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
>                 SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
>                 DIST=$(@D)/$(LIBNSS_DISTDIR) \
>                 CHECKLOC= \
> -               $(LIBNSS_BUILD_VARS) NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX"
> +               $(LIBNSS_BUILD_VARS) \
> +               NATIVE_FLAGS="$(HOST_CFLAGS) -DLINUX" \
> +               NATIVE_LDFLAGS="$(HOST_LDFLAGS)"
>  endef
>
>  define LIBNSS_INSTALL_STAGING_CMDS
> --
> 2.34.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
