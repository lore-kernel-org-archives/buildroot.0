From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Oct 2013 18:28:27 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] Bootable ISO image creation seems to have
 stopped working since 2012.08
In-Reply-To: <bug-6092-163@https.bugs.busybox.net/>
References: <bug-6092-163@https.bugs.busybox.net/>
Message-ID: <20131007182827.863629AD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

--- Comment #9 from tentothe8th at yahoo.com 2013-10-07 18:28:26 UTC ---
Based on a Gentoo patch, I found that adding the flag "-fno-reorder-functions"
to GRUB_CFLAGS in boot/grub/grub.mk makes the ISO bootable again.  The Gentoo
patch only adds it to STAGE2_CFLAGS, but changing grub.mk is easier than making
a new patch since it doesn't interfere with the other patches being applied.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
