Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F762C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 10:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF3540CD6;
	Sat, 30 Jul 2022 10:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF3540CD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JeiD96lWXVy; Sat, 30 Jul 2022 10:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 808BC40407;
	Sat, 30 Jul 2022 10:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 808BC40407
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0080D1BF37B
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 10:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFA9381B60
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 10:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA9381B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gy1XWsEa3-0f for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 10:34:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B77881B17
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B77881B17
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 10:34:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5FCD56012F;
 Sat, 30 Jul 2022 12:34:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 12:34:10 +0200
Date: Sat, 30 Jul 2022 12:34:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220730103410.GO3168@scaer>
References: <20220727190511.2859278-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727190511.2859278-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659177256;
 bh=U9F0GgzPy6UEUFbbnodjg8zTiptFNameZKrUMHrrMpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBqKD/k9QHHRNKMc4mrzj5L+2s2Lzaq2gNtPEneWJvZRnOayhO1Ye/3RWr9TWQ9H8
 58F+3YYapB6vfOLK1phMs+u7s0YAqkW/kYBRGK/TNl6xxt2IaKeO+lEjvI9pHFQ3nx
 IM00Di4F8qojgXzt+nwO1kD2ZK9EdJgVAAcl5Cb8cc5n1xEpCBywVdJoMX/3ou7IMw
 XctTdcVOQJafhsYjejIhe/mQW7Nutlb/sdWDBBF4Kf3dhhAIGlp1VVWZug1K6oYp8f
 e9OOYmLgNlessAZGwzXdk9m4YEc89P6JmIm0xY0ZNVMf/AayDzIMj28l3Ru9wg+Atd
 AGTuB9Bj2gr0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LBqKD/k9
