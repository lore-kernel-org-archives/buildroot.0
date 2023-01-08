Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6167CC54EBC
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 21:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D48BF40216;
	Sun,  8 Jan 2023 21:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D48BF40216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDjIqTDiUdJg; Sun,  8 Jan 2023 21:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD0040240;
	Sun,  8 Jan 2023 21:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CD0040240
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12F1D1BF352
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF04060674
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF04060674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vE8avqTjKbih for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 21:28:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC3376058D
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC3376058D
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 21:28:25 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q190so3656346iod.10
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 13:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a9WenoCDf3mdu87Yw6O6+2Tm/qlQWXojrLoG6xvW46c=;
 b=BB3DWH7K6VTDLxWBOWHbttiCXKYEHCI/Ue7SzimW7d/++qp6GlQbWB8ghaOYd1Dmjf
 E0878o692yTMvWvcytN+VbRYNsZ3nWVKz7PZaLsiaTmiyIMl51j0HeALq7ggYg1HIsnw
 kEcDh+ry6dIa5jZu27DVzlAkyq2G7cm7LYFDsLQtN4eojvU29DKY96FiNpfAAOxjh9cs
 vPfQb/gDINZ3L1LvIIxU1aKQAFrYRkU4mznZU2eliQ805ZQW5G3qnMjFcij+YV4EWrEw
 aSkLtKiYhlhcmXjoPi9ZE2Zfbcy6RBiLGgPqpCMxbUktybeX6M5k7FFsYp97koHEa7tW
 OPNA==
X-Gm-Message-State: AFqh2koqcghCA1NjibWCg1JrfZyTWBhmk5/HrJwykoTmFtDqram822QI
 1Rrbt4RjtIImWjoWIVpxOmnEpLnTPfWR4ZPNXvy9tuMyVVY=
X-Google-Smtp-Source: AMrXdXtbk9ZMYBQ9pO5DmVUPrkcyO0vKN25zAiFU1238uXy+p/RM45AO/becdYZC5sLn1KuEpbZaNThHdygjg/i7RNk=
X-Received: by 2002:a05:6638:19ca:b0:375:1a70:9c5c with SMTP id
 bi10-20020a05663819ca00b003751a709c5cmr5264401jab.129.1673213304381; Sun, 08
 Jan 2023 13:28:24 -0800 (PST)
MIME-Version: 1.0
References: <mailman.4281.1673210051.179342.buildroot@buildroot.org>
In-Reply-To: <mailman.4281.1673210051.179342.buildroot@buildroot.org>
From: Dillan Jackson <dillanjackson45@gmail.com>
Date: Sun, 8 Jan 2023 13:28:13 -0800
Message-ID: <CAOgdC_X_R9LaK9BPabYDGUL+-WBXRmxen1nzyW184Tycm-dvaQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a9WenoCDf3mdu87Yw6O6+2Tm/qlQWXojrLoG6xvW46c=;
 b=nNZZ/RwAUZSSoj0iXRbrnEPnm9swahL7xR/GTWo5KputQRoDMy7aHz0xLdCQyXle01
 KbXSr5qpxBQkBsVgpmjENSccpw2j7fbUpDLRdQeJNPxbU92erFTMbSte+zaWfTuvDnMO
 0k8iLr3mzmFVOMUqejfMB+SMoCrQmbEnBLPtOM0/iaKR+eLgfmLSCfGIC7HleNnvXhWk
 jGY9bPibyR4OM7BgKeLcC28IbYhE4i/9wZqB+sGTayG0AkgiBdF4FtZiHqdrnvFUplzA
 2sZO0uBvTcQVIfBeqxNvChBUtLySlBoKG6GSIXKUoqQpZcBYssID8qlijVBM/UQURoF/
 Wfew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nNZZ/RwA
Subject: [Buildroot] Help me please
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
Content-Type: multipart/mixed; boundary="===============6422319889099993702=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6422319889099993702==
Content-Type: multipart/alternative; boundary="000000000000a4267105f1c75498"

--000000000000a4267105f1c75498
Content-Type: text/plain; charset="UTF-8"

Jeff please
On Sun, Jan 8, 2023 at 12:34 PM <buildroot-request@buildroot.org> wrote:

