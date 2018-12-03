From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 09:16:04 +0100
Subject: [Buildroot] qemu-aarch64 applications misbehaving
In-Reply-To: <CAKAbLo9SzmvsEGfhRyZRYLgRSocJUEgEbR=a9v2cBUsdqeKVig@mail.gmail.com>
References: <CAKAbLo9SzmvsEGfhRyZRYLgRSocJUEgEbR=a9v2cBUsdqeKVig@mail.gmail.com>
Message-ID: <20181203091604.7dc36318@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Nov 2018 17:04:52 +0100, Zeno Endemann wrote:
> Applications run under qemu-aarch64 are misbehaving for me. For example,
> minimal (console only) Qt application are crashing on startup, and also the
> BusyBox's "df" (disk usage) is printing out silly numbers. While I'm not
> positive I suspect these are bugs in qemu.
> 
> I build the guest os using buildroot 2018.08.2,
> qemu_aarch64_virt_defconfig, and running it as instructed (minus network,
> don't need it):
> 
> qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel
> output/images/Image -append "root=/dev/vda console=ttyAMA0" -drive
> file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device
> virtio-blk-device,drive=hd0
> 
> (Host os is Ubuntu 18.04, QEMU emulator version 2.11.1(Debian
> 1:2.11+dfsg-1ubuntu7.7))
> 
> Can someone confirm this? Any hints would be much appreciated.
> 
> While at it, another side question: Is there a reason why the
> qemu_aarch64_virt_defconfig built kernel does not include the drivers for
> qemu graphics emulation?

This should probably be fixed in uClibc with:

  https://git.buildroot.org/buildroot/commit/?id=2179ca4a61b4574854075e4cdc1e2b851fa0d5b3

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
