Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FFDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 01:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9430D403AC;
	Sun, 13 Feb 2022 01:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0QsiBWJGkod; Sun, 13 Feb 2022 01:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B7724034D;
	Sun, 13 Feb 2022 01:21:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 033381BF5A0
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 01:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F254660AFA
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 01:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3dTUVaMcK6bt for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 01:21:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2EC960AD8
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 01:21:03 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id u3so13751464oiv.12
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S7a3CSmq9CZ1SpV+4RQ5EvMB6pDVufumNE+CLEQDY6Q=;
 b=S8VXRnlJmoj5ZzBKUAWrOJlKxMzE1qFpcuQyxMexNdmzuyWsxkY7hLkDaM9GfGT1qg
 c4r2ZECy2ctnAzRsakt8GL9KE9CJN9H3XYuUm3m15b0L+6FPTSzFAMDuHAxCWfF6i7ME
 9S8MpQrZ3xNjl97YicMIjHa3f1fwQwtkFakgAjmxNKP9sUSS8kHaO3W9RpsxRMkKDTha
 A3XSMAh1trMGMV3Cep1FkkRuQohYldDrLJxPh+BCntQCfE6qRo2G2dAYv8TTqiQWtqAX
 kuUQ9F+o+HRDOo4XtlDGylQh7P9La15PXvLV6THKAIZ9aw5lNJOxKEBKyeSTGbYtFNUH
 +VUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7a3CSmq9CZ1SpV+4RQ5EvMB6pDVufumNE+CLEQDY6Q=;
 b=RDEiXjK5+Mt8lqiC7fcC52oXCyhZfb0Uf6IvgXKesA9cO35vL2DXahSlALy6k/L6cW
 mKH25F3nN7+iPAKIYa5EGXEh5WRWH3XDtLwACi9/kPXo/OVW8A8BFDQqwEQTyWdz3bSo
 gpJ7RR2dNk71Quf+Yl5wUEcOMVOHU69WS40erQwyxI1VeE8e9gm7mpbRys0vIavuA/ML
 91wyeOAdv+wvzzBUt5RdK9+5Y5WHC6qpKqb4DblKpTPffO5OeA+mx1JNffIVecfIuB9V
 NiSXyQVazwNnHXG3meg2hzDPYVCZWq27i+Px5skpHmxHOoc1hcemLADWj32hpm+akQnE
 hyDg==
X-Gm-Message-State: AOAM531b9PFKXYUiAdbzZ0IsLKaSWitmt31pL5EfbMwchvUQ4Ir95YmG
 SCo5o6+VKp+1wMIip0pXzalklY0AEiPOuxnWk0K/WtPxkIQcZQ==
X-Google-Smtp-Source: ABdhPJx6V7+JJnAasObGzPx6xbw70R9GLe2pOTkTP13PXPhF7vZYgzsiN772+2jw2zNAZz2+UDWZnDKRoyDbUWGX2TM=
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr3209861oie.103.1644715262066; 
 Sat, 12 Feb 2022 17:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20220131185154.26343-1-james.hilliard1@gmail.com>
 <08b9ef7c-8ce6-3216-3f56-5c64af2f4a66@mind.be>
In-Reply-To: <08b9ef7c-8ce6-3216-3f56-5c64af2f4a66@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Feb 2022 18:20:51 -0700
Message-ID: <CADvTj4pdZyWw1eYyw8vWUN4sV2F=SG2+c91Y86sLhHHxaEG_sg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Feb 12, 2022 at 6:25 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 31/01/2022 19:51, James Hilliard wrote:
> > Move the target bpftool build out of linux-tools so that it is
> > up to date.
> >
> > This also fixes build issues due to differences between kernel
> > versions. The latest version should be fully backwards compatible.
>
>   I don't understand this: linux-tools is part of the kernel build itself, so
> there shouldn't be any differences between kernel versions... Anyway, you
> probably experienced it so I kept the comment.

I mean that older kernels provide outdated versions of bpftool which may
cause issues especially for host-bpftool as stuff like systemd bpf-framework
has minimum version requirements there for build side.

>
> >
> > The host bpftool is needed for enabling features such as the systemd
> > bpf-framework(to be added in a future patch).
>
>   Normally we only accept host packages if there's a (target) package that
> actually depends on it. Knowing you however we're not going to have to wait long
> for this systemd bpf framework, so I kept the host package.

Yeah, I think I'll have that working once we bump clang/llvm, min
version is 10.0.0 and
we're still on 9.0.1:
https://patchwork.ozlabs.org/project/buildroot/list/?series=233431&submitter=&state=*&q=&archive=both&delegate=

