Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93538C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 00:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C39C8400D0;
	Sun, 18 Dec 2022 00:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C39C8400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJA3ucCg6sKq; Sun, 18 Dec 2022 00:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA51240003;
	Sun, 18 Dec 2022 00:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA51240003
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA3AC1BF847
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81E5660767
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 00:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81E5660767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 684zVSPLPryf for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 00:38:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C677260761
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTP id C677260761
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 00:38:36 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6hhKpnjpXtC456hhKp9ZwI; Sun, 18 Dec 2022 01:38:35 +0100
Message-ID: <cbc76ca1-a87e-7a2a-d06e-222d9c00a29e@benettiengineering.com>
Date: Sun, 18 Dec 2022 01:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20221217232556.1609969-1-christian@paral.in>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221217232556.1609969-1-christian@paral.in>
X-CMAE-Envelope: MS4xfKh39mk4X0NGhnpPOAU/oDDzo+e5dAUUEbCcWCvfme/DwgX2MYfw7ZDGsRuFSoIMcKboY5QVvbMztrsjoXlTLnRtmVmixZyZ5Itq7Umk2HumobGsE4AF
 D30Ai2X8pXbMOSPA7uQ9HINyG/Ti3EBFYpmv7TLr2xJjOfLdG077NlAWkAV2hQpqTkQNbaIutGmoU9pFs4jwmRzya6Tmiuxn0YOxZwGuwZEKkqIavxPr62rP
 xDK82Pt24BIYTxbrzeJ+vriixM8rS/Aw/VYPMMB1jAh19T9Usyo8bi3J93lT7jyzurxusG0ZmXQLCGyuaRf1vfbcTBPApYy8m9cEejQsfnI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671323915; bh=N4a7GGz5Gpmd+DoUG32fusXti2NAK5Wlg0ST03fFu2s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=cu/ShagsNs03gr+bJmsY0UbAWoD+u1UwjiFVlcxJ+hUbZzerxld+EFiFAMyunIu4g
 ob/V95eOniP7KRaIGygAuxJO0HT+rYNY50uPqaFLJnc4t8C+53sTCchRKpp3L7CXYE
 n74T+WU6BHuLu76i1PGUJbEixvynuiTaIIj3GjOJaS7LYowBFls0xrwCIViTLh1bqr
 PLvsRDAV2Ahz2T74TIDYgoF7CzpMHBeU7AU8DxzLWaXGp5bwlL4sw9fMJDS5OMq8dB
 0K22f6Y5TSqp4QGcgasutBrJn4dmkR3ixdRAPtRkLzn+PuK2ZDs2IXos4Zx7S7Luq6
 KRQiVKbSlPfTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=cu/Shags
Subject: Re: [Buildroot] [PATCH v3 1/1] package/rtl8821cu: new package
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

On 18/12/22 00:25, Christian Stewart via buildroot wrote:
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
>   - remove all patches (upstreamed)
>   - bump to latest commit 86cc5c
>   - fix license hash
> 
> rtl8821cu
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   DEVELOPERS                       |  1 +
>   package/Config.in                |  1 +
>   package/rtl8821cu/Config.in      | 10 ++++++++++
>   package/rtl8821cu/rtl8821cu.hash |  3 +++
>   package/rtl8821cu/rtl8821cu.mk   | 19 +++++++++++++++++++
>   5 files changed, 34 insertions(+)
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
> index 0000000000..f3c37bc65e
> --- /dev/null
> +++ b/package/rtl8821cu/rtl8821cu.mk
> @@ -0,0 +1,19 @@
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
> +RTL8821CU_MODULE_MAKE_OPTS = \
> +	CONFIG_RTL8821CU=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
> +		-DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT"

This is not enough since it will be prepended to EXTRA_CFLAGS in the 
beginning of the Makefile. CONFIG_PLATFORM_GENERIC is set to y, so that
makes defines CONFIG_LITTLE_ENDIAN by default and in case of a
BIG_ENDIAN architecture you will end up having EXTRA_CFLAGS like this:
...-DCONFIG_BIG_ENDIAN -DCONFIG_LITTLE_ENDIAN...
So what it's been suggested to me and I suggest you to do is to set:
CONFIG_PLATFORM_GENERIC=n
This way you already define -DCONFIG_IOCTL_CFG80211 and 
-DRTW_USE_CFG80211_STA_EVENT that is part of CONFIG_PLATFORM_GENERIC.

Check my pending patch as reference:
https://patchwork.ozlabs.org/project/buildroot/patch/20221213203236.171656-1-giulio.benetti@benettiengineering.com/
There I use CONFIG_PLATFORM_I386_PC=n but the approach is the same.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
