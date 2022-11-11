Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3EAC4332F
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 173BF40162;
	Fri, 11 Nov 2022 20:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 173BF40162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bn5KVGvgIpNO; Fri, 11 Nov 2022 20:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFE1840106;
	Fri, 11 Nov 2022 20:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE1840106
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89CC31BF5DA
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 648F781A6A
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648F781A6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGhv7zQtNaYs for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:00:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A08881A30
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A08881A30
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:00:59 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id o13so5169764pgu.7
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 12:00:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEQipcKTl5Zasfbn5LeEx84hUp9VafMUyHbUeA4U+xg=;
 b=SdaXDcTnMthB3xoPwmH/Ld+5Q7ez1UVXnDlgpDatNOx9xssDfb6sZ2IYumcWQTSGKa
 JIirRjXOq0LVNrUOrsk02sO9hRLO6jCgJJRhfD6TeFtqrUg0/DULUw0f6xiyszNHlxJe
 paIpF4Oepy0yd8y56WPgPaqtG7BtjgChiqROJGCtAy+SdAyBqwiFRw2iU9EuK9cx51r+
 nhZb3qq4uHKtKXN3Nhv3/j7LamPtCUVIh2utgW73iZcTjzunnqTda+6sMj9sELwAbBML
 w4ClP8rExoOibZOgQfVdwNEMQtePq06CGrNoqtgVlDhbTcqj+wL/9Fvf+V+MW16uHT76
 kLBA==
X-Gm-Message-State: ANoB5pk/j0wsR/8SBL3utFxdvJOKS5RM3myroOWgVgoHx+asgIckQKAB
 5Wv500gSrSrPBxqtLnVAROV0MydMl5AxEiLu4Eg=
X-Google-Smtp-Source: AA0mqf59v0yqLLtJZpJj5JrkcUzJqxJvZ4xvPVq9MJN86N/0d3ndqPVKnni78lGv3KT7OidW8013x6lqOODoQZq68LE=
X-Received: by 2002:a63:d850:0:b0:46f:6225:c2f9 with SMTP id
 k16-20020a63d850000000b0046f6225c2f9mr2999972pgj.225.1668196858700; Fri, 11
 Nov 2022 12:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20221111105757.552459-1-nolange79@gmail.com>
In-Reply-To: <20221111105757.552459-1-nolange79@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 11 Nov 2022 16:00:46 -0400
Message-ID: <CADvTj4q9GmqcEkCmyWEWj+H13gPnZ143q_-GTLSz_YAvwxDgkQ@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mEQipcKTl5Zasfbn5LeEx84hUp9VafMUyHbUeA4U+xg=;
 b=D6NsZVb8jePVxHj1Unx4/oZqa/94nGWgffITKgJYMMN9C4b4/C5X0EjUMfwITj7VKB
 hZrKayPva6jl4OvpDi19lLE1kXjZXKriHp6D0CUM0wRz8Zjzce7Jqe20mu79npe4OCHE
 GjA/wlqVlJLDmqr0FIuFD5mDpntm3M/eSTl8B1tljt6PG+1Y1HURDyTD5mFx9hnz6xWX
 mhDyYgqjkYRRT1Hj3MSM6XFpz3lHOZ62MCncwKmU9ojrsFMFaHmkRbZsEAmvMSzuHFZB
 Un69nxtAXM4XWX92uSl89sBREJtSGUz+UJlkwlBQU0WLPy2f/nZhmTY9mH+mrfgus11K
 Ppwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D6NsZVb8
Subject: Re: [Buildroot] [PATCH v7 1/4] package/systemd: bump to version
 252.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Nov 11, 2022 at 6:58 AM Norbert Lange <nolange79@gmail.com> wrote:
>
> Following files changed *license* from CC0-1.0 to MIT-0:
>
> -   src/systemctl/systemd-sysv-install.SKELETON
> -   config files
> -   examples under /network
>
> The file LICENSES/MIT-0.txt has been added for this reason,
> hashes added, corrected for LICENSES/README.md.
>
> Kernel version 3.15 is now the bare minimum, but only
> version 4.15 and higher are fully supported and tested:
>
> -   bump kernel header dependencies
> -   correct kconfig description
> -   improvements to make the kconfig description better reflect
>     the information from the README
>
> Remove upstreamed patch.
>
> Set new options to their default, remove -Defi-cc option.
>
> Set -Ddbus=false to ensure dbus dependency is runtime only.
>
> Set -Ddbus-interfaces-dir=no as interface XML file generation is
> not supported when cross compiling.
>
> Set -Ddefault-user-shell=/bin/sh to the always available shell.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

