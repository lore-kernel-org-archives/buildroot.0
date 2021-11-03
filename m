Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CC3C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5208C610A8
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5208C610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F53F40146;
	Wed,  3 Nov 2021 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6xoaKfXvz5I; Wed,  3 Nov 2021 20:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D022401C0;
	Wed,  3 Nov 2021 20:06:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 589AA1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 487C480F77
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sCpRH_wHDUQ for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B9B580F56
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635969964;
 bh=B7IMgu0TYmkI7XTbQk4t63fuFPEhGBZiDEy9DqoNX3M=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OMtq/sCgxadfosnk9+pusKjdFSCGuANy8Uj7smL2agOnebAG4YoxBbmAsoFHCaZa6
 QPBIyS0yyrvd1yWF8H1fT9O1+eS/FwqKBpV+WiuFzd601ArIn8DyxCmIHI8Wtnd1Ck
 92W3/4mflhSQxLmX7LMyK9GKcu8G8VdKgQxFbzcI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1nES7t2qJR-00WBYB; Wed, 03
 Nov 2021 21:06:04 +0100
Date: Wed, 3 Nov 2021 21:06:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Julien Grossholtz <julien.grossholtz@openest.io>
Message-ID: <20211103210603.3a135f02@gmx.net>
In-Reply-To: <20211030213600.3445223-1-julien.grossholtz@openest.io>
References: <20211030213600.3445223-1-julien.grossholtz@openest.io>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:QkveaHVyR9smyZPepESLxWFUa+/b4T6wU4YHr8Nc66e5Bqceubu
 F5Zx1vR6+xJ0qyZq5WxDalZIhHgPB16k/CB/W5t74bspHmoBwkIY8turrpa/7xXGXJ3dXTY
 5QULav7fQN3efCMoVN1Yj35xAmz1IoUrvqKPGVNsuv3E+ceqz9tsbPTYik+CXOoUa3UT7uq
 L4BV5wAp+At2S3ApfRu0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wAlCtW+w4OQ=:JVZgX7OlTXgKfAdIwppyy4
 AfJ3WfbN2AwK7sLY1ZZ7hlnGtM91P0SWPnmdVlGA1nLtWEFBJX/XAqKt8YcnW5TpjIPncwo5X
 uyKxnpobjQKAYZG7WWgjpuETW6RdEQa0l/d1GMAO48dWIdzKm0/tdwcEHTBRa0Ggqm9dBTzaF
 z9GE04epxgBqW0Be9WNSkJYg+MrWz5hacK9mZ5sj7F4QminfajlKgy9ur0Zu13cbMgwMElc9m
 9dZ5YPdfxLJJmxx1YGTbV3oPx4PjYBCsRovcIb0/tVzrjArHqu1HwOw7y1axmMmeRCAg7Y3v+
 Q3dJJRj0Q9a2Y8HZ6g5+txt14dAY4OEFUWZLedv2gtkU0fdX8RR4CpFI7O3acCLQC/6SB5zw7
 rfrAc1T8XcqNpO9IQwqBNtVJ/KMSRLhawwtvPdW/OFD8mWNMB+qZK2w5YfPPrjcG7Z5ay3Z9Z
 dnlS0rDuI1T3KCU+JMdXNBYMCdrM5DNibvo98amgyn9QqQs3rPJ3n2S9KCdJbTlgjqKQYP1Zh
 aLamv43Rgcb7cq8PmecDkjT/aquSskJvTZENxlHXmXWO3KbhbnbHDaEVutuYFBt0WaqT6aLej
 gyP7VKx1J2nOI6OdekRRwG1TNG8M5v6jX2nUAHD6M8Y5s9/dHsvERgUAetNVukcuL6eLUXG23
 bBPHw3v8mD1Ls9CiVxkaRSxDy7bZzMNBlUk9pLLjqWNec2H/ONJz8cW0vWTBSe75xcKwndv+2
 glbAnPaDbQxcdsgf/eJ6EmXjlq2Puf6BK/vRRdWNrFUc0/JeZ+nchUs+PXLK8YNItNUBhQ6UO
 suF5I7k2ONSVj7Y1iC79A2v3XuMB5lN3vr2En/8PwUdIajRmZ43GBSY/tD1Nf7FjuHfAkifuS
 oe6gYEWhBTtvIm1dtOXn3/KoV+E57fWT2L/r3YAu6FX/X1OGPkq+0E9Gkp13L4l3xn+eGeUtP
 3SD8ZqaoYmTSGQzzi57z/ZUAddS3jzuOygvUUdJO5ZdCACDnb9O3bIMtQ/x/QikYn/WWFm2Sh
 bbbyK53l31o5WAgn7qxI1qCn9qHnNPMDxhTBrDNNetq3ksyklqzhuc2LQilbOd4dHu1qIeXGV
 LTsD8C9XkqaCq8=
