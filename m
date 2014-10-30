From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Oct 2014 01:14:06 +0000 (UTC)
Subject: [Buildroot] [Bug 7580] Invalid filesystem in Pandaboard defconfig
In-Reply-To: <bug-7580-163@https.bugs.busybox.net/>
References: <bug-7580-163@https.bugs.busybox.net/>
Message-ID: <20141030011406.1A853B1D3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7580

--- Comment #1 from Lucas Verney <spam+busybox@phyks.me> 2014-10-30 01:14:05 UTC ---
Update : After discussing on IRC (with NRoach44), here are some tests I did :

* First, I tried modifying the conf in menuconfig so that the generated rootfs
was in ext3 instead of ext2. This worked out of the box nicely.

* Then, I used again the ext2 filesystem for the rootfs, and disabled any
filesystem support in linux-menuconfig except the first line, corresponding to
ext2.

In this case, I got the following error instead of the previous one :
2.331848] Waiting for root device /dev/mmcblk0p2...
2.363922] mmcblk0: mmc0:59b4 SDC   7.34 GiB
2.372253]  mmcblk0: p1 p201.
2.455871] VFS: Cannot open root device "mmcblk0p2" or unknown-block(179,2):
error -19
2.464447] Please append a correct "root=" boot option; here are the available
partitions:
2.473388] b300         7697408 mmcblk0  driver: mmcblkiales
2.477478]   b301           72261 mmcblk0p1 00000000-01
2.477478]   b302         7622842 mmcblk0p2 00000000-02
2.490356] Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(179,2)

I tried to mount mmcblk0p2 on my computer, and it mounted successfully using
the ext2 filesystem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
