Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F9CC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 12:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64539405AC;
	Mon, 15 Aug 2022 12:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64539405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pt_Figbh2Ruq; Mon, 15 Aug 2022 12:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34E7440AD9;
	Mon, 15 Aug 2022 12:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34E7440AD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 247821BF3B9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D3B60BA8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 12:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3D3B60BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yp2jHZvYvHpC for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 12:37:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B037D60590
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B037D60590
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 12:37:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E5EC06012D;
 Mon, 15 Aug 2022 14:36:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 14:36:56 +0200
Date: Mon, 15 Aug 2022 14:36:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220815123656.GW2854108@scaer>
References: <20220815111710.1459820-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815111710.1459820-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660567021;
 bh=jZ02Q9+IitB1EL999ilT8sBqIu7W7yWOc9+HqI6PbsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5gW/7Y990ySRlVhPtvjtgeagqKFBr2vTUELIQm86tIAvSDN5fimo+zdAgsmXhGCp
 Id/z6tYcTbtBYXcDHJ3q5qL2fNbZXh5GCcOiTEkF/zqlDD6XVJ9uSFTmZjBr/d6fsI
 81PsgcZS8XFx3Ca15DLJ0RyDc1PVTRu0P1FGnqoImXH3len2v6l0V+LC73fEjgJqua
 oeZRdfj7DHYUPto6WE1P61pOoCa5ewAT5b7qxpmPWAbPf77EuigyIhk9bZ7//E1BUm
 LrBrq5s70I5Fmvijo56WniZMSfvbgOYLHR8H9Neto7Zlfng8K2sLems71Wfmz/MgzV
 +PlqFSltCpxMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S5gW/7Y9
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

Arnout, All,

On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: Thierry Bultel <thierry.bultel@linatsea.fr>
> Dracut is the tool used by desktop distributions to build initrds.
[--SNIP--]
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

We also need LD_LIBRARY_PATH to actually find our lifakeroot.so (as
discussed on IRC).

[--SNIP--]
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

return 0 is not needed: a shell function returns with the exit code from
the last command it ran. In this case, the previous command succeeded,
or we'd have already returned with 1, so the return code would be 0.

Still, we can keep it if that makes it consistent with the rest of the
dracut modules.

> +}
> +
> +depends() {
> +	return 0

Here, a colon should be enough:  depends() { :; }
Yet, consistency? ;-)

> +}
> +
> +install_busybox_links() {
> +	dir=$1
> +	linkname=$2
> +
> +	(cd "${dracutsysrootdir?}${dir}" &&
> +	for x in *; do
> +		if [ "$(readlink "$x")" = "${linkname}" ]; then

Always expand between curly braces, even single-char variables.

> +			ln -sf "${linkname}" "${initdir?}/${dir}/$x"

Ditto.

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

Isn't that already covered by the second install_busybox_links call,
below?

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

This one should catch the /sbin/init -> /bin/busybox symlink, no?

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

Spurious empty line at EOF.

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

056 is tarball-released, and 057 is github-tagged now. We can bump in a
later commit, of course.

> +DRACUT_SOURCE = dracut-$(DRACUT_VERSION).tar.xz
> +DRACUT_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/dracut

So, what is the canonical source? Kernel.org has 056, but not 057. Their
README.md hints that github is the official source:

    Currently dracut is developed on [github.com](https://github.com/dracutdevs/dracut).

    The release tarballs are [here](https://github.com/dracutdevs/dracut/releases).

> +DRACUT_LICENSE = GPL-2.0
> +DRACUT_LICENSE_FILES = COPYING
> +
> +HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
> +
> +define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
> +	install -D -m 0755 $(HOST_DRACUT_PKGDIR)/dracut_wrapper.sh $(HOST_DIR)/bin/dracut

There is no reason to add the '.sh' suffix to any executable shell
script, since what matters is the shebang line, especially since it
is eventually installed as a non-suffixed name.

> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +
> +# When using uClibc or musl, there must be "ls-uClibc.so.1" or
                                              ,^^
s/ls/ld/ ------------------------------------'

[--SNIP--]
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

For such a situation, there is a construct that I started to like and
use, is to use 'true' and 'false' instead of markers in variables, so
that we can actually test the variable directly:

    sysroot
    next_arg=false
    for arg; do
        if ${next_arg}; then
            next_arg=false
            sysroot="${arg}"
            continue  # not break, in case there are more than one
        fi
        case "${arg}" in
          (--sysroot)
            next_arg=true
            continue
            ;;
          (--sysroot=*)
            sysroot="${arg#*=}"
            continue  # not break, in case there are more than one
            ;;
        esac
    done

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

Curly-braces for expansion.

> +	echo "$0: --sysroot argument must be given." 1>&2
> +	exit 1
> +fi
> +
> +topdir="$(dirname "$(realpath "$(dirname "$0")")")"

You can avoid a call to dirname, with just: ${0%/*}

Also, always expand variables with curly braces, even positional
arguments.

> +export DRACUT_LDD="$topdir/sbin/prelink-rtld --root='${sysroot}'"
                       ^^^^^^
Always expand variables between curly braces, especially since there is
already such an expansion on the same line (also valid below).

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

Besides the usual curly-braces expansion comment, you don't need to use
basename here: ${musl_link##*/}

All of those are minor and can be fixed when applying, but there are a
few where a reply/confirmation would still be welcome.

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