For the series:
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>

>
> ---
> v6->v7:
>
> *   update to 252.1
> *   compare changes in licenses to 250.4
> *   update systemd description in kconfig with required and recommended
>     kernel
> *   split patch
>
> v5->v6:
>
> *   update to 251.4
>
> v4->v5:
>
> *   fix dnssec changes, use James' solution
>
> v2->v4:
>
> *   Bump kernel header dependency to 3.15
> *   Inherit changes from James' version bump patch (following)
> *   (Force) disable compile time dbus dependencies
> *   set default-dnssec to allow-downgrade
>
> v1->v2:
>
> *   note about changed LICENSES/README.md
> *   always set default-user-shell to /bin/sh
> *   always set default-locale to C-UTF-8
> *   fix typos in commit message
>
> ---
>
> License diff for illustration
>
> --- systemd-stable-250.4/LICENSES/README.md
> +++ systemd-stable-252.1/LICENSES/README.md
> @@ -45,9 +45,11 @@
>   * the following sources are licensed under the **CC0-1.0** license:
>     - src/basic/siphash24.c
>     - src/basic/siphash24.h
> -   - src/systemctl/systemd-sysv-install.SKELETON
>     - tools/check-includes.pl
> +  * the following sources are licensed under the **MIT-0** license:
>     - all examples under man/
> +   - src/systemctl/systemd-sysv-install.SKELETON
> +   - config files and examples under /network
>   * the following sources are under **Public Domain** (LicenseRef-murmurhash2-public-domain):
>     - src/basic/MurmurHash2.c
>     - src/basic/MurmurHash2.h
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
>  package/systemd/Config.in                     | 12 +++++--
>  package/systemd/systemd.hash                  |  5 +--
>  package/systemd/systemd.mk                    | 16 +++++++--
>  system/Config.in                              |  6 ++--
>  5 files changed, 29 insertions(+), 43 deletions(-)
>  delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
>
> diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> deleted file mode 100644
> index 0934886acb..0000000000
> --- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@smile.fr>
> -Date: Fri, 7 Jan 2022 22:25:23 +0100
> -Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
> -
> -MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
> -but it's defined in kernel headers since version 5.2.
> -
> -[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
> -
> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ----
> - src/basic/missing_syscall.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
> -index 8267b1a90c..793d111c55 100644
> ---- a/src/basic/missing_syscall.h
> -+++ b/src/basic/missing_syscall.h
> -@@ -569,6 +569,10 @@ static inline int missing_open_tree(
> - #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
> - #endif
> -
> -+#ifndef MOVE_MOUNT_T_EMPTY_PATH
> -+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
> -+#endif
> -+
> - static inline int missing_move_mount(
> -                 int from_dfd,
> -                 const char *from_pathname,
> ---
> -2.31.1
> -
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 45a9e2d644..f35305c0be 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>         depends on !BR2_STATIC_LIBS # kmod
>         depends on BR2_TOOLCHAIN_USES_GLIBC
>         depends on BR2_TOOLCHAIN_HAS_SSP
> -       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>         depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
>         select BR2_PACKAGE_HAS_UDEV
> @@ -51,7 +51,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>           an elaborate transactional dependency-based service control
>           logic.  It can work as a drop-in replacement for sysvinit.
>
> -         Systemd requires a Linux kernel >= 3.13 with the following
> +         Kernel versions below 4.15 ("recommended baseline") have
> +         significant gaps in functionality and are not recommended
> +         for use with this version of systemd.
> +
> +         Systemd requires a Linux kernel >= 3.15 with the following
>           options enabled:
>
>           - CONFIG_DEVTMPFS
> @@ -66,9 +70,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
>           - CONFIG_PROC_FS
>           - CONFIG_FHANDLE (libudev, mount and bind mount handling)
>
> -         - CONFIG_NET_NS (needed by PrivateNetwork=, used in some
> +         - CONFIG_NET_NS (Required for PrivateNetwork=, used in some
>             systemd units)
>
> +         - CONFIG_USER_NS (Required for PrivateUsers=)
> +
>           - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
>           - CONFIG_TMPFS_POSIX_ACL
>           - CONFIG_TMPFS_XATTR
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 3572b25965..4f618ee218 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
> +sha256  efd1c04d14c5e44b55d19aaf9182b309c4253bbd884374f5d840947d598e9d47  systemd-252.1.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> @@ -8,7 +8,8 @@ sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENS
>  sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
>  sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
>  sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
> +sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENSES/MIT-0.txt
>  sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
>  sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
>  sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
> -sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
> +sha256  da9b2c7b8cd10516fd2c4279b82496ea61787148f13e899c62fc8988c5fac34f  LICENSES/README.md
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 1d7452de19..57b6734d21 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 250.4
> +SYSTEMD_VERSION = 252.1
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>         LGPL-2.1+, \
> @@ -29,6 +29,7 @@ SYSTEMD_LICENSE = \
>         BSD-3-Clause (tools/chromiumos), \
>         CC0-1.0 (few source files, see LICENSES/README.md), \
>         GPL-2.0 with Linux-syscall-note (linux kernel headers), \
> +       MIT-0 (few source files, see LICENSES/README.md), \
>         MIT (few source files, see LICENSES/README.md), \
>         OFL-1.1 (Heebo fonts)
>  SYSTEMD_LICENSE_FILES = \
> @@ -40,6 +41,7 @@ SYSTEMD_LICENSE_FILES = \
>         LICENSES/LGPL-2.0-or-later.txt \
>         LICENSES/Linux-syscall-note.txt \
>         LICENSES/lookup3-public-domain.txt \
> +       LICENSES/MIT-0.txt \
>         LICENSES/MIT.txt \
>         LICENSES/murmurhash2-public-domain.txt \
>         LICENSES/OFL-1.1.txt \
> @@ -61,7 +63,13 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
>  SYSTEMD_PROVIDES = udev
>
>  SYSTEMD_CONF_OPTS += \
> +       -Ddbus=false \
> +       -Ddbus-interfaces-dir=no \
> +       -Ddefault-compression='auto' \
>         -Ddefault-hierarchy=unified \
> +       -Ddefault-locale='C.UTF-8' \
> +       -Ddefault-user-shell=/bin/sh \
> +       -Dfirst-boot-full-preset=false \
>         -Didn=true \
>         -Dima=false \
>         -Dkexec-path=/usr/sbin/kexec \
> @@ -72,6 +80,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dman=false \
>         -Dmount-path=/usr/bin/mount \
>         -Dmode=release \
> +       -Dnspawn-locale='C.UTF-8' \
>         -Dnss-systemd=true \
>         -Dquotacheck-path=/usr/sbin/quotacheck \
>         -Dquotaon-path=/usr/sbin/quotaon \
> @@ -82,6 +91,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dsulogin-path=/usr/sbin/sulogin \
>         -Dsystem-gid-max=999 \
>         -Dsystem-uid-max=999 \
> +       -Dsysupdate=false \
>         -Dsysvinit-path= \
>         -Dsysvrcnd-path= \
>         -Dtelinit-path= \
> @@ -548,7 +558,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
>  SYSTEMD_CONF_OPTS += \
>         -Defi=true \
>         -Dgnu-efi=true \
> -       -Defi-cc=$(TARGET_CC) \
>         -Defi-ld=bfd \
>         -Defi-libdir=$(STAGING_DIR)/usr/lib \
>         -Defi-includedir=$(STAGING_DIR)/usr/include/efi
> @@ -794,6 +803,8 @@ HOST_SYSTEMD_CONF_OPTS = \
>         -Dbinfmt=false \
>         -Drepart=false \
>         -Dcoredump=false \
> +       -Ddbus=false \
> +       -Ddbus-interfaces-dir=no \
>         -Dpstore=false \
>         -Doomd=false \
>         -Dlogind=false \
> @@ -802,6 +813,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>         -Dmachined=false \
>         -Dportabled=false \
>         -Dsysext=false \
> +       -Dsysupdate=false \
>         -Duserdb=false \
>         -Dhomed=false \
>         -Dnetworkd=false \
> diff --git a/system/Config.in b/system/Config.in
> index 888c24ce81..24a0e941e3 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -125,19 +125,19 @@ config BR2_INIT_SYSTEMD
>         depends on BR2_TOOLCHAIN_USES_GLIBC
>         depends on BR2_TOOLCHAIN_HAS_SSP
>         depends on BR2_TOOLCHAIN_HAS_THREADS
> -       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +       depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>         depends on BR2_HOST_GCC_AT_LEAST_5
>         select BR2_ROOTFS_MERGED_USR
>         select BR2_PACKAGE_SYSTEMD
>         select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
>
> -comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
> +comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
>         depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>                 !BR2_TOOLCHAIN_HAS_SSP || \
> -               !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
> +               !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
>                 !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
>                 !BR2_HOST_GCC_AT_LEAST_5
>
> --
> 2.35.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
