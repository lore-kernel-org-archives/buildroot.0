From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  8 Nov 2014 11:31:51 +0000 (UTC)
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <20141108113151.76B85A3325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

--- Comment #3 from Lucas Verney <spam+busybox@phyks.me> 2014-11-08 11:31:50 UTC ---
(In reply to comment #2)
> (In reply to comment #1)
> 
> > In this case, I got the following error instead of the previous one :
> > 2.331848] Waiting for root device /dev/mmcblk0p2...
> > 2.363922] mmcblk0: mmc0:59b4 SDC   7.34 GiB
> > 2.372253]  mmcblk0: p1 p201.
> > 2.455871] VFS: Cannot open root device "mmcblk0p2" or unknown-block(179,2):
> > error -19
> > 2.464447] Please append a correct "root=" boot option; here are the available
> > partitions:
> > 2.473388] b300         7697408 mmcblk0  driver: mmcblkiales
> > 2.477478]   b301           72261 mmcblk0p1 00000000-01
> > 2.477478]   b302         7622842 mmcblk0p2 00000000-02
> > 2.490356] Kernel panic - not syncing: VFS: Unable to mount root fs on
> > unknown-block(179,2)
> 
> Did you had the "rootwait" parameter passed on the kernel command line?

Not sure about it. I finally got a working setup using Ubuntu 12.04 and the TI
OMAP kernel. Though it's quite old stuff, it's the only fully working setup I
had so far.

Using buildroot, I just used the defconfig file associated with pandaboard,
which was expecting to produce a working (although minimalistic, so potentially
without Bluetooth / wifi and that kind of stuff) image for the Pandaboard.
Clearly, the easy way is to use this image with an ext3 partition. But using
ext2 might requires some tweaking and this image is no longer working out of
the bo, that's what I wanted to report.

I don't have it right now to find the exact kernel parameteres which are
passed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
