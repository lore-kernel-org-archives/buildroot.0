Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB663C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 21:07:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5A660F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 21:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A5A660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCC4E401C6;
	Sun, 10 Oct 2021 21:07:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxDSrJnW6r17; Sun, 10 Oct 2021 21:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90D69401DC;
	Sun, 10 Oct 2021 21:07:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AC8A1BF41A
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 21:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48FCA60659
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 21:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECgRbkmt4dNY for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 21:07:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E573605C9
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 21:07:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:74c0:e1ec:fabc:9152])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7142B19F57B;
 Sun, 10 Oct 2021 23:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633900062;
 bh=9SK3Y5pCXGZDDzm4FzVE4j+/UzZR/qwvHwiDh38c1jA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JasNIxRTCDelnsfSfS2nGox2T8q0MIqQ5jm3SmWZjvr72SS52azHRmvCx2lmvDeMu
 Db8BtHzQ30Mv4nQZueVdLHF1S0jt+zk5PtPP8qNSxDb420JtZmOyB8fJT/BHE7y/Jm
 9z+z4AlgT295Q3htPtkOWVFoI6SxeOwYE2RjwQpTIGEjJiCpsHK68YOovOJ7fCW8Uf
 r+mjJMC1v6qT85bEISgPlvmvD3dY5iqUlQrTu1EMoHiMs+HS8Yk08Tv9ba+K6xlHbf
 1j8YnVpAOb54WiccpHZPqSl31J0IJxEEGlXJNdn/2/aXRSOpzU3Ei3b6fliXon5FNL
 mAZXIypKFgWoA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Oct 2021 23:07:36 +0200
Date: Sun, 10 Oct 2021 23:07:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gleb Mazovetskiy <glex.spb@gmail.com>
Message-ID: <20211010210736.GA3314139@scaer>
References: <20211010170906.388594-1-glex.spb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211010170906.388594-1-glex.spb@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package: add smpq and stormlib
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gleb, All,

On 2021-10-10 18:09 +0100, Gleb Mazovetskiy spake thusly:
> SMPQ is a utility for working with Blizzard MPQ archives and StormLib is
> the library for doing this that it depends on.
> 
> SMPQ/StormLib is a runtime and/or build-time dependency of several
> source ports / reimplementations of Blizzard games, such as DevilutionX.
> 
> These packages are already available in other distros, such as Debian.

Please, provide you patch per package.

> Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> ---
>  package/Config.in              |  2 ++
>  package/smpq/Config.in         | 11 ++++++++++
>  package/smpq/smpq.hash         |  3 +++
>  package/smpq/smpq.mk           | 37 ++++++++++++++++++++++++++++++++++
>  package/stormlib/Config.in     |  8 ++++++++
>  package/stormlib/stormlib.hash |  3 +++
>  package/stormlib/stormlib.mk   | 16 +++++++++++++++
>  7 files changed, 80 insertions(+)
>  create mode 100644 package/smpq/Config.in
>  create mode 100644 package/smpq/smpq.hash
>  create mode 100644 package/smpq/smpq.mk
>  create mode 100644 package/stormlib/Config.in
>  create mode 100644 package/stormlib/stormlib.hash
>  create mode 100644 package/stormlib/stormlib.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9fed0ab4cb..890a6be135 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -74,6 +74,7 @@ menu "Compressors and decompressors"
>  	source "package/p7zip/Config.in"
>  	source "package/pigz/Config.in"
>  	source "package/pixz/Config.in"
> +	source "package/smpq/Config.in"
>  	source "package/unrar/Config.in"
>  	source "package/unzip/Config.in"
>  	source "package/xz/Config.in"
> @@ -1360,6 +1361,7 @@ menu "Compression and decompression"
>  	source "package/lzo/Config.in"
>  	source "package/minizip/Config.in"
>  	source "package/snappy/Config.in"
> +	source "package/stormlib/Config.in"
>  	source "package/szip/Config.in"
>  	source "package/zlib/Config.in"
>  	source "package/zziplib/Config.in"
> diff --git a/package/smpq/Config.in b/package/smpq/Config.in
> new file mode 100644
> index 0000000000..589f5cf834
> --- /dev/null
> +++ b/package/smpq/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_SMPQ
> +	bool "smpq"
> +	select BR2_PACKAGE_SMPQ
> +	help
> +	  StormLib MPQ archiving utility
> +
> +	  This utility manipulates Blizzard MPQ archives.
> +	  It supports extracting, appending, renaming and deleting files
> +	  in MPQ archives, and creating new MPQ archives.
> +
> +	  https://launchpad.net/smpq
> diff --git a/package/smpq/smpq.hash b/package/smpq/smpq.hash
> new file mode 100644
> index 0000000000..f14eaef49b
> --- /dev/null
> +++ b/package/smpq/smpq.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  b5d2dc8a5de8629b71ee5d3612b6e84d88418b86c5cd39ba315e9eb0462f18cb  smpq_1.6.orig.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/smpq/smpq.mk b/package/smpq/smpq.mk
> new file mode 100644
> index 0000000000..6696c88f9c
> --- /dev/null
> +++ b/package/smpq/smpq.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# smpq
> +#
> +################################################################################
> +
> +SMPQ_VERSION = 1.6
> +SMPQ_SOURCE = smpq_$(SMPQ_VERSION).orig.tar.gz
> +SMPQ_SITE = https://launchpad.net/smpq/trunk/$(SMPQ_VERSION)/+download
> +SMPQ_DEPENDENCIES = stormlib
> +HOST_SMPQ_DEPENDENCIES = host-stormlib
> +SMPQ_LICENSE = GPL-3.0+
> +SMPQ_LICENSE_FILES = LICENSE
> +SMPQ_INSTALL_STAGING = YES
> +SMPQ_CONF_OPTS += -DWITH_KDE=OFF
> +HOST_SMPQ_CONF_OPTS += -DWITH_KDE=OFF

