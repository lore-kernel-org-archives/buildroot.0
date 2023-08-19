Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01458EE49A5
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 13:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C4E833AE;
	Sat, 19 Aug 2023 13:55:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C4E833AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XpAilTv9UcCn; Sat, 19 Aug 2023 13:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93860833C9;
	Sat, 19 Aug 2023 13:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93860833C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6200A1BF476
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 13:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D13E60BBE
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 13:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D13E60BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwSElxgBJUXI for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 13:54:58 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB3F160BB6
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 13:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB3F160BB6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 881D72003DA;
 Sat, 19 Aug 2023 15:54:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 15:54:51 +0200
Date: Sat, 19 Aug 2023 15:54:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230819135451.GA1778688@scaer>
References: <20230818234638.499248-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818234638.499248-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692453294;
 bh=FkN0JcGb2IFSrvi7p8FT4Md3xbpUI1WoXRyWKJgoraM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLPvR8PZju+YYekM168dmbjIRCDVTULuH57GqZEsQHkLb8gA6mH6Whh7MADYBtBsZ
 uIAUkY3wF4EIKx/3dq4lv5YfuiiG9nlKqQvegWrlvdSd48hitrNL6rE3M94kTHK8Lz
 aICoXYAH1eoTf+nlhunZp+s7mSh7R/BJA9CB0nbRBHA7thtCyry9BUxxrDXC9o58Is
 AspDBH2HF1tR990xJDzcylwYOhxlqjMvFrGBT0Xgcs9g+g5lt9hSMN2XIqznMmgMqL
 SX8x5jA8cZy6qNBNAbgofsrsVEZ40Caqgv1vAQ0A5v35nIeSRZEcnk2Caqa43hPyZA
 XDZaNFXUWltyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lLPvR8PZ
Subject: Re: [Buildroot] [PATCH] package/qemu: force the host compiler to
 look at HOST_DIR first
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
Cc: Nicolas CARRIER <carrier.nicolas0@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

+Bernd for the meson bump

On 2023-08-19 01:46 +0200, Romain Naour spake thusly:
> Since meson 1.2.0, compiler's search path are retrieved and used
> to link a library. If the same library is installed on the host
> and build by Buildroot (HOST_DIR/lib), meson now link against
> the one found in the compiler's search path instead of linking
> agains the one provided by Buildroot.
> 
> See: https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566
> 
> Help the compiler by setting -Bprefix that specifies a path where to find the
> executables, libraries, include files, and data files of the compiler itself.
> For each subprogram to be run, the compiler driver first tries the -B prefix,
> if any. If that name is not found, or if -B is not specified, the driver
> tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.

So, I understand that this makes qemu actually build, but I am afraid
this is just hidign the problem.

Indeed, it is possible that we have other host packages that depend on
some of the host libs we build and that may exist on the system, and
those packages are also going to break.

For example, host-efl is a host-meson-package, and depends on
host-libglib2, so presumably we would hav e the issue there too.

We can't fix the breakage by adding -B to all the host packages one by
one. If -B is idneed the correct fix (I doubt it), then we will have to
add it to the common HOST_CFLAGS, HOST_CXXFLAGS and so on...

However, what bothers me slighhtly, is why the qemu link step uses two
different ways to link with the libglib2 libraries, e.g.:

    -l/path/to/host/lib/libgio-2.0.so
    -L/path/to/host/lib -lgmodule-2.0

So, why is libgio handled with an absolute path, while libgmodule is
not? Note that libgio does have a DT_NEEDED on libgmodule.

However, let's have a look at the pkg-config files, let's start with
gio-2.0.pc:

    Requires: glib-2.0, gobject-2.0
    Requires.private: gmodule-no-export-2.0, zlib, mount >= 2.23
    Libs: -L${libdir} -lgio-2.0
    Libs.private: -ldl -lresolv

OK, then gmodule-no-export-2.0.pc:

    Requires: glib-2.0
    Libs: -L${libdir} -lgmodule-2.0 -pthread
    Libs.private: -ldl

So, the two are similar. I am not sure to understand how we end up in
this situation, though... :-/

In the meantime, since the bump to meson 1.2.0 is causing the issue with
out an easy fix in sight, I'll revert the meson bump.

Regards,
Yann E. MORIN.

> Fixes:
>     host/lib/libgio-2.0.so: undefined reference to `g_module_open_full'
>     collect2: error: ld returned 1 exit statu
> 
> The problem only appear if we have two version of the glib2 library installed
> on the system:
> 
> [Buildroot]/host/lib/libgio-2.0.so.0.7600.1
> /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8
> 
> This is probably a meson bug introduced by [1] since the error message is wrong!
> 
> $ strings output/host/lib/libgio-2.0.so | grep g_module_open_full
> g_module_open_full
> 
> The libgio-2.0.so provided by Buildroot contains the g_module_open_full symbol
> while the libgio-2.0.so installed on the host is too old to have it:
> 
> $ strings /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0.6600.8 | grep g_module_open_full
> 
> [1] https://github.com/mesonbuild/meson/commit/59cfbf68e00aa774a9868101f423bd662938c15d
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Nicolas CARRIER <carrier.nicolas0@gmail.com>
> ---
> This meson issue may be not specific to host-qemu...
> ---
>  package/qemu/qemu.mk | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index b341d0220d..8a8dddee58 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -401,7 +401,18 @@ HOST_QEMU_ARCH = sh4eb
>  endif
>  HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
>  
> -HOST_QEMU_CFLAGS = $(HOST_CFLAGS)
> +# Since meson 1.2.0, compiler's search path are retrieved and used
> +# to link a library. If the same library is installed on the host
> +# and build by Buildroot (HOST_DIR/lib), meson now link against
> +# the one found in the compiler's search path instead of linking
> +# agains the one provided by Buildroot.
> +# https://github.com/mesonbuild/meson/issues/11914#issuecomment-1678090566
> +# Help the compiler by setting -Bprefix that specifies where to find the
> +# executables, libraries, include files, and data files of the compiler itself.
> +# For each subprogram to be run, the compiler driver first tries the -B prefix,
> +# if any. If that name is not found, or if -B is not specified, the driver
> +# tries two standard prefixes, /usr/lib/gcc/ and /usr/local/lib/gcc/.
> +HOST_QEMU_CFLAGS = $(HOST_CFLAGS) -B$(HOST_DIR)/lib
>  
>  ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
>  HOST_QEMU_TARGETS += $(HOST_QEMU_SYS_ARCH)-softmmu
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
