Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6DAC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3911960A55;
	Sat, 17 May 2025 10:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFYRgNLBF2QR; Sat, 17 May 2025 10:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25F2160D4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25F2160D4F;
	Sat, 17 May 2025 10:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A6DC1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FEAC40CF6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNLKxeOZBFEg for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02DC440CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DC440CD0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02DC440CD0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:56:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 199DD1C1093; Sat, 17 May 2025 12:56:02 +0200 (CEST)
Message-ID: <26b6be52-9409-4eeb-a597-2c2060c86888@rnout.be>
Date: Sat, 17 May 2025 12:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>
References: <20250513115844.135963-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250513115844.135963-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747479362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PPQB3tFRkRfLEFwPzEjyTWoN4MthXYuulRK4I0NB3pc=;
 b=ElQyrWKde7G1z3xcHSLf7yvX4nFUzJTIm9uRewRhBH6zWaBLwEgpSawhPXOEbjSYceZUpa
 6odDQ3JJQbsx1qmX0FraMSh5BsnPaJB+8yfwaITghcoqS+/Y5XxR/CMxppFB0W5ypcXr9R
 Y5iTVlEEi4dAUjTDaFA/D10KRtXTWHfKp2l4Dx/aFgXjFTLp4jtGorcYsKmt7lnpNMHed7
 QCHMf2De8uZtBpM5KryUl/KWPVpy9k40wYc6U58tI525QxhYzXqALA/ncTSQXextgP9WNm
 25WOe4D2EgEC12W3hxDBkIiONyrfa4cqV+LjxCIYljuMZ9RBAfn+YYrSOwwd2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ElQyrWKd
Subject: Re: [Buildroot] [PATCH 1/1] package/openrc: bump to version 0.62.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Adam,

On 13/05/2025 13:58, Adam Duskett wrote:
> Remove 0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch as the
> meson build now automatically creates the symlinks for tty1 - tty6.

  Well, the point of the patch was to _not_ create those symlinks...

> 
> All tests pass.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   ...so-create-run-lock-subsys-directory.patch} |  2 ++
>   ...-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch | 35 -------------------
>   ...06-allow-setting-rc_libexecdir-path.patch} |  9 +++--
>   package/openrc/openrc.hash                    |  2 +-
>   package/openrc/openrc.mk                      |  2 +-
>   5 files changed, 10 insertions(+), 40 deletions(-)
>   rename package/openrc/{0006-Also-create-run-lock-subsys-directory.patch => 0005-Also-create-run-lock-subsys-directory.patch} (91%)
>   delete mode 100644 package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
>   rename package/openrc/{0007-allow-setting-rc_libexecdir-path.patch => 0006-allow-setting-rc_libexecdir-path.patch} (83%)
> 
> diff --git a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch b/package/openrc/0005-Also-create-run-lock-subsys-directory.patch
> similarity index 91%
> rename from package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> rename to package/openrc/0005-Also-create-run-lock-subsys-directory.patch
> index ad78a4b8f7..14b4185cd4 100644
> --- a/package/openrc/0006-Also-create-run-lock-subsys-directory.patch
> +++ b/package/openrc/0005-Also-create-run-lock-subsys-directory.patch
> @@ -7,6 +7,8 @@ Buildroot service scripts regularly use this directory, so
>   create it in the most appropriate spot.
>   
>   Signed-off-by: Norbert Lange <nolange79@gmail.com>
> +[Adam: update for 0.62.2]
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>   ---
>    sh/init.sh.Linux.in | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch b/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
> deleted file mode 100644
> index 42f77ffdea..0000000000
> --- a/package/openrc/0005-runlevels-do-not-add-agetty.tty-1-6-if-MKSYSVINIT-ye.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 014dc43447fa553e875984ac4a528e5916cc9e06 Mon Sep 17 00:00:00 2001
> -From: Carlos Santos <unixmania@gmail.com>
> -Date: Sat, 29 Feb 2020 22:41:30 -0300
> -Subject: [PATCH] runlevels: do not add agetty.tty[1-6] if MKSYSVINIT=yes
> -
> -Buildroot starts a single getty, according to the system configuration.
> -Also tty[1-6] may not exist (e.g. embedded devices with serial consoles
> -only).
> -
> -Signed-off-by: Carlos Santos <unixmania@gmail.com>
> -[Adam: update for 0.50]
> -Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ----
> - tools/meson_runlevels.sh | 6 ------
> - 1 file changed, 6 deletions(-)
> -
> -diff --git a/tools/meson_runlevels.sh b/tools/meson_runlevels.sh
> -index 1473d4e..eee256b 100755
> ---- a/tools/meson_runlevels.sh
> -+++ b/tools/meson_runlevels.sh
> -@@ -91,11 +91,5 @@ if ! test -d "${DESTDIR}${shutdowndir}"; then
> - 		ln -snf "${init_d_dir}/$x" "${DESTDIR}${shutdowndir}/$x"
> - 	done
> - fi
> --if test "${sysvinit}" = yes && test "${os}" = Linux; then \
> --	for x in tty1 tty2 tty3 tty4 tty5 tty6; do
> --		ln -snf "${init_d_dir}/agetty" "${DESTDIR}/${init_d_dir}/agetty.$x"
> --		ln -snf "${init_d_dir}/agetty.$x" "${DESTDIR}/${defaultdir}/agetty.$x"
> --	done;

  You see, the code for adding hte symlinks was removed from the patch.

