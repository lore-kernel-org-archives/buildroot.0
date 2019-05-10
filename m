From: Christian Stewart <christian@paral.in>
Date: Thu, 9 May 2019 18:15:48 -0700
Subject: [Buildroot] initial ram filesystem with pc_x86_64_efi_defconfig
In-Reply-To: <CA+0GdoM2b3FMCHW2TTn7jxzwLtRZZJy3hDRM7pQLEwSfbakncA@mail.gmail.com>
References: <CA+0GdoM2b3FMCHW2TTn7jxzwLtRZZJy3hDRM7pQLEwSfbakncA@mail.gmail.com>
Message-ID: <CA+h8R2raXTKctY9gXGToXQue39_FkYvkwOp7vaGB9-EUkarjxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,

I am also working on an initramfs based system for x86_64 and have had
some initial difficulty (although I haven't had much time to delve
into it completely) getting a straightforward pipeline for Buildroot
build -> install on a x86_64 machine -> boot.

I have managed to get qemu + even VirtualBox working somewhat with an
initramfs based system:

https://github.com/paralin/SkiffOS/tree/master/configs/intel/x64

Getting it to work on a machine should involve flashing grub and/or
isolinux (does isolinux work reliably for a "production-grade" boot or
is grub needed?) and copying in the initramfs + kernel + boot config
(??).

Unfortunately I have limited experience with grub, most of my
bootloader experience is with either Refind on my laptop (an efi based
bootup for macs) or u-boot.

On Thu, May 9, 2019 at 6:00 PM Peter Morici <pmorici@dev295.com> wrote:
>
>
>     I'm trying to get a buildroot system that runs entirely from ram once booted so that the boot device (ie: a usb drive) can be removed without causing a problem.
>
>     I tried starting with the pc_x86_64_efi_defconfig and making changes to enable building initramfs and modifying the post image generation script but the resulting image caused the machine to crash on boot w/o any useful feedback.  Is there an existing def config that maybe better suited as a starting point or some other approach I can take to get the desired result?


Can you detail how you installed the image on the machine and at what
point in the boot you got the crash?

Thanks,
Christian Stewart
