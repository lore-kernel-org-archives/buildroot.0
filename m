From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 15:40:01 +0100
Subject: [Buildroot] [PATCH v4 5/9] board/qemu: add defconfig file name
 as tag before the qemu command line
In-Reply-To: <cccdab0a-73d4-3409-275e-a1b8b3422643@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-6-romain.naour@smile.fr>
 <20200210140839.4dab48c8@windsurf>
 <cccdab0a-73d4-3409-275e-a1b8b3422643@smile.fr>
Message-ID: <20200210154001.3efa80ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Feb 2020 14:37:27 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 # qemu_aarch64_virt_defconfig
> > 
> > This way, the information is still encoded on the same line, but it's a
> > comment, so if a newcomer copy/pastes that command line, it will really
> > work.  
> 
> Ok, I see your point.
> 
> I did this way since the qemu cmd line can be on several lines (see
> board/qemu/arm-vexpress-tz/readme.txt).
> 
> Do we require that the qemu cmd line must be on one line ?

Is it really because it is on multiple lines that you need this marker?
Not because some readme.txt document several different defconfigs, and
you need to know which qemu command line corresponds to which defconfig
?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
