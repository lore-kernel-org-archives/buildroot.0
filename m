From: Ran Shalit <ranshalit@gmail.com>
Date: Mon, 18 Apr 2016 18:32:22 +0300
Subject: [Buildroot] Run qemu with /dev/sda ?
Message-ID: <CAJ2oMhJibkfHEy4P54dm4HZ_frWv4rCXUNdxMezU38edF9v7vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I probably have some misunderstanding with running qemu with buildroot output.
I see in the following link:
http://www.osadl.org/Use-BuildRoot-to-create-a-Linux-image-fo.buildroot-qemu.0.html
that qemu should be run as following:

KERNEL="bzImage"
DISK="rootfs.i686.ext2"

qemu-system-i386 -kernel $LOCATION/$KERNEL \
-hda $LOCATION/$DISK \
-boot c \
-m 128 \
-append "root=/dev/sda rw" \
-localtime \
-no-reboot \
-name rtlinux \
-net nic -net user \
-redir tcp:2222::22 \
-redir tcp:3333::3333

But how can it be that qemu use the same disk as the host ?
Isn't it dangerous ?

Regards,
Ran