Although there is nothing written black-on-white about this, I prefer
that the variables be ordered in a logical order, and semantically
grouped together:

 1. download metadata: VERSION, SOURCE, SITE
 2. legal info: LICENSE, LICENSE_FILES
 3. if available, CPE info
 4. DEPENDENCIES
 5. CONF_ENV and CONF_OPTS
 6. and so on...

I have no strong preference about where to set the host varaibles vs.
the target ones; intersperesed like you did, of all the host ones after
the target variant. I would slightly favour the latter, but I'm OK with
anything as long as it is consistent.

> +# The StormLib version check in SMPQ CMake is broken. Disable it.
> +define SMPQ_DISABLE_VERSION_CHECK
> +	$(SED) 's/try_compile(CHECK.*/set(CHECK ON)/' $(@D)/CMakeLists.txt
> +endef
> +
> +define SMPQ_DISABLE_MANUAL
> +	$(SED) 's|if(NOT CMAKE_CROSSCOMPILING)|if(FALSE)|' $(@D)/CMakeLists.txt
> +endef
> +
> +# StormLib is C++ and must be linked with a C++ linker (e.g. via g++ instead of gcc).
> +define SMPQ_SET_LANG_TO_CXX
> +	$(SED) '/^project/a file(GLOB_RECURSE CFILES "$${CMAKE_SOURCE_DIR}/*.c")\$(NEWLINE)
> +SET_SOURCE_FILES_PROPERTIES($${CFILES} PROPERTIES LANGUAGE CXX)' $(@D)/CMakeLists.txt
> +endef
> +
> +SMPQ_POST_PATCH_HOOKS += SMPQ_DISABLE_VERSION_CHECK SMPQ_DISABLE_MANUAL SMPQ_SET_LANG_TO_CXX
> +HOST_SMPQ_POST_PATCH_HOOKS += SMPQ_DISABLE_VERSION_CHECK SMPQ_DISABLE_MANUAL SMPQ_SET_LANG_TO_CXX

We try not to unconditionally patch code from the .mk files; instead,
bundle three patches, to fix each of those three issues.

Bonus point if you can make those patches acceptable upstream.
Extra-bonus point if you push those patches upstream, and they get
applied! ;-)

Regards,
Yann E. MORIN.

> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> diff --git a/package/stormlib/Config.in b/package/stormlib/Config.in
> new file mode 100644
> index 0000000000..b2e4df3c62
> --- /dev/null
> +++ b/package/stormlib/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_STORMLIB
> +	bool "stormlib"
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  StormLib is a library that reads and writes Blizzard MPQ archives.
> +
> +	  https://github.com/ladislav-zezula/StormLib
> diff --git a/package/stormlib/stormlib.hash b/package/stormlib/stormlib.hash
> new file mode 100644
> index 0000000000..dc5370b03d
> --- /dev/null
> +++ b/package/stormlib/stormlib.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  53b8befda3855a922e57a27f78c36feba7e9a32804da4b6592a3670c4e9cec98  stormlib-5ab093b7a57b8779dff06a08fac19d46c40b3329.tar.gz
> +sha256  50b128e6750ed9d887e7a5748a6021238bb2f3bf34a5dd2768c410d932069e35  LICENSE
> diff --git a/package/stormlib/stormlib.mk b/package/stormlib/stormlib.mk
> new file mode 100644
> index 0000000000..a2e58aa983
> --- /dev/null
> +++ b/package/stormlib/stormlib.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# stormlib
> +#
> +################################################################################
> +
> +STORMLIB_VERSION = 5ab093b7a57b8779dff06a08fac19d46c40b3329
> +STORMLIB_SITE = $(call github,ladislav-zezula,StormLib,$(STORMLIB_VERSION))
> +STORMLIB_DEPENDENCIES = zlib bzip2
> +HOST_STORMLIB_DEPENDENCIES = host-zlib host-bzip2
> +STORMLIB_LICENSE = MIT
> +STORMLIB_LICENSE_FILES = LICENSE
> +STORMLIB_INSTALL_STAGING = YES
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.30.2
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
