Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB2DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 17:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CC6384067;
	Sat,  2 Apr 2022 17:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EsKtnXsRzEFV; Sat,  2 Apr 2022 17:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B2B84065;
	Sat,  2 Apr 2022 17:26:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C39BE1BF968
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C14B1418AE
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 17:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJNenul_4o-L for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 17:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37D3B418AA
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 17:26:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bcfa:8d59:a850:4621])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 44B1A780374;
 Sat,  2 Apr 2022 19:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648920381;
 bh=4BcXg50HLG9mt2N2FAl6MU7UgEh7cE41CL0DCB20sFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oy2IgOe100aWcfvnLGpgMHk3Y3URAt8SCtP8XjPS08o4R7ijBk0BZ9CQkJ8X6jCZk
 djty0E5lSasQokKvmIAzScGbA0TZna/p1rnoiTGd53KehzleqHemgqxhQOb0ZKsxPI
 6On/UOqsxUdPB11jitap3Eae/vltONbLPzf1jp9sP1U8/BYxZBmTc1DW/RFZRXUlyO
 mCpOVv7+qSUU+3LBm8M6SJLdWoapu4tbVbnouCLDozIO1ZKNa3tC8b2eiDTDHdXcHX
 8AMBNLGyYBUYQPLt022fMPAKDZ7+4qyOsaeEfGuzIkEcsYCpuKF3Fi9UP4fa4Jeq4E
 AZvexuD8IrHEg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Apr 2022 19:26:18 +0200
Date: Sat, 2 Apr 2022 19:26:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Markus Mayer <mmayer@broadcom.com>
Message-ID: <20220402172618.GC1811301@scaer>
References: <20220401215653.1703616-1-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401215653.1703616-1-mmayer@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package: replace git:// URLs with https://
 URLs where possible
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Markus, All,

On 2022-04-01 14:56 -0700, Markus Mayer via buildroot spake thusly:
> Replace the remaining git:// URLs with their https:// equivalents as
> this is more secure and also more palatable to corporate firewalls.
> 
> This leaves package/dahdi-linux as the sole package still using a
> git:// URL for cloning.

I was a bit sad to have that one be an outlier, so I checked...

I went to the Asterisk gitweb:
    https://git.asterisk.org/gitweb/

Then I checked the main repository, asterisk:
    https://git.asterisk.org/gitweb/?p=asterisk/asterisk.git;a=summary