Subject: Re: [Buildroot] [v2 PATCH 0/2] Raspberry-Pi Zero 2 W support
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

On Sat, 30 Oct 2021 23:35:58 +0200, Julien Grossholtz <julien.grossholtz@openest.io> wrote:

> Hello,
>
> Here is an update of my previous Raspberry-Pi Zero 2 W support.
> As Peter Seiderer pointed out, the Raspberry-Pi Linux Kernel was
> updated with a new bcm2710-rpi-zero-2.dtb [1] a few hours after I sent
> the patch.

Seems you are to fast, with commit [2] a 'bcm2710-rpi-zero-2-w.dtb' was
added (as a permanent replacement/name-change for bcm2710-rpi-zero-2.dtb)
...

>
> Therefore, I bumped the Raspberry-Pi Linux kernel to 5.10.76 for all related
> boards. I built and tested it for the Pis I have access to : Pi Zero W
> and Pi 4 (32 and 64 bit versions). But, I cannot test the other.

Would like to keep rpi-firmware up-to-date with the rpi-kernel (see
for example [3] and [4])...

Mind to re-spin your patchset?

Regards,
Peter

[2] https://github.com/raspberrypi/linux/commit/093bc6d7ffd3cfba05712a7208c8dbfdcffbbf47
[3] https://patchwork.ozlabs.org/project/buildroot/patch/20211006213728.1069-1-ps.report@gmx.net/
[4] https://patchwork.ozlabs.org/project/buildroot/patch/20211006213728.1069-2-ps.report@gmx.net/

>
> Regarding the Raspberry-Pi Zero 2 W, I updated the patch with the new
> dts and kernel git sha1. I booted it, everything seems to work: HDMI,
> Micro SD and Wi-Fi with some extra packages.
>
> Let me know what you think,
>
> Julien Grossholtz
>
>
> [1] https://github.com/raspberrypi/linux/commit/84dc624be6ae704fdb3c413b7d86315cf49fbb0b
>
>
> *** BLURB HERE ***
>
> Julien Grossholtz (2):
>   configs/raspberrypi: bump kernel to 581049d (5.10.76)
>   board/raspberrypi: add Raspberry Pi Zero 2 W
>
>  board/raspberrypi/config_zero2w.txt           | 29 +++++++++++++++
>  .../genimage-raspberrypizero2w.cfg            | 31 ++++++++++++++++
>  board/raspberrypi/readme.txt                  |  5 +++
>  board/raspberrypizero2w                       |  1 +
>  configs/raspberrypi0_defconfig                |  2 +-
>  configs/raspberrypi0w_defconfig               |  2 +-
>  configs/raspberrypi2_defconfig                |  2 +-
>  configs/raspberrypi3_64_defconfig             |  2 +-
>  configs/raspberrypi3_defconfig                |  2 +-
>  configs/raspberrypi3_qt5we_defconfig          |  2 +-
>  configs/raspberrypi4_64_defconfig             |  2 +-
>  configs/raspberrypi4_defconfig                |  2 +-
>  configs/raspberrypi_defconfig                 |  2 +-
>  configs/raspberrypicm4io_64_defconfig         |  2 +-
>  configs/raspberrypicm4io_defconfig            |  2 +-
>  configs/raspberrypizero2w_defconfig           | 36 +++++++++++++++++++
>  16 files changed, 113 insertions(+), 11 deletions(-)
>  create mode 100644 board/raspberrypi/config_zero2w.txt
>  create mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg
>  create mode 120000 board/raspberrypizero2w
>  create mode 100644 configs/raspberrypizero2w_defconfig
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
