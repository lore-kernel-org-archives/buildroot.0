Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E9C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FC2681C19;
	Wed,  7 Feb 2024 15:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0WastXcM-1Xm; Wed,  7 Feb 2024 15:31:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C78D881E1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C78D881E1E;
	Wed,  7 Feb 2024 15:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 741771BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E50D81E1E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2NTzyEQ3SbN for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 202A281C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202A281C19
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 202A281C19
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:30:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C028C13F88F;
 Wed,  7 Feb 2024 16:30:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 16:30:51 +0100
Date: Wed, 7 Feb 2024 16:30:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZcOiK1W5bhQj7-UG@landeda>
References: <20240202093625.1409559-1-antoine.coutant@smile.fr>
 <20240202093625.1409559-2-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202093625.1409559-2-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707319857;
 bh=YJxl+Z2+HHuhtOEqYIx0o+ySgVQyBo8Ry2MfajMQ5aQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKNvkb4cDzYwWhmvs4uAn2bBrLWyHHtBwgS4P7YsF1fmg0k+uo56CF4CpmzRLjsT0
 sg77IdkEEgskd/D0xh2FdmoyJv2Me3b1UD4kVGB3HuCl0qSinXJG60oNdO+SYrJ2Zx
 NJCZagvrCTXU2pf5qfkX9iblru7P6ZvyHfJT/Yw7H41xP3r3nwIJ9OTMiZzHxSg4Hs
 XNAY7XjNLJQH4Ea7FLplvKt3RJK554suqH/KIKmgNKxyOvl1qk2eYyArOvJMAMaeVy
 7Q4WP9zfC7FpPVS9Kobzh7XCU/0nNcrm24AapQxr7rvxOJziF2jYFORQudKXxETdAm
 11epE7j5X5enQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JKNvkb4c
Subject: Re: [Buildroot] [PATCH v4 1/7] package/meson: bump version to 1.3.1
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
Cc: sebastian.weyer@smile.fr, bernd@kuhls.net, romain.naour@smile.fr,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

(sorry, I sent too fast, here are a bit more details below...)

On 2024-02-02 10:36 +0100, Antoine Coutant spake thusly:
> The meson upgrade from 1.1.1 to 1.2.0 have been reverted
> because host-qemu (version v8.0.3) was searching
> libraries in the build machine instead of buildroot host
> directory [1].
> $ grep -r LINK_ARGS  * | grep "\-L/usr"
> build.ninja: LINK_ARGS =
>     -L/usr/lib/gcc/x86_64-linux-gnu/10 \
>     -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu \
>     -L/usr/lib/gcc/x86_64-linux-gnu/10/../../../../lib -L/usr/lib \
>     -L/lib/x86_64-linux-gnu \
>     -L/lib/../lib \
>     -L/usr/lib/../lib \
>     -L/usr/lib/gcc/x86_64-linux-gnu/10/../../.. \
>     -L/lib \
>     -I/[...]/host/include \
>     -L/[...]/host/lib \
>     -I/[...]/host/include/libfdt \
>     ...
> 
> Upgrading qemu to version v8.1.0 solves the problem:
> $ grep -r LINK_ARGS  * | grep "\-L/usr"
> build.ninja: LINK_ARGS =
>     -I/[...]/host/include \
>     -L/[...]/host/lib \
>     -I/[...]/host/include/libfdt \
>     ...
> 
> Those two tests were done with the same buildroot version
> (2023.08) on the same machine were the bug appeared. Using,
> git bisect, in this environment, it was found that the
> problem was fixed in qemu by the commit [2].
> 
> Thus, it is possible that the problem was introduced by
> improper use of meson by qemu <= v8.0.3. Also, meson has
> been updated to version 1.2.1 and 1.3.0 in yocto and it
> doesn't seem to create any issue. [3]
> 
> The original problem is no longer present and some
> projects require meson > 1.1.1 (e.g. rusticl requires
> meson 1.2.0 since mesa 23.3.0 and meson 1.3.1 since mesa
> 24.0.0).
> 
> "pkgconfig" field is deprecated by meson 1.3.0 and
> replaced by "pkg-config". See: [4]
> 
> The patch that adds the pkg_config_static property has
> been rebased.

I reflowed the commit log to approach the 72-char limit on line length
(I needed soemthing to do while there aas a test-build on-going!)

> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/acfdf21f0b752e844a33c70a0fd2f82f4534a5a0
> [2] https://gitlab.com/qemu-project/qemu/-/commit/Fc9a809e0d28417fa1e7f7efc19f845bda4c1be9
> [3] https://github.com/yoctoproject/poky/commits/master/meta/recipes-devtools/meson
> [4] https://mesonbuild.com/Release-notes-for-1-3-0.html#machine-files-pkgconfig-field-deprecated-and-replaced-by-pkgconfig
> 
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
> ---
[--SNIP--]
>  diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgconfig.py
> -index 1e8d9132e..d902ba215 100644
> +index e86206b88..94888657d 100644
>  --- a/mesonbuild/dependencies/pkgconfig.py
>  +++ b/mesonbuild/dependencies/pkgconfig.py
> -@@ -338,7 +338,8 @@ class PkgConfigDependency(ExternalDependency):
> -         env = None
> -         libcmd = ['--libs']
> - 
> --        if self.static:
> -+        if self.static or \
> -+            (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
> -             libcmd.append('--static')
> - 
> -         libcmd.append(self.name)
> +@@ -169,7 +169,7 @@ class PkgConfigCLI(PkgConfigInterface):
> +             env['PKG_CONFIG_ALLOW_SYSTEM_LIBS'] = '1'
> +         args: T.List[str] = []
> +         args += self._define_variable_args(define_variable)
> +-        if static:
> ++        if static or (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):

I changed that code back to have our addition on a separate line, so
that it stands out better when updating the patch.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +             args.append('--static')
> +         args += ['--libs', name]
> +         ret, out, err = self._call_pkgbin(args, env=env)
>  -- 
>  2.25.1
>  
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index cb36b674fa..150fd6d1bb 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
> -sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/1.3.1/meson-1.3.1.tar.gz.asc
> +sha256  6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7  meson-1.3.1.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 503aca8c25..467569d28b 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MESON_VERSION = 1.1.1
> +MESON_VERSION = 1.3.1
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
> diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
> index 7053df472b..a58ab553d0 100644
> --- a/support/misc/cross-compilation.conf.in
> +++ b/support/misc/cross-compilation.conf.in
> @@ -10,7 +10,7 @@ ar = '@TARGET_AR@'
>  strip = '@TARGET_STRIP@'
>  cmake = '@BR2_CMAKE@'
>  fortran = '@TARGET_FC@'
> -pkgconfig = '@PKGCONF_HOST_BINARY@'
> +pkg-config = '@PKGCONF_HOST_BINARY@'
>  g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>  g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
>  
> -- 
> 2.25.1
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