This is labelled as:
    Mirror of the Asterisk Project (https://gerrit.asterisk.org)

So I went there, and noticed:
    BROWSE -> Repositories

And surely there is an entry for dahdi-linux;
    https://gerrit.asterisk.org/admin/repos/dahdi-linux

Which has instructions to download over https:
    https://gerrit.asterisk.org/dahdi-linux

So I migrated that one too. We no longer have git:// downloads now.
Woot-woot! \o/

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 3 ++-
>  package/aer-inject/aer-inject.mk                  | 3 ++-
>  package/firmware-utils/firmware-utils.mk          | 3 ++-
>  package/flashbench/flashbench.mk                  | 3 ++-
>  package/mmc-utils/mmc-utils.mk                    | 3 ++-
>  package/mxsldr/mxsldr.mk                          | 3 ++-
>  package/open62541/open62541.mk                    | 2 +-
>  package/pahole/pahole.mk                          | 2 +-
>  package/psplash/psplash.mk                        | 3 ++-
>  package/rtc-tools/rtc-tools.mk                    | 3 ++-
>  package/rtmpdump/rtmpdump.mk                      | 3 ++-
>  package/sox/sox.mk                                | 2 +-
>  package/tftpd/tftpd.mk                            | 3 ++-
>  package/wilink-bt-firmware/wilink-bt-firmware.mk  | 2 +-
>  14 files changed, 24 insertions(+), 14 deletions(-)
> 
> diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
> index 3a1af9b02c7e..30b352f8e7df 100644
> --- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
> +++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  BOOT_WRAPPER_AARCH64_VERSION = 8d5a765251d9113c3c0f9fa14de42a9e7486fe8a
> -BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
> +BOOT_WRAPPER_AARCH64_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
> +BOOT_WRAPPER_AARCH64_SITE_METHOD = git
>  BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause
>  BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
>  BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux
> diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
> index 72495bbea26a..6bc9cb44da74 100644
> --- a/package/aer-inject/aer-inject.mk
> +++ b/package/aer-inject/aer-inject.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
> -AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
> +AER_INJECT_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
> +AER_INJECT_SITE_METHOD = git
>  AER_INJECT_LICENSE = GPL-2.0
>  AER_INJECT_LICENSE_FILES = README
>  AER_INJECT_DEPENDENCIES = host-flex host-bison
> diff --git a/package/firmware-utils/firmware-utils.mk b/package/firmware-utils/firmware-utils.mk
> index 151a01882d71..d5b079e4f5a7 100644
> --- a/package/firmware-utils/firmware-utils.mk
> +++ b/package/firmware-utils/firmware-utils.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  FIRMWARE_UTILS_VERSION = 86739f2b3ae9502368b89ef37fa6f31c42aad6f4
> -FIRMWARE_UTILS_SITE = git://git.openwrt.org/project/firmware-utils.git
> +FIRMWARE_UTILS_SITE = https://git.openwrt.org/project/firmware-utils.git
> +FIRMWARE_UTILS_SITE_METHOD = git
>  FIRMWARE_UTILS_LICENSE = \
>  	BSD-2-Clause (tplink-safeloader), \
>  	BSD-3-Clause (seama), \
> diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
> index e89a250aa31a..f5791c3e95b6 100644
> --- a/package/flashbench/flashbench.mk
> +++ b/package/flashbench/flashbench.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
> -FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
> +FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
> +FLASHBENCH_SITE_METHOD = git
>  FLASHBENCH_LICENSE = GPL-2.0
>  FLASHBENCH_LICENSE_FILES = COPYING
>  
> diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
> index 8c264a454a33..c84737869264 100644
> --- a/package/mmc-utils/mmc-utils.mk
> +++ b/package/mmc-utils/mmc-utils.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  MMC_UTILS_VERSION = d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8
> -MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
> +MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
> +MMC_UTILS_SITE_METHOD = git
>  MMC_UTILS_LICENSE = GPL-2.0
>  MMC_UTILS_LICENSE_FILES = mmc.h
>  
> diff --git a/package/mxsldr/mxsldr.mk b/package/mxsldr/mxsldr.mk
> index 239b40ad29af..2375b9f42b59 100644
> --- a/package/mxsldr/mxsldr.mk
> +++ b/package/mxsldr/mxsldr.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  MXSLDR_VERSION = 2793a657ab7a22487d21c1b020957806f8ae8383
> -MXSLDR_SITE = git://git.denx.de/mxsldr.git
> +MXSLDR_SITE = https://git.denx.de/mxsldr.git
> +MXSLDR_SITE_METHOD = git
>  MXSLDR_LICENSE = GPL-2.0+
>  MXSLDR_LICENSE_FILES = COPYING
>  HOST_MXSLDR_DEPENDENCIES = host-libusb host-pkgconf
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index fb28a614e2a7..627c29e95b6c 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -6,7 +6,7 @@
>  
>  OPEN62541_VERSION = v1.2.2
>  OPEN62541_SITE_METHOD = git
> -OPEN62541_SITE = git://github.com/open62541/open62541.git
> +OPEN62541_SITE = https://github.com/open62541/open62541.git
>  OPEN62541_GIT_SUBMODULES = YES
>  OPEN62541_INSTALL_STAGING = YES
>  OPEN62541_LICENSE = MPL-2.0
> diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
> index 1ad937062dfd..da6d67e6a293 100644
> --- a/package/pahole/pahole.mk
> +++ b/package/pahole/pahole.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PAHOLE_VERSION = v1.23
> -PAHOLE_SITE = git://git.kernel.org/pub/scm/devel/pahole/pahole.git
> +PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git
>  PAHOLE_SITE_METHOD = git
>  # pahole contains git submodule and relies on them to be built.
>  PAHOLE_GIT_SUBMODULES = YES
> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index 5e61f2392f78..69f9bf386da0 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  PSPLASH_VERSION = 44afb7506d43cca15582b4c5b90ba5580344d75d
> -PSPLASH_SITE = git://git.yoctoproject.org/psplash
> +PSPLASH_SITE = https://git.yoctoproject.org/psplash
> +PSPLASH_SITE_METHOD = git
>  PSPLASH_LICENSE = GPL-2.0+
>  PSPLASH_LICENSE_FILES = COPYING
>  PSPLASH_AUTORECONF = YES
> diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
> index 2ef850a81f60..2882c88575d3 100644
> --- a/package/rtc-tools/rtc-tools.mk
> +++ b/package/rtc-tools/rtc-tools.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7
> -RTC_TOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
> +RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
> +RTC_TOOLS_SITE_METHOD = git
>  RTC_TOOLS_LICENSE = GPL-2.0
>  RTC_TOOLS_LICENSE_FILES = COPYING
>  
> diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
> index db79a796dcac..fb381d0e1048 100644
> --- a/package/rtmpdump/rtmpdump.mk
> +++ b/package/rtmpdump/rtmpdump.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  RTMPDUMP_VERSION = c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
> -RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
> +RTMPDUMP_SITE = https://git.ffmpeg.org/rtmpdump
> +RTMPDUMP_SITE_METHOD = git
>  RTMPDUMP_INSTALL_STAGING = YES
>  # Note that rtmpdump is GPL-2.0 but librtmp has its own license and since we only
>  # care about librtmp, it's LGPL-2.1+
> diff --git a/package/sox/sox.mk b/package/sox/sox.mk
> index 4b09b94bc3e3..1896437ad4c7 100644
> --- a/package/sox/sox.mk
> +++ b/package/sox/sox.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  SOX_VERSION = 7524160b29a476f7e87bc14fddf12d349f9a3c5e
> -SOX_SITE = git://git.code.sf.net/p/sox/code
> +SOX_SITE = https://git.code.sf.net/p/sox/code
>  SOX_SITE_METHOD = git
>  SOX_DEPENDENCIES = host-autoconf-archive host-pkgconf
>  SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
> diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
> index 42b5f17821ad..ceac24119eb4 100644
> --- a/package/tftpd/tftpd.mk
> +++ b/package/tftpd/tftpd.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  TFTPD_VERSION = b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7
> -TFTPD_SITE = git://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
> +TFTPD_SITE = https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
> +TFTPD_SITE_METHOD = git
>  TFTPD_CONF_OPTS = --without-tcpwrappers
>  TFTPD_LICENSE = BSD-4-Clause
>  TFTPD_LICENSE_FILES = tftpd/tftpd.c
> diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.mk b/package/wilink-bt-firmware/wilink-bt-firmware.mk
> index 722c4655cd75..a5f3a826090b 100644
> --- a/package/wilink-bt-firmware/wilink-bt-firmware.mk
> +++ b/package/wilink-bt-firmware/wilink-bt-firmware.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  WILINK_BT_FIRMWARE_VERSION = 43fca73c6a98c63fcb98f82af5bf83761778e005
> -WILINK_BT_FIRMWARE_SITE = git://git.ti.com/ti-bt/service-packs.git
> +WILINK_BT_FIRMWARE_SITE = https://git.ti.com/git/ti-bt/service-packs.git
>  WILINK_BT_FIRMWARE_SITE_METHOD = git
>  WILINK_BT_FIRMWARE_LICENSE = PROPRIETARY
>  WILINK_BT_FIRMWARE_LICENSE_FILES = LICENSE
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