> --fi
> -
> - ln -snf "${rc_libexecdir}"/sh/functions.sh "${DESTDIR}/${init_d_dir}"
> ---
> -2.18.2
> -
> diff --git a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch b/package/openrc/0006-allow-setting-rc_libexecdir-path.patch
> similarity index 83%
> rename from package/openrc/0007-allow-setting-rc_libexecdir-path.patch
> rename to package/openrc/0006-allow-setting-rc_libexecdir-path.patch
> index 5787c26dde..8ca97d8713 100644
> --- a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
> +++ b/package/openrc/0006-allow-setting-rc_libexecdir-path.patch
> @@ -9,7 +9,7 @@ Subject: [PATCH] allow setting rc_libexecdir path
>   Upstream: https://github.com/OpenRC/openrc/pull/443
>   
>   Signed-off-by: artoo <artoo@artixlinux.org>
> -[Adam: update for 0.56]
> +[Adam: update for 0.62.2]
>   Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>   ---
>    meson.build       | 2 +-
> @@ -30,15 +30,18 @@ index 5b3f8fa..40d4be1 100644
>    rc_sbindir = rc_libexecdir / 'sbin'
>    rc_shdir = rc_libexecdir / 'sh'
>   diff --git a/meson_options.txt b/meson_options.txt
> -index 2c74152..d2f67e4 100644
> +index 8cefbbb..9d58de0 100644
>   --- a/meson_options.txt
>   +++ b/meson_options.txt
> -@@ -26,3 +26,5 @@ option('sysvinit', type : 'boolean', value : false,
> +@@ -28,6 +28,8 @@ option('sysvinit', type : 'boolean', value : false,
>      description : 'enable SysVinit compatibility (linux only)')
>    option('zsh-completions', type : 'boolean',
>      description : 'install zsh completions')
>   +option('librcdir', type : 'string', value : 'rc',
>   +  description : 'default location of rc libexec dir')
> + option('agetty', type: 'array',
> +   value: ['tty1', 'tty2', 'tty3', 'tty4', 'tty5', 'tty6'],
> +   description : 'agetty symlinks to install when sysvinit is also specified')

  And here you see it's now a meson option. So I think we have to pass
-Dagetty='' to the build.


  I just tested and it does install the symlinks:

Installing symlink pointing to agetty to .../target/etc/init.d/agetty.tty1
Installing symlink pointing to /etc/init.d/agetty.tty1 to 
.../target/etc/runlevels/default/agetty.tty1
...

  They weren't installed before the bump.

  I think if you try to run this in qemu, you'll get errors about ttyX not existing.

  Regards,
  Arnout

>   --
>   2.41.0
>   
> diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
> index 85e869f82a..6f74c315e1 100644
> --- a/package/openrc/openrc.hash
> +++ b/package/openrc/openrc.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  a06b530290057637eab17fc943cbf79c0335eb734ba71ece38b9f3acd8a341d4  openrc-0.56.tar.gz
> +sha256  bddb0fe1c0cc5074439255d17ae92eeb989322f02eac0536f4924b9d96cd73a0  openrc-0.62.2.tar.gz
>   sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 67846ce0ea..dd8069bd21 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENRC_VERSION = 0.56
> +OPENRC_VERSION = 0.62.2
>   OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
>   OPENRC_LICENSE = BSD-2-Clause
>   OPENRC_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
