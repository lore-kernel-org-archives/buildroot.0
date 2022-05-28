Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5016C433FE
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 10:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 706EF6F4C3;
	Sat, 28 May 2022 10:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_XooQyHfE4L; Sat, 28 May 2022 10:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A2761088;
	Sat, 28 May 2022 10:05:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55F861BF4D7
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43EFA84C8F
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 10:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwgmAg-oRC0V for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 10:05:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4129884C7C
 for <buildroot@buildroot.org>; Sat, 28 May 2022 10:05:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5173:a555:38b0:75bd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 86C0678035E;
 Sat, 28 May 2022 12:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653732310;
 bh=t4xZZ8m+xEppOfUVqndhIEGoFomeIIzz3qMHWCKoTIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mDtksIYsRFfYnbQq5fs8Yu9pMG+jfAlG9imh7qSwq3ApXhRHREls3MmMzijFG9vio
 V4knxSnZibaNVXSj6vKjWonD7UIJ4ouHTcZG1ic7SvYzX+xiD2DF8iPI0kKaxL0Hdr
 0F2x4mhyptTPoS/xnrjfNSwEItcu+NQjonkVrbdx7sZTlN8Is+f0mpnxczMHzld8hu
 dKvBjvPNoYNyNucwEXj4CvZ8kuLEjMd8EbhFNciY/39AUmKZ6J0pOdup2TBttSK4IZ
 XoO7kVakCSBhctfSMm/dfHLqIEubmiKAnCZeI8dZMXVB2CgMbCmAeEOpoSNczykLDZ
 lPAFtRhbnv3+Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 12:05:08 +0200
Date: Sat, 28 May 2022 12:05:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220528100508.GE301044@scaer>
References: <20220527112146.387164-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527112146.387164-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix gcc 11 Werror
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-05-27 13:21 +0200, Romain Naour spake thusly:
> Backport a patch [1] included in edk2-stable202202 release.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/2510255569
> 
> [1] https://github.com/tianocore/edk2/commit/ae8272ef787d80950803c521a13a308651bdc62e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Dick Olsson <hi@senzilla.io>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ePkg-UsbBusDxe-fix-NOOPT-build-error.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
> 
> diff --git a/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
> new file mode 100644
> index 0000000000..f4f1b1565a
> --- /dev/null
> +++ b/boot/edk2/0001-MdeModulePkg-UsbBusDxe-fix-NOOPT-build-error.patch
> @@ -0,0 +1,48 @@
> +From 59aa67f7a4d8efc564b46fe467aaf6eccec17183 Mon Sep 17 00:00:00 2001
> +From: Gerd Hoffmann <kraxel@redhat.com>
> +Date: Mon, 20 Dec 2021 22:32:38 +0800
> +Subject: [PATCH] MdeModulePkg/UsbBusDxe: fix NOOPT build error
> +
> +gcc-11 (fedora 35):
> +
> +/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c: In function ?UsbIoBulkTransfer?:
> +/home/kraxel/projects/edk2/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBus.c:277:12: error: ?UsbHcBulkTransfer? accessing 80 bytes in a region of size 8 [-Werror=stringop-overflow=]
> +
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +Reviewed-by: Hao A Wu <hao.a.wu@intel.com>
> +(cherry picked from commit ae8272ef787d80950803c521a13a308651bdc62e)
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c | 2 +-
> + MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
> +index 7529e03e85..b2ce97ca37 100644
> +--- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
> ++++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.c
> +@@ -285,7 +285,7 @@ UsbHcBulkTransfer (
> +   IN  UINT8                               DevSpeed,
> +   IN  UINTN                               MaxPacket,
> +   IN  UINT8                               BufferNum,
> +-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
> ++  IN  OUT VOID                            *Data[],
> +   IN  OUT UINTN                           *DataLength,
> +   IN  OUT UINT8                           *DataToggle,
> +   IN  UINTN                               TimeOut,
> +diff --git a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
> +index 1d2b8a6174..1316a5981f 100644
> +--- a/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
> ++++ b/MdeModulePkg/Bus/Usb/UsbBusDxe/UsbUtility.h
> +@@ -149,7 +149,7 @@ UsbHcBulkTransfer (
> +   IN  UINT8                               DevSpeed,
> +   IN  UINTN                               MaxPacket,
> +   IN  UINT8                               BufferNum,
> +-  IN  OUT VOID                            *Data[EFI_USB_MAX_BULK_BUFFER_NUM],
> ++  IN  OUT VOID                            *Data[],
> +   IN  OUT UINTN                           *DataLength,
> +   IN  OUT UINT8                           *DataToggle,
> +   IN  UINTN                               TimeOut,
> +-- 
> +2.35.3
> +
> -- 
> 2.35.3
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
