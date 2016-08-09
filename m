From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Tue, 9 Aug 2016 07:23:27 +0100
Subject: [Buildroot] init do not start on rpi-3
In-Reply-To: <CALtfCQZntOzpr5UZr9ayBcPBwXT2SDa+Z_CtNNcFCUX-H41jOw@mail.gmail.com>
References: <CALtfCQZntOzpr5UZr9ayBcPBwXT2SDa+Z_CtNNcFCUX-H41jOw@mail.gmail.com>
Message-ID: <CAFN-Ez76kdXFyagpCzmTteQCeShs4dMAs9o9=bhGJV+S+LdVcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

No changes, used the standard contents. For trial, I had apended
init=/bin/sh in cmdlne.txt once, that was removed later

============begin inittab===============
# Startup the system
::sysinit:/bin/mount -t proc proc /proc
::sysinit:/bin/mount -o remount,rw /
::sysinit:/bin/mkdir -p /dev/pts
::sysinit:/bin/mkdir -p /dev/shm
::sysinit:/bin/mount -a
::sysinit:/bin/hostname -F /etc/hostname
# now run any rc scripts
::sysinit:/etc/init.d/rcS

# Put a getty on the serial port
console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console

# Stuff to do for the 3-finger salute
#::ctrlaltdel:/sbin/reboot

# Stuff to do before rebooting
::shutdown:/etc/init.d/rcK
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r
==========end inittab==================

=========begin cmdline.txt==============
root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200
==========end cmdline.txt===============

Thanks
C

On Tue, Aug 9, 2016 at 7:15 AM, Oscar Gomez Fuente <oscargomezf@gmail.com>
wrote:

> Hi,
>
> Could you send us the content of the following files: cmdline.txt file and
> /etc/inittab?
>
> Best regards.
>
> Oscar Gomez Fuente.
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160809/e783020e/attachment.html>
