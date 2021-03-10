From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Mar 2021 19:46:16 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-6eaJ0A4lbl@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #9 from ingineru_de_sistem at yahoo.com ---
(In reply to Peter Seiderer from comment #7)

About the grub issue:
For an older project of mine (reviving an old AMD Sempron laptop where the
original hdd had unrecoverable bad sectors), I tried Lubuntu 18.04 LTS with an
IDE44pin-to-SDCard convertor with a fairly new micro-SD card.
All went fine except for the part when booting it with grub would erase the
partition table at every boot from the hdd (well, sd-card+adapter).
After tons of Googling (can't remember the exact search terms) found that one
guy had replaced grub with lilo (which fortunately still comes as a Lubuntu
package at least in 18.04) and it worked. So I did the same (full install, add
the lilo package, purge grub, remove all grubby remnants, configure and run
lilo) and it worked fine.


For syslinux - if one wraps the linker in a shell file that adds
--allow-multiple-definition, all works fine. And it's even simpler than LILO
but it needs a FAT partition (no biggie), tested that one as well.

For the revival project at hand (ancient 32-bit 5*86 with an asterisk zap card)
I reused the ancient LILO which can load new kernels as well. 
Still a lot to do (Asterisk+zaptel doesn't compile directly either from
buildroot on 586, GCC doesn't come at all with buildroot and GCC's
documentation is not very friendly as to what sources one needs to download to
do the whole bootstraping stuff) and since it's a pet low-priority project, it
will take a long while. If anything pops up in the mean time, I will let you
know.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
