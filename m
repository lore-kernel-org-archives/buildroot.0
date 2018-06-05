From: Florian La Roche <F.LaRoche@pilz.de>
Date: Tue, 5 Jun 2018 14:36:11 +0200
Subject: [Buildroot] [PATCH 1/1] Use one call to mkdir to create needed
 directories.
Message-ID: <20180605123611.21759-1-F.LaRoche@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reduce this to only call mkdir once to create the needed directories.


Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
---
 package/busybox/inittab | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index ef58c32f0d..7cd203de0b 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -16,8 +16,7 @@
 # Startup the system
 ::sysinit:/bin/mount -t proc proc /proc
 ::sysinit:/bin/mount -o remount,rw /
-::sysinit:/bin/mkdir -p /dev/pts
-::sysinit:/bin/mkdir -p /dev/shm
+::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
 null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
 null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
-- 
2.17.0

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
