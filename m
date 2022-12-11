Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE242C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 17:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FC3C408EE;
	Sun, 11 Dec 2022 17:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC3C408EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lfv2PDYQD6gf; Sun, 11 Dec 2022 17:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A384090B;
	Sun, 11 Dec 2022 17:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A384090B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC2A1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D8C4090B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 17:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D8C4090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esFdPTpQgiW5 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 17:47:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A77C408EE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A77C408EE
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 17:47:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7ED9F13F8AC;
 Sun, 11 Dec 2022 18:47:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 18:47:30 +0100
Date: Sun, 11 Dec 2022 18:47:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221211174730.GW1044805@scaer>
References: <20221211112824.319583-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221211112824.319583-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670780853;
 bh=2wuicN0Tz1tp0qSgmweFPJwZemYaYTl3BpU75CS18kI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rl/hHo6+Y6Yy6Vrn3EfnFLTqh/YJLiEOBsx1VuZbDTanbrQT2UMjBbc2Gjzctzx4l
 W60GRUSU71zkrig+noBZl4JKbTt6f5Xlod2gwkjn+CldvGGz3msjZasM2eVtr0ntgP
 1vzeLpC4jYr+d/cDiPRBlbn1Kig1HmAcjmWn4T6PwxO/fjeNfob3HIp9QyZ3ugJO3N
 B1lBpQqmLZatfqHtLI2pLDE1vHF4f895T3HdNIkG7ZmxHsKJtBebVz8N0EHPgqX0I4
 vv+SsbEHZzErd5TERTXFir/rq/XNBHiGjg/aSS5UXB44BNXZkzvec109FcCBVp4JBx
 kRn3uZilgGMcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rl/hHo6+
Subject: Re: [Buildroot] [PATCH 1/1] package/hddtemp: new package
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

Bernd, All,

On 2022-12-11 12:28 +0100, Bernd Kuhls spake thusly:
> From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>

Unfortunately, Gilles will never be able to reply:
    https://source.denx.de/Xenomai/xenomai/-/wikis/Gilles_Chanteperdrix
so I dropped it from the list of Cc...

