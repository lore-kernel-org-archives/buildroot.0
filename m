Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2211C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 11:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3566C81F37;
	Tue, 11 Apr 2023 11:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3566C81F37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsCMOqMhAJv3; Tue, 11 Apr 2023 11:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3AC98206B;
	Tue, 11 Apr 2023 11:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3AC98206B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 540121C3BF6
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 11:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B13E403F9
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 11:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B13E403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlOQFJEtEQ3y for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 11:31:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BDF6400E2
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BDF6400E2
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 11:31:33 +0000 (UTC)
Received: from opfednr04.francetelecom.fr (unknown [xx.xx.xx.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr23.francetelecom.fr (ESMTP service) with ESMTPS id 4PwkFG3Jlbz5w02; 
 Tue, 11 Apr 2023 13:31:30 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 11 Apr 2023 13:31:28 +0200
Date: Tue, 11 Apr 2023 13:31:28 +0200
From: <yann.morin@orange.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <27991_1681212690_64354512_27991_146_1_20230411113128.GA483930@tl-lnx-nyma7486>
References: <20230329193028.775041-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329193028.775041-1-sebastian.weyer@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX205.corporate.adroot.infra.ftgroup (10.115.27.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1681212690;
 bh=ZTBfB8QxKI/suZA5q+E/uUF6h13nRftE3IyXJu29nfQ=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Mb3ifx90M3SE+u0rHH2cEejse11Za6T6juzxn+YMxJSSypp424ibJRyj5Nl7Wi9Ae
 IoTynIYo7mTyY1FFZy0QGBSVDd9XHCrdQOl0TqrosXuhgBlEgWL3Og90te79SjYaeo
 exdLv/L/taYvA4QRTAVhBjBE5zqiGCAzgBPvYL+29B4a7yzUGOjALKjzCSFgSMHxpd
 ahUOxXXwytra89X5w4E55GPtTaUDkZAJD6mSA6Q6Rtsv4LnseXz1kmClwvG33UAIMs
 8KgwiZXooy5dexcE0jBQCvo9VmxlsEdWbjHR+N/ixV0i41fia7NPVKfTha/T4Xe4HF
 Dg+jP9nXO5ftw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=Mb3ifx90
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: bump to version 2.37
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
Cc: Romain Naour <romain.naour@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sebastian, Romain, All,

On 2023-03-29 21:30 +0200, Sebastian Weyer spake thusly:
> From: Romain Naour <romain.naour@smile.fr>
> 
> See:
> https://sourceware.org/glibc/wiki/Release/2.37
> https://lists.gnu.org/archive/html/info-gnu/2023-02/msg00000.html


Thos bump breaks the build of host-localedef, as a patch can't be
applied:

    >>> host-localedef 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa Patching
    Applying 0001-HACK-only-build-and-install-localedef.patch using patch:
    patching file Rules
    Hunk #1 succeeded at 224 (offset 8 lines).
    patching file locale/Makefile

    Applying 0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch using patch:
    patching file configure
    Hunk #1 succeeded at 4178 with fuzz 1 (offset -473 lines).
    Hunk #2 FAILED at 4781.
    Hunk #3 succeeded at 4589 (offset -600 lines).
    1 out of 3 hunks FAILED -- saving rejects to file configure.rej

Could you please have a look?

Bizarrely though, we do not yet have any autobuild failure (is it
because no config needs to build locales?)...

Regards,
Yann E. MORIN.

> Security related changes:
> 
>   CVE-2022-39046: When the syslog function is passed a crafted input
>   string larger than 1024 bytes, it reads uninitialized memory from the
>   heap and prints it to the target log file, potentially revealing a
>   portion of the contents of the heap
> 
> Remove patch 0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch fixed
> in 2.37 release by [1].
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=29249
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>  ...lement-a-useful-version-of-_startup_.patch | 132 ------------------
>  package/glibc/glibc.hash                      |   2 +-
>  package/glibc/glibc.mk                        |   2 +-
>  package/localedef/localedef.mk                |   2 +-
>  4 files changed, 3 insertions(+), 135 deletions(-)
>  delete mode 100644 package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> 
> diff --git a/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch b/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> deleted file mode 100644
> index 549650aca1..0000000000
> --- a/package/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
> +++ /dev/null
> @@ -1,132 +0,0 @@
> -From dfda505870f94a7ac8063eb47f622ddc65665ff1 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Tue, 14 Jun 2022 19:42:43 -0600
> -Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fatal"
> -
> -Fixes:
> -csu/libc-tls.c:202: undefined reference to `_startup_fatal_not_constant'
> -
> -This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
> -
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----
> - sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
> - sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
> - sysdeps/unix/sysv/linux/startup.h      | 39 --------------------------
> - 3 files changed, 19 insertions(+), 65 deletions(-)
> - delete mode 100644 sysdeps/unix/sysv/linux/ia64/startup.h
> - delete mode 100644 sysdeps/unix/sysv/linux/startup.h
> -
> -diff --git a/sysdeps/unix/sysv/linux/i386/startup.h b/sysdeps/unix/sysv/linux/i386/startup.h
> -index 213805d7d2..67c9310f3a 100644
> ---- a/sysdeps/unix/sysv/linux/i386/startup.h
> -+++ b/sysdeps/unix/sysv/linux/i386/startup.h
> -@@ -1,5 +1,5 @@
> - /* Linux/i386 definitions of functions used by static libc main startup.
> --   Copyright (C) 2022 Free Software Foundation, Inc.
> -+   Copyright (C) 2017-2022 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> - 
> -    The GNU C Library is free software; you can redistribute it and/or
> -@@ -16,7 +16,22 @@
> -    License along with the GNU C Library; if not, see
> -    <https://www.gnu.org/licenses/>.  */
> - 
> --/* Can't use "call *%gs:SYSINFO_OFFSET" during startup.  */
> --#define I386_USE_SYSENTER 0
> -+#if BUILD_PIE_DEFAULT
> -+/* Can't use "call *%gs:SYSINFO_OFFSET" during statup in static PIE.  */
> -+# define I386_USE_SYSENTER 0
> - 
> --#include_next <startup.h>
> -+# include <sysdep.h>
> -+# include <abort-instr.h>
> -+
> -+__attribute__ ((__noreturn__))
> -+static inline void
> -+_startup_fatal (const char *message __attribute__ ((unused)))
> -+{
> -+  /* This is only called very early during startup in static PIE.
> -+     FIXME: How can it be improved?  */
> -+  ABORT_INSTRUCTION;
> -+  __builtin_unreachable ();
> -+}
> -+#else
> -+# include_next <startup.h>
> -+#endif
> -diff --git a/sysdeps/unix/sysv/linux/ia64/startup.h b/sysdeps/unix/sysv/linux/ia64/startup.h
> -deleted file mode 100644
> -index 77f29f15a2..0000000000
> ---- a/sysdeps/unix/sysv/linux/ia64/startup.h
> -+++ /dev/null
> -@@ -1,22 +0,0 @@
> --/* Linux/ia64 definitions of functions used by static libc main startup.
> --   Copyright (C) 2022 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, see
> --   <https://www.gnu.org/licenses/>.  */
> --
> --/* This code is used before the TCB is set up.  */
> --#define IA64_USE_NEW_STUB 0
> --
> --#include_next <startup.h>
> -diff --git a/sysdeps/unix/sysv/linux/startup.h b/sysdeps/unix/sysv/linux/startup.h
> -deleted file mode 100644
> -index 39859b404a..0000000000
> ---- a/sysdeps/unix/sysv/linux/startup.h
> -+++ /dev/null
> -@@ -1,39 +0,0 @@
> --/* Linux definitions of functions used by static libc main startup.
> --   Copyright (C) 2017-2022 Free Software Foundation, Inc.
> --   This file is part of the GNU C Library.
> --
> --   The GNU C Library is free software; you can redistribute it and/or
> --   modify it under the terms of the GNU Lesser General Public
> --   License as published by the Free Software Foundation; either
> --   version 2.1 of the License, or (at your option) any later version.
> --
> --   The GNU C Library is distributed in the hope that it will be useful,
> --   but WITHOUT ANY WARRANTY; without even the implied warranty of
> --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> --   Lesser General Public License for more details.
> --
> --   You should have received a copy of the GNU Lesser General Public
> --   License along with the GNU C Library; if not, see
> --   <https://www.gnu.org/licenses/>.  */
> --
> --#ifdef SHARED
> --# include_next <startup.h>
> --#else
> --# include <sysdep.h>
> --
> --/* Avoid a run-time invocation of strlen.  */
> --#define _startup_fatal(message)                                         \
> --  do                                                                    \
> --    {                                                                   \
> --      size_t __message_length = __builtin_strlen (message);             \
> --      if (! __builtin_constant_p (__message_length))                    \
> --        {                                                               \
> --          extern void _startup_fatal_not_constant (void);               \
> --          _startup_fatal_not_constant ();                               \
> --        }                                                               \
> --      INTERNAL_SYSCALL_CALL (write, STDERR_FILENO, (message),           \
> --                             __message_length);                         \
> --      INTERNAL_SYSCALL_CALL (exit_group, 127);                          \
> --    }                                                                   \
> --  while (0)
> --#endif  /* !SHARED */
> --- 
> -2.25.1
> -
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 4ce4c6f6d1..453aadae11 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  666482e657c319f7e139121121a0d97d303c65207b9f9730f42a3ee83c79f686  glibc-2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c.tar.gz
> +sha256  0f8bfad0b853a0c6e1dd1c3254a30b58d4c7050870fe2b0da90ad40f4d450ce2  glibc-2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 354f035d33..79e6c76cb4 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
> +GLIBC_VERSION = 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 6699840854..6f8b170516 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.36-81-g4f4d7a13edfd2fdc57c9d76e1fd6d017fb47550c
> +LOCALEDEF_VERSION = 2.37-2-g9f8513dc64119a424b312db97cef5d87d376defa
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>  HOST_LOCALEDEF_DL_SUBDIR = glibc
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
