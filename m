Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D78E95A91
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C3C4611C3;
	Mon,  9 Oct 2023 14:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3C4611C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HBYb26Rn-LBu; Mon,  9 Oct 2023 14:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC8A61249;
	Mon,  9 Oct 2023 14:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CC8A61249
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 076191BF20B
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E224661249
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E224661249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECscUMBsWklC for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:59:02 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 040BF611C3
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:59:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 040BF611C3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9E5A96014E;
 Mon,  9 Oct 2023 16:58:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 16:58:54 +0200
Date: Mon, 9 Oct 2023 16:58:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009145854.GA14234@scaer>
References: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696863539;
 bh=qzyTUSGn+2a6W1eg61OGiTlq7F9Rv5A1GLngAqmpY4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qB7r2t/JwB5dImSwFk+s4SuFpYnhZ1y5d8mzKdSKF7cU/twybX/9ZJnEhfPptzhx9
 wQVaX0U2vP33KWHBB6XitSRHX8KkkzHa4DLkLFEzg5GUsrevsNQH9RegpRr8ksu7ai
 xBuDohvc2OXpV23Ov0tzXNJUww/kUQMJ9ziLU6j1UnScLRFWtyOY5B8YQxxbO/Uckn
 DO8KwgTHp55XeXIow3TqMQuYDCEYDYFsGQBViWYourmM8Ej9rlt3Rdio1Zn21fJ6YL
 jxWNj4ae9Egns1sjL/HQj/pT3JZsO/F0X7kinZMAfVTNGLFOYOD7CqTxfXMV8HMDd2
 9/ZDYhd3JO8WQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qB7r2t/J
Subject: Re: [Buildroot] [PATCH 1/4] package/openrc: bump version to 0.50
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-09 16:29 +0200, Adam Duskett spake thusly:
>   - Convert to a meson package.
>   - Remove uneeded make opts and installation commands.
>   - Change OPENRC_MAKE_OPTS to OPENRC_CONF_OPTS

Don't describe the patch; explain it.

