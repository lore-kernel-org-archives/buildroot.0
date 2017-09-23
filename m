From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 20:29:37 +0200
Subject: [Buildroot] [git commit] boot/grub: remove
Message-ID: <20170923184645.9613E80FE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=144dc9ca8007cb4390bd9ba3e8b018d7fd92be2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub is no longer maintained: it is stuck at version 0.97 with huge
patches that have no opportunity to be applied upstream, as upstream
has even renamed it grub-legacy.

Besides, it no longer builds correctly with recent binutils versions,
and even the huge patches we could grab from Debian do not help the
slightest.

Since upstream really considers it dead, and there are at least two
alternatives (grub2 and syslinux), just remove grub.

Add a legacy entry.

Remove the test cases as well.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml                                |     2 -
 Config.in.legacy                              |     9 +
 boot/Config.in                                |     1 -
 boot/grub/Config.in                           |   200 -
 boot/grub/grub.100-autoreconf.patch           |  1407 -
 boot/grub/grub.200-fix_mbr_handling.patch     |    13 -
 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |    36 -
 boot/grub/grub.400-nic_update2.patch          | 47064 ------------------------
 boot/grub/grub.hash                           |     3 -
 boot/grub/grub.mk                             |   109 -
 boot/grub/menu.lst                            |    16 -
 boot/grub/splash.xpm.gz                       |   Bin 16466 -> 0 bytes
 support/testing/conf/grub-menu.lst            |    20 -
 support/testing/tests/fs/test_iso9660.py      |    37 -
 14 files changed, 9 insertions(+), 48908 deletions(-)

Patch is too large, so refusing to show it