Still, it was nice of you to keep authorship to him, and so did I.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> [Bernd:
>  - switched to actively maintained fork
>  - package/Config.in: moved to "Hardware handling" (Peter)
>  - added toolchain dependencies (Thomas)
>  - added license hash
>  - fixed build errors related to iconv and execinfo (Peter)
>  - removed hook HDDTEMP_REMOVE_MAN (Thomas)
>  - install hddtemp.db to target
>  - added build/install _CMDS due to
>    https://github.com/vitlav/hddtemp/issues/5]

I've done quite a few more changes to actually fix the gettext issue
in the po/ subdir:

  - use GETTEXTIZE=YES, drop host-gettext from _DEPENDENCIES
  - drop custom build and install commands now that we gettextize
  - explicitly specify the DB path, introduce HDDTEMP_DB_PATH

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Imho this package is still relevant despite the fact that is was removed
> from Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1002484
> The drivetemp kernel module is only available since kernel 5.6 and nvme
> support was added to the current hddtemp fork:
> https://github.com/vitlav/hddtemp/commit/edcb4db5acd806010925ccf7bf58f1968cf54df3
> 
> Building this defconfig
> 
> BR2_PACKAGE_HDDTEMP=y
> 
> finished without errors:
> 
>                              arm-aarch64 [ 1/44]: OK
>                    bootlin-aarch64-glibc [ 2/44]: OK
>                bootlin-arcle-hs38-uclibc [ 3/44]: OK
>                     bootlin-armv5-uclibc [ 4/44]: OK
>                      bootlin-armv7-glibc [ 5/44]: OK
>                    bootlin-armv7m-uclibc [ 6/44]: SKIPPED
>                       bootlin-armv7-musl [ 7/44]: OK
>                 bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/44]: OK
>              bootlin-microblazeel-uclibc [10/44]: OK
>                 bootlin-mipsel32r6-glibc [11/44]: OK
>                    bootlin-mipsel-uclibc [12/44]: OK
>                      bootlin-nios2-glibc [13/44]: OK
>                  bootlin-openrisc-uclibc [14/44]: OK
>         bootlin-powerpc64le-power8-glibc [15/44]: OK
>            bootlin-powerpc-e500mc-uclibc [16/44]: OK
>                    bootlin-riscv32-glibc [17/44]: OK
>                    bootlin-riscv64-glibc [18/44]: OK
>                     bootlin-riscv64-musl [19/44]: OK
>                       bootlin-sh4-uclibc [20/44]: OK
>                    bootlin-sparc64-glibc [21/44]: OK
>                     bootlin-sparc-uclibc [22/44]: OK
>                     bootlin-x86-64-glibc [23/44]: OK
>                      bootlin-x86-64-musl [24/44]: OK
>                    bootlin-x86-64-uclibc [25/44]: OK
>                    bootlin-xtensa-uclibc [26/44]: OK
>                             br-arm-basic [27/44]: OK
>                     br-arm-full-nothread [28/44]: OK
>                       br-arm-full-static [29/44]: SKIPPED
>                    br-i386-pentium4-full [30/44]: OK
>                 br-i386-pentium-mmx-musl [31/44]: OK
>                       br-mips64-n64-full [32/44]: OK
>                  br-mips64r6-el-hf-glibc [33/44]: OK
>                br-powerpc-603e-basic-cpp [34/44]: OK
>                br-powerpc64-power7-glibc [35/44]: OK
>                        linaro-aarch64-be [36/44]: OK
>                           linaro-aarch64 [37/44]: OK
>                               linaro-arm [38/44]: OK
>                      sourcery-arm-armv4t [39/44]: OK
>                             sourcery-arm [40/44]: OK
>                      sourcery-arm-thumb2 [41/44]: OK
>                          sourcery-mips64 [42/44]: OK
>                            sourcery-mips [43/44]: OK
>                           sourcery-nios2 [44/44]: OK
> 44 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/hddtemp/Config.in    | 17 ++++++++++++++
>  package/hddtemp/hddtemp.hash |  3 +++
>  package/hddtemp/hddtemp.mk   | 44 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 66 insertions(+)
>  create mode 100644 package/hddtemp/Config.in
>  create mode 100644 package/hddtemp/hddtemp.hash
>  create mode 100644 package/hddtemp/hddtemp.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6e30f50472..03ff139128 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -345,6 +345,7 @@ F:	package/glmark2/
>  F:	package/gpsd/
>  F:	package/gptfdisk/
>  F:	package/hdparm/
> +F:	package/hddtemp/
>  F:	package/inih/
>  F:	package/intel-gmmlib/
>  F:	package/intel-mediadriver/
> diff --git a/package/Config.in b/package/Config.in
> index bf3ee3cc7c..cc240bf7cd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -508,6 +508,7 @@ endmenu
>  	source "package/gpsd/Config.in"
>  	source "package/gptfdisk/Config.in"
>  	source "package/gvfs/Config.in"
> +	source "package/hddtemp/Config.in"
>  	source "package/hdparm/Config.in"
>  	source "package/hwdata/Config.in"
>  	source "package/hwloc/Config.in"
> diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
> new file mode 100644
> index 0000000000..0e02252461
> --- /dev/null
> +++ b/package/hddtemp/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_HDDTEMP
> +	bool "hddtemp"
> +	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +	help
> +	  hddtemp is a small utility that gives you the temperature of
> +	  your hard drive by reading S.M.A.R.T. informations, for drives
> +	  that support this feature.
> +
> +	  https://github.com/vitlav/hddtemp
> +	  http://www.guzu.net/linux/hddtemp.php
> +
> +comment "hddtemp needs dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS
> diff --git a/package/hddtemp/hddtemp.hash b/package/hddtemp/hddtemp.hash
> new file mode 100644
> index 0000000000..cd82d7f89b
> --- /dev/null
> +++ b/package/hddtemp/hddtemp.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  592322c64f0d5f035132249e3d051b752f5d24867514522a17285d5e72d21075  hddtemp-0.4.3.tar.gz
> +sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  GPL-2
> diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
> new file mode 100644
> index 0000000000..ac93a4ed25
> --- /dev/null
> +++ b/package/hddtemp/hddtemp.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# hddtemp
> +#
> +################################################################################
> +
> +HDDTEMP_VERSION = 0.4.3
> +HDDTEMP_SITE = $(call github,vitlav,hddtemp,v$(HDDTEMP_VERSION))
> +HDDTEMP_LICENSE = GPLv2
> +HDDTEMP_LICENSE_FILES = GPL-2
> +# Fetched from Github with no configure script
> +HDDTEMP_AUTORECONF = YES
> +# needed for autoreconf
> +HDDTEMP_DEPENDENCIES = host-gettext
> +HDDTEMP_CONF_ENV = LIBS="$(HDDTEMP_LIBS)"
> +
> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
> +HDDTEMP_DEPENDENCIES += libexecinfo
> +HDDTEMP_LIBS += -lexecinfo
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +HDDTEMP_DEPENDENCIES += libiconv
> +HDDTEMP_LIBS += -liconv
> +endif
> +
> +# prevent loop in po/ while building
> +define HDDTEMP_BUILD_CMDS
> +	cd $(@D)/src; \
> +		$(TARGET_MAKE_ENV) $(MAKE)
> +endef
> +
> +# prevent loop in po/ while building
> +define HDDTEMP_INSTALL_TARGET_CMDS
> +	cd $(@D)/src; \
> +		$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +define HDDTEMP_INSTALL_HDDTEMP_DB
> +	$(INSTALL) -D $(@D)/data/hddtemp.db $(TARGET_DIR)/usr/share/misc/hddtemp.db
> +endef
> +HDDTEMP_POST_INSTALL_TARGET_HOOKS += HDDTEMP_INSTALL_HDDTEMP_DB
> +
> +$(eval $(autotools-package))
> -- 
> 2.34.1
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
