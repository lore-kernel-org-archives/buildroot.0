From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 7 Nov 2012 21:53:15 -0500
Subject: [Buildroot] proc mount needed in both inittab and fstab?
Message-ID: <CANxTyt7FzVFqwS8Rx1-W=sgoatYE9NZkCeedUf6mWDkd4Q9zwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, quick question: I noticed that the skeleton/etc/inittab has:

# Startup the system
null::sysinit:/bin/mount -t proc proc /proc
null::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
null::sysinit:/bin/mkdir -p /dev/pts
null::sysinit:/bin/mkdir -p /dev/shm
null::sysinit:/bin/mount -a
...

and that fstab has:

# <file system> <mount pt>     <type> <options>         <dump> <pass>
/dev/root       /              ext2 rw,noauto         0      1
proc /proc        proc     defaults   0  0
...

I was wondering - is the /proc mount in inittab needed, since there is a
corresponding line in fstab?

Thanks in advance,
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121107/ed5327d7/attachment.html>