For example:
  - why is the license hash changed?
  - why is the LIBNAME hack no longer needed (stating "Remove uneeded
    foo" is not really enough, maybe it's just "foo is now handled
    correctly by meson")
  - why don't we no longer need to install our sysv-rcs? And thus, why
    is it not removed from the tree?
  - where is the BRANDING gone?

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  ....in-change-run-lock-from-root-uucp-t.patch |  2 +-
>  ...-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 35 ++++++++---------
>  ...lso-create-run-lock-subsys-directory.patch |  2 +-
>  package/openrc/openrc.hash                    |  4 +-
>  package/openrc/openrc.mk                      | 38 ++++---------------
>  5 files changed, 30 insertions(+), 51 deletions(-)
> 
> diff --git a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
> index 457fbacb5b..2f0a81bbd3 100644
> --- a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
> +++ b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
> @@ -22,7 +22,7 @@ diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
>  index 222bbd3b..7f1a88db 100644
>  --- a/sh/init.sh.Linux.in
>  +++ b/sh/init.sh.Linux.in
> -@@ -85,7 +85,7 @@ fi
> +@@ -83,7 +83,7 @@ fi
>   fi
>   
>   checkpath -d "$RC_SVCDIR"
> diff --git a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
> index 733506ada9..41c367d953 100644
> --- a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
> +++ b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
> @@ -8,27 +8,28 @@ Also tty[1-6] may not exist (e.g. embedded devices with serial consoles
>  only).
>  
>  Signed-off-by: Carlos Santos <unixmania@gmail.com>
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +Refresh for 0.50
>  ---
> - runlevels/Makefile | 6 ------
> + tools/meson_runlevels.sh | 6 ------
>   1 file changed, 6 deletions(-)
>  
> -diff --git a/runlevels/Makefile b/runlevels/Makefile
> -index 73843d8b..dbfb59ca 100644
> ---- a/runlevels/Makefile
> -+++ b/runlevels/Makefile
> -@@ -90,12 +90,6 @@ install:
> - 			fi; \
> - 			ln -snf ${INITDIR}/"$$x" ${SHUTDOWNDIR}/"$$x" || exit $$?; done \
> - 	fi
> --	if test "${MKSYSVINIT}" = yes && test "${OS}" = Linux; then \
> --		for x in tty1 tty2 tty3 tty4 tty5 tty6; do \
> --			ln -snf ${INITDIR}/agetty ${DESTDIR}/${INITDIR}/"agetty.$$x" || exit $$?; \
> --			ln -snf ${INITDIR}/agetty.$$x ${DEFAULTDIR}/"agetty.$$x" || exit $$?; \
> --		done; \
> --	fi
> - 
> - check test::
> +diff --git a/tools/meson_runlevels.sh b/tools/meson_runlevels.sh
> +index 1473d4e..eee256b 100755
> +--- a/tools/meson_runlevels.sh
> ++++ b/tools/meson_runlevels.sh
> +@@ -91,11 +91,5 @@ if ! test -d "${DESTDIR}${shutdowndir}"; then
> + 		ln -snf "${init_d_dir}/$x" "${DESTDIR}${shutdowndir}/$x"
> + 	done
> + fi
> +-if test "${sysvinit}" = yes && test "${os}" = Linux; then \
> +-	for x in tty1 tty2 tty3 tty4 tty5 tty6; do
> +-		ln -snf "${init_d_dir}/agetty" "${DESTDIR}/${init_d_dir}/agetty.$x"
> +-		ln -snf "${init_d_dir}/agetty.$x" "${DESTDIR}/${defaultdir}/agetty.$x"
> +-	done;
> +-fi
>   
> + ln -snf "${rc_libexecdir}"/sh/functions.sh "${DESTDIR}/${init_d_dir}"
>  -- 
>  2.18.2
>  
> diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> index cf592a88b0..ad78a4b8f7 100644
> --- a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> +++ b/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> @@ -15,7 +15,7 @@ diff --git a/sh/init.sh.Linux.in b/sh/init.sh.Linux.in
>  index e8afc1fb..662ab223 100644
>  --- a/sh/init.sh.Linux.in
>  +++ b/sh/init.sh.Linux.in
> -@@ -82,7 +82,7 @@ elif ! mountinfo -q /run; then
> +@@ -83,7 +83,7 @@ elif ! mountinfo -q /run; then
>   fi
>   
>   checkpath -d "$RC_SVCDIR"
> diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
> index 4fcfa9132f..24a6878911 100644
> --- a/package/openrc/openrc.hash
> +++ b/package/openrc/openrc.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  968e81743a1de7a2348590b3b3286d6af5baf96da28fa1e6364e24f8203fc3b6  openrc-0.43.3.tar.gz
> -sha256  96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624  LICENSE
> +sha256  8d9bb3a68a491d5d4e0f0af1515e00f27e4463acc0c256930aded26c7c8a834b  openrc-0.50.tar.gz
> +sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 1d4e70f712..01c23a2a79 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENRC_VERSION = 0.43.3
> +OPENRC_VERSION = 0.50
>  OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
>  OPENRC_LICENSE = BSD-2-Clause
>  OPENRC_LICENSE_FILES = LICENSE
> @@ -12,40 +12,18 @@ OPENRC_CPE_ID_VENDOR = openrc_project
>  
>  OPENRC_DEPENDENCIES = ncurses
>  
> -# set LIBNAME so openrc puts files in proper directories and sets proper
> -# paths in installed files. Since in buildroot /lib64 and /lib32 always
> -# points to /lib, it's safe to hardcode it to "lib"
> -OPENRC_MAKE_OPTS = \
> -	LIBNAME=lib \
> -	LIBEXECDIR=/usr/libexec/rc \
> -	MKPKGCONFIG=no \
> -	MKSYSVINIT=yes \
> -	BRANDING="Buildroot $(BR2_VERSION_FULL)" \
> -	CC=$(TARGET_CC)
> -
> -ifeq ($(BR2_SHARED_LIBS),y)
> -OPENRC_MAKE_OPTS += MKSTATICLIBS=no
> -else
> -OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
> -endif
> +OPENRC_CONF_OPTS = \
> +	-Dos=Linux \
> +	-Dpkgconfig=false \
> +	-Dsysvinit=true
>  
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> -OPENRC_MAKE_OPTS += MKSELINUX=yes
> +OPENRC_CONF_OPTS += -Dselinux=enabled
>  OPENRC_DEPENDENCIES += libselinux
>  else
> -OPENRC_MAKE_OPTS += MKSELINUX=no
> +OPENRC_CONF_OPTS += -Dselinux=disabled
>  endif
>  
> -define OPENRC_BUILD_CMDS
> -	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
> -endef
> -
> -define OPENRC_INSTALL_TARGET_CMDS
> -	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
> -	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
> -		$(TARGET_DIR)/etc/init.d/sysv-rcs
> -endef
> -
>  ifeq ($(BR2_PACKAGE_KBD),)
>  # keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
>  # remove them if the kbd package is not selected (e.g. devices with serial
> @@ -90,4 +68,4 @@ endef
>  OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY
>  endif # BR2_TARGET_GENERIC_GETTY
>  
> -$(eval $(generic-package))
> +$(eval $(meson-package))
> -- 
> 2.41.0
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