Subject: Re: [Buildroot] [PATCH] Makefile, docs/manual, support,
 toolchain: remove Eclipse integration
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 21:05 +0200, Thomas Petazzoni via buildroot spake thusly:
> Back many years ago, we developed an Eclipse plugin that simplified
> the usage of Buildroot toolchains. Enabling the BR2_ECLIPSE_REGISTER=y
> was registering the Buildroot toolchain into a special file in your
> HOME folder that the Eclipse plugin would recognize to allow to
> directly use the Buildroot cross-compiler.
> 
> This Eclipse plugin has not been maintained for years. The last commit
> in the repository dates back from September 2017. Since then Eclipse
> has moved on, and the plugin is no longer compatible with current
> versions of Eclipse.
> 
> Also, Eclipse is probably no longer that widely used in the embedded
> Linux space, as other more modern IDEs have become more popular.
> 
> All in all, it's time to say good bye to this Eclipse integration.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                           |  9 +++
>  Makefile                                   |  8 ---
>  docs/manual/common-usage.txt               |  2 -
>  docs/manual/eclipse-integration.txt        | 30 ---------
>  support/scripts/eclipse-register-toolchain | 76 ----------------------
>  toolchain/Config.in                        |  7 --
>  6 files changed, 9 insertions(+), 123 deletions(-)
>  delete mode 100644 docs/manual/eclipse-integration.txt
>  delete mode 100755 support/scripts/eclipse-register-toolchain
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 24b4236ade..80c443d9fb 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,15 @@ endif
>  
>  comment "Legacy options removed in 2022.08"
>  
> +config BR2_ECLIPSE_REGISTER
> +	bool "Eclipse integration removed"
> +	select BR2_LEGACY
> +	help
> +	  The Buildroot integration with the Eclipse IDE has been
> +	  removed, as the corresponding Eclipse plugin is no longer
> +	  maintained, and is no longer usable with current versions of
> +	  Eclipse.
> +
>  config BR2_csky
>  	bool "csky architecture removed"
>  	select BR2_LEGACY
> diff --git a/Makefile b/Makefile
> index 7d2081b98e..0993417ae0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -646,14 +646,6 @@ STRIP_FIND_SPECIAL_LIBS_CMD = \
>  	\( -name 'ld-*.so*' -o -name 'libpthread*.so*' \) \
>  	-print0
>  
> -ifeq ($(BR2_ECLIPSE_REGISTER),y)
> -define TOOLCHAIN_ECLIPSE_REGISTER
> -	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` \
> -		$(notdir $(TARGET_CROSS)) $(BR2_ARCH)
> -endef
> -TARGET_FINALIZE_HOOKS += TOOLCHAIN_ECLIPSE_REGISTER
> -endif
> -
>  # Generate locale data.
>  ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 9ba87a8339..9abd3799dd 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -417,6 +417,4 @@ effects:
>    be empty and it's only at the very end of the build that they will
>    be populated.
>  
> -include::eclipse-integration.txt[]
> -
>  include::advanced.txt[]
> diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
> deleted file mode 100644
> index 1f726d8240..0000000000
> --- a/docs/manual/eclipse-integration.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -// -*- mode:doc; -*-
> -// vim: set syntax=asciidoc:
> -
> -=== Integration with Eclipse
> -
> -While a part of the embedded Linux developers like classical text
> -editors like Vim or Emacs, and command-line based interfaces, a number
> -of other embedded Linux developers like richer graphical interfaces to
> -do their development work. Eclipse being one of the most popular
> -Integrated Development Environment, Buildroot integrates with Eclipse
> -in order to ease the development work of Eclipse users.
> -
> -Our integration with Eclipse simplifies the compilation, remote
> -execution and remote debugging of applications and libraries that are
> -built on top of a Buildroot system. It does not integrate the
> -Buildroot configuration and build processes themselves with
> -Eclipse. Therefore, the typical usage model of our Eclipse integration
> -would be:
> -
> -* Configure your Buildroot system with +make menuconfig+, +make
> -  xconfig+ or any other configuration interface provided with
> -  Buildroot.
> -* Build your Buildroot system by running +make+.
> -* Start Eclipse to develop, execute and debug your own custom
> -  applications and libraries, that will rely on the libraries built
> -  and installed by Buildroot.
> -
> -The Buildroot Eclipse integration installation process and usage is
> -described in detail at
> -https://github.com/mbats/eclipse-buildroot-bundle/wiki.
> diff --git a/support/scripts/eclipse-register-toolchain b/support/scripts/eclipse-register-toolchain
> deleted file mode 100755
> index 891d29ee6f..0000000000
> --- a/support/scripts/eclipse-register-toolchain
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -#!/bin/sh
> -
> -# This script registers the toolchain of a Buildroot project into the
> -# Eclipse plugin. To do so, it adds a new line for the Buildroot
> -# toolchain into the $HOME/.buildroot-eclipse.toolchains file, which
> -# the Eclipse Buildroot plugin reads to discover automatically the
> -# available Buildroot toolchains on the system.
> -#
> -# This script should typically not be called manually. Instead, one
> -# should enable the BR2_ECLIPSE_REGISTER configuration option, which
> -# will lead Buildroot to automatically call this script with the
> -# appropriate arguments.
> -#
> -# Usage:
> -#  eclipse-register-toolchain project-directory toolchain-prefix architecture
> -#
> -#   project-directory is the absolute path to the Buildroot project
> -#   output directory (which contains the host/, target/, build/,
> -#   images/, etc. subdirectories). It should be an absolute and
> -#   canonical path.
> -#
> -#   toolchain-prefix is the prefix of the cross-compilation tools, i.e
> -#   'arm-linux-' if the cross-compiler executable is 'arm-linux-gcc'.
> -#
> -#   architecture is the lower-cased name of the architecture targetted
> -#   by the Buildroot project.
> -
> -if test $# -ne 3; then
> -    echo "Invalid number of arguments."
> -    echo "Usage: $0 project-directory toolchain-prefix architecture"
> -    exit 1
> -fi
> -
> -project_directory=$1
> -toolchain_prefix=$2
> -architecture=$3
> -
> -if test ! -d ${project_directory} ; then
> -    echo "Non-existing project directory ${project_directory}"
> -    exit 1
> -fi
> -
> -if test ! -d ${project_directory}/host ; then
> -    echo "Your project directory does not look like a Buildroot output"
> -    exit 1
> -fi
> -
> -if test ! -e ${project_directory}/host/bin/${toolchain_prefix}gcc ; then
> -    echo "Cannot find the cross-compiler in the project directory"
> -    exit 1
> -fi
> -
> -TOOLCHAIN_ECLIPSE_FILE=${HOME}/.buildroot-eclipse.toolchains
> -
> -# First, we remove all lines from the ${TOOLCHAIN_ECLISPE_FILE} that
> -# correspond to toolchains that no longer exist.
> -if test -f ${TOOLCHAIN_ECLIPSE_FILE} ; then
> -    mv ${TOOLCHAIN_ECLIPSE_FILE} ${TOOLCHAIN_ECLIPSE_FILE}.tmp
> -    cat ${TOOLCHAIN_ECLIPSE_FILE}.tmp | while read toolchain ; do
> -	path=$(echo ${toolchain} | cut -f1 -d ':')
> -        # Filter lines corresponding to still existing projects
> -	echo "Testing ${path} ..."
> -	if ! test -d ${path} ; then
> -	    continue
> -	fi
> -	# .. and the current project
> -	if test ${path} = ${project_directory} ; then
> -	    continue
> -	fi
> -	echo ${toolchain} >> ${TOOLCHAIN_ECLIPSE_FILE}
> -    done
> -    rm ${TOOLCHAIN_ECLIPSE_FILE}.tmp
> -fi
> -
> -# Add the toolchain
> -echo "${project_directory}:${toolchain_prefix}:${architecture}" >> ${TOOLCHAIN_ECLIPSE_FILE}
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 5f79c07df0..05725394ea 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -331,13 +331,6 @@ config BR2_TARGET_LDFLAGS
>  	  Note that options with a '$' sign (eg.
>  	  -Wl,-rpath='$ORIGIN/../lib') are not supported.
>  
> -config BR2_ECLIPSE_REGISTER
> -	bool "Register toolchain within Eclipse Buildroot plug-in"
> -	help
> -	  This options tells Buildroot to generate the necessary
> -	  configuration files to make your toolchain appear within
> -	  Eclipse, through the Eclipse Buildroot plugin.
> -
>  # Options for packages to depend on, if they require at least a
>  # specific version of the kernel headers.
>  # Toolchains should choose the adequate option (ie. the highest
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
