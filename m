From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 12:17:27 +0100
Subject: [Buildroot] [git commit] fs/iso9660: put the Buildroot boot entry
	first in Grub menu.lst
Message-ID: <20131229111948.52B879C226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49c231cab4db6c34ebcd546cdbd92bcd31db8c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ISO9660-specific Grub menu.lst contains two entries: one entry to
chainload the bootloader available in the first hard drive, and
another entry to boot the Buildroot system.

However, it defaults to booting the first entry, i.e chainloading
what's on the first hard drive. For a Buildroot generated system, this
is quite odd: we're not even booting the system built by Buildroot.

So, switch the two entries, and put the Buildroot boot entry first.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/iso9660/menu.lst |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
index d78caeb..ed7836a 100644
--- a/fs/iso9660/menu.lst
+++ b/fs/iso9660/menu.lst
@@ -2,10 +2,10 @@ default		0
 timeout		10
 color cyan/blue white/blue
 
+title		Buildroot ISO9660 image
+kernel		/kernel
+initrd		/initrd
+
 title		Hard Drive (first partition)
 rootnoverify	(hd0)
 chainloader	+1
-
-title		BuildRoot ISO9660 image
-kernel		/kernel
-initrd		/initrd
