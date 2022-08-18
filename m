Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD78C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5969A4013A;
	Thu, 18 Aug 2022 21:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5969A4013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXyIAPF4Ko12; Thu, 18 Aug 2022 21:09:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5C72400AB;
	Thu, 18 Aug 2022 21:09:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5C72400AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D63AB1BF315
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A26607C1
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A26607C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkbZ4qrN4BYx for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:09:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5940360784
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5940360784
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 21:09:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b502:d67d:6967:6fb1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E600B7804FF;
 Thu, 18 Aug 2022 23:09:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 18 Aug 2022 23:09:15 +0200
Date: Thu, 18 Aug 2022 23:09:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220818210915.GV2854108@scaer>
References: <20220815111710.1459820-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815111710.1459820-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660856960;
 bh=znlLKzGrLyuR4pk+RXTlFTZx/ZxSsAnQxuEmQzhkh2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FaLZouImc/sIznnDMehaNLSywIoj2b3Uo6yAJRnwcHwbJhHhNFohLwfAWGDaZmulz
 eZ4o0EangJkFMoc0ZcgGd9L1bOhvOGXsoNi6KgRQ20cNhuuiBgq03b7FdOSCNe4SV+
 SNu6ypEEM8D9NkC8EZoze6XdIc06cRMu1OJgAmqILhQH4e8qQ2vbt3RxPtuDv6Tdq5
 sZPANm3S3WmRx9r0n29T3vWb8Ajl1/EXh+VCIkL/C+NNsyAHn3Sr6bAnDR9jEpn8kV
 vh5oXn6GVYuUf1NX0gRNqXue9BFrXuaoyiqf5ER614PBLP+D/T7Pi2LYydUHOsOJz7
 DdIloqhIQcPzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FaLZouIm
Subject: Re: [Buildroot] [PATCH next v5 1/3] package/dracut: new host package
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARnout, Thierry, All,

On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: Thierry Bultel <thierry.bultel@linatsea.fr>
> 
> Dracut is the tool used by desktop distributions to build initrds.
> 
> In the embedded world, it can be very useful, too, for instance when
> wanting to create an initramfs for a system recovery mode.
> Whereas it is definitively possible to achieve this with buildroot, the
> process is to have a dedicated buildroot configuration for that, and
> perform a full build. Instead of doing that, dracut can pick the needed
> binaries/shared libraries, configuration files, or kernel modules from
> the 'target' directory.
> The advantage is to save build time, and also to have a consistency
> between the packages versions taken for the recovery and the production
> filesystem.
> 
> The principle of dracut is based on the so-called 'dracut modules'. The
> modules determine what will be included in the initramfs. For example,
> one of dracut's modules checks the kernel modules that are included and
> also includes the corresponding firmware blobs.
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
> module must be disabled in the dracut configuration file. For
> convenience, the 05busybox-init module is provided, to support
> busybox init system. Note that this module should *not* be enabled when
> using systemd init. It is therefore only installed if busybox init is
> selected.
> 
> Musl and uClibc make assumptions about the existence of some symlinks
> that are not discoverable with readelf. Therefore, another module
> 05libc-links is provided that creates those links. The module is
> installed regardless of which libc is used - the script itself discovers
> if the links need to be installed based on which libc is found.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Adam Duskett <aduskett@gmail.com>

