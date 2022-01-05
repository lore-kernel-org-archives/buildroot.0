Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 23:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C963240915;
	Wed,  5 Jan 2022 23:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDoIorYVJvgz; Wed,  5 Jan 2022 23:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D628E414C6;
	Wed,  5 Jan 2022 23:17:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 555911BF336
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 23:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E3B840361
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 23:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y0OMG9byJIJ for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 23:17:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42330400B8
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 23:17:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91d2:d1c6:5626:51cd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E184E7802FE;
 Thu,  6 Jan 2022 00:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641424627;
 bh=qGqFexPlBoZBT9EjurRkBoXQNfOzfpKn1qiSr+4Qtx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D+eSR3VmfD3b68+MAQOHDz05Son/qqmTrdupCD7WXGalrnTQ4mQqi1VRCBYFyMK6a
 lTCdeo6ZmPkn04viFoCwxygmiuOznulIGDRtXeM1zcd2yIFe/zFkd5XzDp+SynOWkO
 1AeOKJ596MLQNY0XpVfYFWAXMiuKQjsY9A1C2E0N5ig+b3nUYey85ejaD3mqV7H45Z
 fqevWPM9NS6BoVi0M1MYtMjdrpJ53cCt3zmTYDMTQs7rauSkKMehUWyHCkLT2bZbdo
 x0AFUgEsVo8C74vZe+QfXcY30Fk1If4UkbwkBI5mKo8W6Nqej+aQiknkwrDzJHHohE
 ieJNw+FuiIdeQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jan 2022 00:16:54 +0100
Date: Thu, 6 Jan 2022 00:16:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20220105231654.GL614810@scaer>
References: <20211223111348.3532601-1-thierry.bultel@linatsea.fr>
 <20211223111348.3532601-2-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211223111348.3532601-2-thierry.bultel@linatsea.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/3] package/dracut: new host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thierry, All,

On 2021-12-23 12:13 +0100, Thierry Bultel spake thusly:
> dracut is the tool used by desktop distributions to
> build initrds. In the embedded world, it can be
> very usefull, too, for instance when wanting to
> create an initramfs for a system recovery mode.
> Whereas it is definitively possible to achieve
> this with buildroot, the process is to have a
> dedicated buildroot configuration for that,
> and perform a full build. Instead of doing that,
> the idea is to use dracut to pick the needed
> binaries/shared libraries, configuration files,
> or kernel modules from the 'target' directory.
> The advantage is to save build time, and also
> to have a consistency between the packages versions
> taken for the recovery and the production filesystem.

Please, wrap your commit log to ~72 chars.

> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> ---
[--SNIP--]
> diff --git a/package/dracut/05busybox-buildroot/module-setup.sh b/package/dracut/05busybox-buildroot/module-setup.sh
> new file mode 100755
> index 0000000000..b227571db4
> --- /dev/null
> +++ b/package/dracut/05busybox-buildroot/module-setup.sh

You will have to (briefly, maybe) explain how those 'modules' are meant
to be used...

> @@ -0,0 +1,69 @@
> +#!/bin/bash

... here you make it an executable (0755) shell script, but it only
defines functions, it actually calls nothing. Are moduels supposed to be
source-d from dracut itself?

> +check() {
> +	require_binaries \
> +		busybox | return 1

This can't possibly work: it will always fail (there is a single pipe,
so the whole command will fail).

Then what happens depends on whether the shell is set -e or not. If it
is not set -e, the execution continues, and the check() function will
always return 0 (success). If the shell is set -e, then execution of
check() ends right there, and presumably check() is called as an
if-block condition, and thus the condition will never be true.

So, it was not tested? ;-)

(also: commands that fit on a line should be on a single line, like so:
    require_binaries busybox || return 1
)

