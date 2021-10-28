Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F812C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 07:01:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFC960296
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 07:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DFC960296
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33926060E;
	Thu, 28 Oct 2021 07:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXOQhqKTYHqB; Thu, 28 Oct 2021 07:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE2E60619;
	Thu, 28 Oct 2021 07:01:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFDA61BF350
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 07:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDD804040D
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 07:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHbDCHZkuJv0 for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 07:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30686403E4
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 07:01:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 965752000A;
 Thu, 28 Oct 2021 07:01:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mfzPk-0007iY-A4; Thu, 28 Oct 2021 09:01:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <87cznqpocv.fsf@dell.be.48ers.dk>
 <DM6PR04MB7081C25D109CFECB60F402A3E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
Date: Thu, 28 Oct 2021 09:01:28 +0200
In-Reply-To: <DM6PR04MB7081C25D109CFECB60F402A3E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
 (Damien Le Moal's message of "Thu, 28 Oct 2021 01:07:00 +0000")
Message-ID: <87zgqtocon.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Sean Anderson <seanga2@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Damien" == Damien Le Moal <Damien.LeMoal@wdc.com> writes:

Hi,

 >> > +CONFIG_NOMMU=y
 >> 
 >> That is already taken care of in package/busybox/busybox.mk

 > Right. I overlooked that. This should not be needed. Will check.

Thanks.

 >> Did you verify if all of these tweaks are needed? This looks pretty
 >> extensive. Perhaps we should update busybox-minimal with some of these
 >> instead?

 > busybox-minimal is fine but gives a larger busybox executable. I added this tiny
 > config to save memory when running and avoid failures due to memory allocation
 > when executing complex-ish shell commands spawning multiple shells (e.g. pipes).

Ok. Would BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES make sense to save RAM
on NOMMU (I don't really have any nommu experience)?

From a maintenance PoV I would prefer to keep the number of busybox
configs to a minimum, but if we cannot get it to work properly with a
(possibly tweaked) busybox-minimal, then so be it.


 >> Why? Isn't fs/cpio/init suitable?

 > In the past, I was getting errors mounting devtmpfs. Trying again now, it seems
 > to be working as expected. This added init does adds mount of sysfs and procfs
 > for convenience, but the main point is that the last exec starts the interactive
 > shell instead of /sbin/init. The default busybox init executable is way too big
 > and fails to run.

Interesting, why does init fail but /bin/sh doesn't? It is the same
busybox binary, and init does not look that big:

size init/lib.a shell/hush.o
   text    data     bss     dec     hex filename
    635       0       0     635     27b halt.o (ex init/lib.a)
   5907       0       0    5907    1713 init.o (ex init/lib.a)
  51649     904       0   52553    cd49 shell/hush.o

Is it because of the scripts that init executes?


 > I could just overlay /sbin/init as a symlink to /bin/sh.

 > I do like the sysfs and proc automatic mount though, and the cute logo added :)

;)

If we could get the normal init working, then the mounts would be
working. A logo could be printed by getty (see our
BR2_TARGET_GENERIC_ISSUE logic).


 >> Cute, but why can't we use the normal busybox init / inittab?

 > The default binary init is way too big and fails to run (ENOMEM). Even if we
 > could run it, it would stay around and consume memory for nothing.
 > That is why I just go straight to an interactive shell here.

Ok, can you just add a small comment to the file to explain that?


 >> > +BR2_LINUX_KERNEL=y
 >> 
 >> You don't specify the kernel version, so it will change every time we
 >> bump it, please specify a known good version.

 > Any version including and above 5.13 work fine. How do I do that ?

BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="<version>"

See the other defconfigs for examples.


 >> I gave it a try here, and it fails to boot with 5.14.14:
 > [...]> [    0.253373] i2c /dev entries driver
 >> [    0.258022] random: get_random_bytes called from 0x000000008000569a with crng_init=0
 >> [    0.271672] Freeing unused kernel image (initmem) memory: 608K
 >> [    0.276809] This architecture does not have kernel memory protection.
 >> [    0.283241] Run /init as init process
 >> [    0.289488] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
 >> [    0.296422] SMP: stopping secondary CPUs
 >> [    0.300340] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
 >> 
 >> Any idea why?

 > I was getting the same when elf2flt had problems (buggy relocation). What I sent
 > is working for me doing this:

 > make clean
 > make sipeed_maix_bit_defconfig
 > make

Odd. This was with a clean build on current master after applying your
patch 5.


 > Not sure what is going on. It seems that elf2flt riscv support is still very
 > fragile. I need to address the comments I got on my PR and dig further to check
 > that I am not overlooking anything.

Ok, thanks.


 >> > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
 >> > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
 >> > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 >> > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
 >> 
 >> I see you are adding documentation at the end of the series, but perhaps
 >> it would make sense to add a host package for python3-kflash to make
 >> this work out of the box?

 > Yes, we could. Do you want this with this series ? Or adding it later is OK ?
 > I need to check how to add a host package. Not sure how to do that...

I think it makes sense to add it now, it is quite easy to do. See
package/Config.in.host and one of the packages listed there,
E.G. python-lxml. Also see the documentation:

https://buildroot.org/downloads/manual/manual.html#_literal_config_in_host_literal_file


 >> We have genimage in buildroot so it is easy to create a full sd card
 >> image with the right partition as well. I also see that there is some
 >> k210 support in u-boot nowadays, would a setup with u-boot in the SPI
 >> flash and kernel + rootfs on the SD card not be nicer?

 > +Sean who did all the k210 U-Boot work.

 > I have not tried but I think it should work. And as long as the final memory
 > usage is the same (e.g. U-Boot not sticking around in memory), things should be
 > all OK.

I believe it should be. It would make it more similar to other boards
and a bit faster/easier to update.


 >> Any specific reason to keep the kernel in the SPI flash?

 > Not really for now. It is just very simple to use :)

 > Going forward though, I hope to be able to use XIP to execute busybox from there
 > directly. There are patches out there for this board and got report that it is
 > working with nommu. But that is more for the cpio case than the sdcard case.

How does XIP work with cpio/initramfs? Isn't XIP about storing the
application uncompressed in a filesystem in the flash and executing it
directly from there?

How about XIP for the kernel?


 > Let me dig again in elf2flt to see if I can get something more solid.

Great, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