Applied to next, with all the changes we discussed in this thread and
on IRC, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (all suggested by Arnout)
>   - added a wrapper script
> Changes v2 -> v3
>   - added modules for:
>      - supporting busybox system init type
>      - fixing a missing symlink for uClibc
> Changes v3 -> v4
>   - some explanations on the dracut modules in the commit log
>   - fixed a bug on the 'require_binary' line in busybox module
>   - expanded variables with double quotes and curly braces
>   - removed commented out code
>   - fixes for 'fakeroot' and 'uclibc' and 'musl' as patches
>   - musl and uclibc dynamic fix
>   - renamed dracut wrapper
>   - disabled when using another init system than systemd or busybox
> Changes v4 -> v5
>   - add hash file;
>   - add DEVELOPERS entries;
>   - replace patch 0001 with an intree file and copy in post-install;
>   - properly format patch 0000, add signoff, rename to 0001;
>   - rename busybox-buildroot to busybox-init;
>   - correct the symlink creation for musl and uclibc;
>   - remove directory part from the extra modules;
>   - remove unused dracut script (identical to dracut_wrapper);
>   - switch to prelink-cross instead of cross-ldd;
>   - make dracut_wrapper script relocatable;
>   - don't set sysroot in wrapper script, expect it to be passed as
>     --sysroot argument;
>   - call the wrapper script bin/dracut instead of sbin/dracut, and
>     rename the original to dracut.real;
>   - fix shellcheck warnings in the module scripts.
> ---
>  DEVELOPERS                                    |  2 +
>  package/Config.in.host                        |  1 +
>  ...001-dracut.sh-don-t-unset-LD_PRELOAD.patch | 29 +++++++++
>  package/dracut/Config.in.host                 |  9 +++
>  package/dracut/busybox-init-module-setup.sh   | 62 +++++++++++++++++++
>  package/dracut/dracut.hash                    |  3 +
>  package/dracut/dracut.mk                      | 47 ++++++++++++++
>  package/dracut/dracut_wrapper.sh              | 33 ++++++++++
>  package/dracut/libc-links-module-setup.sh     | 27 ++++++++
>  9 files changed, 213 insertions(+)
>  create mode 100644 package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
>  create mode 100644 package/dracut/Config.in.host
>  create mode 100644 package/dracut/busybox-init-module-setup.sh
>  create mode 100644 package/dracut/dracut.hash
>  create mode 100644 package/dracut/dracut.mk
>  create mode 100644 package/dracut/dracut_wrapper.sh
>  create mode 100755 package/dracut/libc-links-module-setup.sh
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..4287fd9cf7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -225,6 +225,7 @@ F:	package/espeak/
>  N:	Arnout Vandecappelle <arnout@mind.be>
>  F:	package/arp-scan/
>  F:	package/dehydrated/
> +F:	package/dracut/
>  F:	package/freescale-imx/firmware-imx/
>  F:	package/freescale-imx/imx-lib/
>  F:	package/libpagekite/
> @@ -2796,6 +2797,7 @@ F:	configs/beagleboardx15_defconfig
>  F:	package/pugixml/
>  
>  N:	Thierry Bultel <tbultel@free.fr>
> +F:	package/dracut/
>  F:	package/mpd-mpc/
>  
>  N:	Thijs Vermeir <thijsvermeir@gmail.com>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 99edeafece..f437ef680c 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -19,6 +19,7 @@ menu "Host utilities"
>  	source "package/dos2unix/Config.in.host"
>  	source "package/dosfstools/Config.in.host"
>  	source "package/doxygen/Config.in.host"
> +	source "package/dracut/Config.in.host"
>  	source "package/dtc/Config.in.host"
>  	source "package/e2fsprogs/Config.in.host"
>  	source "package/e2tools/Config.in.host"
> diff --git a/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch b/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
> new file mode 100644
> index 0000000000..87083d2cef
> --- /dev/null
> +++ b/package/dracut/0001-dracut.sh-don-t-unset-LD_PRELOAD.patch
> @@ -0,0 +1,29 @@
> +From bb12f15856911d8532b569116da7dab4cbf107be Mon Sep 17 00:00:00 2001
> +From: Thierry Bultel <thierry.bultel@linatsea.fr>
> +Date: Mon, 10 Jan 2022 09:09:43 +0100
> +Subject: [PATCH] dracut.sh: don't unset LD_PRELOAD
> +
> +LD_PRELOAD is needed to run under fakeroot.
> +
> +Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> +---
> + dracut.sh | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/dracut.sh b/dracut.sh
> +index 60ac46f4..37f25b38 100755
> +--- a/dracut.sh
> ++++ b/dracut.sh
> +@@ -868,8 +868,6 @@ export LC_ALL=C
> + export LANG=C
> + unset LC_MESSAGES
> + unset LC_CTYPE
> +-unset LD_LIBRARY_PATH
> +-unset LD_PRELOAD
> + unset GREP_OPTIONS
> + 
> + export DRACUT_LOG_LEVEL=warning
> +-- 
> +2.37.1
> +
> diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
> new file mode 100644
> index 0000000000..18f562b310
> --- /dev/null
> +++ b/package/dracut/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_DRACUT
> +	bool
> +	select BR2_PACKAGE_HOST_KMOD
> +	help
> +	  dracut is used to create an initramfs image by
> +	  copying tools and files from an installed system
> +	  and combining it with the dracut framework.
> +
> +	  https://dracut.wiki.kernel.org
> diff --git a/package/dracut/busybox-init-module-setup.sh b/package/dracut/busybox-init-module-setup.sh
> new file mode 100644
> index 0000000000..2667f866d1
> --- /dev/null
> +++ b/package/dracut/busybox-init-module-setup.sh
> @@ -0,0 +1,62 @@
> +#!/bin/bash
> +
> +check() {
> +	require_binaries busybox || return 1
> +	return 0
> +}
> +
> +depends() {
> +	return 0
> +}
> +
> +install_busybox_links() {
> +	dir=$1
> +	linkname=$2
> +
> +	(cd "${dracutsysrootdir?}${dir}" &&
> +	for x in *; do
> +		if [ "$(readlink "$x")" = "${linkname}" ]; then
> +			ln -sf "${linkname}" "${initdir?}/${dir}/$x"
> +		fi
> +	done
> +	)
> +}
> +
> +install() {
> +	inst_multiple /bin/busybox
> +
> +	# wrapper script for early console; will launch /sbin/init
> +	# after having mounted devtmpfs
> +	inst_multiple /init
> +
> +	ln -s ../bin/busybox "${initdir?}"/sbin/init
> +
> +	if [ -e "${dracutsysrootdir?}/lib64" ]; then
> +		ln -sf lib "${initdir?}/lib64"
> +		ln -sf lib "${initdir?}/usr/lib64"
> +	fi
> +
> +	if [ -e "${dracutsysrootdir?}/lib32" ]; then
> +		ln -sf lib "${initdir?}/lib32"
> +		ln -sf lib "${initdir?}/usr/lib32"
> +	fi
> +
> +	install_busybox_links "/bin" "busybox"
> +	install_busybox_links "/sbin" "../bin/busybox"
> +	if [ ! -L /bin ]; then
> +		install_busybox_links "/usr/bin" "../../bin/busybox"
> +		install_busybox_links "/usr/sbin" "../../bin/busybox"
> +	fi
> +
> +	inst_multiple \
> +		/etc/inittab	\
> +		/etc/init.d/rcS \
> +		/etc/init.d/rcK \
> +		/etc/issue	\
> +		/etc/fstab	\
> +		/etc/group	\
> +		/etc/passwd	\
> +		/etc/shadow	\
> +		/etc/hostname
> +}
> +
> diff --git a/package/dracut/dracut.hash b/package/dracut/dracut.hash
> new file mode 100644
> index 0000000000..3cda736856
> --- /dev/null
> +++ b/package/dracut/dracut.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  4baa08206cceeb124dbf1075a0daf774b5a8f144ce2e01d82a144af3020fd65b  dracut-055.tar.xz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> new file mode 100644
> index 0000000000..7afec80c0e
> --- /dev/null
> +++ b/package/dracut/dracut.mk
> @@ -0,0 +1,47 @@
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
> +HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
> +
> +define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
> +	install -D -m 0755 $(HOST_DRACUT_PKGDIR)/dracut_wrapper.sh $(HOST_DIR)/bin/dracut
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +
> +# When using uClibc or musl, there must be "ls-uClibc.so.1" or
> +# "ld-musl-x.so" symlinks, respectively - else the init process cannot
> +# start
> +define HOST_DRACUT_POST_INSTALL_LIBC_LINKS_MODULE
> +	$(INSTALL) -D -m 0755 package/dracut/libc-links-module-setup.sh \
> +		$(HOST_DIR)/lib/dracut/modules.d/05libc-links/module-setup.sh
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_LIBC_LINKS_MODULE
> +
> +ifeq ($(BR2_INIT_BUSYBOX),y)
> +# Dracut does not support busybox init (systemd init is assumed to work
> +# out of the box, though). It provides a busybox module, that does not
> +# use the same paths as buildroot, and is not meant to be used as an init
> +# system.
> +# So it is simpler for users to disable the standard 'busybox' module in
> +# the configuration file, and enable the "busybox-init' module instead.
> +# Note that setting the script as executable (0755) is not mandatory,
> +# but this is what dracut does on all its modules, so lets just conform
> +# to it.
> +define HOST_DRACUT_POST_INSTALL_BUSYBOX_INIT_MODULE
> +	$(INSTALL) -D -m 0755 package/dracut/busybox-init-module-setup.sh \
> +		$(HOST_DIR)/lib/dracut/modules.d/05busybox-init/module-setup.sh
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_INIT_MODULE
> +endif
> +
> +$(eval $(host-autotools-package))
> diff --git a/package/dracut/dracut_wrapper.sh b/package/dracut/dracut_wrapper.sh
> new file mode 100644
> index 0000000000..3f58b0907e
> --- /dev/null
> +++ b/package/dracut/dracut_wrapper.sh
> @@ -0,0 +1,33 @@
> +#!/bin/bash
> +set -e
> +
> +# Find the --sysroot argument
> +sysroot=
> +next_arg=
> +for arg; do
> +	if [ "$next_arg" = 1 ]; then
> +		next_arg=
> +		sysroot="$arg"
> +		continue
> +	fi
> +
> +	case "$arg" in
> +	--sysroot=*)
> +		sysroot="${arg#*=}"
> +		;;
> +	--sysroot)
> +		next_arg=1
> +		;;
> +	esac
> +done
> +if [ -z "$sysroot" ]; then
> +	echo "$0: --sysroot argument must be given." 1>&2
> +	exit 1
> +fi
> +
> +topdir="$(dirname "$(realpath "$(dirname "$0")")")"
> +export DRACUT_LDD="$topdir/sbin/prelink-rtld --root='${sysroot}'"
> +export DRACUT_INSTALL="$topdir/lib/dracut/dracut-install"
> +export DRACUT_LDCONFIG=/bin/true
> +export dracutbasedir="$topdir/lib/dracut"
> +exec "$topdir/bin/dracut.real" "$@"
> diff --git a/package/dracut/libc-links-module-setup.sh b/package/dracut/libc-links-module-setup.sh
> new file mode 100755
> index 0000000000..e15b216e6e
> --- /dev/null
> +++ b/package/dracut/libc-links-module-setup.sh
> @@ -0,0 +1,27 @@
> +#!/bin/bash
> +
> +# Adds the missing links for uClibc or musl, if needed
> +
> +check() {
> +	return 0
> +}
> +
> +depends() {
> +	return 0
> +}
> +
> +install() {
> +	# Despite of the fact that the listed dependency (reported by readelf -d)
> +	# is purely /lib/libc.so, the musl symlink is needed anyway.
> +	musl_link="$(find "${dracutsysrootdir?}/lib" -name "ld-musl-*.so*")"
> +	if [ -n "$musl_link" ] ; then
> +		ln -s libc.so "${initdir?}/lib/$(basename "${musl_link}")"
> +	fi
> +
> +	# Same for uClibc, the listed dependency
> +	# is ld-uClibc.so.1, the loader needs the ld-uClibc.so.0, too
> +	uclibc_link="$(find "${dracutsysrootdir?}/lib" -name "ld-uClibc-*.so*")"
> +	if [ -n "$uclibc_link" ] ; then
> +		ln -s ld-uClibc.so.1 "${initdir?s}/lib/ld-uClibc.so.0"
> +	fi
> +}
> -- 
> 2.37.1
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
