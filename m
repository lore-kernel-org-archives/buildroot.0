Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A99C43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 19:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7630640320;
	Thu, 21 Jul 2022 19:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7630640320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJ5xT3KjjcVT; Thu, 21 Jul 2022 19:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D8640080;
	Thu, 21 Jul 2022 19:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D8640080
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C90E1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 19:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 743BB815CC
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 19:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 743BB815CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTgSSpTv_-Ds for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 19:32:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E2A4814B6
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E2A4814B6
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 19:32:37 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id y13so1232718ilv.5
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 12:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhnkrkxbDql5uyST4rRtfhztRMip2cTs+XZ1ghnDzmE=;
 b=ukNAZ5XqqTEUHPZJ4XGeYLG3wedQS7AXEMy523ms1XZu7x0BFZQWFk/mjPNKBLhIMp
 eKZiO4QCYM6xM34b9QMK8RfvMGxUz8Hh4VGv+fNgDo1eshrl3XyJ5EuzdDfIJhA0A07q
 OPyV7HKtN2rOvMM0sIeTqChJC+shxTSndyk814WsfCwTjVM5xgpLmtofed2CZjPeUUi3
 xWCQbpVDGGv8cIMvPnDIx3sdvyWC2tSuec8GNiuRnfTLS3fZbxEw7FbVH6SKjwi8UrDx
 /cXMm3gJJP0NPitMQ3ExncQWeRCJswrrBXY7am7UEVET4IqiwYznDBzd2KrLjbrggI5N
 Up0w==
X-Gm-Message-State: AJIora/OBGwzLorYnEX795t5c1aRLU06D28dNAfvE/gzhhroyK6ae9P/
 JVuzGvn36m3MPXwKRQwhQh/o5AyFXrBOblaAwSk=
X-Google-Smtp-Source: AGRyM1u4vrYAQ8/TMOEuasIoCw6j3Nxmtttx+gBA/7PUYHwxUG2pWCU9HuN8/p6hE+J3v87EEIGE2LXAWOtSS9O7I80=
X-Received: by 2002:a05:6e02:1645:b0:2da:e6be:3dfc with SMTP id
 v5-20020a056e02164500b002dae6be3dfcmr22923033ilu.116.1658431957124; Thu, 21
 Jul 2022 12:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220721151907.212216-1-nolange79@gmail.com>
In-Reply-To: <20220721151907.212216-1-nolange79@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 21 Jul 2022 13:32:25 -0600
Message-ID: <CADvTj4rXWb=_3kTFCdbmJ2hjNZ_GEGq3O+f-VP=_u6tK5D4o4w@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=lhnkrkxbDql5uyST4rRtfhztRMip2cTs+XZ1ghnDzmE=;
 b=dMDynDxZqZ7iZLTJN4YfARYDSt+Vs3AfoEkyGsHk/YlQZXmXQQvfyRCjK42wKFlpVy
 SrWuLKItb1DK79FI/b6rfqD7GG+Jfrqzo6zGArMN6nuPZnvb0XGhJY1s0Ocgdm/yfVI8
 d0w26J5cJOHi9RvqaHXmydbyQqhNcFUD4G4K/8oqFWNnbnq0Tbr7uuj5xYOR6j2LCr1U
 PchgboOk9B/Ut7N83pVWATboKJT1qdp98BuR0UXuF1AJ1nLE32oLRH9kGj/oGCpzCrGn
 KNjI8HM4ua/BUsHO5NutSdNuXyLqNtWjpaAG/azCzFhmttSn93H90y2Twy8tnrX1phV6
 nXAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dMDynDxZ
Subject: Re: [Buildroot] [PATCH v3 1/3] package/systemd: bump to version
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

On Thu, Jul 21, 2022 at 9:20 AM Norbert Lange <nolange79@gmail.com> wrote:
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
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
> ---
> v1->v2:
> *   note about changed LICENSES/README.md
> *   always set default-user-shell to /bin/sh
> *   always set default-locale to C-UTF-8
> *   fix typos in commit message

You're missing a few things still, take a look at my patch here:
https://patchwork.ozlabs.org/project/buildroot/patch/20220522011729.117324-1-james.hilliard1@gmail.com/

Make sure you pick up the following changes from my patch:
 - dbus config option settings(to prevent dbus from becoming a build
time dependency)
 - dnssec changes(so that we pull in new dnssec backends properly)
 - kernel headers minimum version bump

> ---
>  ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
>  package/systemd/Config.in                     | 12 +++++++
>  package/systemd/systemd.hash                  |  4 +--
>  package/systemd/systemd.mk                    | 13 ++++++--
>  4 files changed, 25 insertions(+), 37 deletions(-)
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
> index d5d88404de..9f1a778e59 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
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
> index 46a4e8de2c..afee1cfc79 100644
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
> @@ -62,6 +62,9 @@ SYSTEMD_PROVIDES = udev
>
>  SYSTEMD_CONF_OPTS += \
>         -Ddefault-hierarchy=unified \
> +       -Ddefault-compression=auto \
> +       -Ddefault-locale='C.UTF-8' \
> +       -Ddefault-user-shell=/bin/sh \
>         -Didn=true \
>         -Dima=false \
>         -Dkexec-path=/usr/sbin/kexec \
> @@ -472,6 +475,12 @@ else
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
> @@ -546,7 +555,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
>  SYSTEMD_CONF_OPTS += \
>         -Defi=true \
>         -Dgnu-efi=true \
> -       -Defi-cc=$(TARGET_CC) \
>         -Defi-ld=bfd \
>         -Defi-libdir=$(STAGING_DIR)/usr/lib \
>         -Defi-includedir=$(STAGING_DIR)/usr/include/efi
> @@ -797,6 +805,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>         -Dmachined=false \
>         -Dportabled=false \
>         -Dsysext=false \
> +       -Dsysupdate=false \
>         -Duserdb=false \
>         -Dhomed=false \
>         -Dnetworkd=false \
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