> Send buildroot mailing list submissions to
>         buildroot@buildroot.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         https://lists.buildroot.org/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
>         buildroot-request@buildroot.org
>
> You can reach the person managing the list at
>         buildroot-owner@buildroot.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
>
>
> Today's Topics:
>
>    1. [Bug 14996] Too many directories in BR2_EXTERNAL causes hang
>       during make (bugzilla@busybox.net)
>    2. Re: [PATCH 1/1] core: Use of percent_defconfig seems to
>       impact performance (Yann E. MORIN)
>    3. [PATCH 2022.02.x 1/1] package/php: security bump version to
>       8.0.27 (Bernd Kuhls)
>    4. Re: [PATCH 1/1] package/crun: add libgcrypt optional
>       dependency (Christian Stewart)
>    5. Re: [PATCH 1/1] package/crun: support crun as runtime in
>       containerd (Christian Stewart)
>    6. [autobuild.buildroot.net] Daily results for 2023-01-07
>       (Thomas Petazzoni)
>    7. [PATCH 1/1] package/bustle: fix pcap-config call
>       (Fabrice Fontaine)
>    8. Re: [PATCH v1] package/ntpsec: bump version to 1.2.2
>       (Peter Seiderer)
>    9. [git commit] package/bustle: fix pcap-config call (Yann E. MORIN)
>   10. Re: [PATCH 1/1] package/bustle: fix pcap-config call
>       (Yann E. MORIN)
>   11. [git commit] package/crun: fix static build (Yann E. MORIN)
>   12. Re: [PATCH 1/1] package/crun: fix static build (Yann E. MORIN)
>   13. [git commit] package/crun: needs fexecve (Yann E. MORIN)
>   14. Re: [PATCH 1/1] package/crun: needs fexecve (Yann E. MORIN)
>   15. [git commit] package/crun: add libgcrypt optional dependency
>       (Yann E. MORIN)
>   16. Re: [PATCH 1/1] package/crun: add libgcrypt optional
>       dependency (Yann E. MORIN)
>   17. [git commit] package/containerd: support crun as runtime
>       (Yann E. MORIN)
>   18. [git commit] package/crun: impersonate runc (Yann E. MORIN)
>   19. Re: [PATCH 1/1] package/crun: support crun as runtime in
>       containerd (Yann E. MORIN)
>   20. [PATCH v8 0/3] package: add petitboot to use with
>       qemu-system-m68k (Laurent Vivier)
>   21. [PATCH v8 2/3] board/qemu/m68k-virt: Add virt-m68k linux
>       config (Laurent Vivier)
>   22. [PATCH v8 1/3] package: add petitboot (Laurent Vivier)
>   23. [PATCH v8 3/3] support/scripts/boot-qemu-image.py: manage
>       petitboot interface (Laurent Vivier)
>   24. [PATCH 1/1] package/wireshark: fix legal info (Fabrice Fontaine)
>   25. [PATCH 1/1] package/crun: needs gcc >= 4.9 (Fabrice Fontaine)
>   26. Re: [PATCH v2 0/4] Add RISC-V 32 NOMMU support (Jesse Taube)
>   27. [PATCH 1/1] package/trinity: fix build with kernel >= 6.1
>       (Fabrice Fontaine)
>   28. [PATCH 1/1] package/libpjsip: security bump to version 2.13
>       (Fabrice Fontaine)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Sat, 07 Jan 2023 20:11:48 +0000
> From: bugzilla@busybox.net
> To: buildroot@uclibc.org
> Subject: [Buildroot] [Bug 14996] Too many directories in BR2_EXTERNAL
>         causes hang during make
> Message-ID: <bug-14996-163-Oez9KNjSl0@https.bugs.busybox.net/>
> Content-Type: text/plain; charset=UTF-8
>
> https://bugs.busybox.net/show_bug.cgi?id=14996
>
> Yann E. MORIN <yann.morin.1998@free.fr> changed:
>
>            What    |Removed                     |Added
>
> ----------------------------------------------------------------------------
>              Status|ASSIGNED                    |RESOLVED
>          Resolution|---                         |FIXED
>
> --- Comment #13 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> David, All,
>
> Thank you for the report.
>
> We believe this is now fixed with commit e6195c53041f (Makefile: fix use
> of many br2-external trees).
>
> If you still encounter the issue, please re-open.
>
> Regards,
> Yann E. MORIN.
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
>
> ------------------------------
>
> Message: 2
> Date: Sat, 7 Jan 2023 21:15:26 +0100
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: Nevo Hed <nhed+buildroot@starry.com>
> Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
> Subject: Re: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig
>         seems to impact performance
> Message-ID: <20230107201526.GA151997@scaer>
> Content-Type: text/plain; charset=utf-8
>
> Nevo, All,
>
> On 2023-01-04 20:57 -0500, Nevo Hed via buildroot spake thusly:
> > Noticed a significant slowdown with rise of number of external trees
> > in our env.  This slowdown seemed to be related to invocations if the
> > percent_defconfig function (GNU Make 4.3).
> >
> > While I have not do a deep dive in analyzing the performance issue, it
> > felt like redefining the %_defconfig rule N times impact performance.
> >
> > This patch makes %_defconfig a single rule which combines uses the
> > first return of a wildcard expression.
> >
> > Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1-8 external
> > trees:
> >
> >     #Trees    Before    After
> >          1      0.38     0.37
> >          2      0.32     0.31
> >          3      0.31     0.33
> >          4      0.36     0.32
> >          5      0.45     0.35
> >          6      1.26     0.36
> >          7      9.10     0.36
> >          8     85.93     0.42
> >
> > Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
>
> Thanks for the respin, I like it better than your first iteration, and
> most importantly, better than my own implementation!
>
> I however used most of my commit log, a=exteneded it even further,
> provided my reproducibility script in the commit log and redid the
> timings up to 1000 trees (heck, it's manageable now, so why not!).
>
> I also slightly reformatted the code, to split the long lines.
>
> Finally, I also added David as the reporter, and that his bug #14996
> is now fixed.
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  Makefile | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 88f90cd2fa..ad866f1f24 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1013,13 +1013,14 @@ oldconfig syncconfig olddefconfig:
> $(BUILD_DIR)/buildroot-config/conf outputmake
> >  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> >       @$(COMMON_CONFIG_ENV) $< --defconfig$(if
> $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
> >
> > -define percent_defconfig
> > -# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new
> defconfig
> > -%_defconfig: $(BUILD_DIR)/buildroot-config/conf
> $(1)/configs/%_defconfig outputmakefile
> > -     @$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
> > -             $$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
> > -endef
> > -$(eval $(foreach d,$(call reverse,$(TOPDIR)
> $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
> > +%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
> > +     @defconfig=$(or \
> > +             $(firstword $(foreach d, \
> > +                     $(call reverse,$(TOPDIR)
> $(BR2_EXTERNAL_DIRS)),$(wildcard $(d)/configs/$@))), \
> > +             $(error "Can't find $@") \
> > +     ); \
> > +     $(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
> > +             $< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
> >
> >  update-defconfig: savedefconfig
> >
> > --
> > 2.38.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
>
> ------------------------------
>
> Message: 3
> Date: Sat,  7 Jan 2023 21:18:03 +0100
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [PATCH 2022.02.x 1/1] package/php: security bump
>         version to 8.0.27
> Message-ID: <20230107201803.587499-1-bernd.kuhls@t-online.de>
>
> Release notes: https://www.php.net/releases/8_0_27.php
> Changelog: https://www.php.net/ChangeLog-8.php#8.0.27
>
> Fixes CVE-2022-31631: http://bugs.php.net/81740
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 574d5fb7c4..01e9c4fe79 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256  a291b71d0498707fc5514eb5b9513e88f0f1d4890bcdefd67282ded8a2bfb941
> php-8.0.25.tar.xz
> +sha256  f942cbfe2f7bacbb8039fb79bbec41c76ea779ac5c8157f21e1e0c1b28a5fc3a
> php-8.0.27.tar.xz
>
>  # License file
>  sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff
> LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 531f88e896..e1b62b02a8 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -PHP_VERSION = 8.0.25
> +PHP_VERSION = 8.0.27
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 4
> Date: Sat, 7 Jan 2023 18:38:53 -0800
> From: Christian Stewart <christian@paral.in>
> To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: buildroot@buildroot.org, Christian Stewart <christian@paral.in>
> Subject: Re: [Buildroot] [PATCH 1/1] package/crun: add libgcrypt
>         optional dependency
> Message-ID:
>         <
> CA+h8R2oVpT9SfKALBq2ooUn0CgFOJa34Rhn+C7067T1TTpyhhQ@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> Hi Fabrice,
>
> On Fri, Dec 30, 2022 at 10:08 AM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > libgcrypt is an optional dependency which is enabled by default since
> > version 1.7 and
> >
> https://github.com/containers/crun/commit/dd310aaf5aee336d0f6236c1c2add7b7cb030482
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/crun/crun.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
>
> Reviewed-by: Christian Stewart <christian@paral.in>
>
> Thanks!
>
>
> ------------------------------
>
> Message: 5
> Date: Sat, 7 Jan 2023 18:40:55 -0800
> From: Christian Stewart <christian@paral.in>
> To: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: buildroot@buildroot.org, Christian Stewart <christian@paral.in>
> Subject: Re: [Buildroot] [PATCH 1/1] package/crun: support crun as
>         runtime in containerd
> Message-ID:
>         <
> CA+h8R2p6i0ixT49tMD_biNKnXzoGHe6AZ+gf5mdfBwx5s19dDw@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> Hi all,
>
>
> On Thu, Oct 6, 2022 at 7:08 AM TIAN Yuanhao <tianyuanhao3@163.com> wrote:
> >
> > Create runc symlink to crun when runc is missing.
> >
> > See: https://github.com/containerd/containerd/discussions/6162
> >
> > Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> > ---
> >  package/containerd/Config.in | 2 +-
> >  package/crun/crun.mk         | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/containerd/Config.in b/package/containerd/Config.in
> > index 0e3a55ef39..e69dd6768a 100644
> > --- a/package/containerd/Config.in
> > +++ b/package/containerd/Config.in
> > @@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD
> >         depends on BR2_TOOLCHAIN_HAS_THREADS
> >         depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
> >         depends on BR2_USE_MMU # util-linux
> > -       select BR2_PACKAGE_RUNC # runtime dependency
> > +       select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
> >         select BR2_PACKAGE_UTIL_LINUX # runtime dependency
> >         select BR2_PACKAGE_UTIL_LINUX_BINARIES
> >         select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
> > diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> > index 4a0c150594..19dda71a9f 100644
> > --- a/package/crun/crun.mk
> > +++ b/package/crun/crun.mk
> > @@ -36,4 +36,11 @@ else
> >  CRUN_CONF_OPTS += --disable-systemd
> >  endif
> >
>
> This patch is still good, seems stalled though, can we merge?
>
> Thanks!
> Christian
>
>
> ------------------------------
>
> Message: 6
> Date: Sun, 08 Jan 2023 06:42:17 -0000
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot@buildroot.org
> Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
>         2023-01-07
> Message-ID: <20230108064223.E8C8060A9D@smtp3.osuosl.org>
> Content-Type: text/plain; charset="us-ascii"
>
> Hello,
>
> Autobuild statistics for 2023-01-07
> ===================================
>
>       branch |  OK | NOK | TIM | TOT |
>   2022.02.x  |  2  |  0  |  0  |  2  |
>   2022.11.x  | 15  | 12  |  0  | 27  |
>     master   | 176 | 348 |  0  | 524 |
>
> Classification of failures by reason for master
> -----------------------------------------------
>
>                    bash-5.2.15 | 29
>                   bustle-0.8.0 | 21
>                     fwup-1.9.1 | 19
>                host-fwup-1.9.1 | 16
>          host-sentry-cli-2.8.0 | 15
>                      xz-5.2.10 | 12
>                     bat-0.19.0 | 10
>   gobject-introspection-1.72.0 | 9
>                   jack2-1.9.21 | 8
>                    linux-6.1.2 | 8
>                     dust-0.8.1 | 7
>             host-binutils-2.38 | 7
>                     pixz-1.0.7 | 7
>               host-rust-1.66.0 | 6
>                     opkg-0.4.5 | 6
>                        unknown | 6
>            janus-gateway-1.1.1 | 5
>                     crun-1.7.2 | 4
>              dahdi-linux-3.2.0 | 4
>                 elfutils-0.186 | 4
>               host-pahole-1.24 | 4
>                libglib2-2.72.3 | 4
>                     norm-1.5.8 | 4
>            python-bcrypt-4.0.1 | 4
>     python-cryptography-38.0.4 | 4
>                 gerbera-1.10.0 | 3
> glibc-2.36-66-ga1dc0be03c9d... | 3
>                    gvfs-1.48.1 | 3
>                 host-go-1.19.4 | 3
>     host-python-greenlet-2.0.1 | 3
>              libgpg-error-1.46 | 3
>                   ntp-4.2.8p15 | 3
>             ocf-linux-20171122 | 3
>             python-bunch-1.0.1 | 3
>             quickjs-2021-03-27 | 3
>                  wolfssl-5.5.3 | 3
>   binutils-arc-2020.09-release | 2
>                   boost-1.80.0 | 2
>                      efivar-38 | 2
>                fftw-quad-3.3.8 | 2
>              fontconfig-2.13.1 | 2
> gummiboot-2bcd919c681c952eb... | 2
>             host-binutils-2.39 | 2
>               libgcrypt-1.10.1 | 2
>                   mender-3.4.0 | 2
>            optee-client-3.19.0 | 2
>                    perl-5.34.1 | 2
>                      ply-2.3.0 | 2
>            python-numpy-1.23.5 | 2
> ripgrep-af6b6c543b224d348a8... | 2
>                  sudo-1.9.12p1 | 2
> toolchain-external-codescap... | 2
>                  uclibc-1.0.42 | 2
>                   zabbix-5.4.9 | 2
> /home/buildroot/autobuild/i... | 1
> android-tools-4.2.2+git2013... | 1
>                apcupsd-3.14.14 | 1
>                   assimp-5.2.5 | 1
>                  avro-c-1.11.1 | 1
>                   bind-9.16.33 | 1
>              bluez5_utils-5.65 | 1
>                   cmocka-1.1.5 | 1
>              ctorrent-dnh3.3.2 | 1
>             dieharder-3.31.1.4 | 1
>                  dmalloc-5.6.5 | 1
>                    ethtool-6.1 | 1
>                    flann-1.9.2 | 1
>        freeradius-client-1.1.7 | 1
> fs/cramfs/cramfs.mk:46: /tm... | 1
> fs/ubifs/ubifs.mk:49: /home... | 1
> fs/ubifs/ubifs.mk:49: /home... | 1
> fs/ubifs/ubifs.mk:49: /home... | 1
> fs/ubifs/ubifs.mk:49: /tmp/... | 1
> google-breakpad-c85eb4a59b6... | 1
>              host-delve-1.20.0 | 1
>        host-gcc-initial-10.4.0 | 1
>        host-gcc-initial-12.2.0 | 1
>                  host-gdb-12.1 | 1
> host-spirv-llvm-translator-... | 1
>               hyperfine-1.14.0 | 1
> jq-a17dd3248a666d01be75f6b1... | 1
>                    json-c-0.16 | 1
> kvmtool-f77d646ba01d04be5aa... | 1
> libcamera-ba6435930f08e802c... | 1
>                libcap-ng-0.8.3 | 1
>                 libressl-3.6.1 | 1
>               libuhttpd-3.14.1 | 1
>           linux-5.10.145-cip17 | 1
>       linux-5.10.145-cip17-rt7 | 1
>                    linux-tools | 1
>              lirc-tools-0.10.2 | 1
>         ltp-testsuite-20220930 | 1
>                      lxc-5.0.1 | 1
>                   ndisc6-1.0.6 | 1
>                  nerdctl-1.0.0 | 1
>                    pcre2-10.42 | 1
>                       pdbg-3.5 | 1
>                pipewire-0.3.62 | 1
>                  proftpd-1.3.8 | 1
>            proxychains-ng-4.16 | 1
>                 python3-3.11.1 | 1
> rtl8812au-aircrack-ng-e7a4a... | 1
>                  rtl_433-22.11 | 1
>                     sdl-1.2.15 | 1
>                        sed-4.9 | 1
>                   sscep-0.10.0 | 1
>                    trinity-1.9 | 1
>                valgrind-3.19.0 | 1
>           wireshark-legal-info | 1
>                     zstd-1.5.2 | 1
>
>
> Detail of failures for master
> -----------------------------
>
>     arch     |             reason             | OK? |
>                  url                                       | orph?
>
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> microblazeel | /home/buildroot/autobuild/i... | NOK |
> http://autobuild.buildroot.net/results/642d168a588c27d66503708af100aba717469954
> |
>    mips64    | android-tools-4.2.2+git2013... | NOK |
> http://autobuild.buildroot.net/results/53af325806eb9bcc6e717f03a8e2269be6485014
> |
>    arceb     |        apcupsd-3.14.14         | NOK |
> http://autobuild.buildroot.net/results/12d53cc8cd966a271beb8764f00b5bfd3e1db31f
> |
>     mips     |          assimp-5.2.5          | NOK |
> http://autobuild.buildroot.net/results/fe6b0acb974a536a0d286210b3f60f2b37811bb1
> | ORPH
>   mips64el   |         avro-c-1.11.1          | NOK |
> http://autobuild.buildroot.net/results/ce4e9011d4ef9f550d483d79da6cbf6f9dda197a
> |
>    sparc     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/719e03e6c0e1d32a2739768933a7f7477f6c43d4
> | ORPH
>    arceb     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/bee0297601f9f657ae2171bd5c564b73eb3d3de2
> | ORPH
>    arceb     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/4d26f7f99413144e2f71c726547c6891cd4ff68d
> | ORPH
>    sparc     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/5a30ac60720bd19fd7bf4ee3d6262e2b32dd9457
> | ORPH
>    mipsel    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/ac1188b3daeac3a0be187f32587dbcee9044057d
> | ORPH
>   mips64el   |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/1282068df78cfaa4fe288139941fc2abd177f1db
> | ORPH
>    mips64    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/d31b42d80ee1b94c218b11d0fb14cf1db9b85e7a
> | ORPH
>     arc      |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/665b4cb978d4504661d92223ffc140fa47473855
> | ORPH
>   aarch64    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/893922590b1fbd55a831b4211d2045f41dc61d60
> | ORPH
>   mips64el   |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/3ce3fbb415cda1c18851b10c910a4b636c0f6bd4
> | ORPH
>    mips64    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/44b9bb0400bf77b0fd31244a805b78ee5ccc3791
> | ORPH
>     m68k     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/9ca35d21db6f3c209b6f166cb483b3173a83a367
> | ORPH
>     arc      |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/2446091658021b6e565f9de608c12bb56ed071fb
> | ORPH
>   powerpc    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/78a665ff897bd977ce3f1165dd612331a3baab6e
> | ORPH
>    mipsel    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/3d903d4dd7490b903a318be3cb74ecde94eb2b55
> | ORPH
>   powerpc    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/601e8346cabcd91352f7fbfcc59d3d9a132d027b
> | ORPH
>     arc      |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/07013c9c143f81d848e27741d482afa5efbe9daf
> | ORPH
>     m68k     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/0569796080f1a8e5478f7d72007b889b8500fa51
> | ORPH
>    armeb     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/fb723fe78e79a5a1bd4acceca4304fa3ac5ddbb7
> | ORPH
>    xtensa    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/0fb7ba52530f18ac91962f9dbf8d349d2c4d714e
> | ORPH
>    xtensa    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/9b06fa6c65bfcb9c89738c07d60f5375298f75ae
> | ORPH
>    sparc     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/fe8b5070b2e580d4da18504867089a6ea356fde4
> | ORPH
>    arceb     |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/da8aedff11a22929d178dd08855e7627c4317e4a
> | ORPH
>     arc      |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/14dcad9c7b57c1952d17622020a330f08066ec60
> | ORPH
>    mips64    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/30925704f014308234bb49ee13b677813448c038
> | ORPH
>  microblaze  |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/f63bf5c6c8f3e186effba6bfe987cdaff8475ac5
> | ORPH
>   aarch64    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/8d1405d80fe58ebdfadae9e971b225d5b8fc65f1
> | ORPH
>    mipsel    |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/f0e404c4f4e7a83fa6bb21d109a4c56a08676b5c
> | ORPH
>     arc      |          bash-5.2.15           | NOK |
> http://autobuild.buildroot.net/results/a8dac82e4ca056ed875b461a98884739615b25e1
> | ORPH
>    x86_64    |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/4d292ce185e109f20392630c69a0d5b0c3ecb1aa
> |
>  powerpc64   |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/b350f152b51676143b999263f4680ed70bdea3e9
> |
>     i686     |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/3112119a2ddbc9510dbcecb5634ff3eecf33ea08
> |
>  powerpc64   |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/30f547ed5c88e5e944768feb7a80c70855532ef2
> |
>   sparc64    |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/5ad5d967593843cf77bb24d67c1d12406920cc99
> |
>  powerpc64   |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/420d8d3e617a8194fafa481603bd66a2ce610e5d
> |
>    mipsel    |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/091c953da7433387369f93734ea400531ad1d939
> |
>     arm      |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/d3c6bd6fa13608a9ba59b9d7e584c6f749d2108c
> |
>   aarch64    |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/1cf04c154d3224fd74050e0e46ebb9ed0af5e61b
> |
>    x86_64    |           bat-0.19.0           | NOK |
> http://autobuild.buildroot.net/results/b1032984f29bbcabf918014d8e599873bd8c4429
> |
>     sh4a     |          bind-9.16.33          | NOK |
> http://autobuild.buildroot.net/results/c6ce0a58be4db4b2d84dd828b49e4bfd24151c13
> | ORPH
>     arc      |  binutils-arc-2020.09-release  | NOK |
> http://autobuild.buildroot.net/results/3fc4780d44f7dbcd9072830a949b26144d5ff5b5
> |
>     arc      |  binutils-arc-2020.09-release  | NOK |
> http://autobuild.buildroot.net/results/87f10a1f18027b291608fb33479d96be53d0db2a
> |
>     sh4a     |       bluez5_utils-5.65        | NOK |
> http://autobuild.buildroot.net/results/739a1ebb6f4905d0254281658c56c0fed81488e3
> |
>     arc      |          boost-1.80.0          | NOK |
> http://autobuild.buildroot.net/results/c351c186a8a9623bd6c93482c7391cf420daf30b
> |
>    arceb     |          boost-1.80.0          | NOK |
> http://autobuild.buildroot.net/results/fc9b61082cf3e9442c87a1aaeb8503b61a9ca042
> |
>    nios2     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/e5e017fa17f0977cf5f5cd36a05dc50e68ed254e
> | ORPH
>    armeb     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/dc1ab74bc462cbe36ef1655bfff836da4eb0fa6d
> | ORPH
>     mips     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/300ddad3ec01107068a3de530ea5f4e4999a9d83
> | ORPH
>    mips64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/2988246e2a567ea5e7383702172f18586568d7e9
> | ORPH
>    mips64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/41af120595836ae414f737aeab582e6e14365385
> | ORPH
> powerpc64le  |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/9b161dbab6a6c51d586f4ee2fed8dd796d597e40
> | ORPH
>    s390x     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/f772374e2d31d5d30bd7639b05735e87553f687a
> | ORPH
>    nios2     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/0f4291b4c60fee73f966c6d8cb743a592d2d436e
> | ORPH
>   aarch64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/452ba9ecd1e87ef62a2c3636d4cc2d7de3d97a2a
> | ORPH
>    nios2     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/1b3f53afde542fa0579fba4549a98b4c9a6faa0e
> | ORPH
>   aarch64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/c00e06f743b30771c3600ce1a39d9e7d16c3156a
> | ORPH
>   sparc64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/c4720c38d341d91bee6cabbfb38988a8c30e4381
> | ORPH
>    x86_64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/d68b04ec97fe1e9ef85b8ef51651f6866511a80f
> | ORPH
>    x86_64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/8f85e0bd345265f768184b9b1a36237ddcdf43c3
> | ORPH
>   sparc64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/78905a48b4feaf8bfd17364a8a9a1ef1d3278fcf
> | ORPH
>    s390x     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/26b705ef62d285ea649bbfe057b93e07d23a50a6
> | ORPH
>  powerpc64   |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/070a217f7b578b44d9654dbacf59d887250e84e2
> | ORPH
>     or1k     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/886b2b8f5514b66c67504107bc1fd1fc4c368a5f
> | ORPH
>   sparc64    |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/aa682e37ac58f38ed6c412805471063fc11aaf47
> | ORPH
>     or1k     |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/f0ffacd790a22aefba4f54a48e92b8f5105b5d8d
> | ORPH
>  microblaze  |          bustle-0.8.0          | NOK |
> http://autobuild.buildroot.net/results/0d6c4a46e810c9a7ed0a4200a1c74271a99b48aa
> | ORPH
>     arm      |          cmocka-1.1.5          | NOK |
> http://autobuild.buildroot.net/results/d5506c9b5158fa19dc85af3091507d0df83bec47
> |
>     arm      |           crun-1.7.2           | NOK |
> http://autobuild.buildroot.net/results/89c5cde0a0aeb2da4c42d9a999386f85f421056b
> |
>     m68k     |           crun-1.7.2           | NOK |
> http://autobuild.buildroot.net/results/d856901105237e9f9333a2d9d317c85fc8f37311
> |
>     arc      |           crun-1.7.2           | NOK |
> http://autobuild.buildroot.net/results/e8334e2a0b7eeb3033659f3c60ad446c7b04cba0
> |
>   riscv64    |           crun-1.7.2           | NOK |
> http://autobuild.buildroot.net/results/19829e70de4f24db9384f84f066de2d520df810b
> |
>   riscv64    |       ctorrent-dnh3.3.2        | NOK |
> http://autobuild.buildroot.net/results/709da1e7ad61f89e148286aed9a369daad8d974e
> |
> powerpc64le  |       dahdi-linux-3.2.0        | NOK |
> http://autobuild.buildroot.net/results/c3f3b4702f81de7ee72e8f76e0cc06f04c1d0c53
> |
> microblazeel |       dahdi-linux-3.2.0        | NOK |
> http://autobuild.buildroot.net/results/7052cfd674ce7223e012efa225336c763c742181
> |
>   riscv32    |       dahdi-linux-3.2.0        | NOK |
> http://autobuild.buildroot.net/results/bd6b75272cb1ba0f91e400e4650676cf88d9a79b
> |
>    armeb     |       dahdi-linux-3.2.0        | NOK |
> http://autobuild.buildroot.net/results/7f25e6d172320563d40e3faa0a6cd0a50c78bc9d
> |
> microblazeel |       dieharder-3.31.1.4       | NOK |
> http://autobuild.buildroot.net/results/e532000eaff86803cd6c2e34aa20474c53a4fa53
> |
>   powerpc    |         dmalloc-5.6.5          | NOK |
> http://autobuild.buildroot.net/results/8a7be3fd8a25fbb523bba91610f9872cffbc982e
> | ORPH
> powerpc64le  |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/29890fa63a695b7ab1b0cfe365419edc222b8aa4
> | ORPH
>   powerpc    |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/f7b33e620e0495624cacdb5bf641e7423fc42afd
> | ORPH
> powerpc64le  |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/62f523f190884b48e1f5c1d5151f6149f74fdcd6
> | ORPH
>    s390x     |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/610af4232acd1b67229d2dc6991ce09742edc493
> | ORPH
>   sparc64    |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/33902543b80a09c8a1644f4a1a351c638d8ceffa
> | ORPH
>     mips     |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/30b69204131dc3057b02fdbaeda462ae7b78b0b5
> | ORPH
>    mipsel    |           dust-0.8.1           | NOK |
> http://autobuild.buildroot.net/results/e69b04902e2a79409ca37cad6961b057d7fb2b9d
> | ORPH
>   aarch64    |           efivar-38            | NOK |
> http://autobuild.buildroot.net/results/9622d506dfdbe9a44f0acfae25bff69155f55b6e
> |
>     arm      |           efivar-38            | NOK |
> http://autobuild.buildroot.net/results/1b50677481f14de85875652a305a4334e303ed53
> |
> microblazeel |         elfutils-0.186         | NOK |
> http://autobuild.buildroot.net/results/f730c0bb8be5701eba34c796d4f6ce35d75d44c6
> | ORPH
>    arceb     |         elfutils-0.186         | NOK |
> http://autobuild.buildroot.net/results/5427c661c850a48f61909db5c8a66195ac8bde87
> | ORPH
> microblazeel |         elfutils-0.186         | NOK |
> http://autobuild.buildroot.net/results/d3394e6e2b4083a4c2a9d5200d46239aa8116f4f
> | ORPH
>    arceb     |         elfutils-0.186         | NOK |
> http://autobuild.buildroot.net/results/871523f947a56c47cef673f977b3fd9a87eab08c
> | ORPH
>    x86_64    |          ethtool-6.1           | NOK |
> http://autobuild.buildroot.net/results/1560c14dc6715cbd49d0efca0d1c8289b1e7dc6a
> |
> powerpc64le  |        fftw-quad-3.3.8         | NOK |
> http://autobuild.buildroot.net/results/5d6587e1180fb795fc55437fb2471eac57b1e041
> | ORPH
> powerpc64le  |        fftw-quad-3.3.8         | NOK |
> http://autobuild.buildroot.net/results/96982382b558338fb5a219f3ba951f95006111e8
> | ORPH
>     mips     |          flann-1.9.2           | NOK |
> http://autobuild.buildroot.net/results/0c93e5ff99c57536bbe6001f1d258c738d76e36c
> |
>   riscv64    |       fontconfig-2.13.1        | NOK |
> http://autobuild.buildroot.net/results/7adc5978b1f655c844aebf9eb733c721c0500b41
> | ORPH
>   riscv64    |       fontconfig-2.13.1        | NOK |
> http://autobuild.buildroot.net/results/5ab12a1eeca15375b67fd828e60e62d9d08634f5
> | ORPH
>   riscv64    |    freeradius-client-1.1.7     | NOK |
> http://autobuild.buildroot.net/results/22e72d9d4e8ba3e65a05385561239976ee66e6c4
> |
>  aarch64_be  | fs/cramfs/cramfs.mk:46: /tm... | NOK |
> http://autobuild.buildroot.net/results/2df7bfcf94a0ea6cdcf7e87757e6f4461115a7f6
> |
>   mips64el   | fs/ubifs/ubifs.mk:49: /home... | NOK |
> http://autobuild.buildroot.net/results/0806f7373086ebbcbd680b94f594225e06b679e3
> |
>     mips     | fs/ubifs/ubifs.mk:49: /home... | NOK |
> http://autobuild.buildroot.net/results/c0082772c6d3875e434609abec850ce3510da32e
> |
>    sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK |
> http://autobuild.buildroot.net/results/61c233700d696d0ce9776c8e7e3dea513c39c5de
> |
>    s390x     | fs/ubifs/ubifs.mk:49: /tmp/... | NOK |
> http://autobuild.buildroot.net/results/108c8686239aa88e42a6e2cc53bbb46db44cee07
> |
>  aarch64_be  |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/754252fe31d86c18951d019c9e2c504affe3d232
> |
>     mips     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/58a40e6df56ff5aa27ab944b01e20e24c448df4b
> |
>   mips64el   |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/2ca7a6dc110aaf9ed91fb5540f4cfca6d420e209
> |
>    s390x     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/e4ce13b7d500bcfa29454e570fad0a3b5ebb07ed
> |
>     or1k     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/f5b0425b8e70ae494d7fe5c08f28c4defb3caac2
> |
>  powerpc64   |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/b569e14015b06ceceb71b350bd4bcd2ff4841fdd
> |
>     m68k     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/1288297bb411d905264edfae93f0981cfb72d5be
> |
>     mips     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/d97639c44a18d7cb537fb5aa6e039e966b8aae89
> |
>  aarch64_be  |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/c2a862fd7aa3bbbab15958d9627767685f7062d8
> |
>   powerpc    |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/2fbc89cb39bf4c36e4b1199d6b747975686f3dfc
> |
>    sparc     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/7b7807cb8f93d414c6f1471b8699617f03ef8427
> |
>  powerpc64   |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/1c90ef36a6a8e2166842a95647c1a6a58c740be4
> |
>  powerpc64   |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/23678904d9a4b35ea2821747b26e9b56fdd7fcf6
> |
>     arm      |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/05800ca7ac86ab52ca5904aedf10d4e3b4309061
> |
>     mips     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/240eed608aca0fc3679b4743dcf37e2faa7c2907
> |
>  microblaze  |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/24942a167c32cacf93f962438c2b04e13b67d507
> |
>   mips64el   |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/aca1164826222255cd09cb72b6cc7958af1190a2
> |
>    armeb     |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/6bba275fcf0301bd7ce6b12fbc223a3eeb54df40
> |
>   mips64el   |           fwup-1.9.1           | NOK |
> http://autobuild.buildroot.net/results/d5b8d9cc1917f6adb66589a40902d173d595550e
> |
>    mipsel    |         gerbera-1.10.0         | NOK |
> http://autobuild.buildroot.net/results/0abcda70a45ae731b9e9e2a52ad16a63d12c8c2f
> |
> powerpc64le  |         gerbera-1.10.0         | NOK |
> http://autobuild.buildroot.net/results/fbfbd57645e66c4ae68b0a226542dfa5927308ee
> |
>    arceb     |         gerbera-1.10.0         | NOK |
> http://autobuild.buildroot.net/results/7f43ee87e7bb05f1d376b3e2c081ac1b0de3ef3c
> |
>    arceb     | glibc-2.36-66-ga1dc0be03c9d... | NOK |
> http://autobuild.buildroot.net/results/bc65f0ccd0ec27af01753c185138ee99d1cf15d1
> |
>   powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK |
> http://autobuild.buildroot.net/results/d50fd5557f15835946e59340f3078b02ec6d4eab
> |
>   powerpc    | glibc-2.36-66-ga1dc0be03c9d... | NOK |
> http://autobuild.buildroot.net/results/f7156c57004897dd86b5378523306811ceb2deb3
> |
>   sparc64    |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/accf137b5973d9056f306198e51e0427bbcc9569
> | ORPH
>   sparc64    |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/e820baaa1f3c219f8ba4d756071d55e2af634cb1
> | ORPH
>    s390x     |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/43aa7481e13a02b98631f3f7acfebb4f0fe4d704
> | ORPH
>     mips     |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/25ab8d6cddbbd3eef8e3cedb7a9343c8019665f4
> | ORPH
>    nios2     |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/4644e89287285d9b790fc4e613345b8aba20354c
> | ORPH
> powerpc64le  |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/65ae3d5aae076619ed5651340ec3d3401bc15b2d
> | ORPH
>   sparc64    |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/dfd9a283425ce9b9a97c4a205682375331f1f5ab
> | ORPH
>    nios2     |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/b5ac53c8dce40a2412cd5c07f9ea4c2154c90f27
> | ORPH
>   powerpc    |  gobject-introspection-1.72.0  | NOK |
> http://autobuild.buildroot.net/results/27b5d0b608f6c229ffe360612c587387e4872d65
> | ORPH
>     arm      | google-breakpad-c85eb4a59b6... | NOK |
> http://autobuild.buildroot.net/results/29184695d69798e488f9a0f469bd1a4d482a39c0
> |
>     i686     | gummiboot-2bcd919c681c952eb... | NOK |
> http://autobuild.buildroot.net/results/2f0a80890e4a74d29cdc700c6b8e45aadb47c4c0
> |
>     i686     | gummiboot-2bcd919c681c952eb... | NOK |
> http://autobuild.buildroot.net/results/9f94a95c44debb80a8b059a4f1547bc60869d70e
> |
>  aarch64_be  |          gvfs-1.48.1           | NOK | http://autobuild.
> <http://autobuild.buildroot.net/results/eb3bc7efafec12806d0dd9c54be2b9e86cc7a6fe>

--000000000000a4267105f1c75498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">Jeff please=C2=A0<br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 8, 2023 at 12:34 PM=
 &lt;<a href=3D"mailto:buildroot-request@buildroot.org">buildroot-request@b=
uildroot.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">Send buildroot mailin=
g list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot@buildroot.org" targ=
et=3D"_blank">buildroot@buildroot.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.buildroot.org/mailman/=
listinfo/buildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buil=
droot.org/mailman/listinfo/buildroot</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot-request@buildroot.o=
rg" target=3D"_blank">buildroot-request@buildroot.org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:buildroot-owner@buildroot.org=
" target=3D"_blank">buildroot-owner@buildroot.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of buildroot digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. [Bug 14996] Too many directories in BR2_EXTERNAL causes han=
g<br>
=C2=A0 =C2=A0 =C2=A0 during make (<a href=3D"mailto:bugzilla@busybox.net" t=
arget=3D"_blank">bugzilla@busybox.net</a>)<br>
=C2=A0 =C2=A02. Re: [PATCH 1/1] core: Use of percent_defconfig seems to<br>
=C2=A0 =C2=A0 =C2=A0 impact performance (Yann E. MORIN)<br>
=C2=A0 =C2=A03. [PATCH 2022.02.x 1/1] package/php: security bump version to=
<br>
=C2=A0 =C2=A0 =C2=A0 8.0.27 (Bernd Kuhls)<br>
=C2=A0 =C2=A04. Re: [PATCH 1/1] package/crun: add libgcrypt optional<br>
=C2=A0 =C2=A0 =C2=A0 dependency (Christian Stewart)<br>
=C2=A0 =C2=A05. Re: [PATCH 1/1] package/crun: support crun as runtime in<br=
>
=C2=A0 =C2=A0 =C2=A0 containerd (Christian Stewart)<br>
=C2=A0 =C2=A06. [<a href=3D"http://autobuild.buildroot.net" rel=3D"noreferr=
er" target=3D"_blank">autobuild.buildroot.net</a>] Daily results for 2023-0=
1-07<br>
=C2=A0 =C2=A0 =C2=A0 (Thomas Petazzoni)<br>
=C2=A0 =C2=A07. [PATCH 1/1] package/bustle: fix pcap-config call<br>
=C2=A0 =C2=A0 =C2=A0 (Fabrice Fontaine)<br>
=C2=A0 =C2=A08. Re: [PATCH v1] package/ntpsec: bump version to 1.2.2<br>
=C2=A0 =C2=A0 =C2=A0 (Peter Seiderer)<br>
=C2=A0 =C2=A09. [git commit] package/bustle: fix pcap-config call (Yann E. =
MORIN)<br>
=C2=A0 10. Re: [PATCH 1/1] package/bustle: fix pcap-config call<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 11. [git commit] package/crun: fix static build (Yann E. MORIN)<br>
=C2=A0 12. Re: [PATCH 1/1] package/crun: fix static build (Yann E. MORIN)<b=
r>
=C2=A0 13. [git commit] package/crun: needs fexecve (Yann E. MORIN)<br>
=C2=A0 14. Re: [PATCH 1/1] package/crun: needs fexecve (Yann E. MORIN)<br>
=C2=A0 15. [git commit] package/crun: add libgcrypt optional dependency<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 16. Re: [PATCH 1/1] package/crun: add libgcrypt optional<br>
=C2=A0 =C2=A0 =C2=A0 dependency (Yann E. MORIN)<br>
=C2=A0 17. [git commit] package/containerd: support crun as runtime<br>
=C2=A0 =C2=A0 =C2=A0 (Yann E. MORIN)<br>
=C2=A0 18. [git commit] package/crun: impersonate runc (Yann E. MORIN)<br>
=C2=A0 19. Re: [PATCH 1/1] package/crun: support crun as runtime in<br>
=C2=A0 =C2=A0 =C2=A0 containerd (Yann E. MORIN)<br>
=C2=A0 20. [PATCH v8 0/3] package: add petitboot to use with<br>
=C2=A0 =C2=A0 =C2=A0 qemu-system-m68k (Laurent Vivier)<br>
=C2=A0 21. [PATCH v8 2/3] board/qemu/m68k-virt: Add virt-m68k linux<br>
=C2=A0 =C2=A0 =C2=A0 config (Laurent Vivier)<br>
=C2=A0 22. [PATCH v8 1/3] package: add petitboot (Laurent Vivier)<br>
=C2=A0 23. [PATCH v8 3/3] support/scripts/boot-qemu-image.py: manage<br>
=C2=A0 =C2=A0 =C2=A0 petitboot interface (Laurent Vivier)<br>
=C2=A0 24. [PATCH 1/1] package/wireshark: fix legal info (Fabrice Fontaine)=
<br>
=C2=A0 25. [PATCH 1/1] package/crun: needs gcc &gt;=3D 4.9 (Fabrice Fontain=
e)<br>
=C2=A0 26. Re: [PATCH v2 0/4] Add RISC-V 32 NOMMU support (Jesse Taube)<br>
=C2=A0 27. [PATCH 1/1] package/trinity: fix build with kernel &gt;=3D 6.1<b=
r>
=C2=A0 =C2=A0 =C2=A0 (Fabrice Fontaine)<br>
=C2=A0 28. [PATCH 1/1] package/libpjsip: security bump to version 2.13<br>
=C2=A0 =C2=A0 =C2=A0 (Fabrice Fontaine)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Sat, 07 Jan 2023 20:11:48 +0000<br>
From: <a href=3D"mailto:bugzilla@busybox.net" target=3D"_blank">bugzilla@bu=
sybox.net</a><br>
To: <a href=3D"mailto:buildroot@uclibc.org" target=3D"_blank">buildroot@ucl=
ibc.org</a><br>
Subject: [Buildroot] [Bug 14996] Too many directories in BR2_EXTERNAL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 causes hang during make<br>
Message-ID: &lt;<a href=3D"http://bug-14996-163-Oez9KNjSl0@https.bugs.busyb=
ox.net/" rel=3D"noreferrer" target=3D"_blank">bug-14996-163-Oez9KNjSl0@http=
s.bugs.busybox.net/</a>&gt;<br>
Content-Type: text/plain; charset=3DUTF-8<br>
<br>
<a href=3D"https://bugs.busybox.net/show_bug.cgi?id=3D14996" rel=3D"norefer=
rer" target=3D"_blank">https://bugs.busybox.net/show_bug.cgi?id=3D14996</a>=
<br>
<br>
Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_bla=
nk">yann.morin.1998@free.fr</a>&gt; changed:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0What=C2=A0 =C2=A0 |Removed=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|Added=
<br>
---------------------------------------------------------------------------=
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Status|ASSIGNED=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |RESOLVED<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Resolution|---=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|FIXED<br>
<br>
--- Comment #13 from Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@fr=
ee.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt; ---<br>
David, All,<br>
<br>
Thank you for the report.<br>
<br>
We believe this is now fixed with commit e6195c53041f (Makefile: fix use<br=
>
of many br2-external trees).<br>
<br>
If you still encounter the issue, please re-open.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
You are receiving this mail because:<br>
You are on the CC list for the bug.<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Sat, 7 Jan 2023 21:15:26 +0100<br>
From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin.1998@free.=
fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;<br>
To: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com" target=3D"_=
blank">nhed+buildroot@starry.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, <a href=3D"mailto:thomas.petazzoni@bootlin.com" target=
=3D"_blank">thomas.petazzoni@bootlin.com</a><br>
Subject: Re: [Buildroot] [PATCH 1/1] core: Use of percent_defconfig<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 seems to impact performance<br>
Message-ID: &lt;20230107201526.GA151997@scaer&gt;<br>
Content-Type: text/plain; charset=3Dutf-8<br>
<br>
Nevo, All,<br>
<br>
On 2023-01-04 20:57 -0500, Nevo Hed via buildroot spake thusly:<br>
&gt; Noticed a significant slowdown with rise of number of external trees<b=
r>
&gt; in our env.=C2=A0 This slowdown seemed to be related to invocations if=
 the<br>
&gt; percent_defconfig function (GNU Make 4.3).<br>
&gt; <br>
&gt; While I have not do a deep dive in analyzing the performance issue, it=
<br>
&gt; felt like redefining the %_defconfig rule N times impact performance.<=
br>
&gt; <br>
&gt; This patch makes %_defconfig a single rule which combines uses the<br>
&gt; first return of a wildcard expression.<br>
&gt; <br>
&gt; Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1-8 external<=
br>
&gt; trees:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0#Trees=C2=A0 =C2=A0 Before=C2=A0 =C2=A0 After<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 0.38=C2=A0 =C2=
=A0 =C2=A00.37<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 0.32=C2=A0 =C2=
=A0 =C2=A00.31<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0 =C2=A0 0.31=C2=A0 =C2=
=A0 =C2=A00.33<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 0.36=C2=A0 =C2=
=A0 =C2=A00.32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5=C2=A0 =C2=A0 =C2=A0 0.45=C2=A0 =C2=
=A0 =C2=A00.35<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6=C2=A0 =C2=A0 =C2=A0 1.26=C2=A0 =C2=
=A0 =C2=A00.36<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7=C2=A0 =C2=A0 =C2=A0 9.10=C2=A0 =C2=
=A0 =C2=A00.36<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A085.93=C2=A0 =C2=
=A0 =C2=A00.42<br>
&gt; <br>
&gt; Signed-off-by: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.=
com" target=3D"_blank">nhed+buildroot@starry.com</a>&gt;<br>
<br>
Thanks for the respin, I like it better than your first iteration, and<br>
most importantly, better than my own implementation!<br>
<br>
I however used most of my commit log, a=3Dexteneded it even further,<br>
provided my reproducibility script in the commit log and redid the<br>
timings up to 1000 trees (heck, it&#39;s manageable now, so why not!).<br>
<br>
I also slightly reformatted the code, to split the long lines.<br>
<br>
Finally, I also added David as the reporter, and that his bug #14996<br>
is now fixed.<br>
<br>
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 Makefile | 15 ++++++++-------<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Makefile b/Makefile<br>
&gt; index 88f90cd2fa..ad866f1f24 100644<br>
&gt; --- a/Makefile<br>
&gt; +++ b/Makefile<br>
&gt; @@ -1013,13 +1013,14 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR=
)/buildroot-config/conf outputmake<br>
&gt;=C2=A0 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(COMMON_CONFIG_ENV) $&lt; --defconfig$(if =
$(DEFCONFIG),=3D$(DEFCONFIG)) $(CONFIG_CONFIG_IN)<br>
&gt;=C2=A0 <br>
&gt; -define percent_defconfig<br>
&gt; -# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defc=
onfig<br>
&gt; -%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defcon=
fig outputmakefile<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=3D$(1)/confi=
gs/$$@ \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$$&lt; --defconfig=3D=
$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)<br>
&gt; -endef<br>
&gt; -$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(c=
all percent_defconfig,$(d))$(sep)))<br>
&gt; +%_defconfig: $(BUILD_DIR)/buildroot-config/conf=C2=A0 outputmakefile<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0@defconfig=3D$(or \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(firstword $(foreach=
 d, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(wildcard $(d)/confi=
gs/$@))), \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(error &quot;Can&#39=
;t find $@&quot;) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=3D$${defconfig=
} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$&lt; --defconfig=3D$=
${defconfig} $(CONFIG_CONFIG_IN)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 update-defconfig: savedefconfig<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.38.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Sat,=C2=A0 7 Jan 2023 21:18:03 +0100<br>
From: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" target=3D"=
_blank">bernd.kuhls@t-online.de</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [PATCH 2022.02.x 1/1] package/php: security bump<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 version to 8.0.27<br>
Message-ID: &lt;<a href=3D"mailto:20230107201803.587499-1-bernd.kuhls@t-onl=
ine.de" target=3D"_blank">20230107201803.587499-1-bernd.kuhls@t-online.de</=
a>&gt;<br>
<br>
Release notes: <a href=3D"https://www.php.net/releases/8_0_27.php" rel=3D"n=
oreferrer" target=3D"_blank">https://www.php.net/releases/8_0_27.php</a><br=
>
Changelog: <a href=3D"https://www.php.net/ChangeLog-8.php#8.0.27" rel=3D"no=
referrer" target=3D"_blank">https://www.php.net/ChangeLog-8.php#8.0.27</a><=
br>
<br>
Fixes CVE-2022-31631: <a href=3D"http://bugs.php.net/81740" rel=3D"noreferr=
er" target=3D"_blank">http://bugs.php.net/81740</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" t=
arget=3D"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
---<br>
=C2=A0package/php/php.hash | 2 +-<br>
=C2=A0package/php/<a href=3D"http://php.mk" rel=3D"noreferrer" target=3D"_b=
lank">php.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/php/php.hash b/package/php/php.hash<br>
index 574d5fb7c4..01e9c4fe79 100644<br>
--- a/package/php/php.hash<br>
+++ b/package/php/php.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# From <a href=3D"https://www.php.net/downloads.php" rel=3D"noreferre=
r" target=3D"_blank">https://www.php.net/downloads.php</a><br>
-sha256=C2=A0 a291b71d0498707fc5514eb5b9513e88f0f1d4890bcdefd67282ded8a2bfb=
941=C2=A0 php-8.0.25.tar.xz<br>
+sha256=C2=A0 f942cbfe2f7bacbb8039fb79bbec41c76ea779ac5c8157f21e1e0c1b28a5f=
c3a=C2=A0 php-8.0.27.tar.xz<br>
<br>
=C2=A0# License file<br>
=C2=A0sha256=C2=A0 a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3=
c5430fff=C2=A0 LICENSE<br>
diff --git a/package/php/<a href=3D"http://php.mk" rel=3D"noreferrer" targe=
t=3D"_blank">php.mk</a> b/package/php/<a href=3D"http://php.mk" rel=3D"nore=
ferrer" target=3D"_blank">php.mk</a><br>
index 531f88e896..e1b62b02a8 100644<br>
--- a/package/php/<a href=3D"http://php.mk" rel=3D"noreferrer" target=3D"_b=
lank">php.mk</a><br>
+++ b/package/php/<a href=3D"http://php.mk" rel=3D"noreferrer" target=3D"_b=
lank">php.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-PHP_VERSION =3D 8.0.25<br>
+PHP_VERSION =3D 8.0.27<br>
=C2=A0PHP_SITE =3D <a href=3D"https://www.php.net/distributions" rel=3D"nor=
eferrer" target=3D"_blank">https://www.php.net/distributions</a><br>
=C2=A0PHP_SOURCE =3D php-$(PHP_VERSION).tar.xz<br>
=C2=A0PHP_INSTALL_STAGING =3D YES<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Sat, 7 Jan 2023 18:38:53 -0800<br>
From: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D=
"_blank">christian@paral.in</a>&gt;<br>
To: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" targ=
et=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, Christian Stewart &lt;<a href=3D"mailto:christian@paral.=
in" target=3D"_blank">christian@paral.in</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: add libgcrypt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 optional dependency<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:CA%2Bh8R2oVpT9SfKALBq2ooU=
n0CgFOJa34Rhn%2BC7067T1TTpyhhQ@mail.gmail.com" target=3D"_blank">CA+h8R2oVp=
T9SfKALBq2ooUn0CgFOJa34Rhn+C7067T1TTpyhhQ@mail.gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
Hi Fabrice,<br>
<br>
On Fri, Dec 30, 2022 at 10:08 AM Fabrice Fontaine<br>
&lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=3D"_blank">fontain=
e.fabrice@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; libgcrypt is an optional dependency which is enabled by default since<=
br>
&gt; version 1.7 and<br>
&gt; <a href=3D"https://github.com/containers/crun/commit/dd310aaf5aee336d0=
f6236c1c2add7b7cb030482" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/containers/crun/commit/dd310aaf5aee336d0f6236c1c2add7b7cb030482</a><b=
r>
&gt;<br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer" targe=
t=3D"_blank">crun.mk</a> | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
<br>
Reviewed-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" ta=
rget=3D"_blank">christian@paral.in</a>&gt;<br>
<br>
Thanks!<br>
<br>
<br>
------------------------------<br>
<br>
Message: 5<br>
Date: Sat, 7 Jan 2023 18:40:55 -0800<br>
From: Christian Stewart &lt;<a href=3D"mailto:christian@paral.in" target=3D=
"_blank">christian@paral.in</a>&gt;<br>
To: TIAN Yuanhao &lt;<a href=3D"mailto:tianyuanhao3@163.com" target=3D"_bla=
nk">tianyuanhao3@163.com</a>&gt;<br>
Cc: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>, Christian Stewart &lt;<a href=3D"mailto:christian@paral.=
in" target=3D"_blank">christian@paral.in</a>&gt;<br>
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: support crun as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 runtime in containerd<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:CA%2Bh8R2p6i0ixT49tMD_biN=
KnXzoGHe6AZ%2Bgf5mdfBwx5s19dDw@mail.gmail.com" target=3D"_blank">CA+h8R2p6i=
0ixT49tMD_biNKnXzoGHe6AZ+gf5mdfBwx5s19dDw@mail.gmail.com</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
Hi all,<br>
<br>
<br>
On Thu, Oct 6, 2022 at 7:08 AM TIAN Yuanhao &lt;<a href=3D"mailto:tianyuanh=
ao3@163.com" target=3D"_blank">tianyuanhao3@163.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Create runc symlink to crun when runc is missing.<br>
&gt;<br>
&gt; See: <a href=3D"https://github.com/containerd/containerd/discussions/6=
162" rel=3D"noreferrer" target=3D"_blank">https://github.com/containerd/con=
tainerd/discussions/6162</a><br>
&gt;<br>
&gt; Signed-off-by: TIAN Yuanhao &lt;<a href=3D"mailto:tianyuanhao3@163.com=
" target=3D"_blank">tianyuanhao3@163.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/containerd/Config.in | 2 +-<br>
&gt;=C2=A0 package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer" targe=
t=3D"_blank">crun.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/package/containerd/Config.in b/package/containerd/Config.=
in<br>
&gt; index 0e3a55ef39..e69dd6768a 100644<br>
&gt; --- a/package/containerd/Config.in<br>
&gt; +++ b/package/containerd/Config.in<br>
&gt; @@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_USES_UCLIBC=
 # runc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # util-linux<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_RUNC # runtime dependen=
cy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CR=
UN # runtime dependency<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_UTIL_LINUX # runti=
me dependency<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_UTIL_LINUX_BINARIE=
S<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_UTIL_LINUX_PIVOT_R=
OOT<br>
&gt; diff --git a/package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer=
" target=3D"_blank">crun.mk</a> b/package/crun/<a href=3D"http://crun.mk" r=
el=3D"noreferrer" target=3D"_blank">crun.mk</a><br>
&gt; index 4a0c150594..19dda71a9f 100644<br>
&gt; --- a/package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer" targe=
t=3D"_blank">crun.mk</a><br>
&gt; +++ b/package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer" targe=
t=3D"_blank">crun.mk</a><br>
&gt; @@ -36,4 +36,11 @@ else<br>
&gt;=C2=A0 CRUN_CONF_OPTS +=3D --disable-systemd<br>
&gt;=C2=A0 endif<br>
&gt;<br>
<br>
This patch is still good, seems stalled though, can we merge?<br>
<br>
Thanks!<br>
Christian<br>
<br>
<br>
------------------------------<br>
<br>
Message: 6<br>
Date: Sun, 08 Jan 2023 06:42:17 -0000<br>
From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
To: <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
Subject: [Buildroot] [<a href=3D"http://autobuild.buildroot.net" rel=3D"nor=
eferrer" target=3D"_blank">autobuild.buildroot.net</a>] Daily results for<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2023-01-07<br>
Message-ID: &lt;<a href=3D"mailto:20230108064223.E8C8060A9D@smtp3.osuosl.or=
g" target=3D"_blank">20230108064223.E8C8060A9D@smtp3.osuosl.org</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
<br>
Hello,<br>
<br>
Autobuild statistics for 2023-01-07<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0 =C2=A0 =C2=A0 branch |=C2=A0 OK | NOK | TIM | TOT |<br>
=C2=A0 2022.02.x=C2=A0 |=C2=A0 2=C2=A0 |=C2=A0 0=C2=A0 |=C2=A0 0=C2=A0 |=C2=
=A0 2=C2=A0 |<br>
=C2=A0 2022.11.x=C2=A0 | 15=C2=A0 | 12=C2=A0 |=C2=A0 0=C2=A0 | 27=C2=A0 |<b=
r>
=C2=A0 =C2=A0 master=C2=A0 =C2=A0| 176 | 348 |=C2=A0 0=C2=A0 | 524 |<br>
<br>
Classification of failures by reason for master<br>
-----------------------------------------------<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bash-5=
.2.15 | 29<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.0=
 | 21<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fwup-=
1.9.1 | 19<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-fwup-1.9.1 | 16=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-sentry-cli-2.8.0 | 15<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0xz-5.2.10 | 12<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bat-0=
.19.0 | 10<br>
=C2=A0 gobject-introspection-1.72.0 | 9 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jack2-1.9.21=
 | 8 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-=
6.1.2 | 8 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dust-=
0.8.1 | 7 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-binutils-2.38 | 7 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pixz-=
1.0.7 | 7 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-rust-1.66.0 | 6 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg-=
0.4.5 | 6 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unknown | 6 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0janus-gateway-1.1.1 | 5 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crun-=
1.7.2 | 4 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dahdi-linux-3.2.0 | 4 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elfutils-0.186 | 4 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-pahole-1.24 | 4 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libglib2-2.72.3 | 4 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 norm-=
1.5.8 | 4 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-bcrypt-4.0.1 | 4 <br>
=C2=A0 =C2=A0 python-cryptography-38.0.4 | 4 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gerbera-1.10.0 | 3 =
<br>
glibc-2.36-66-ga1dc0be03c9d... | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gvfs-1=
.48.1 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-go-1.19.4 | 3 =
<br>
=C2=A0 =C2=A0 host-python-greenlet-2.0.1 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgpg-error-1.46 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ntp-4.2.8p15=
 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ocf-linux-20171122 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-bunch-1.0.1 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 quickjs-2021-03-27 | 3 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wolfssl-5.5.3=
 | 3 <br>
=C2=A0 binutils-arc-2020.09-release | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boost-1.80.0=
 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0efivar-38 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fftw-quad-3.3.8 | 2 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fontconfig-2.13.1 | 2 <br>
gummiboot-2bcd919c681c952eb... | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-binutils-2.39 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcrypt-1.10.1 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mender-3.4.0=
 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optee-client-3.19.0 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perl-5=
.34.1 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ply-2.3.0 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-numpy-1.23.5 | 2 <br>
ripgrep-af6b6c543b224d348a8... | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sudo-1.9.12p1=
 | 2 <br>
toolchain-external-codescap... | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uclibc-1.0.42=
 | 2 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zabbix-5.4.9=
 | 2 <br>
/home/buildroot/autobuild/i... | 1 <br>
android-tools-4.2.2+git2013... | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apcupsd-3.14.14 | 1 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assimp-5.2.5=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avro-c-1.11.1=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bind-9.16.33=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bluez5_utils-5.65 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmocka-1.1.5=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctorrent-dnh3.3.2 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dieharder-3.31.1.4 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmalloc-5.6.5=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethtoo=
l-6.1 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flann-=
1.9.2 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0freeradius-client-1.1.7 | 1 <br>
fs/cramfs/<a href=3D"http://cramfs.mk:46" rel=3D"noreferrer" target=3D"_bla=
nk">cramfs.mk:46</a>: /tm... | 1 <br>
fs/ubifs/<a href=3D"http://ubifs.mk:49" rel=3D"noreferrer" target=3D"_blank=
">ubifs.mk:49</a>: /home... | 1 <br>
fs/ubifs/<a href=3D"http://ubifs.mk:49" rel=3D"noreferrer" target=3D"_blank=
">ubifs.mk:49</a>: /home... | 1 <br>
fs/ubifs/<a href=3D"http://ubifs.mk:49" rel=3D"noreferrer" target=3D"_blank=
">ubifs.mk:49</a>: /home... | 1 <br>
fs/ubifs/<a href=3D"http://ubifs.mk:49" rel=3D"noreferrer" target=3D"_blank=
">ubifs.mk:49</a>: /tmp/... | 1 <br>
google-breakpad-c85eb4a59b6... | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-delve-1.20.0 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0host-gcc-initial-10.4.0 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0host-gcc-initial-12.2.0 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-gdb-12.1=
 | 1 <br>
host-spirv-llvm-translator-... | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hyperfine-1.14.0 | 1 <br>
jq-a17dd3248a666d01be75f6b1... | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json-c=
-0.16 | 1 <br>
kvmtool-f77d646ba01d04be5aa... | 1 <br>
libcamera-ba6435930f08e802c... | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libcap-ng-0.8.3 | 1 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libressl-3.6.1 | 1 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libuhttpd-3.14.1 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-5.10.145-cip17 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 linux-5.10.145-cip17-rt7 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-=
tools | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lirc-tools-0.10.2 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ltp-testsuite-20220930 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0lxc-5.0.1 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndisc6-1.0.6=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nerdctl-1.0.0=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcre2-=
10.42 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pdbg-3.5 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipewire-0.3.62 | 1 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proftpd-1.3.8=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proxychains-ng-4.16 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-3.11.1 | 1 =
<br>
rtl8812au-aircrack-ng-e7a4a... | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtl_433-22.11=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdl-1=
.2.15 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed-4.9 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sscep-0.10.0=
 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trinit=
y-1.9 | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0valgrind-3.19.0 | 1 =
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wireshark-legal-info | 1 <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zstd-=
1.5.2 | 1 <br>
<br>
<br>
Detail of failures for master<br>
-----------------------------<br>
<br>
=C2=A0 =C2=A0 arch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0reason=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| OK? |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| orph?<br>
-------------+--------------------------------+-----+----------------------=
-----------------------------------------------------------+-------<br>
microblazeel | /home/buildroot/autobuild/i... | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/642d168a588c27d66503708af100aba717469954" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/64=
2d168a588c27d66503708af100aba717469954</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0mips64=C2=A0 =C2=A0 | android-tools-4.2.2+git2013... | NOK | <=
a href=3D"http://autobuild.buildroot.net/results/53af325806eb9bcc6e717f03a8=
e2269be6485014" rel=3D"noreferrer" target=3D"_blank">http://autobuild.build=
root.net/results/53af325806eb9bcc6e717f03a8e2269be6485014</a> |=C2=A0 =C2=
=A0 =C2=A0<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 apcupsd-=
3.14.14=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/12d53cc8cd966a271beb8764f00b5bfd3e1db31f" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/12d53cc8=
cd966a271beb8764f00b5bfd3e1db31f</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
ssimp-5.2.5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/fe6b0acb974a536a0d286210b3f60f2b37811bb1" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/fe=
6b0acb974a536a0d286210b3f60f2b37811bb1</a> | ORPH<br>
=C2=A0 mips64el=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avro-c-1.11.=
1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/ce4e9011d4ef9f550d483d79da6cbf6f9dda197a" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/ce4e9011d4ef9=
f550d483d79da6cbf6f9dda197a</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0sparc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/719e03e6c0e1d32a2739768933a7f7477f6c43d4"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/719e03e6c0e1d32a2739768933a7f7477f6c43d4</a> | ORPH<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/bee0297601f9f657ae2171bd5c564b73eb3d3de2"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/bee0297601f9f657ae2171bd5c564b73eb3d3de2</a> | ORPH<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/4d26f7f99413144e2f71c726547c6891cd4ff68d"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/4d26f7f99413144e2f71c726547c6891cd4ff68d</a> | ORPH<br>
=C2=A0 =C2=A0sparc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/5a30ac60720bd19fd7bf4ee3d6262e2b32dd9457"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/5a30ac60720bd19fd7bf4ee3d6262e2b32dd9457</a> | ORPH<br>
=C2=A0 =C2=A0mipsel=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/ac1188b3daeac3a0be187f32587dbcee9044057d" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/ac=
1188b3daeac3a0be187f32587dbcee9044057d</a> | ORPH<br>
=C2=A0 mips64el=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/1282068df78cfaa4fe288139941fc2abd177f1db" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/1282068d=
f78cfaa4fe288139941fc2abd177f1db</a> | ORPH<br>
=C2=A0 =C2=A0mips64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/d31b42d80ee1b94c218b11d0fb14cf1db9b85e7a" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/d3=
1b42d80ee1b94c218b11d0fb14cf1db9b85e7a</a> | ORPH<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/665b4cb978d4504661d92223ffc140fa47473855"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/665b4cb978d4504661d92223ffc140fa47473855</a> | ORPH<br>
=C2=A0 aarch64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/893922590b1fbd55a831b4211d2045f41dc61d60" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/89392259=
0b1fbd55a831b4211d2045f41dc61d60</a> | ORPH<br>
=C2=A0 mips64el=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/3ce3fbb415cda1c18851b10c910a4b636c0f6bd4" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/3ce3fbb4=
15cda1c18851b10c910a4b636c0f6bd4</a> | ORPH<br>
=C2=A0 =C2=A0mips64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/44b9bb0400bf77b0fd31244a805b78ee5ccc3791" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/44=
b9bb0400bf77b0fd31244a805b78ee5ccc3791</a> | ORPH<br>
=C2=A0 =C2=A0 m68k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/9ca35d21db6f3c209b6f166cb483b3173a83a367"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/9ca35d21db6f3c209b6f166cb483b3173a83a367</a> | ORPH<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/2446091658021b6e565f9de608c12bb56ed071fb"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/2446091658021b6e565f9de608c12bb56ed071fb</a> | ORPH<br>
=C2=A0 powerpc=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/78a665ff897bd977ce3f1165dd612331a3baab6e" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/78a665ff=
897bd977ce3f1165dd612331a3baab6e</a> | ORPH<br>
=C2=A0 =C2=A0mipsel=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/3d903d4dd7490b903a318be3cb74ecde94eb2b55" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/3d=
903d4dd7490b903a318be3cb74ecde94eb2b55</a> | ORPH<br>
=C2=A0 powerpc=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/601e8346cabcd91352f7fbfcc59d3d9a132d027b" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/601e8346=
cabcd91352f7fbfcc59d3d9a132d027b</a> | ORPH<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/07013c9c143f81d848e27741d482afa5efbe9daf"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/07013c9c143f81d848e27741d482afa5efbe9daf</a> | ORPH<br>
=C2=A0 =C2=A0 m68k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/0569796080f1a8e5478f7d72007b889b8500fa51"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/0569796080f1a8e5478f7d72007b889b8500fa51</a> | ORPH<br>
=C2=A0 =C2=A0armeb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/fb723fe78e79a5a1bd4acceca4304fa3ac5ddbb7"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/fb723fe78e79a5a1bd4acceca4304fa3ac5ddbb7</a> | ORPH<br>
=C2=A0 =C2=A0xtensa=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/0fb7ba52530f18ac91962f9dbf8d349d2c4d714e" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/0f=
b7ba52530f18ac91962f9dbf8d349d2c4d714e</a> | ORPH<br>
=C2=A0 =C2=A0xtensa=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/9b06fa6c65bfcb9c89738c07d60f5375298f75ae" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/9b=
06fa6c65bfcb9c89738c07d60f5375298f75ae</a> | ORPH<br>
=C2=A0 =C2=A0sparc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/fe8b5070b2e580d4da18504867089a6ea356fde4"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/fe8b5070b2e580d4da18504867089a6ea356fde4</a> | ORPH<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/da8aedff11a22929d178dd08855e7627c4317e4a"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/da8aedff11a22929d178dd08855e7627c4317e4a</a> | ORPH<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/14dcad9c7b57c1952d17622020a330f08066ec60"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/14dcad9c7b57c1952d17622020a330f08066ec60</a> | ORPH<br>
=C2=A0 =C2=A0mips64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/30925704f014308234bb49ee13b677813448c038" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/30=
925704f014308234bb49ee13b677813448c038</a> | ORPH<br>
=C2=A0microblaze=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.b=
uildroot.net/results/f63bf5c6c8f3e186effba6bfe987cdaff8475ac5" rel=3D"noref=
errer" target=3D"_blank">http://autobuild.buildroot.net/results/f63bf5c6c8f=
3e186effba6bfe987cdaff8475ac5</a> | ORPH<br>
=C2=A0 aarch64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5.2.15=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/8d1405d80fe58ebdfadae9e971b225d5b8fc65f1" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/8d1405d8=
0fe58ebdfadae9e971b225d5b8fc65f1</a> | ORPH<br>
=C2=A0 =C2=A0mipsel=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bash-5=
.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/f0e404c4f4e7a83fa6bb21d109a4c56a08676b5c" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/f0=
e404c4f4e7a83fa6bb21d109a4c56a08676b5c</a> | ORPH<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ash-5.2.15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/a8dac82e4ca056ed875b461a98884739615b25e1"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/a8dac82e4ca056ed875b461a98884739615b25e1</a> | ORPH<br>
=C2=A0 =C2=A0x86_64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bat-0.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/4d292ce185e109f20392630c69a0d5b0c3ecb1aa"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/4d292ce185e109f20392630c69a0d5b0c3ecb1aa</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bat-0=
.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/b350f152b51676143b999263f4680ed70bdea3e9" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/b3=
50f152b51676143b999263f4680ed70bdea3e9</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 i686=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bat-0.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/3112119a2ddbc9510dbcecb5634ff3eecf3=
3ea08" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/3112119a2ddbc9510dbcecb5634ff3eecf33ea08</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bat-0=
.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/30f547ed5c88e5e944768feb7a80c70855532ef2" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/30=
f547ed5c88e5e944768feb7a80c70855532ef2</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bat-0=
.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/5ad5d967593843cf77bb24d67c1d12406920cc99" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/5a=
d5d967593843cf77bb24d67c1d12406920cc99</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bat-0=
.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/420d8d3e617a8194fafa481603bd66a2ce610e5d" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/42=
0d8d3e617a8194fafa481603bd66a2ce610e5d</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0mipsel=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bat-0.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/091c953da7433387369f93734ea400531ad1d939"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/091c953da7433387369f93734ea400531ad1d939</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 arm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bat-0.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/d3c6bd6fa13608a9ba59b9d7e584c6f749d=
2108c" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/d3c6bd6fa13608a9ba59b9d7e584c6f749d2108c</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 aarch64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bat-0=
.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/1cf04c154d3224fd74050e0e46ebb9ed0af5e61b" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/1c=
f04c154d3224fd74050e0e46ebb9ed0af5e61b</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0x86_64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bat-0.19.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/b1032984f29bbcabf918014d8e599873bd8c4429"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/b1032984f29bbcabf918014d8e599873bd8c4429</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 sh4a=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ind-9.16.33=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/c6ce0a58be4db4b2d84dd828b49e4bfd24151c13" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/c6=
ce0a58be4db4b2d84dd828b49e4bfd24151c13</a> | ORPH<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 binutils-arc-2020.09-release=
=C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/3fc4780d44=
f7dbcd9072830a949b26144d5ff5b5" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.net/results/3fc4780d44f7dbcd9072830a949b26144d5ff5b5</=
a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 binutils-arc-2020.09-release=
=C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/87f10a1f18=
027b291608fb33479d96be53d0db2a" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.net/results/87f10a1f18027b291608fb33479d96be53d0db2a</=
a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 sh4a=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0bluez5_ut=
ils-5.65=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/739a1ebb6f4905d0254281658c56c0fed81488e3" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/739a1ebb6f490=
5d0254281658c56c0fed81488e3</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
oost-1.80.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/c351c186a8a9623bd6c93482c7391cf420daf30b" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/c3=
51c186a8a9623bd6c93482c7391cf420daf30b</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
oost-1.80.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/fc9b61082cf3e9442c87a1aaeb8503b61a9ca042" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/fc=
9b61082cf3e9442c87a1aaeb8503b61a9ca042</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0nios2=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/e5e017fa17f0977cf5f5cd36a05dc50e68ed254e" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/e5=
e017fa17f0977cf5f5cd36a05dc50e68ed254e</a> | ORPH<br>
=C2=A0 =C2=A0armeb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/dc1ab74bc462cbe36ef1655bfff836da4eb0fa6d" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/dc=
1ab74bc462cbe36ef1655bfff836da4eb0fa6d</a> | ORPH<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/300ddad3ec01107068a3de530ea5f4e4999a9d83" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/30=
0ddad3ec01107068a3de530ea5f4e4999a9d83</a> | ORPH<br>
=C2=A0 =C2=A0mips64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle=
-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/2988246e2a567ea5e7383702172f18586568d7e9" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/2988246e=
2a567ea5e7383702172f18586568d7e9</a> | ORPH<br>
=C2=A0 =C2=A0mips64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle=
-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/41af120595836ae414f737aeab582e6e14365385" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/41af1205=
95836ae414f737aeab582e6e14365385</a> | ORPH<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.n=
et/results/9b161dbab6a6c51d586f4ee2fed8dd796d597e40" rel=3D"noreferrer" tar=
get=3D"_blank">http://autobuild.buildroot.net/results/9b161dbab6a6c51d586f4=
ee2fed8dd796d597e40</a> | ORPH<br>
=C2=A0 =C2=A0s390x=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/f772374e2d31d5d30bd7639b05735e87553f687a" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/f7=
72374e2d31d5d30bd7639b05735e87553f687a</a> | ORPH<br>
=C2=A0 =C2=A0nios2=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/0f4291b4c60fee73f966c6d8cb743a592d2d436e" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/0f=
4291b4c60fee73f966c6d8cb743a592d2d436e</a> | ORPH<br>
=C2=A0 aarch64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/452ba9ecd1e87ef62a2c3636d4cc2d7de3d97a2a" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/452ba9ecd1e87=
ef62a2c3636d4cc2d7de3d97a2a</a> | ORPH<br>
=C2=A0 =C2=A0nios2=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/1b3f53afde542fa0579fba4549a98b4c9a6faa0e" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/1b=
3f53afde542fa0579fba4549a98b4c9a6faa0e</a> | ORPH<br>
=C2=A0 aarch64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/c00e06f743b30771c3600ce1a39d9e7d16c3156a" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/c00e06f743b30=
771c3600ce1a39d9e7d16c3156a</a> | ORPH<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/c4720c38d341d91bee6cabbfb38988a8c30e4381" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/c4720c38d341d=
91bee6cabbfb38988a8c30e4381</a> | ORPH<br>
=C2=A0 =C2=A0x86_64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle=
-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/d68b04ec97fe1e9ef85b8ef51651f6866511a80f" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/d68b04ec=
97fe1e9ef85b8ef51651f6866511a80f</a> | ORPH<br>
=C2=A0 =C2=A0x86_64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle=
-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/8f85e0bd345265f768184b9b1a36237ddcdf43c3" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/8f85e0bd=
345265f768184b9b1a36237ddcdf43c3</a> | ORPH<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/78905a48b4feaf8bfd17364a8a9a1ef1d3278fcf" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/78905a48b4fea=
f8bfd17364a8a9a1ef1d3278fcf</a> | ORPH<br>
=C2=A0 =C2=A0s390x=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/26b705ef62d285ea649bbfe057b93e07d23a50a6" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/26=
b705ef62d285ea649bbfe057b93e07d23a50a6</a> | ORPH<br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/070a217f7b578b44d9654dbacf59d887250e84e2" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/070a217f7b578=
b44d9654dbacf59d887250e84e2</a> | ORPH<br>
=C2=A0 =C2=A0 or1k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/886b2b8f5514b66c67504107bc1fd1fc4c368a5f" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/88=
6b2b8f5514b66c67504107bc1fd1fc4c368a5f</a> | ORPH<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/aa682e37ac58f38ed6c412805471063fc11aaf47" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/aa682e37ac58f=
38ed6c412805471063fc11aaf47</a> | ORPH<br>
=C2=A0 =C2=A0 or1k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ustle-0.8.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/f0ffacd790a22aefba4f54a48e92b8f5105b5d8d" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/f0=
ffacd790a22aefba4f54a48e92b8f5105b5d8d</a> | ORPH<br>
=C2=A0microblaze=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bustle-0.8.0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildro=
ot.net/results/0d6c4a46e810c9a7ed0a4200a1c74271a99b48aa" rel=3D"noreferrer"=
 target=3D"_blank">http://autobuild.buildroot.net/results/0d6c4a46e810c9a7e=
d0a4200a1c74271a99b48aa</a> | ORPH<br>
=C2=A0 =C2=A0 arm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
mocka-1.1.5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/d5506c9b5158fa19dc85af3091507d0df83bec47" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/d5=
506c9b5158fa19dc85af3091507d0df83bec47</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 arm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0crun-1.7.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/89c5cde0a0aeb2da4c42d9a999386f85f42=
1056b" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/89c5cde0a0aeb2da4c42d9a999386f85f421056b</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 =C2=A0 m68k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0crun-1.7.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/d856901105237e9f9333a2d9d317c85fc8f=
37311" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/d856901105237e9f9333a2d9d317c85fc8f37311</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 =C2=A0 arc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0crun-1.7.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/e8334e2a0b7eeb3033659f3c60ad446c7b0=
4cba0" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/e8334e2a0b7eeb3033659f3c60ad446c7b04cba0</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 riscv64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crun-=
1.7.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/19829e70de4f24db9384f84f066de2d520df810b" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/19=
829e70de4f24db9384f84f066de2d520df810b</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 riscv64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0ctorrent-dnh3.3.2=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.n=
et/results/709da1e7ad61f89e148286aed9a369daad8d974e" rel=3D"noreferrer" tar=
get=3D"_blank">http://autobuild.buildroot.net/results/709da1e7ad61f89e14828=
6aed9a369daad8d974e</a> |=C2=A0 =C2=A0 =C2=A0<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0dahdi-linux-3.2.0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results=
/c3f3b4702f81de7ee72e8f76e0cc06f04c1d0c53" rel=3D"noreferrer" target=3D"_bl=
ank">http://autobuild.buildroot.net/results/c3f3b4702f81de7ee72e8f76e0cc06f=
04c1d0c53</a> |=C2=A0 =C2=A0 =C2=A0<br>
microblazeel |=C2=A0 =C2=A0 =C2=A0 =C2=A0dahdi-linux-3.2.0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/7052cf=
d674ce7223e012efa225336c763c742181" rel=3D"noreferrer" target=3D"_blank">ht=
tp://autobuild.buildroot.net/results/7052cfd674ce7223e012efa225336c763c7421=
81</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 riscv32=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0dahdi-linux-3.2.0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.n=
et/results/bd6b75272cb1ba0f91e400e4650676cf88d9a79b" rel=3D"noreferrer" tar=
get=3D"_blank">http://autobuild.buildroot.net/results/bd6b75272cb1ba0f91e40=
0e4650676cf88d9a79b</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0armeb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0dahdi-lin=
ux-3.2.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/7f25e6d172320563d40e3faa0a6cd0a50c78bc9d" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/7f25e6d172320=
563d40e3faa0a6cd0a50c78bc9d</a> |=C2=A0 =C2=A0 =C2=A0<br>
microblazeel |=C2=A0 =C2=A0 =C2=A0 =C2=A0dieharder-3.31.1.4=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.net/results/e532=
000eaff86803cd6c2e34aa20474c53a4fa53" rel=3D"noreferrer" target=3D"_blank">=
http://autobuild.buildroot.net/results/e532000eaff86803cd6c2e34aa20474c53a4=
fa53</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 powerpc=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmalloc-5.6.=
5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.bui=
ldroot.net/results/8a7be3fd8a25fbb523bba91610f9872cffbc982e" rel=3D"norefer=
rer" target=3D"_blank">http://autobuild.buildroot.net/results/8a7be3fd8a25f=
bb523bba91610f9872cffbc982e</a> | ORPH<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dust-0.8.1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.b=
uildroot.net/results/29890fa63a695b7ab1b0cfe365419edc222b8aa4" rel=3D"noref=
errer" target=3D"_blank">http://autobuild.buildroot.net/results/29890fa63a6=
95b7ab1b0cfe365419edc222b8aa4</a> | ORPH<br>
=C2=A0 powerpc=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dust-=
0.8.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/f7b33e620e0495624cacdb5bf641e7423fc42afd" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/f7=
b33e620e0495624cacdb5bf641e7423fc42afd</a> | ORPH<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dust-0.8.1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.b=
uildroot.net/results/62f523f190884b48e1f5c1d5151f6149f74fdcd6" rel=3D"noref=
errer" target=3D"_blank">http://autobuild.buildroot.net/results/62f523f1908=
84b48e1f5c1d5151f6149f74fdcd6</a> | ORPH<br>
=C2=A0 =C2=A0s390x=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dust-0.8.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/610af4232acd1b67229d2dc6991ce09742e=
dc493" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/610af4232acd1b67229d2dc6991ce09742edc493</a> | ORPH<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dust-=
0.8.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/33902543b80a09c8a1644f4a1a351c638d8ceffa" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/33=
902543b80a09c8a1644f4a1a351c638d8ceffa</a> | ORPH<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0dust-0.8.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/30b69204131dc3057b02fdbaeda462ae7b7=
8b0b5" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/30b69204131dc3057b02fdbaeda462ae7b78b0b5</a> | ORPH<br>
=C2=A0 =C2=A0mipsel=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
dust-0.8.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/e69b04902e2a79409ca37cad6961b057d7fb2b9d"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/e69b04902e2a79409ca37cad6961b057d7fb2b9d</a> | ORPH<br>
=C2=A0 aarch64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0efiva=
r-38=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/9622d506dfdbe9a44f0acfae25bff69155f55b6e" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/96=
22d506dfdbe9a44f0acfae25bff69155f55b6e</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 arm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0efivar-38=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D=
"http://autobuild.buildroot.net/results/1b50677481f14de85875652a305a4334e30=
3ed53" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/1b50677481f14de85875652a305a4334e303ed53</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
microblazeel |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elfutils-0.186=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.net/resu=
lts/f730c0bb8be5701eba34c796d4f6ce35d75d44c6" rel=3D"noreferrer" target=3D"=
_blank">http://autobuild.buildroot.net/results/f730c0bb8be5701eba34c796d4f6=
ce35d75d44c6</a> | ORPH<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0el=
futils-0.186=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/5427c661c850a48f61909db5c8a66195ac8bde87" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/54=
27c661c850a48f61909db5c8a66195ac8bde87</a> | ORPH<br>
microblazeel |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elfutils-0.186=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.net/resu=
lts/d3394e6e2b4083a4c2a9d5200d46239aa8116f4f" rel=3D"noreferrer" target=3D"=
_blank">http://autobuild.buildroot.net/results/d3394e6e2b4083a4c2a9d5200d46=
239aa8116f4f</a> | ORPH<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0el=
futils-0.186=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/871523f947a56c47cef673f977b3fd9a87eab08c" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/87=
1523f947a56c47cef673f977b3fd9a87eab08c</a> | ORPH<br>
=C2=A0 =C2=A0x86_64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethtoo=
l-6.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/1560c14dc6715cbd49d0efca0d1c8289b1e7dc6a" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/15=
60c14dc6715cbd49d0efca0d1c8289b1e7dc6a</a> |=C2=A0 =C2=A0 =C2=A0<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 fftw-quad-3.3.8=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.net/resu=
lts/5d6587e1180fb795fc55437fb2471eac57b1e041" rel=3D"noreferrer" target=3D"=
_blank">http://autobuild.buildroot.net/results/5d6587e1180fb795fc55437fb247=
1eac57b1e041</a> | ORPH<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 fftw-quad-3.3.8=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.net/resu=
lts/96982382b558338fb5a219f3ba951f95006111e8" rel=3D"noreferrer" target=3D"=
_blank">http://autobuild.buildroot.net/results/96982382b558338fb5a219f3ba95=
1f95006111e8</a> | ORPH<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
lann-1.9.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http:=
//autobuild.buildroot.net/results/0c93e5ff99c57536bbe6001f1d258c738d76e36c"=
 rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/result=
s/0c93e5ff99c57536bbe6001f1d258c738d76e36c</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 riscv64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0fontconfig-2.13.1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.n=
et/results/7adc5978b1f655c844aebf9eb733c721c0500b41" rel=3D"noreferrer" tar=
get=3D"_blank">http://autobuild.buildroot.net/results/7adc5978b1f655c844aeb=
f9eb733c721c0500b41</a> | ORPH<br>
=C2=A0 riscv64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0fontconfig-2.13.1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.n=
et/results/5ab12a1eeca15375b67fd828e60e62d9d08634f5" rel=3D"noreferrer" tar=
get=3D"_blank">http://autobuild.buildroot.net/results/5ab12a1eeca15375b67fd=
828e60e62d9d08634f5</a> | ORPH<br>
=C2=A0 riscv64=C2=A0 =C2=A0 |=C2=A0 =C2=A0 freeradius-client-1.1.7=C2=A0 =
=C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.net/results/22e7=
2d9d4e8ba3e65a05385561239976ee66e6c4" rel=3D"noreferrer" target=3D"_blank">=
http://autobuild.buildroot.net/results/22e72d9d4e8ba3e65a05385561239976ee66=
e6c4</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0aarch64_be=C2=A0 | fs/cramfs/<a href=3D"http://cramfs.mk:46" rel=3D"n=
oreferrer" target=3D"_blank">cramfs.mk:46</a>: /tm... | NOK | <a href=3D"ht=
tp://autobuild.buildroot.net/results/2df7bfcf94a0ea6cdcf7e87757e6f4461115a7=
f6" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/res=
ults/2df7bfcf94a0ea6cdcf7e87757e6f4461115a7f6</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 mips64el=C2=A0 =C2=A0| fs/ubifs/<a href=3D"http://ubifs.mk:49" rel=
=3D"noreferrer" target=3D"_blank">ubifs.mk:49</a>: /home... | NOK | <a href=
=3D"http://autobuild.buildroot.net/results/0806f7373086ebbcbd680b94f594225e=
06b679e3" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.n=
et/results/0806f7373086ebbcbd680b94f594225e06b679e3</a> |=C2=A0 =C2=A0 =C2=
=A0<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0| fs/ubifs/<a href=3D"http://ubifs.mk=
:49" rel=3D"noreferrer" target=3D"_blank">ubifs.mk:49</a>: /home... | NOK |=
 <a href=3D"http://autobuild.buildroot.net/results/c0082772c6d3875e434609ab=
ec850ce3510da32e" rel=3D"noreferrer" target=3D"_blank">http://autobuild.bui=
ldroot.net/results/c0082772c6d3875e434609abec850ce3510da32e</a> |=C2=A0 =C2=
=A0 =C2=A0<br>
=C2=A0 =C2=A0sparc=C2=A0 =C2=A0 =C2=A0| fs/ubifs/<a href=3D"http://ubifs.mk=
:49" rel=3D"noreferrer" target=3D"_blank">ubifs.mk:49</a>: /home... | NOK |=
 <a href=3D"http://autobuild.buildroot.net/results/61c233700d696d0ce9776c8e=
7e3dea513c39c5de" rel=3D"noreferrer" target=3D"_blank">http://autobuild.bui=
ldroot.net/results/61c233700d696d0ce9776c8e7e3dea513c39c5de</a> |=C2=A0 =C2=
=A0 =C2=A0<br>
=C2=A0 =C2=A0s390x=C2=A0 =C2=A0 =C2=A0| fs/ubifs/<a href=3D"http://ubifs.mk=
:49" rel=3D"noreferrer" target=3D"_blank">ubifs.mk:49</a>: /tmp/... | NOK |=
 <a href=3D"http://autobuild.buildroot.net/results/108c8686239aa88e42a6e2cc=
53bbb46db44cee07" rel=3D"noreferrer" target=3D"_blank">http://autobuild.bui=
ldroot.net/results/108c8686239aa88e42a6e2cc53bbb46db44cee07</a> |=C2=A0 =C2=
=A0 =C2=A0<br>
=C2=A0aarch64_be=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-1.9.1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/754252fe31d86c18951d019c9e2c504affe3d232" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/754252fe=
31d86c18951d019c9e2c504affe3d232</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/58a40e6df56ff5aa27ab944b01e20e24c44=
8df4b" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/58a40e6df56ff5aa27ab944b01e20e24c448df4b</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 mips64el=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/2ca7a6dc110aaf9ed91fb5540f4cfca6d420e209" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/2c=
a7a6dc110aaf9ed91fb5540f4cfca6d420e209</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0s390x=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/e4ce13b7d500bcfa29454e570fad0a3b5eb=
b07ed" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/e4ce13b7d500bcfa29454e570fad0a3b5ebb07ed</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 =C2=A0 or1k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/f5b0425b8e70ae494d7fe5c08f28c4defb3=
caac2" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/f5b0425b8e70ae494d7fe5c08f28c4defb3caac2</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/b569e14015b06ceceb71b350bd4bcd2ff4841fdd" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/b5=
69e14015b06ceceb71b350bd4bcd2ff4841fdd</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 m68k=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/1288297bb411d905264edfae93f0981cfb7=
2d5be" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/1288297bb411d905264edfae93f0981cfb72d5be</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/d97639c44a18d7cb537fb5aa6e039e966b8=
aae89" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/d97639c44a18d7cb537fb5aa6e039e966b8aae89</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0aarch64_be=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-1.9.1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/c2a862fd7aa3bbbab15958d9627767685f7062d8" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/c2a862fd=
7aa3bbbab15958d9627767685f7062d8</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 powerpc=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/2fbc89cb39bf4c36e4b1199d6b747975686f3dfc" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/2f=
bc89cb39bf4c36e4b1199d6b747975686f3dfc</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0sparc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/7b7807cb8f93d414c6f1471b8699617f03e=
f8427" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/7b7807cb8f93d414c6f1471b8699617f03ef8427</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/1c90ef36a6a8e2166842a95647c1a6a58c740be4" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/1c=
90ef36a6a8e2166842a95647c1a6a58c740be4</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0powerpc64=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/23678904d9a4b35ea2821747b26e9b56fdd7fcf6" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/23=
678904d9a4b35ea2821747b26e9b56fdd7fcf6</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 arm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/05800ca7ac86ab52ca5904aedf10d4e3b43=
09061" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/05800ca7ac86ab52ca5904aedf10d4e3b4309061</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/240eed608aca0fc3679b4743dcf37e2faa7=
c2907" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/240eed608aca0fc3679b4743dcf37e2faa7c2907</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0microblaze=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-1.9.1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/24942a167c32cacf93f962438c2b04e13b67d507" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/24942a16=
7c32cacf93f962438c2b04e13b67d507</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 mips64el=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/aca1164826222255cd09cb72b6cc7958af1190a2" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/ac=
a1164826222255cd09cb72b6cc7958af1190a2</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0armeb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0fwup-1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D=
"http://autobuild.buildroot.net/results/6bba275fcf0301bd7ce6b12fbc223a3eeb5=
4df40" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/=
results/6bba275fcf0301bd7ce6b12fbc223a3eeb54df40</a> |=C2=A0 =C2=A0 =C2=A0<=
br>
=C2=A0 mips64el=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fwup-=
1.9.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/d5b8d9cc1917f6adb66589a40902d173d595550e" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/d5=
b8d9cc1917f6adb66589a40902d173d595550e</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0mipsel=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gerbera=
-1.10.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuil=
d.buildroot.net/results/0abcda70a45ae731b9e9e2a52ad16a63d12c8c2f" rel=3D"no=
referrer" target=3D"_blank">http://autobuild.buildroot.net/results/0abcda70=
a45ae731b9e9e2a52ad16a63d12c8c2f</a> |=C2=A0 =C2=A0 =C2=A0<br>
powerpc64le=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gerbera-1.10.0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.buildroot.ne=
t/results/fbfbd57645e66c4ae68b0a226542dfa5927308ee" rel=3D"noreferrer" targ=
et=3D"_blank">http://autobuild.buildroot.net/results/fbfbd57645e66c4ae68b0a=
226542dfa5927308ee</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ge=
rbera-1.10.0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://aut=
obuild.buildroot.net/results/7f43ee87e7bb05f1d376b3e2c081ac1b0de3ef3c" rel=
=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/results/7f=
43ee87e7bb05f1d376b3e2c081ac1b0de3ef3c</a> |=C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0arceb=C2=A0 =C2=A0 =C2=A0| glibc-2.36-66-ga1dc0be03c9d... | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/bc65f0ccd0ec27af01753=
c185138ee99d1cf15d1" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/bc65f0ccd0ec27af01753c185138ee99d1cf15d1</a> |=C2=A0 =
=C2=A0 =C2=A0<br>
=C2=A0 powerpc=C2=A0 =C2=A0 | glibc-2.36-66-ga1dc0be03c9d... | NOK | <a hre=
f=3D"http://autobuild.buildroot.net/results/d50fd5557f15835946e59340f3078b0=
2ec6d4eab" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.=
net/results/d50fd5557f15835946e59340f3078b02ec6d4eab</a> |=C2=A0 =C2=A0 =C2=
=A0<br>
=C2=A0 powerpc=C2=A0 =C2=A0 | glibc-2.36-66-ga1dc0be03c9d... | NOK | <a hre=
f=3D"http://autobuild.buildroot.net/results/f7156c57004897dd86b537852330681=
1ceb2deb3" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.=
net/results/f7156c57004897dd86b5378523306811ceb2deb3</a> |=C2=A0 =C2=A0 =C2=
=A0<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 gobject-introspection-1.72.0=C2=A0 | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/accf137b5973d9056f306=
198e51e0427bbcc9569" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/accf137b5973d9056f306198e51e0427bbcc9569</a> | ORPH<b=
r>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 gobject-introspection-1.72.0=C2=A0 | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/e820baaa1f3c219f8ba4d=
756071d55e2af634cb1" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/e820baaa1f3c219f8ba4d756071d55e2af634cb1</a> | ORPH<b=
r>
=C2=A0 =C2=A0s390x=C2=A0 =C2=A0 =C2=A0|=C2=A0 gobject-introspection-1.72.0=
=C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/43aa7481e1=
3a02b98631f3f7acfebb4f0fe4d704" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.net/results/43aa7481e13a02b98631f3f7acfebb4f0fe4d704</=
a> | ORPH<br>
=C2=A0 =C2=A0 mips=C2=A0 =C2=A0 =C2=A0|=C2=A0 gobject-introspection-1.72.0=
=C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/25ab8d6cdd=
bbd3eef8e3cedb7a9343c8019665f4" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.net/results/25ab8d6cddbbd3eef8e3cedb7a9343c8019665f4</=
a> | ORPH<br>
=C2=A0 =C2=A0nios2=C2=A0 =C2=A0 =C2=A0|=C2=A0 gobject-introspection-1.72.0=
=C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/4644e89287=
285d9b790fc4e613345b8aba20354c" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.net/results/4644e89287285d9b790fc4e613345b8aba20354c</=
a> | ORPH<br>
powerpc64le=C2=A0 |=C2=A0 gobject-introspection-1.72.0=C2=A0 | NOK | <a hre=
f=3D"http://autobuild.buildroot.net/results/65ae3d5aae076619ed5651340ec3d34=
01bc15b2d" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.=
net/results/65ae3d5aae076619ed5651340ec3d3401bc15b2d</a> | ORPH<br>
=C2=A0 sparc64=C2=A0 =C2=A0 |=C2=A0 gobject-introspection-1.72.0=C2=A0 | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/dfd9a283425ce9b9a97c4=
a205682375331f1f5ab" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/dfd9a283425ce9b9a97c4a205682375331f1f5ab</a> | ORPH<b=
r>
=C2=A0 =C2=A0nios2=C2=A0 =C2=A0 =C2=A0|=C2=A0 gobject-introspection-1.72.0=
=C2=A0 | NOK | <a href=3D"http://autobuild.buildroot.net/results/b5ac53c8dc=
e40a2412cd5c07f9ea4c2154c90f27" rel=3D"noreferrer" target=3D"_blank">http:/=
/autobuild.buildroot.net/results/b5ac53c8dce40a2412cd5c07f9ea4c2154c90f27</=
a> | ORPH<br>
=C2=A0 powerpc=C2=A0 =C2=A0 |=C2=A0 gobject-introspection-1.72.0=C2=A0 | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/27b5d0b608f6c229ffe36=
0612c587387e4872d65" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/27b5d0b608f6c229ffe360612c587387e4872d65</a> | ORPH<b=
r>
=C2=A0 =C2=A0 arm=C2=A0 =C2=A0 =C2=A0 | google-breakpad-c85eb4a59b6... | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/29184695d69798e488f9a=
0f469bd1a4d482a39c0" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/29184695d69798e488f9a0f469bd1a4d482a39c0</a> |=C2=A0 =
=C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 i686=C2=A0 =C2=A0 =C2=A0| gummiboot-2bcd919c681c952eb... | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/2f0a80890e4a74d29cdc7=
00c6b8e45aadb47c4c0" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/2f0a80890e4a74d29cdc700c6b8e45aadb47c4c0</a> |=C2=A0 =
=C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 i686=C2=A0 =C2=A0 =C2=A0| gummiboot-2bcd919c681c952eb... | NO=
K | <a href=3D"http://autobuild.buildroot.net/results/9f94a95c44debb80a8b05=
9a4f1547bc60869d70e" rel=3D"noreferrer" target=3D"_blank">http://autobuild.=
buildroot.net/results/9f94a95c44debb80a8b059a4f1547bc60869d70e</a> |=C2=A0 =
=C2=A0 =C2=A0<br>
=C2=A0aarch64_be=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gvfs-1.48.1=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| NOK | <a href=3D"http://autobuild.b=
uildroot.net/results/eb3bc7efafec12806d0dd9c54be2b9e86cc7a6fe" rel=3D"noref=
errer" target=3D"_blank">http://autobuild.</a></blockquote></div></div>

--000000000000a4267105f1c75498--

--===============6422319889099993702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6422319889099993702==--
