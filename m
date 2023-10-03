Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678A0E75433
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 07:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0600481F8B;
	Tue,  3 Oct 2023 07:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0600481F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qevchwPEu1AK; Tue,  3 Oct 2023 07:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D6C81F99;
	Tue,  3 Oct 2023 07:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D6C81F99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFFF71BF276
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B68BB60EE8
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B68BB60EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gilcrm9Uy0w5 for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 07:59:13 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70DC060E8B
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 07:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DC060E8B
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id A88BA4402F5;
 Tue,  3 Oct 2023 10:58:59 +0300 (IDT)
References: <20231003073303.305988-1-bernd@kuhls.net>
User-agent: mu4e 1.9.21; emacs 29.1
To: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 03 Oct 2023 10:58:39 +0300
In-reply-to: <20231003073303.305988-1-bernd@kuhls.net>
Message-ID: <87edicdtmc.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1696319939;
 bh=KyB/fWQdfZr6G5CggI1JezCkmXNlEvc0ZEbnDHCQuTo=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Hgq1ZEWblSRXHGzGAui+ZIyaniGCwmmQkS+vVNjqhnAC2erS0tIB867gn0JX/t9QU
 eRuXfTrHGLZYJuvZu9UwYgNCFkC9U4WBBITwHgkldbyunsA2Ry3FDUK9E5NFoBfGyB
 ufvtktJzoxotSjUdByDkQvmQsLiv9tJo1sIDwfqE9jikZOTy0rjMdqLx2NPWqslzeK
 0OZQtoQFs4MIpWXLF85o4DpT4DoRXikDZP/OfGXPUR+Q22TKjbM/bLQF6CyZqUeBdG
 HQjb355PLDvh9BEW4N5Onyv8L0fmaoOP+M31640bH9rzvTZuV/y9pOgLyFBSg9XoHh
 RL7yC7pZtR/Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=Hgq1ZEWb
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20230919
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Tue, Oct 03 2023, Bernd Kuhls wrote:

> Updated license hash due to various commits:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/WHENCE
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
>  package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
>  package/kodi/kodi.hash                     | 8 ++++----
>  package/kodi/kodi.mk                       | 2 +-

These changes look unrelated.

baruch

>  package/linux-firmware/linux-firmware.hash | 4 ++--
>  package/linux-firmware/linux-firmware.mk   | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> index 4e2c72ec65..a97e340733 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c39923af8e3473cd80f7daedfcc1790d63111b55f1786606a843f89bf88b84d6  kodi-pvr-waipu-21.4.0-Omega.tar.gz
> +sha256  d336d154ee3e571d1b990dd7077587602595bedcc78ccb98ac6ed420a0fb3b96  kodi-pvr-waipu-21.4.1-Omega.tar.gz
>  sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
> diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> index 4fdc3dedd1..8b194e45d4 100644
> --- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> +++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_WAIPU_VERSION = 21.4.0-Omega
> +KODI_PVR_WAIPU_VERSION = 21.4.1-Omega
>  KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
>  KODI_PVR_WAIPU_LICENSE = GPL-2.0+
>  KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index e5a47f9036..7b08344456 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,7 +1,7 @@
>  # Locally computed
>  sha256  1b4e1ef18a53897667e4a26122f82fc7a196952a3377868afe036cb9ed27571d  kodi-21.0a3-Omega.tar.gz
> -sha256 d03792719f61a702da8b33ecb145f469ac0a7ba4de7ee8fe475e4a120449eba8
> kodi-e7a7395af00cb3f78fe503ae19c921bad0b31a7d.tar.gz
> -sha256 f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e
> kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
> -sha256 584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc
> kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
> -sha256 719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62
> kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
> +sha256  1b4e1ef18a53897667e4a26122f82fc7a196952a3377868afe036cb9ed27571d  kodi-21.0a3-Omega.tar.gz
> +sha256  1b4e1ef18a53897667e4a26122f82fc7a196952a3377868afe036cb9ed27571d  kodi-21.0a3-Omega.tar.gz
> +sha256  1b4e1ef18a53897667e4a26122f82fc7a196952a3377868afe036cb9ed27571d  kodi-21.0a3-Omega.tar.gz
> +sha256  1b4e1ef18a53897667e4a26122f82fc7a196952a3377868afe036cb9ed27571d  kodi-21.0a3-Omega.tar.gz
>  sha256  9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 43bda54f0b..4e998635e7 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -8,7 +8,7 @@
>  # and kodi-texturepacker
>  KODI_VERSION_MAJOR = 21.0a3
>  KODI_VERSION_NAME = Omega
> -KODI_VERSION = e7a7395af00cb3f78fe503ae19c921bad0b31a7d
> +KODI_VERSION = 21.0a3-Omega
>  KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
>  KODI_LICENSE = GPL-2.0
>  KODI_LICENSE_FILES = LICENSE.md
> diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
> index 31bbfddfaa..d33215ecd1 100644
> --- a/package/linux-firmware/linux-firmware.hash
> +++ b/package/linux-firmware/linux-firmware.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
> -sha256  88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688  linux-firmware-20230804.tar.xz
> +sha256  97fada0d02bdafc4e017a4dcc456e7fa48bc8daf2ddf75161f39a92e38f084ad  linux-firmware-20230919.tar.xz
>  
>  # Hash for license files
>  sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
> @@ -36,6 +36,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
>  sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
>  sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
>  sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
> -sha256  0f87f8f67de39828d8e59c69369f850e0a80de638795e22ddfdd1f7f31cdf889  WHENCE
> +sha256  960bbc08cdd5f505b05645947360461aa5a62fe56c97f5ffbae064ca33a922ec  WHENCE
>  sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
>  sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 0cd1f30c16..6f15ff7400 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LINUX_FIRMWARE_VERSION = 20230804
> +LINUX_FIRMWARE_VERSION = 20230919
>  LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
>  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
>  LINUX_FIRMWARE_INSTALL_IMAGES = YES


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
