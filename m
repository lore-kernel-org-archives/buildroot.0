From: anthony henderson <development@fair-games.com>
Date: Sat, 7 Aug 2010 17:10:42 +0100
Subject: [Buildroot] can't create /dev/ttys0 on cirrus ARM EP93XX
Message-ID: <AANLkTikvxE-my1WWLsNAYZnXRY6RiP-NtyxpgsNoCyN6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I've built a new rootfs for a cirrus logic EP93XX chip, the rootfs provided
is very old and no extras cross compiled software (directfb etc).

So I've ran buildroot for the ARM 920T.  All seems fine.  As the board has
no keyboard ect development is done via serial port.  This is set in the old
rootfs from etc/initab via
ttyAM0::askfirst:-/bin/sh

I tried to start the new rootfs, but it appears to want to start from video
command prompt.  So I copied the inittab from the old working system to the
new rootfs, this gave an error finding ttyAM0.
On searching the new rootfs I can see dev doesn't have this node.  I can see
ttyS0, so I thought this might be used?  I tried changing the command to
ttyS0::askfirst:-/bin/sh.  But all this shows on screen is

/bin/'sh: can't create /dev/ttyS0: No such device or address.


While my pc serial port just keeps repeating

 /bin/'sh: can't create /dev/ttyS0: No such device or address.
/bin/'sh: can't create /dev/ttyS0: No such device or address.
...

Can anyone advise.  I new to embedded Linux so am finding information hard
to come by.  Thanks in advance :)




-- 
Regards Tony
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100807/09b7c6af/attachment.html>
