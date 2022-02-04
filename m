Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E99C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 20:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 798D340395;
	Fri,  4 Feb 2022 20:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmm2WBH3ihLR; Fri,  4 Feb 2022 20:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE925401A3;
	Fri,  4 Feb 2022 20:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26FB81BF286
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 20:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F28401A3
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 20:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWTQ_rvo96Fu for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 20:56:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 453234013A
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 20:56:45 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id v67so9901574oie.9
 for <buildroot@buildroot.org>; Fri, 04 Feb 2022 12:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s4C5bAzNIDA0UHuwECFOxZ3DlpjTvBRLD5TMLR9dl/k=;
 b=KXG0/HbC64RHW1gZNxvlNO+SbDcur+5QfN9eAVec6XwkXMeUvRpfjLRt/RJBIcsgZn
 wsqMweCeLhOC4cnGX5sVPUpNbttpyclgfEFCqSc0P4Mw6fa4oWHcUGBtoR7bA8r+4FhV
 +72H0u4YvQSQFV2qMvlNEEaTetislmZftrJn4lMAPS5pjKA9vu7RUdCfE2XiRVoxY5GM
 DL1sYZ/iM/G1zu1wWxoVcx+wm6adkG4iyKnde7sIF55Mvi7SlJg4rkFZxhLRklkqWbhY
 dGl81PLZ0ygVzEmNsQKvXCEg1hX2QXvLWj6CCOTuK0KzJ/dGUhf455xNaUavwY+nSCKb
 sZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s4C5bAzNIDA0UHuwECFOxZ3DlpjTvBRLD5TMLR9dl/k=;
 b=IYaSFqbCT0yksrDve7kh6EV61Btes7ApdK4kA0PyrbBUaxiCWooOR/6sSMtVKm00nU
 uf0Cbl11i6PQD2f6CkQixtQqE7SiW9LiQpPHxzDtrm6RMQQVGdJwwwwH70kILNT6CTCu
 zEEyUhQJksJA8baOy1KlK3r8jOTRzpf34sXGQYuvrDoBhdmSQz0ORRgHht6sHvMDOld4
 1diWGUP9VrdV6JISxNPwuQvloY/ILMSarkmxR62LCCBCVLrjGnHnBGMCW+njfopEWL6m
 1AhipulYMeQ6K/5FMhyxf2WWYzl5g3/0C6aMDdmu/sVWaIQ2XmUap5crb1AT5KoA0Cl/
 CN5A==
X-Gm-Message-State: AOAM532LMuF1fI91eOkRipH25ezjTL74269abrrG2GlgvQb5kC6bY/if
 +dRux5xmeqosH5gT33Gu5aDTwOyD1UPKVtraI6xh3nxwpz0=
X-Google-Smtp-Source: ABdhPJyc2PskmjV30lfsBx5pISOpJo7N/qStpLq18hY0f9iNg+KpzV+1aEUPZ9sDf4HsH4OhNu44c+su9mlQ0zZwjak=
X-Received: by 2002:a05:6808:15aa:: with SMTP id
 t42mr2114096oiw.227.1644008204095; 
 Fri, 04 Feb 2022 12:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20220110124644.1388438-1-thierry.bultel@linatsea.fr>
 <20220110124644.1388438-2-thierry.bultel@linatsea.fr>
In-Reply-To: <20220110124644.1388438-2-thierry.bultel@linatsea.fr>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 4 Feb 2022 12:56:33 -0800
Message-ID: <CAFSsvmqxjyNTov2yHW-hDY8cOYZn=wJfY+MJY6PaxJ92aHgBJw@mail.gmail.com>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Subject: Re: [Buildroot] [PATCH v4 2/3] package/dracut: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello! Thank you for the patch series! Hopefully I can help a bit.

