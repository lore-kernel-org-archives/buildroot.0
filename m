From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 05 May 2019 02:21:52 +0000
Subject: [Buildroot] [Bug 11811] lsblk (util-linux) should depend on libudev
 if available
In-Reply-To: <bug-11811-163@https.bugs.busybox.net/>
References: <bug-11811-163@https.bugs.busybox.net/>
Message-ID: <bug-11811-163-YZLC9XwE91@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11811

--- Comment #8 from Pete Morici <pmorici@dev295.com> ---
I've attached my config it is a modified version of the included pc/efi def
config.

Looking at your output though I think you have reproduced the problem.  The
serial column for your sda device is blank.  You can also get the serial by
running the utility "/lib/udev/ata_id /dev/sda"  If that returns something
where lsblk returns a blank then that is the problem.  I've not tested this
with MMC or SD devices so it might be limited to SATA and USB drives.

Another way to see the difference is to do a full build followed by a "make
util-linux-dirclean" and then "make" again that will cause lsblk to link
against libudev and report the serial number correctly.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
