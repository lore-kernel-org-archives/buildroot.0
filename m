From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 15 Mar 2013 12:34:02 -0500
Subject: [Buildroot] target /etc/inittab
Message-ID: <ADE657CA350FB648AAC2C43247A983F0020980106B97@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I recently pulled the latest buildroot and ran into an issue I can't
figure out.

I'm using buildroot to create a rootfs for an ep93xx board. This
board has 3 serial ports ttyAM0-3. When the rootfs is created I
get this in the /etc/inittab:

# Set up a couple of getty's
tty1::respawn:/sbin/getty 38400 tty1
tty2::respawn:/sbin/getty 38400 tty2

# Put a getty on the serial port
ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100 # GENERIC_SERIAL
#ttyAM1::respawn:/sbin/getty -L ttyAM1 57600 vt100 # GENERIC_SERIAL
#ttyAM2::respawn:/sbin/getty -L ttyAM2 57600 vt100 # GENERIC_SERIAL

The problem is tty1 and tty2. They don't exist on my board and
give me issues when the board boots. I can't figure out why they
are being added to /etc/inittab and how to prevent theses getty's
from showing up.

Also how do I get a getty on ttyAM1 and ttyAM2?

If I edit output/target/etc/inittab and then do a make to create the
rootfs image it just gets changed back.

Any pointers?

Thanks,
Hartley
