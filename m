Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDB2C3DA7F
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 02:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D240C60675;
	Sat,  3 Aug 2024 02:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iPiXINUFwia; Sat,  3 Aug 2024 02:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7626069A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC7626069A;
	Sat,  3 Aug 2024 02:50:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667BD1BF378
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 02:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 615EE6069A
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 02:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDoK6k0x4xsF for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 02:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.16.199.2;
 helo=susu.bendor.com.au; envelope-from=zoltan@bendor.com.au;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B59A60675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B59A60675
Received: from susu.bendor.com.au (susu.bendor.com.au [203.16.199.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B59A60675
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 02:50:18 +0000 (UTC)
Received: from mazsola (mazsola.bendor.com.au [203.16.199.5])
 by susu.bendor.com.au (Postfix) with ESMTPSA id 356BD56004D;
 Sat,  3 Aug 2024 12:49:38 +1000 (EST)
Date: Sat, 3 Aug 2024 12:50:13 +1000
From: =?UTF-8?B?Wm9sdMOhbiBLw7Njc2k=?= <zoltan@bendor.com.au>
To: buildroot@buildroot.org
Message-ID: <20240803125013.5b7b907c@mazsola>
In-Reply-To: <20240802235743.58a983a5@windsurf>
References: <20240803062508.312de54e@mazsola>
 <20240802235743.58a983a5@windsurf>
Organization: Bendor Research Pty. Ltd.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bendor.com.au
Subject: Re: [Buildroot] User mailing list?
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi there,

On Fri, 2 Aug 2024 23:57:43 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> This mailing list is actually used for both, so feel free to ask your
> user's questions.

In that case, I'll have some. Background: I live on Linux, I regularly
cross-compile to bare-metal targets, write my own BSPs and target libs
and all, know make.

New board, with a Xilinx Zynq7 SoC (actually, SoM w/ DRAM). It's just
an ARM Cortex-A9 with loads of peripherals and an FPGA. I can boot the
board (with bare metal code), can load anything to RAM, configure all
devices and all. But I want Linux on it.

Not the Xilinx one, but the mainline version (the Zynq7 is old enough
so that all relevant Xilinx drivers are already on the mainline), with
the RT patches applied. Don't really want uboot or anything fancy, I can
load a kernel image, device tree and rootfs into RAM myself and start
the kernel. So all I need is the kernel, the DTB and the rootfs.

Buildroot seems to be a perfect match for this.
 
Alas, from here, user stupidity and ignorance to be expected...

First step, let's make an SDK. Load a defconfig with a board using the
same chip, then change the Buildroot config to use a mainline kernel +
RT patch, disable everything that the manual says: busybox, init
system, /bin/sh, and tar-ing the root file system.
Type make sdk.

It chugs along, then the kernel compilation fails with a prototype
mismatch in the noveau video driver. Why would it need an nVidia driver
for a headless board is a mystery, but ok. Let's configure the kernel.
Turn off everything the board doesn't have and/or not needed.

make sdk again. Cool! The kernel compiles. Then Buildroot starts to
build rootfs.ext2. First, a warning about 64-bit filesystem support not
being enabled, but it builds it anyway.
Writing superblocks and filesystem accounting information: done.
Hurray!

Then:

>>>   Executing post-image script board/zynq/post-image.sh
INFO: cmd: "mkdir -p
"/usr/local/work/Linux/test/buildroot-2024.05/output/build/genimage.tmp"" (stderr):
INFO: cmd: "rm -rf
"/usr/local/work/Linux/test/buildroot-2024.05/output/build/genimage.tmp"/*" (stderr):
INFO: cmd: "mkdir -p
"/usr/local/work/Linux/test/buildroot-2024.05/output/build/genimage.tmp"" (stderr):
INFO: cmd: "cp -a "/tmp/tmp.piKMAgmzhv"
"/usr/local/work/Linux/test/buildroot-2024.05/output/build/genimage.tmp/root"" (stderr):
ERROR: file(boot.bin):
stat(/usr/local/work/Linux/test/buildroot-2024.05/output/images/boot.bin)
failed: No such file or directory
ERROR: vfat(boot.vfat): could not setup boot.bin
make: *** [Makefile:826: target-post-image] Error 1

I guess what happened was that Buildroot wanted to invoke the Xilinx
tool 'genimage' to create boot.bin, which is the FSBL for the Zynq7
chips.
Boot.bin is built from bare-metal code source (probably from Xilinx) and
the resulting elf file is massaged to boot.bin by the Xilinx genimage
tool. But I don't need boot.bin (I have my own), just the kernel,
rootfs and the dtb.

Obviously, my gung-ho approach of reading the first few chapters of the
manual and jumping on it is not the way to go. What I'd like to ask for
is some advice about the correct way to have a new target board defined,
the kernel configured *for that board* and building what I need (but
not what I don't need).

Pointers to information about the whole build process would also be
appreciated.

Thanks,

Zoltan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
