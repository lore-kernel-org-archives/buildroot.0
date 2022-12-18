Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B00DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 01:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B743940101;
	Sun, 18 Dec 2022 01:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B743940101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cSelAYzgeIyL; Sun, 18 Dec 2022 01:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D532F40003;
	Sun, 18 Dec 2022 01:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D532F40003
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19BE61BF40B
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 01:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9326607E3
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 01:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9326607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iWLJ3HW8HbeR for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 01:37:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8702360701
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8702360701
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 01:37:44 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6icYp7IAopFO96icYpxScw; Sun, 18 Dec 2022 02:37:42 +0100
Message-ID: <edde337d-c4f9-e214-8eab-2399743c97de@benettiengineering.com>
Date: Sun, 18 Dec 2022 02:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20221218005546.1793522-1-christian@paral.in>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221218005546.1793522-1-christian@paral.in>
X-CMAE-Envelope: MS4xfL8tjloIcV3MlYUhHVJVi9Lk9RBJGqttR8deAci+WnmkXlv0EMu8ijdySgzQEdQoc5qZTKthwInZ2QuibgYtHdJZB9zcPUGHxbnigJK0Wd/V/BYvdEbE
 paWYkQudSN6VE2nzQHEYJLwbmg1Dk64LqV8sLG7vd5LZ2nI3lzvrvuQ2oKeNqJJjpgrdwcwCAumowJnoP/atPvUkyiWwedhWr8f8RdYuJLk+hjN1G5WX/Vh3
 BTpixnNBn0+4f9H8SWhXn79AILs7R6KTqitDSOQU1QxRiy+fvc+dPl/KZrfEBF7US6NFafmQ8/RRxai8hW9tLASiRM3h2jOd5yrNGvCXC7w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671327462; bh=kKw218XgdZAGo5PpzevODCcvm5rpazutqEXTk04OvtQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=I3ZzUW9VhiQrJ6pRgth7wvF6BCnVQM5SvMbfhCTSLf0pWMjt9bcbAGzBTeaWgmZXh
 Hs/v0FGfTqHkbIcViaqnD5yXJ4u/PxmHMF0vaXh5SbFtDfVsRZIrnbnhFiBRiUjeTp
 2tXVQd71byRgsLpWRJ3T2ybTrawDMD5YSjm99KXSa05EGvK8mqrSOPlGMeqt9DBi0y
 5nNakOgaZLqzVLgVFfLdBNrXzuGUqNvSWZPD57KdKHxOcz/PJvTqui0WVmAtSuUvSB
 LRPGex+/dsuDZf+ialHb/e+VwUfr0RcRvLkDyvd23SRhoQqW52/G31NXZbjkPFJkse
 L5BKp9apn3UEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=I3ZzUW9V
Subject: Re: [Buildroot] [PATCH v4 1/1] package/rtl8821cu: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

On 18/12/22 01:55, Christian Stewart via buildroot wrote:
> Adds support for USB rtl8821cu wifi cards.
> 
> Similar to rtl8821au and rtl8812au-aircrack-ng packages.
> 
> https://github.com/morrownr/8821cu-20210118
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> v1 -> v2:
> 
>    - add myself to DEVELOPERS
>    - bump to latest commit 615995
>      - fixes build failure against the odroid xu4 kernel
>    - simplify -Werror=date-time fix-patch
>    - simplify makefile patches
> 
> v2 -> v3:
> 
>   - remove platform-specific checks
> 
> v3 -> v4:
> 
>   - fix setting USER_EXTRA_CFLAGS
>   - unset PLATFORM_GENERIC
>   - thanks for the suggestion from Giulio Benetti
>   - https://patchwork.ozlabs.org/project/buildroot/patch/20221213203236.171656-1-giulio.benetti@benettiengineering.com/
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   DEVELOPERS                       |  1 +
>   package/Config.in                |  1 +
>   package/rtl8821cu/Config.in      | 10 ++++++++++
>   package/rtl8821cu/rtl8821cu.hash |  3 +++
>   package/rtl8821cu/rtl8821cu.mk   | 25 +++++++++++++++++++++++++
>   5 files changed, 40 insertions(+)
>   create mode 100644 package/rtl8821cu/Config.in
>   create mode 100644 package/rtl8821cu/rtl8821cu.hash
>   create mode 100644 package/rtl8821cu/rtl8821cu.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3a0e3c14ab..9152b3321b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -560,6 +560,7 @@ F:	package/mosh/
>   F:	package/nerdctl/
>   F:	package/pkg-golang.mk
>   F:	package/rtl8821au/
> +F:	package/rtl8821cu/
>   F:	package/runc/
>   F:	package/tini/
>   F:	support/testing/tests/package/test_docker_compose.py
> diff --git a/package/Config.in b/package/Config.in
> index 914c3584e9..0ffb1654ec 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -587,6 +587,7 @@ endmenu
>   	source "package/rtl8723ds/Config.in"
>   	source "package/rtl8812au-aircrack-ng/Config.in"
>   	source "package/rtl8821au/Config.in"
> +	source "package/rtl8821cu/Config.in"
>   	source "package/sane-backends/Config.in"
>   	source "package/sdparm/Config.in"
>   	source "package/sedutil/Config.in"
> diff --git a/package/rtl8821cu/Config.in b/package/rtl8821cu/Config.in
> new file mode 100644
> index 0000000000..a5a7b9d255
> --- /dev/null
> +++ b/package/rtl8821cu/Config.in
> @@ -0,0 +1,10 @@
> +comment "rtl8821cu needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_RTL8821CU
> +	bool "rtl8821cu"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  rtl8821cu wifi driver
> +
> +	  https://github.com/brektrou/rtl8821CU
> diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
> new file mode 100644
> index 0000000000..efb9871472
> --- /dev/null
> +++ b/package/rtl8821cu/rtl8821cu.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  09b9fb4160003502d564d0d0d85d6f19b8b6d1627d1a339b3ddfca6a948d84fb  rtl8821cu-86cc5ceb7c28b9b997838e1c796847f6c395c382.tar.gz
> +sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
> diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
> new file mode 100644
> index 0000000000..18222e0014
> --- /dev/null
> +++ b/package/rtl8821cu/rtl8821cu.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# rtl8821cu
> +#
> +################################################################################
> +
> +RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
> +RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
> +RTL8821CU_LICENSE = GPL-2.0
> +RTL8821CU_LICENSE_FILES = LICENSE
> +
> +RTL8821CU_USER_EXTRA_CFLAGS = \
> +	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
> +	-DCONFIG_IOCTL_CFG80211 \
> +	-DRTW_USE_CFG80211_STA_EVENT \
> +	-Wno-error
> +
> +RTL8821CU_MODULE_MAKE_OPTS = \
> +	CONFIG_PLATFORM_GENERIC=n \
> +	CONFIG_RTL8821CU=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))

I've just built successfully for a Big Endian architecture and
everything looks good me so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
