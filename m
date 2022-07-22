Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9016C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 19:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CDA04161B;
	Fri, 22 Jul 2022 19:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDA04161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJYYMHdYliL3; Fri, 22 Jul 2022 19:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D764B415F7;
	Fri, 22 Jul 2022 19:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D764B415F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7EC1BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 19:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D88AF84989
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 19:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D88AF84989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mT4xM2g6hsiT for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 19:05:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74CD084AEB
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74CD084AEB
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 19:05:31 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10d867a8358so7384215fac.10
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 12:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3qVch3k9c7nINKwXfwF16yrUuYr1XkNOAYGQeys0Bg=;
 b=0IZ+/LcMBsM9Hutvs0X09xW3oGe3RWZSplOE/XyFH+Qj8T41RZ2YypmeuC1ysIwXUH
 I0UUqkX9Bm/5aUFCRL+5WF47SrMasxZUmcopFap8MnG44uLnLz7jigraJU7Ks5nMQGt+
 dHGl0idU+x6fpewUSunTQqz6Zfd39T/E0qDqXw8GJxxNZgh6PSv+770kuJwu+Yxwb2qN
 sQXftwlhpi+fegmH0756uwdR6PXuWrObZhmNh1dbP4jm3jD0ADv1U82HJnfeR3VZ3T3I
 ZFXXQLU4zrCm/UkhKVswWk6q9Se43Hnr4XcrroCCPVXwG6M2qbgxv668W4FZYhNf/43j
 QcPA==
X-Gm-Message-State: AJIora9Nc1Bw+Gsf83DzDnhY/oi++q5dRZTPbAccOxPJBQukx88KVlei
 GFqsyh6poGCRGBhYpPlzfyBmaKLCaGwVR3c+vZ8=
X-Google-Smtp-Source: AGRyM1sz4eMojxSvF4IZVENXjWWebHxpAktztBhxOn+cblY9i66LHigllzyxSslqjmUAJPHYm7ZpMmcnR0yW6BCQ5CQ=
X-Received: by 2002:a05:6870:8314:b0:10c:cc1a:57fc with SMTP id
 p20-20020a056870831400b0010ccc1a57fcmr8731719oae.153.1658516730278; Fri, 22
 Jul 2022 12:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220722101653.7475-1-nolange79@gmail.com>
In-Reply-To: <20220722101653.7475-1-nolange79@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 22 Jul 2022 13:05:19 -0600
Message-ID: <CADvTj4rc4mjoFwtCptoU=RwyNfcc1GvHiZvZGzt4jufABSS5CA@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=g3qVch3k9c7nINKwXfwF16yrUuYr1XkNOAYGQeys0Bg=;
 b=lYU/f3LOhLpboY4fjnznXy8TYUXb3OzQU/uWxbKZRsOyFXoWSd6PqjQdbBQwYvKO38
 Ywx7X2g47Rjg3CZv3kH1ecxVbV4hzLTavsertHX7pBoaaNZToT3p2lH/4gk0k3YXIqS9
 Rmp5y+FDvOr0SspXD1AVXT/vjXs1tnRaHrAgAdMqSU1GzmaReeKVCAaiUeoh4CGggFBQ
 5xlrzBRsO44i0VrDKNduyvm1dgRmGEkJFluc6OaRaNgYvsDOJDFGFMtHX20Nx7mk2/+b
 LiZLcYzzhbi4LrMJMpHegiD+5rmrNsm/WcusWwAGPRrLNpJbTnRjRiaMU2qXOhu4vkpk
 JO8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lYU/f3LO
