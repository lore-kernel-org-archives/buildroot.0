From: Willy <willy@willygroup.org>
Date: Fri, 27 Apr 2012 16:23:20 +0200
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
 device (flash drive)
In-Reply-To: <jn68cv$dcc$1@dough.gmane.org>
References: <jio6ql$25v$1@dough.gmane.org> <jn68cv$dcc$1@dough.gmane.org>
Message-ID: <jnea4q$6a2$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 24/04/2012 15:04, Willy ha scritto:
> I've still that problem :-(

I made some little steps.

I've installed grub on my usb flash using qemu:
"qemu -kernel bzimage -hda=/dev/sdc"
where sdc is my usb flash.
It tries to boot, but it stops.
I figured out that it tries to boot the bzImage on RAM (and it's larger 
than my memory).

So I've deleted the output/ folder, made some modifications and rebuilt 
all obtaining a smaller kernel and a smaller fs.
Now it boot, but always using the bzImage (I've only /boot/grub/* and 
bzImage on my flash usb). Every modifications does not survive to reboot.

So I've built the vmlinux image and tar fs, but I got
"Grub Error 13: Invalid or unsupported executable format"

There is a way to use a vmlinux image and the fs directly on the flash 
drive?

Thanks
-- 
Willy
