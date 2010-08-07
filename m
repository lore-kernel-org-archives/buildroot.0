From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Aug 2010 18:55:16 +0200
Subject: [Buildroot] can't create /dev/ttys0 on cirrus ARM EP93XX
In-Reply-To: <AANLkTikvxE-my1WWLsNAYZnXRY6RiP-NtyxpgsNoCyN6@mail.gmail.com>
References: <AANLkTikvxE-my1WWLsNAYZnXRY6RiP-NtyxpgsNoCyN6@mail.gmail.com>
Message-ID: <20100807185516.21da8fc0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anthony,

On Sat, 7 Aug 2010 17:10:42 +0100
anthony henderson <development@fair-games.com> wrote:

> So I've ran buildroot for the ARM 920T.  All seems fine.  As the board has
> no keyboard ect development is done via serial port.  This is set in the old
> rootfs from etc/initab via
> ttyAM0::askfirst:-/bin/sh

Correct.

> I tried to start the new rootfs, but it appears to want to start from video
> command prompt.  So I copied the inittab from the old working system to the
> new rootfs, this gave an error finding ttyAM0.

Just modify Buildroot /etc/inittab instead.

> On searching the new rootfs I can see dev doesn't have this node.

Yes, it must be created. So, add the following line to
target/generic/device_table.txt:

/dev/ttyAM     c       666     0       0       204     16      0	1       4

It will make that /dev/ttyAM0, /dev/ttyAM1, /dev/ttyAM2 and /dev/ttyAM3
are created when building the root filesystem.

If you want to automate the adaptation of the /etc/inittab, just add an
entry in target/generic/Config.in.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