Subject: Re: [Buildroot] [PATCH v4 1/4] package/systemd: bump to version
 251.3
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jul 22, 2022 at 4:17 AM Norbert Lange <nolange79@gmail.com> wrote:
>
> LICENSES/README.md hash updated, this line got added in
> regards to files covered by CC0-1.0:
>
> >   -config files and examples under /network
>
> Add config option for the new sysupdate feature.
>
> Remove upstreamed patch.
>
> Update options: set new options to their default,
> remove option not available anymore.
>
> Slight kernel header dependeny bump to 3.15, cleanup existing
> mixed version dependencies that way.
>
> Set -Ddbus=false to ensure dbus dependency is runtime only.
>
> Set -Ddbus-interfaces-dir=no as interface XML file generation is
> not supported when cross compiling.
>
> Set -Ddefault-dnssec=allow-downgrade if openssl is available as both
> openssl and gcrypt are now supported for dnssec.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> ---
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
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
>  package/systemd/Config.in                     | 14 +++++++-
>  package/systemd/systemd.hash                  |  4 +--
>  package/systemd/systemd.mk                    | 24 +++++++++++---
>  system/Config.in                              |  6 ++--
>  5 files changed, 38 insertions(+), 43 deletions(-)
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
> index d5d88404de..1cd74618f4 100644
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
> @@ -475,6 +475,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
>
>           https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
>
> +config BR2_PACKAGE_SYSTEMD_SYSUPDATE
> +       bool "enable sysupdate support"
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +       select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
> +       help
> +         systemd-sysupdate atomically updates the host OS, container
> +         images, portable service images or other sources, based on
> +         the transfer configuration files described in sysupdate.d.
> +
> +         https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
> +
>  config BR2_PACKAGE_SYSTEMD_SYSUSERS
>         bool "enable sysusers support"
>         help
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 3572b25965..838ed13fd5 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
> +sha256  11c9c3fcc13d689615dd2ea79161d1b992087cf1e2a23856d7d7ade0efbddc54  systemd-251.3.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
>  sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
> @@ -11,4 +11,4 @@ sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENS
>  sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
>  sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
>  sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
> -sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
> +sha256  177ff657698bc940f9888b7f69e5d734b0933c2859ea264fde8de1700cec40dd  LICENSES/README.md
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 46a4e8de2c..b5628f5155 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -19,7 +19,7 @@
>  # - Diff sysusers.d with the previous version
>  # - Diff factory/etc/nsswitch.conf with the previous version
>  #   (details are often sprinkled around in README and manpages)
> -SYSTEMD_VERSION = 250.4
> +SYSTEMD_VERSION = 251.3
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = \
>         LGPL-2.1+, \
> @@ -61,7 +61,12 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
>  SYSTEMD_PROVIDES = udev
>
>  SYSTEMD_CONF_OPTS += \
> +       -Ddbus=false \
> +       -Ddbus-interfaces-dir=no \
> +       -Ddefault-compression=auto \
>         -Ddefault-hierarchy=unified \
> +       -Ddefault-locale='C.UTF-8' \
> +       -Ddefault-user-shell=/bin/sh \
>         -Didn=true \
>         -Dima=false \
>         -Dkexec-path=/usr/sbin/kexec \
> @@ -232,9 +237,9 @@ endif
>
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  SYSTEMD_DEPENDENCIES += libgcrypt
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
> +SYSTEMD_CONF_OPTS += -Dgcrypt=true
>  else
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
> +SYSTEMD_CONF_OPTS += -Dgcrypt=false
>  endif
>
>  ifeq ($(BR2_PACKAGE_P11_KIT),y)
> @@ -472,6 +477,12 @@ else
>  SYSTEMD_CONF_OPTS += -Dsysext=false
>  endif
>
> +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
> +SYSTEMD_CONF_OPTS += -Dsysupdate=true
> +else
> +SYSTEMD_CONF_OPTS += -Dsysupdate=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
>  SYSTEMD_CONF_OPTS += -Dnetworkd=true
>  SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
> @@ -503,6 +514,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dgnutls=false \
>         -Dopenssl=true \
>         -Ddns-over-tls=openssl \
> +       -Ddefault-dnssec=allow-downgrade \
>         -Ddefault-dns-over-tls=opportunistic
>  SYSTEMD_DEPENDENCIES += openssl
>  else ifeq ($(BR2_PACKAGE_GNUTLS),y)
> @@ -510,6 +522,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dgnutls=true \
>         -Dopenssl=false \
>         -Ddns-over-tls=gnutls \
> +       -Ddefault-dnssec=allow-downgrade \

This is wrong, dnssec requires either openssl or gcrypt, what you
have done is enable it if either openssl or gnutls is enabled, see:
https://github.com/systemd/systemd-stable/blob/v251.3/meson.build#L1660-L1670

The dns-over-tls option requires" openssl or gnutls" while dnssec requires
"openssl or gcrypt", they are easy to mix up because they both start with "g"
I think ;P.

>         -Ddefault-dns-over-tls=opportunistic
>  SYSTEMD_DEPENDENCIES += gnutls
>  else
> @@ -517,6 +530,7 @@ SYSTEMD_CONF_OPTS += \
>         -Dgnutls=false \
>         -Dopenssl=false \
>         -Ddns-over-tls=false \
> +       -Ddefault-dnssec=no \
>         -Ddefault-dns-over-tls=no
>  endif
>
> @@ -546,7 +560,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
>  SYSTEMD_CONF_OPTS += \
>         -Defi=true \
>         -Dgnu-efi=true \
> -       -Defi-cc=$(TARGET_CC) \
>         -Defi-ld=bfd \
>         -Defi-libdir=$(STAGING_DIR)/usr/lib \
>         -Defi-includedir=$(STAGING_DIR)/usr/include/efi
> @@ -789,6 +802,8 @@ HOST_SYSTEMD_CONF_OPTS = \
>         -Dbinfmt=false \
>         -Drepart=false \
>         -Dcoredump=false \
> +       -Ddbus=false \
> +       -Ddbus-interfaces-dir=no \
>         -Dpstore=false \
>         -Doomd=false \
>         -Dlogind=false \
> @@ -797,6 +812,7 @@ HOST_SYSTEMD_CONF_OPTS = \
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
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
