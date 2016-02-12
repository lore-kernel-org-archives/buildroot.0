From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 14:50:06 +0100
Subject: [Buildroot] Booting from cramfs image
In-Reply-To: <CAJrvd8PF5qwZxm3N0b73fJ+Ea4OFMTf-1unN1uhf7FdZBivvSA@mail.gmail.com>
References: <CAJrvd8PF5qwZxm3N0b73fJ+Ea4OFMTf-1unN1uhf7FdZBivvSA@mail.gmail.com>
Message-ID: <20160212145006.77bfa2fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hajime,

On Thu, 11 Feb 2016 21:36:38 +0100, Hajime Yamasaki Vukelic wrote:

> I have an amlogic board (WetekPlay if anyone's familiar with it), and I
> have a kernel image with initramfs, and a rootfs image in cramfs format.
> The files involved are `boot.img` which is built using kernel uImage file,
> DTB, and initramfs in cpio.gz format, and `rootfs.cramfs`. Both are written
> to a FAT32 microSD card.
> 
> I'm trying to get the initramfs loop mount the cramfs image and switch_root
> to it, but I keep getting kernel panic. The init script looks like this:
> 
>     https://gist.github.com/foxbunny/936438bf2ba67c2a5879
> 
> The error message:
> 
>     https://gist.github.com/foxbunny/fd9ceb120e8fe5a631aa
> 
> If someone could give me pointers on how to debug or fix this, I would
> greatly appreciate it.

Well, it essentially means that your init program on your real root
filesystem (in the cramfs image) does not work. Built for the wrong
architecture variant, missing libraries, etc. Could be lots of things.

Also, why use a cramfs filesystem rather than the modern modern and
efficient squashfs?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
