From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 9 Jul 2012 19:16:34 +0300
Subject: [Buildroot] /dev/ttyS0 in filesystem created by Buildroot can't
 be opened in Qemu
In-Reply-To: <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
References: <CAM1vXnbUXsTaCbtRnS5z8SdqKTTY-EV3=o79vcGbwnSjukYmNw@mail.gmail.com>
 <20120709084152.GJ22116@sapphire.tkos.co.il>
 <CAM1vXnZsLGimtxeVZ3k6n+K6k3OdV=VwWPVEuujAD0-ZT176Bg@mail.gmail.com>
Message-ID: <20120709161602.GG3783@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mihajlo,

On Mon, Jul 09, 2012 at 04:40:52PM +0200, Mihajlo Jovanovi? wrote:
> Hi Baruch,
> 
> Thanks for this hint. I have rebuilt everything with
> qemu_arm_vexpress_defconfig configuration file.
> 
> I have noticed that it created ext2 filesystem, instead of cpio, as I was
> planning to do, to be as close to tutorial as possible.
> 
> Nevertheless, I have launched Qemu like this:
> 
> qemu-system-arm -M vexpress-a9 -kernel zImage -initrd rootfs.ext2 -serial
> stdio -append "console=ttyAMA0"
> 
> Where zImage and rootfs.ext2 are kernel image and filesystem created by
> Buildroot, respectively.
> 
> Now there are no complaints about missing /dev/ttyS0 any more, but kernel
> prints the message that it can not mount filesystem:

[...]

Quoting board/qemu/arm-vexpress/readme.txt:

Run the emulation with:

  qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200 root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user

The login prompt will appear in the terminal that started Qemu. The
graphical window is the framebuffer.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
