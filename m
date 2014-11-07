From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Nov 2014 07:27:14 +0000 (UTC)
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <20141107072714.3A817ACE1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-07 07:27:13 UTC ---
(In reply to comment #1)

> In this case, I got the following error instead of the previous one :
> 2.331848] Waiting for root device /dev/mmcblk0p2...
> 2.363922] mmcblk0: mmc0:59b4 SDC   7.34 GiB
> 2.372253]  mmcblk0: p1 p201.
> 2.455871] VFS: Cannot open root device "mmcblk0p2" or unknown-block(179,2):
> error -19
> 2.464447] Please append a correct "root=" boot option; here are the available
> partitions:
> 2.473388] b300         7697408 mmcblk0  driver: mmcblkiales
> 2.477478]   b301           72261 mmcblk0p1 00000000-01
> 2.477478]   b302         7622842 mmcblk0p2 00000000-02
> 2.490356] Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(179,2)

Did you had the "rootwait" parameter passed on the kernel command line?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
