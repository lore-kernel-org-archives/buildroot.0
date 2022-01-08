Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F199F60A73;
	Sat,  8 Jan 2022 15:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ux9YXBd7Fn6; Sat,  8 Jan 2022 15:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E9360810;
	Sat,  8 Jan 2022 15:42:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0E9E1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 892ED60810
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:42:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWLKlGS8P74a for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:42:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09DFC607A3
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:42:37 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso14053998pjm.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DvDkd11FjLbodC6+sII3gvp48Qp33o8YckO4YwmHRE4=;
 b=zm6UkoERu9yDP72ugvkpt+/8JG0d1GCb8zD8R5aIBr0G60u7RWDiw0i1Ssio3zzGGP
 78M06Sqflh5eV3qaL19yW4sO/oklNkoUyr0l8oLu/Fc7txnaQPPq4mmt51fbRa8bxvYS
 Si5k6i82IsqfXgLNd51OYmQTJoPXeH/GLW+YqMUrfJymedPgidhs4KtP4dXlSx30Obrf
 6YmS+ocotTXrlo82Nf7+57OuJizcbkfMo1n9Bta7ydSssEr2O2SnecDrUMKhY2NeMdX+
 +KEl/3prtWgLL4wuYLzAMafNP3x7M9BRXlX9Lun5/EBTAqH0blnbju6vgs9k6wvaqXzV
 t88Q==
X-Gm-Message-State: AOAM531KTcKSyqiMezTkr3D9ANQpWIJL+qD6yK+Z2eK6iVjanwAmG15j
 zoQe1to8WJ13baR4UQ3BjrkVDS8E7uXaLW9tAEw=
X-Google-Smtp-Source: ABdhPJzUu4l0uD1Uv3s96Yd9j162SDbFqD0QRj8nMP7LbEXBImZiPjKBxzomchVvsn8uXTYsr+6CnY9VKp4qO+NcSUE=
X-Received: by 2002:a17:90b:4c49:: with SMTP id
 np9mr21219756pjb.138.1641656557392; 
 Sat, 08 Jan 2022 07:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20200926200021.28930-1-egorenar-dev@posteo.net>
In-Reply-To: <20200926200021.28930-1-egorenar-dev@posteo.net>
From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Jan 2022 16:42:25 +0100
Message-ID: <CACXmViaj9Q6wkAPt1LZybPYPsZMws+T3UuycEea9GcoX2_5c5A@mail.gmail.com>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/crash: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Sorry for the slow response.

On Sat, Sep 26, 2020 at 10:00 PM Alexander Egorenkov
<egorenar-dev@posteo.net> wrote:

> diff --git a/package/crash/0001-Support-cross-compilation.patch b/package/crash/0001-Support-cross-compilation.patch
> new file mode 100644
> index 0000000000..7e1bd3f861
> --- /dev/null
> +++ b/package/crash/0001-Support-cross-compilation.patch
> @@ -0,0 +1,134 @@
> +From 44cb56ad5bbd78203fb6f346299ccfe45f2568fe Mon Sep 17 00:00:00 2001
> +From: Alexander Egorenkov <egorenar-dev@posteo.net>
> +Date: Sat, 26 Sep 2020 14:29:49 +0200
> +Subject: [PATCH 1/1] Support cross-compilation
> +
> +- Introduce CONF_CC variable to compile configure.c
> +- Introduce CONF_HOST_ARCH to configure.c to enable overriding target
> +  at compile time
> +
> +Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

I noticed that this patch is not yet upstream / I don't see a PR for
it. Are you still interested in this package?

The patch could be quite a bit smaller if you didn't move the !
CONF_HOST_ARCH lines, but otherwise it looks fine to me.


> +++ b/package/crash/Config.in
> +config BR2_PACKAGE_CRASH
> +       bool "crash"
> +       depends on BR2_PACKAGE_CRASH_ARCH_SUPPORTS
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_STATIC_LIBS # dlopen
> +       depends on BR2_USE_WCHAR
> +       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       select BR2_PACKAGE_LESS

The dependency on less looks odd. Presumably you mean this as a
runtime dependency which we normally mark with a # runtime comment and
then don't add to _DEPENDENCIES, but looking at the code it seems to
work without less as well or with the busybox less applet?

> +++ b/package/crash/crash.mk
> @@ -0,0 +1,50 @@
> +################################################################################
> +#
> +# crash
> +#
> +################################################################################
> +
> +CRASH_VERSION = 7.2.8
> +CRASH_SITE = $(call github,crash-utility,crash,$(CRASH_VERSION))
> +CRASH_DEPENDENCIES = host-bison less ncurses zlib
> +CRASH_LICENSE = GPL-3.0

Most of the code seems to come from the kernel and is marked as GPL-2.0+.

> +CRASH_LICENSE_FILES = COPYING3
> +
> +CRASH_GDB_CONF_FLAGS = \
> +       --host=$(GNU_TARGET_NAME)

That looked odd to me. It apparently downloads a GDB tarball during
the build step, patches and builds that, completely sidestepping the
download / mirror logic of Buildroot (and our existing gdb patches),
so that is not good. What is this needed for exactly? Can it instead
use our existing gdb package?

> +ifeq ($(BR2_i386),y)
> +CRASH_TARGET = X86
> +else ifeq ($(BR2_x86_64),y)
> +CRASH_TARGET = X86_64
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +CRASH_TARGET = ARM
> +else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> +CRASH_TARGET = ARM64
> +else ifeq ($(BR2_powerpc),y)
> +CRASH_TARGET = PPC
> +else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> +CRASH_TARGET = PPC64
> +else ifeq ($(BR2_s390x),y)
> +CRASH_TARGET = S390X
> +else ifeq ($(BR2_sparc64),y)
> +CRASH_TARGET = SPARC64
> +endif

NIT: such conditional logic is a bit clearer / shorter in Config.in
instead of in the .mk.

What is the use case for this exactly? You are building it for the
target, but wouldn't this make more sense as a host utility?

The gdb download is a show stopper, so I have marked this as changes requested.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