First things first:
  - dracut.hash is missing.
  - Please run ./utils/check-package package/dracut/* and fix any warnings

Your Dracut package does not depend on systemd, which results in the error:

dracut: FAILED: output/host/lib/dracut/dracut-install -r
output/build/buildroot-fs/cpio/target -D
output/build/buildroot-fs/cpio/tmp/dracut.Sm7N5J/initramfs -a -l
udevadm cat uname blkid
dracut: Cannot find [systemd-]udevd binary!

I do have a dracut package you may find useful here:
https://gitlab.com/aduskett/buildroot/-/tree/dracut/external/package/dracut

Thanks!
Adam

On Mon, Jan 10, 2022 at 4:57 AM Thierry Bultel
<thierry.bultel@linatsea.fr> wrote:
>
> Dracut is the tool used by desktop distributions to build initrds.
>
> In the embedded world, it can be very usefull, too, for instance when
> wanting to create an initramfs for a system recovery mode.
> Whereas it is definitively possible to achieve this with buildroot, the
> process is to have a dedicated buildroot configuration for that, and
> perform a full build. Instead of doing that, the idea is to use dracut
> to pick the needed binaries/shared libraries, configuration files, or
> kernel modules from the 'target' directory.
> The advantage is to save build time, and also to have a consistency
> between the packages versions taken for the recovery and the production
> filesystem.
>
> The principle of dracut is based on the so-called 'dracut modules'
> On the host, they are on host/lib/dracut/modules.d
> Each directory as a prefix number for the order of execution, and
> at least a "module-setup.sh" script.
>
> Dracut sources all of them, and typically calls the "check()" function,
> which is the placeholder for required binaries (that are aimed to be
> polulated in the initrd), then the "depends()" function, that lists
> other modules to depend on, and the "install()" function, that makes
> the actual work.
>
> Dracut was initially thought to work with systems using systemd,
> but it can also work without it. Do to so, every "systemd-xxx"
> modules must be disabled in the dracut configuration file. For
> convenience, the 05busybox-buildroot module is provided, to support
> busybox init system.
>
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
> Changes v1 -> v2 (all suggested by Arnoult)
>   - added a wrapper script
> Changes v2 -> v3
>   - added modules for:
>      - supporting busybox system init type
>      - fixing a missing symlink for uClibc
> Changes v3 -> v4
>      - some explanations on the dracut modules in the commit log
>      - fixed a bug on the 'require_binary' line in busybox module
>      - expanded variables with double quotes and curly braces
>      - removed commented out code
>      - fixes for 'fakeroot' and 'uclibc' and 'musl' as patches
>      - musl and uclibc dynamic fix
>      - renamed dracut wrapper
>      - disabled when using another init system than systemd or busybox
>
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
>  package/Config.in.host                        |  1 +
>  package/dracut/0000-enable-fakeroot.patch     | 12 ++++
>  ...01-add-a-module-to-fix-libc-ld-links.patch | 56 +++++++++++++++++
>  .../05busybox-buildroot/module-setup.sh       | 60 +++++++++++++++++++
>  package/dracut/Config.in.host                 | 10 ++++
>  package/dracut/dracut                         |  2 +-
>  package/dracut/dracut.mk                      | 41 +++++++++++++
>  package/dracut/dracut_wrapper.sh              | 15 +++++
>  8 files changed, 196 insertions(+), 1 deletion(-)
>  create mode 100644 package/dracut/0000-enable-fakeroot.patch
>  create mode 100644 package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch
>  create mode 100644 package/dracut/05busybox-buildroot/module-setup.sh
>  create mode 100644 package/dracut/Config.in.host
>  create mode 100644 package/dracut/dracut.mk
>  create mode 100644 package/dracut/dracut_wrapper.sh
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index b3e00bb482..caa28262be 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -14,6 +14,7 @@ menu "Host utilities"
>         source "package/cramfs/Config.in.host"
>         source "package/cryptsetup/Config.in.host"
>         source "package/dbus-python/Config.in.host"
> +       source "package/dracut/Config.in.host"
>         source "package/dfu-util/Config.in.host"
>         source "package/dos2unix/Config.in.host"
>         source "package/dosfstools/Config.in.host"
> diff --git a/package/dracut/0000-enable-fakeroot.patch b/package/dracut/0000-enable-fakeroot.patch
> new file mode 100644
> index 0000000000..e148485135
> --- /dev/null
> +++ b/package/dracut/0000-enable-fakeroot.patch
> @@ -0,0 +1,12 @@
> +diff -purN host-dracut-055.orig/dracut.sh host-dracut-055/dracut.sh
> +--- host-dracut-055.orig/dracut.sh     2021-05-27 12:34:19.000000000 +0000
> ++++ host-dracut-055/dracut.sh  2022-01-06 14:17:57.022317138 +0000
> +@@ -868,8 +868,6 @@ export LC_ALL=C
> + export LANG=C
> + unset LC_MESSAGES
> + unset LC_CTYPE
> +-unset LD_LIBRARY_PATH
> +-unset LD_PRELOAD
> + unset GREP_OPTIONS
> +
> + export DRACUT_LOG_LEVEL=warning
> diff --git a/package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch b/package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch
> new file mode 100644
> index 0000000000..ad5e97b34a
> --- /dev/null
> +++ b/package/dracut/0001-add-a-module-to-fix-libc-ld-links.patch
> @@ -0,0 +1,56 @@
> +From 2c0188164223563adfce4852faa83d2553bee367 Mon Sep 17 00:00:00 2001
> +From: Thierry Bultel <thierry.bultel@linatsea.fr>
> +Date: Mon, 10 Jan 2022 09:09:43 +0100
> +Subject: [PATCH] add a module to fix libc ld links
> +
> +When using uClibc or musl, there must
> +be "ls-uClibc.so.1" or "ld-musl-x.so" symlinks,
> +respectively (else the init process cannot
> +start)
> +
> +Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> +---
> + modules.d/05libc-links/module-setup.sh | 31 ++++++++++++++++++++++++++
> + 1 file changed, 31 insertions(+)
> + create mode 100755 modules.d/05libc-links/module-setup.sh
> +
> +diff --git a/modules.d/05libc-links/module-setup.sh b/modules.d/05libc-links/module-setup.sh
> +new file mode 100755
> +index 00000000..249bb80c
> +--- /dev/null
> ++++ b/modules.d/05libc-links/module-setup.sh
> +@@ -0,0 +1,31 @@
> ++#!/bin/bash
> ++
> ++# Adds the missing links for uClibc or musl, if needed
> ++
> ++check() {
> ++      return 0
> ++}
> ++
> ++depends() {
> ++      return 0
> ++}
> ++
> ++install() {
> ++
> ++      # Despite of the fact that the listed dependency (reported by readelf -d)
> ++      # is purely /lib/libc.so, the musl symlink is needed anyway.
> ++
> ++      musl_link=$(find "${dracutsysrootdir}"/lib -name "ld-musl-*.so*")
> ++      if [ $? -eq 0 ] ; then
> ++              ln -s /lib/libc.so ${initdir}/lib/`basename "${musl_link}"`
> ++      fi
> ++
> ++      # Same for uClibc, the listed dependency
> ++      # is ld-uClibc.so.1, the loader needs the ld-uClibc.so.0, too
> ++
> ++      uclibc_link = $(find "${dracutsysrootdir}"/lib -name "ld-uClibc-*.so*")
> ++      if [ $? -eq 0 ] ; then
> ++              ln -s ld-uClibc.so.1 "${initdir}"/`basename "${uclibc_link}"`
> ++      fi
> ++
> ++}
> +--
> +2.25.1
> +
> diff --git a/package/dracut/05busybox-buildroot/module-setup.sh b/package/dracut/05busybox-buildroot/module-setup.sh
> new file mode 100644
> index 0000000000..ab4e0a5c50
> --- /dev/null
> +++ b/package/dracut/05busybox-buildroot/module-setup.sh
> @@ -0,0 +1,60 @@
> +#!/bin/bash
> +
> +check() {
> +       require_binaries busybox || return 1
> +       return 0
> +}
> +
> +depends() {
> +       return 0
> +}
> +
> +install_busybox_links() {
> +       dir=$1
> +       linkname=$2
> +
> +       (cd "${dracutsysrootdir}${dir}" &&
> +       for x in *; do
> +               if [ "$(readlink "$x")" = "${linkname}" ]; then
> +                       ln -sf "${linkname}" "${initdir}/${dir}/$x"
> +               fi
> +       done
> +       )
> +}
> +
> +install() {
> +       inst_multiple /bin/busybox
> +
> +       # wrapper script for early console; will launch /sbin/init
> +       # after having mounted devtmpfs
> +       inst_multiple /init
> +
> +       ln -s ../bin/busybox "${initdir}"/sbin/init
> +
> +       if [ -e "${dracutsysrootdir}/lib64" ]; then
> +               ln -s lib "${initdir}/lib64"
> +               ln -s lib "${initdir}/usr/lib64"
> +       fi
> +
> +       if [ -e "${dracutsysrootdir}/lib32" ]; then
> +               ln -s lib "${initdir}/lib32"
> +               ln -s lib "${initdir}/usr/lib32"
> +       fi
> +
> +       install_busybox_links "/bin" "busybox"
> +       install_busybox_links "/sbin" "../bin/busybox"
> +       install_busybox_links "/usr/bin" "../../bin/busybox"
> +       install_busybox_links "/usr/sbin" "../../bin/busybox"
> +
> +       inst_multiple \
> +               /etc/inittab    \
> +               /etc/init.d/rcS \
> +               /etc/init.d/rcK \
> +               /etc/issue      \
> +               /etc/fstab      \
> +               /etc/group      \
> +               /etc/passwd     \
> +               /etc/shadow     \
> +               /etc/hostname
> +}
> +
> diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
> new file mode 100644
> index 0000000000..074d46f623
> --- /dev/null
> +++ b/package/dracut/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_DRACUT
> +       bool
> +       select BR2_PACKAGE_HOST_KMOD
> +       select BR2_PACKAGE_HOST_CROSS_LDD
> +       help
> +         dracut is used to create an initramfs image by
> +         copying tools and files from an installed system
> +         and combining it with the dracut framework.
> +
> +         https://dracut.wiki.kernel.org
> diff --git a/package/dracut/dracut b/package/dracut/dracut
> index 9d3db3b58e..eb15ea9abd 100644
> --- a/package/dracut/dracut
> +++ b/package/dracut/dracut
> @@ -8,7 +8,7 @@ if [ -z "$*" ]; then
>      exit
>  fi
>
> -DRACUT_LDD=${TARGET_CROSS}ldd-cross \
> +DRACUT_LDD=${TARGET_CROSS}ldd-buildroot \
>  DRACUT_INSTALL="${HOST_DIR}/lib/dracut/dracut-install" \
>  dracutbasedir=${HOST_DIR}/usr/lib/dracut \
>  dracutsysrootdir=${TARGET_DIR} \
> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> new file mode 100644
> index 0000000000..5a9e154ccc
> --- /dev/null
> +++ b/package/dracut/dracut.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# dracut
> +#
> +################################################################################
> +
> +DRACUT_VERSION = 055
> +DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
> +DRACUT_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/dracut
> +DRACUT_LICENSE = GPL-2.0
> +DRACUT_LICENSE_FILES = COPYING
> +
> +HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
> +
> +define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +       $(INSTALL) -D -m 0755 package/dracut/dracut \
> +               $(HOST_DIR)/sbin/dracut
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +
> +
> +# Dracut does not support busybox init (systemd init is assumed to work
> +# out of the box, though). It provides a busybox module, that does not
> +# use the same paths as buildroot, and is not meant to be used as an init
> +# system.
> +# So it is simplier for users to disable the standard 'busybox' module in
> +# the configuration file, and enable the "busybox-buildroot' module
> +# instead.
> +# Notice that setting the script as executable (0755) is not mandatory,
> +# but this is what dracut does on all its modules, so lets just conform
> +# to it.
> +
> +ifeq ($(BR2_INIT_BUSYBOX),y)
> +define HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
> +       $(INSTALL) -D -m 0755 package/dracut/05busybox-buildroot/module-setup.sh \
> +               $(HOST_DIR)/lib/dracut/modules.d/05busybox-buildroot/module-setup.sh
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
> +endif
> +
> +$(eval $(host-autotools-package))
> diff --git a/package/dracut/dracut_wrapper.sh b/package/dracut/dracut_wrapper.sh
> new file mode 100644
> index 0000000000..9d3db3b58e
> --- /dev/null
> +++ b/package/dracut/dracut_wrapper.sh
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +
> +set -e
> +set -x
> +
> +if [ -z "$*" ]; then
> +    echo "No argument supplied"
> +    exit
> +fi
> +
> +DRACUT_LDD=${TARGET_CROSS}ldd-cross \
> +DRACUT_INSTALL="${HOST_DIR}/lib/dracut/dracut-install" \
> +dracutbasedir=${HOST_DIR}/usr/lib/dracut \
> +dracutsysrootdir=${TARGET_DIR} \
> +${HOST_DIR}/bin/dracut "$@"
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