> +	return 0
> +}
> +
> +depends() {
> +	return 0
> +}
> +
> +
> +install_busybox_links() {
> +	dir=$1
> +	linkname=$2
> +
> +	(cd "$dracutsysrootdir"$dir &&

    $ shellcheck package/dracut/05busybox-buildroot/module-setup.sh
        (cd "$dracutsysrootdir"$dir &&
                               ^--^ SC2086: Double quote to prevent globbing and word splitting.

Also, please do variable expansion with curly braces (everywhere):

    "${dracutsysrootdir}${dir}"

> +	for x in *; do
> +	    if [ "$(readlink "$x")" = $linkname ]; then
> +	    	ln -sf $linkname $initdir/$dir/$x
> +	    fi
> +	done
> +	)
> +
> +}
> +
> +install() {
> +

No initial empty line at begining of function.

[--SNIP--]
> +#	mkdir -p $initdir/etc/init.d
> +#	cp -a $dracutsysrootdir/etc/init.d/* $initdir/etc/init.d

Commented-out debug code or non-function code should just be removed.

> +	

No empty line at the end of function.

> +}
> +
> diff --git a/package/dracut/06uclibc/module-setup.sh b/package/dracut/06uclibc/module-setup.sh
> new file mode 100644
> index 0000000000..77e9bd864e
> --- /dev/null
> +++ b/package/dracut/06uclibc/module-setup.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +
> +check() {
> +	return 0
> +}
> +
> +depends() {
> +	return 0
> +}
> +
> +
> +
> +install() {
> +
> +	# Despite of the fact that the listed dependency (reported by readelf -d)
> +	# is purely ld-uClibc.so.1, the loader needs the ld-uClibc.so.0, too
> +
> +	ln -s ld-uClibc.so.1 $initdir/lib/ld-uClibc.so.0
> +

Extra empty lines...

But still, a little explanations (in the commit log) on how those
scripts are supposed to be used would help further review.

[--SNIP--]
> diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
> new file mode 100644
> index 0000000000..6c82b4ba75
> --- /dev/null
> +++ b/package/dracut/dracut.mk
> @@ -0,0 +1,45 @@
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
> +HOST_DRACUT_DEPENDENCIES += host-pkgconf host-kmod host-cross-ldd

First assignment should not be +=, but just =.

> +define HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
> +	$(SED) '/unset LD_LIBRARY_PATH/d' $(HOST_DIR)/bin/dracut
> +	$(SED) '/unset LD_PRELOAD/d' $(HOST_DIR)/bin/dracut

As for cross-ldd, we prefer that patching be done with actual patches
rather than sed expressions.

> +endef
> +
> +define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
> +	$(INSTALL) -D -m 0755 package/dracut/dracut_wrapper.sh \
> +		$(HOST_DIR)/usr/bin/dracut_wrapper.sh

Your commit log does not explain the reason why we need to have a
wrapper, or how it is going to be used...

Usually, when we introduce a wrapper, it replace sthe original
executable in name, and the original is renamed, with the wrapper
eventually calling into the renamed original...

So having a wrapper installed as you do it is slightly off-road...

> +endef
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +define HOST_DRACUT_POST_INSTALL_UCLIBC_MODULE
> +	$(INSTALL) -D -m 0755 package/dracut/06uclibc/module-setup.sh \
> +		$(HOST_DIR)/lib/dracut/modules.d/06uclibc/module-setup.sh
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_UCLIBC_MODULE
> +endif

And what about glibc? musl?

Can we unconditionally install the modules and change their check()
functions to decide whther the moduels is usable or not? Or something
else dynamic?

> +ifeq ($(BR2_INIT_BUSYBOX),y)
> +define HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
> +	$(INSTALL) -D -m 0755 package/dracut/05busybox-buildroot/module-setup.sh \
> +		$(HOST_DIR)/lib/dracut/modules.d/05busybox-buildroot/module-setup.sh
> +endef
> +HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE

And what about systemd as an init system? openrc? sysv-init? Others?

> +endif
> +
> +HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
> +HOST_DRACUT_POST_INSTALL_HOOKS+=HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT

Spaces around the operator. Also, since this is the same hook, a single
assignment is better:

    HOST_DRACUT_POST_INSTALL_HOOKS += \
        HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT \
        HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT

Note: we prefer to have uncondtional asignemnts come before the
conditional ones, and we also prefer to have ythe hook assignment
come right after the hook definitionm like so:


    define HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT
        blabla
    endef
    HOST_DRACUT_POST_INSTALL_HOOKS = HOST_DRACUT_POST_INSTALL_ENABLE_FAKEROOT

    define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
        blabla
    endef
    HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT

    ifeq ($(BR2_INIT_BUSYBOX),y)
    define HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
        blabla
    endef
    HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_BUSYBOX_MODULE
    endif

and so on...

Regards,
Yann E. MORIN.

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
