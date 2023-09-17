Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D90CD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 13:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CDB5402F2;
	Sun, 17 Sep 2023 13:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CDB5402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhnRxk_MZ0i6; Sun, 17 Sep 2023 13:31:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1159A40449;
	Sun, 17 Sep 2023 13:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1159A40449
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A664E1BF41F
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 13:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D94041584
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 13:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D94041584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ac67ZrXKgyWW for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 13:31:42 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFF8F40624
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 13:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF8F40624
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0ADDBB00579;
 Sun, 17 Sep 2023 15:31:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 15:31:36 +0200
Date: Sun, 17 Sep 2023 15:31:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230917133136.GY415981@scaer>
References: <20230917130122.576967-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230917130122.576967-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694957499;
 bh=uNAaaEHZkFhhpFC9N+oaJyo7V6HmImiIbcvpUgV1us8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcoWgF5wKlH/P5OCpiV9005roHkvXzEFRtW3a6piirE4oVjx/N7HeOswJpdj9XyvU
 4i4UmjbGRYXpjFyp/mnxrRauW8tOBWLSzBG93bRjOWWC+6g4JrYbfurJBlIQ+59jlN
 OKo8Tc+uEeKts5Vqv81Fm1crtXPIW6Riph3DAJ8AzYg4xdcZau+UP+6nP3+2xQc5W6
 Ks9MBKmkCv1/vL4BYrRcj9fmDxzq6eoRFph6WvzxsofHiJ4/zk0X8dP/D+r2fj2GCG
 KOkxR9eeWpgoD6rOE6M0zeqvvEbU7fatkmUu5ELKnQ/pPNyMYIthxG9E8JI0qUhkQF
 tLZ9HOj3Yod5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lcoWgF5w
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: add mandatory dependency
 to zlib
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2023-09-17 15:01 +0200, Julien Olivain spake thusly:
> Tcl changed its zlib handling in upstream commit [1]. Before this
> commit, the HAVE_ZLIB macro was defined only if a zlib headers/library
> was found. After that commit, the HAVE_ZLIB macro is unconditionally
> defined. The only change is that: if a working zlib library is found
> in the toolchain sysroot, it is used. Otherwise, the package will use
> a shipped version in [2]. See also [3] and [4].
> 
> This tcl commit is included in Buildroot since commit 7fda943b43
> "tcl: bump to version 8.6.1".
> 
> This behavior leads to runtime failures, when the package is compiled
> with toolchains including zlib in their sysroot. This is because at
> configuration time, the package will detect zlib in the sysroot and
> link against it, but the library files won't be installed on target.
> 
> This happen to be the case with Bootlin toolchains such as [5]. This

I would think that this is a bug that those toolchains have zlib in
their sysroot.

Indeed, Buildroot only supports "pure" toolchains, i.e. those that only
have the libraries from the toolchain components: the C library, and the
gcc runtime.

But those toolchains also bundle gdbserver, and zlib is a dependency of
gdb. Thomas believes this is a spurious dependency, and I think that's
correct, and that we need to fix it.

Still, this change is correct, not because the toolchain has zlib, but
because we do not want to use bundled versions where possible.

So, I slightly expanded the commit log with that extra information.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> toolchain also happen to be the one used in basic configurations
> of the runtime test infrastructure (this issue was found while
> attempting to write a runtime test for tcl).
> 
> In such cases, running "tclsh" command fails with error message:
> 
>     tclsh: error while loading shared libraries: libz.so.1: cannot open shared object file: No such file or directory
> 
> libtcl library also miss its dependency.
> 
>     ldd /usr/lib/libtcl8.6.so
> 	    libz.so.1 => not found
> 	    libm.so.6 => /lib/libm.so.6 (0xb6dad000)
> 	    libc.so.6 => /lib/libc.so.6 (0xb6c65000)
> 	    /lib/ld-linux.so.3 (0xb6f6c000)
> 
> This commit fixes this issue by adding zlib as a mandatory dependency.
> 
> [1] https://github.com/tcltk/tcl/commit/6f3dea45cee94f12ffa0b2acbbdb3eedbc01807b
> [2] https://github.com/tcltk/tcl/tree/core-8-6-13/compat/zlib
> [3] https://github.com/tcltk/tcl/blob/core-8-6-13/unix/configure.in#L172
> [4] https://github.com/tcltk/tcl/blob/core-8-6-13/unix/Makefile.in#L240
> [5] https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--stable-2023.08-1.tar.bz2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 7691377 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     utils/test-pkg -p tcl
>     ...
>     6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Also runtime-tested manually with the case described in the
> commit log. I'll send an automated runtime test later...
> ---
>  package/tcl/Config.in | 1 +
>  package/tcl/tcl.mk    | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tcl/Config.in b/package/tcl/Config.in
> index f1fa0541a1..adb9f22488 100644
> --- a/package/tcl/Config.in
> +++ b/package/tcl/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_TCL
>  	# See this mailing list thread:
>  	# http://lists.busybox.net/pipermail/buildroot/2015-March/121198.html
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_ZLIB
>  	help
>  	  TCL (Tool Command Language) is a simple textual language.
>  
> diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
> index 843d58a4ae..1943bc7b27 100644
> --- a/package/tcl/tcl.mk
> +++ b/package/tcl/tcl.mk
> @@ -75,7 +75,8 @@ TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
>  
>  TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
>  	$(if $(BR2_PACKAGE_MYSQL),mysql) \
> -	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql)
> +	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql) \
> +	zlib
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
