Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EA1CD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FE3240547;
	Sun, 17 Sep 2023 19:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE3240547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esrHKmetEeko; Sun, 17 Sep 2023 19:41:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B0E4056A;
	Sun, 17 Sep 2023 19:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B0E4056A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAF801BF2C6
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 829AD405DE
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 829AD405DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypWorN_rRk0f for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:41:31 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD60F405B7
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD60F405B7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6c46:319:6f5d:1ada])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 569A06012D;
 Sun, 17 Sep 2023 21:41:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 21:41:23 +0200
Date: Sun, 17 Sep 2023 21:41:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230917194123.GA2573@scaer>
References: <20230917152303.1300577-1-yann.morin.1998@free.fr>
 <23f8c528-9158-07ae-615e-e2ca44c842e8@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23f8c528-9158-07ae-615e-e2ca44c842e8@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694979688;
 bh=tThTmCpJokIiTjBP8dqCyniQHkD3kO8bFvlaxI1UgKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JQ0n3PZC/3I1p83UK5dBgFwZ25ZHM9v/sSCuzCfbuJxdgKWXNRqlSIS9wh8gFrmtt
 3JoEn8nqlJuveOiHbRzsT2uVzD0jXaeDZt1f05tW3nN0gfXzFzFD9p18vsqgib4ltC
 6JBWHqEOR1m5/XyzrlbnUWkrxmJvC7n6ReY+cP8YkZ6iCXAjUzutof/Rn6jjLb0xeM
 jRmEwsDPn2KPhrUEq8zPRFe8has6bh/1jicUrrPpEghbzqKm5ibuZGi95/rh3XFn9n
 gd96pMM9SgbOhk3Y0YUUUHjhZw/4FYBsvhNP6FQCcEtmPBAiOC4OgcpqrHB93wReKF
 WLOOeJTqbjbxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JQ0n3PZC
Subject: Re: [Buildroot] [PATCH] package/gdb: gdbserver does not need zlib
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2023-09-17 21:32 +0200, Arnout Vandecappelle via buildroot spake thusly:
> On 17/09/2023 17:23, Yann E. MORIN wrote:
[--SNIP--]
> >As Julien noticed, for example, tcl will try and link with zlib if
> >available, and at build time it is. But at runtime, it is not, and thus
> >tclsh fails to run; see 7af8dee3a8a0 (package/tcl: add mandatory
> >dependency to zlib)
>  So this commit should be reverted now?

No, because tcl unconditionally uses zlib: either a bundled version, or
the system one. 7af8dee3a8a0 ensured the system one is available and
used.

> >So, when we onlyt build gdbserver, we tell configure to not use a system
> >zlib, which triggers a build of the bundled one, which we do not use...
>  I didn't think this paragraph was very clear, so I reformulated it a
> little, and applied to master, thanks.

Better, indeed, thanks!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >
> >Reported-by: Julien Olivain <ju.o@free.fr>
> >Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> >Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> >Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >---
> >  package/gdb/Config.in |  2 +-
> >  package/gdb/gdb.mk    | 14 ++++++++++----
> >  2 files changed, 11 insertions(+), 5 deletions(-)
> >
> >diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> >index 20fd262c93..e4ab39a2bd 100644
> >--- a/package/gdb/Config.in
> >+++ b/package/gdb/Config.in
> >@@ -24,7 +24,6 @@ config BR2_PACKAGE_GDB
> >  	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
> >  	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
> >  	depends on !BR2_or1k || !BR2_TOOLCHAIN_USES_MUSL
> >-	select BR2_PACKAGE_ZLIB
> >  	# When the external toolchain gdbserver is copied to the
> >  	# target, we don't allow building a separate gdbserver. The
> >  	# one from the external toolchain should be used.
> >@@ -61,6 +60,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
> >  	depends on !BR2_sh
> >  	select BR2_PACKAGE_GMP if !BR2_arc
> >  	select BR2_PACKAGE_NCURSES
> >+	select BR2_PACKAGE_ZLIB
> >  comment "full gdb on target needs a toolchain w/ wchar"
> >  	depends on !BR2_sh
> >diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> >index 0d41548ed0..070598b385 100644
> >--- a/package/gdb/gdb.mk
> >+++ b/package/gdb/gdb.mk
> >@@ -32,7 +32,6 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
> >  # also need ncurses.
> >  # As for libiberty, gdb may use a system-installed one if present, so
> >  # we must ensure ours is installed first.
> >-GDB_DEPENDENCIES = zlib
> >  HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
> >  # Disable building documentation
> >@@ -131,22 +130,29 @@ GDB_CONF_OPTS = \
> >  	--disable-sim \
> >  	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
> >  	--without-included-gettext \
> >-	--with-system-zlib \
> >  	--disable-werror \
> >  	--enable-static \
> >  	--without-mpfr \
> >  	--disable-source-highlight
> >  ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
> >+GDB_DEPENDENCIES += zlib
> >  GDB_CONF_OPTS += \
> >  	--enable-gdb \
> >-	--with-curses
> >+	--with-curses \
> >+	--with-system-zlib
> >  GDB_DEPENDENCIES += ncurses \
> >  	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
> >  else
> >+# When only building gdbserver, we don't need zlib. But we have no way to
> >+# tell the top-level configure that we don't need zlib: it either wants to
> >+# build the bundled one, or use the system one.
> >+# Since we're going to only install the gdbserver to the target, we don't
> >+# care that the bundled zlib is built, as it is not used.
> >  GDB_CONF_OPTS += \
> >  	--disable-gdb \
> >-	--without-curses
> >+	--without-curses \
> >+	--without-system-zlib
> >  endif
> >  # Starting from GDB 11.x, gmp is needed as a dependency to build full
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
