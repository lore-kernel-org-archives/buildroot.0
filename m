From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 16:38:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <20141109163816.0DA98AD815@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

Lucas Verney <spam+busybox@phyks.me> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |

--- Comment #5 from Lucas Verney <spam+busybox@phyks.me> 2014-11-09 16:38:15 UTC ---
(In reply to comment #4)
> Unfortunately, due to lack of details, it's hard to know whether this bug is
> really a Buildroot bug, or a configuration error in the kernel arguments /
> usage of the Buildroot image. Since there is really not much difference between
> the process to generate an ext2 and ext3 image in Buildroot, I'm leaning
> towards some other configuration issue done by the bug reporter when using the
> Buildroot image.
> 
> I'll therefore mark this bug as "worksforme", since we're using the ext2
> filesystem image successfully on other systems. Feel free to reopen with more
> details (kernel version, kernel configuration, kernel argument, full kernel
> log) if you don't agree with my conclusion.

Hmmm, I think I may have missed something. Here are the *exact* steps I used to
build the faulty image :

* Clone buildroot repo
* In this repo, `make pandaboard_defconfig`
* Checked the settings, did *not* change anything.
* `make`
* Create the partitions on the SD, cf http://elinux.org/Panda_How_to_buildroot
* Copy MLO, u-boot.bin, uImage and .dtb file to the first partition on the SD
card.
* `dd` the .ext2 file onto the second partition of the device.
* Put the SD card in the Pandaboard, power it on and see what is going on over
serial.

With *nothing* else than these steps, it does *not* boot, due to the first
error reported.

After having came accross this error, I played a bit with the settings until I
could figure out something working.



I finally moved to the minimal Ubuntu 12.04 image with TI kernel, which allows
me to use wifi / ethernet / bluetooth / ducati etc out of the box, so I did not
do further tests. I can do some extra tests this week, if such tests are
necessary, but I did not tweak the defconfig before building it.

I may have missed something, but as far as I understood, this was supposed to
work and the defconfig was supposed to provide a basic setup running out of the
box on the pandaboard (although it may not have all the stuff to use all the
devices on the Pandaboard).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
