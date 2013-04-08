From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 08 Apr 2013 13:31:30 -0300
Subject: [Buildroot] Newbie questions on building images for EP405
In-Reply-To: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
References: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
Message-ID: <5162F0E2.2030103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2013 12:20 PM, David Li wrote:

> Hello,
> 
> I am new to using buildroot and I am learning this with an ep405 (ppc)
>         board. My goal is to build an Linux image and boot it up. The
>     board comes with u-boot loader on bootup.
>         I did make menuconfig with minmal packages (busybox, devtmpfs,
>     native buildroot tool chain etc).  After make, I got two image files
>     in output/images: rootfs.tar and uImage.
> 
>         My questions are:
>         1. There are two def kernel config files I used in
>            output/build/linux-3.7.8/arch/
>     powerpc/configs/. which one is really  for ep405? I tried both in make
>     menuconfig and all of them built OK:
> 
>       ppc40x_defconfig
>       40x/ep405_defconfig

Hi.
The ppc40x_defconfig is the "common" config - useful if you're
targetting different 40x-based boards.
The ep405_defconfig is targetted towards the embedded planet ep405 board
explicitly - the kernel will be somewhat smaller.

>           2. There are two files in output/images/ - one kernel and the
>     other a roof filesystem. Can they be combined into one image and boot
>     up with ep405 uboot?

Yes, you probably want to use an initramfs target for that. In the
Filesystem images menu you've got "initial RAM filesystem linked into
the linux kernel" option, that's what you'd want for a quick test.
The uImage is the kernel prepared/formatted for u-boot to use.
The tar is just a simple archive of the root filesystem, usable for
example if you are NFS-booting the board or dumping it into some form of
removable media (SD card and so on).

>           3. The ep405 board already boots up uboot. Do I need use  buildroot to
>            build another uboot image?

If it's already working like you want it too usually there's no need to
upgrade the booatloader, specially since in many cases you'll need
specialized hardware to recover from a botched upgrade.
Regards.
