Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A09C6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 15:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21916163C;
	Thu, 30 Mar 2023 15:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B21916163C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4C-rEHKKVgF; Thu, 30 Mar 2023 15:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30A460EA7;
	Thu, 30 Mar 2023 15:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30A460EA7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFDF81BF310
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 15:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A898435D
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 15:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A898435D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9wvXVrKLSq5 for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 15:47:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DA984323
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96DA984323
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 15:47:18 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MvryJ-1qXo3f0jfb-00st9n for <buildroot@buildroot.org>; Thu, 30 Mar 2023
 17:47:16 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Thu, 30 Mar 2023 17:47:15 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] generating a kernel with camera support (video 4
 linux)
Thread-Index: AdliTv3uoYZvkG6QSc+Ok+fs8fAjsf//6ZyA//5P3ZA=
Date: Thu, 30 Mar 2023 15:47:14 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8C24E16F@Exchange2013.PRIMES.local>
References: <1619D009AA8C9E469331A8EE22395AEC8C24E05A@Exchange2013.PRIMES.local>
 <20230329173851.18816793@gmx.net>
In-Reply-To: <20230329173851.18816793@gmx.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:edIjBzyc0hG+fUiOgSV6m+PsIRBFIiCqy1l/Tu3HPnEBZioHMpY
 9uVnhBcCZh6ZYqABgPmGOMzhy/9RFV/ApVRtTZpogfoHk4wn/2WPnQiUJODIgFVOB/QAbpu
 reXrjPBAo6+xfOzwnjF4JyvB45l2lI040gkpDnZJc2iBgrXY39hmQv6eIWm36KHg0bcK4Qu
 B37LLck+o6luHu4kkqbBg==
UI-OutboundReport: notjunk:1;M01:P0:thev3yD9ug8=;7Ex57CvwNapaCnS1uD6HM/9iwwy
 v7+/nqxzA0eR9+poKKJabeQnJtFx6Q7hS3M7CgeEWaLDIbJYlbkozM9e1Vfdn231cnf+naFMC
 RlrYXlOq5YDGI5gIpGkyUyfuotDELNUq1LfoVA5EaToZ55mPLBwxlGO11vb2OGBW4CnckTm5O
 0/I7AgLFmZw/KAfH7RyIRjdb9OlUx1I2JRhmFtyxMXUTES6SBScGtmu8NaMtOb3rsZ5n0NQzA
 sRler12Q6tJ6bs4GhppjURh3NJP9YUeYQNxtEnUeWsXAuRd2ZYvDTquLsaWCDoalt9IS3XTRd
 Vz22Ldr31rK3lwKVgseGPB9jA+54VCD0ym2vpCg6RYLYxR5AxlLIycGmICv6UiWpZCMFnWFiI
 EFCIOjRqcf8GjWnWrFFj311d6JQR/EtYdwBJhoplyC8Q8RE6R1KY+j311fSDL17BMpe+4IDah
 CWscwbtw3tLiyX1Ky58xQJbuz8eCDKKueZzB1JDxqi/sgRGyuS8dJ28X9XaqGa6Qn1OG0uuiY
 rhuHLb/NjWlyIiiu1Ubq09dZY2YHH4RY2mWjsegk3LtpDxfrxJGLdmSMykNC3UU6oHNXiV28f
 1VMLHTbPYams02LbuxNBJQE5Qg8rDQFs51IyQnFx68M15hBMIsR/UDUrI138ESaPmlhQUI7pH
 zPEc6FKDBCB4+9nmFE3eplBXrrZ6d2gsQvw1ztnuLg==
Subject: Re: [Buildroot] generating a kernel with camera support (video 4
 linux)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thank you Peter for your fast reply 
 
> Add 'dtparam=i2c=on' and 'dtoverlay=imx219' to the config.txt file on the first partition, reboot and (dependent on your configuration) load the module 
> via 'modprobe imx219' (or re-build your buildroot image with '/dev management' set to Dynamic mdev or eudev which will enable the udev autoload 
> magic of the kernel modules)...

I tried:

dtparam=i2c=on
dtoverlay=imx219

and typed:
>modprobe -v imx219
(no confirmation or error message)

> modprobe -l | grep imx219
kernel/drivers/media/i2c/imx219.ko
(with or without modprobe -v imx219)

I tried some variations I found online:
dtparam=i2c=on
dtoverlay=imx219,media-controller=0
camera_auto_detect=1

No success

I built a new image with

system configuration -> /dev management -> [*] Dynamic using devtmpfs + mdev

didn't help either.

I tested the camera and some of your settings with a standard raspberry image, at least I know this camera could be detected from the raspberry with v4l2-ctl and I got /dev/video0 .

So there seems to be a very basic error in the configuration I made, here ist he configuration I used:

-------------------

make clean
make raspberrypi4_defconfig 
make menuconfig

Target 			-> [*] ARM (little endian)
Target Architecture	-> [*] cortex-A72		// attention RaspPi 4 specific!
Target ABI 		-> [*] EABIhf			// hard float
Floating Point Strat-> [*] NEON/VFPvi4			// attention RaspPi 4 specific!
ARM instruction set	-> [*] ARM			// Thumb2 may be more compact but not compatible

Toolchain type		-> [*] buildroot toolchain 	// default Buildroot toolchain
c library		-> [*] glibc			// uClibc is more compact, glibc is larger but maybe more compatibel
Kernel headers		-> Same as kernel being built	// should be tested for compatibility later
Custom kernel headers	-> (5.10.x)			// default
Enable C++ support	-> [*]
			
Filesystem images	-> [*] ext2/3/4 root filesystem
					`-> [*] ext4		// default

Filesystem images	-> [*] tar the root filesystem
					`-> [*] no compression

Networking Applications	->	[*] dropbear	// for ssh client & server
System config. root pw	->	(PiManiaZX81)		// needed for root login via ssh

		
target packages -> hardware handling -> firmware -> [*] rpi-firmware 
							`-> [*] rpi 4 (extended)

target packages -> hardware handling -> [*] rpi-userland 


target packages -> libraries -> graphics [*] opencv4
					`-> [*] v4l support
					      [*] imgcodecs
					      [*] imgproc


target packages -> libraries -> hardware handling [*] libgpiod
target packages -> libraries -> hardware handling [*] lib4l
						`-> [*] v4l-utils
target packages -> libraries -> multimedia [*] libcamera
						`-> [*] libcamera v4l compatibility layer

-------------------
system configuration -> /dev management -> [*] Dynamic using devtmpfs + mdev
-------------------

The drivers for the camera imx219 are also included with this setting but maybe there is something missing or interfering with v4l ....

Any ideas?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