>
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v3 -> v4:
> >    - remove linux-tools bpftool kconfig entry
>
>   Ideally this should have been done in a separate patch, but OK.
>
> > Changes v2 -> v3:
> >    - fix target install
> > Changes v1 -> v2:
> >    - move target bpftool out of linux-tools into stand-alone build
> > ---
> >   Config.in.legacy                             |  8 ++++
> >   DEVELOPERS                                   |  1 +
> >   package/Config.in                            |  1 +
> >   package/bpftool/Config.in                    | 18 ++++++++
> >   package/bpftool/bpftool.hash                 |  5 +++
> >   package/bpftool/bpftool.mk                   | 45 ++++++++++++++++++++
> >   package/linux-tools/Config.in                | 22 ----------
> >   package/linux-tools/linux-tool-bpftool.mk.in | 37 ----------------
> >   8 files changed, 78 insertions(+), 59 deletions(-)
> >   create mode 100644 package/bpftool/Config.in
> >   create mode 100644 package/bpftool/bpftool.hash
> >   create mode 100644 package/bpftool/bpftool.mk
> >   delete mode 100644 package/linux-tools/linux-tool-bpftool.mk.in
> >
>
> [snip]
> > diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
> > new file mode 100644
> > index 0000000000..4276f91958
> > --- /dev/null
> > +++ b/package/bpftool/bpftool.mk
> > @@ -0,0 +1,45 @@
> > +################################################################################
> > +#
> > +# bpftool
> > +#
> > +################################################################################
> > +
> > +BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
> > +BPFTOOL_SITE = https://github.com/libbpf/bpftool
> > +BPFTOOL_SITE_METHOD = git
> > +BPFTOOL_GIT_SUBMODULES = YES
>
>   This is purely for the libbpf submodule. We normally prefer to unbundle such
> dependencies, since we have libbpf as a package. I've kept it for now, but if
> you could unbundle it, that would be great.

Yeah, unbundled doesn't seem to really be a supported configuration here yet.

>
>   I've added a line to the commit message to explain why the git download method
> is used.
>
>
>   Applied to master, thanks.
>
>   Regards,
>   Arnout
>
>
> > +BPFTOOL_LICENSE = GPL-2.0, BSD-2-Clause
> > +BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
> > +BPFTOOL_DEPENDENCIES = binutils elfutils
> > +HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
> > +
> > +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> > +BPFTOOL_DEPENDENCIES += libcap
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_ZLIB),y)
> > +BPFTOOL_DEPENDENCIES += zlib
> > +endif
> > +
> > +define BPFTOOL_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> > +             -C $(@D)/src
> > +endef
> > +
> > +define HOST_BPFTOOL_BUILD_CMDS
> > +     $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> > +             -C $(@D)/src
> > +endef
> > +
> > +define BPFTOOL_INSTALL_TARGET_CMDS
> > +     $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
> > +             -C $(@D)/src install DESTDIR="$(TARGET_DIR)" prefix=/usr
> > +endef
> > +
> > +define HOST_BPFTOOL_INSTALL_CMDS
> > +     $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> > +             -C $(@D)/src install DESTDIR="$(HOST_DIR)" prefix=/usr
> > +endef
> > +
> > +$(eval $(generic-package))
> > +$(eval $(host-generic-package))
> > diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> > index 28641dccdd..f459b41762 100644
> > --- a/package/linux-tools/Config.in
> > +++ b/package/linux-tools/Config.in
> > @@ -5,28 +5,6 @@ menu "Linux Kernel Tools"
> >   config BR2_PACKAGE_LINUX_TOOLS
> >       bool
> >
> > -config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
> > -     bool "bpftool"
> > -     depends on !BR2_nios2 # binutils
> > -     depends on BR2_USE_WCHAR # binutils, elfutils
> > -     depends on !BR2_STATIC_LIBS # elfutils
> > -     depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
> > -     depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> > -     select BR2_PACKAGE_LINUX_TOOLS
> > -     select BR2_PACKAGE_BINUTILS
> > -     select BR2_PACKAGE_ELFUTILS
> > -     help
> > -       bpftool is a tool for for inspection and simple manipulation
> > -       of eBPF programs and maps.
> > -
> > -       These tools are available only from kernel version 4.15.
> > -
> > -comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
> > -     depends on !BR2_nios2
> > -     depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> > -             || !BR2_TOOLCHAIN_HAS_THREADS \
> > -             || !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> > -
> >   config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
> >       bool "cpupower"
> >       select BR2_PACKAGE_LINUX_TOOLS
> > diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
> > deleted file mode 100644
> > index 0c4d3693a3..0000000000
> > --- a/package/linux-tools/linux-tool-bpftool.mk.in
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -################################################################################
> > -#
> > -# bpftool
> > -#
> > -################################################################################
> > -
> > -LINUX_TOOLS += bpftool
> > -
> > -BPFTOOL_DEPENDENCIES = binutils elfutils
> > -
> > -ifeq ($(BR2_PACKAGE_LIBCAP),y)
> > -BPFTOOL_DEPENDENCIES += libcap
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_ZLIB),y)
> > -BPFTOOL_DEPENDENCIES += zlib
> > -endif
> > -
> > -BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
> > -
> > -define BPFTOOL_BUILD_CMDS
> > -     $(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
> > -             echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
> > -             echo "At least kernel 4.15 must be used." ; \
> > -             exit 1 ; \
> > -     fi
> > -
> > -     $(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
> > -             $(BPFTOOL_MAKE_OPTS)
> > -endef
> > -
> > -define BPFTOOL_INSTALL_TARGET_CMDS
> > -     $(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
> > -             $(BPFTOOL_MAKE_OPTS) \
> > -             DESTDIR=$(TARGET_DIR) \
> > -             install
> > -endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
