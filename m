From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Jun 2009 14:42:15 +0200
Subject: [Buildroot] [git commit] target/generic: add /dev/sd{a, b}*,
	/dev/ub{a, b}* device nodes
Message-ID: <20090622132901.1317B777A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=691cf5eb424caca0626e9d8c163adc886f2c5d93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


E.G. for usb disks.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/device_table.txt |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index a2bfff9..c054000 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -125,10 +125,10 @@
 #/dev/hdh	b	640	0	0	34	65	1	1	15
 
 # SCSI Devices
-#/dev/sda	b	640	0	0	8	0	0	0	-
-#/dev/sda	b	640	0	0	8	1	1	1	15
-#/dev/sdb	b	640	0	0	8	16	0	0	-
-#/dev/sdb	b	640	0	0	8	17	1	1	15
+/dev/sda	b	640	0	0	8	0	0	0	-
+/dev/sda	b	640	0	0	8	1	1	1	15
+/dev/sdb	b	640	0	0	8	16	0	0	-
+/dev/sdb	b	640	0	0	8	17	1	1	15
 #/dev/sdc	b	640	0	0	8	32	0	0	-
 #/dev/sdc	b	640	0	0	8	33	1	1	15
 #/dev/sdd	b	640	0	0	8	48	0	0	-
@@ -149,6 +149,12 @@
 #/dev/st	c	640	0	0	9	64	1	1	4
 #/dev/st	c	640	0	0	9	96	1	1	4
 
+# USB block devices (ub driver)
+/dev/uba	b	640	0	0	180	0	0	0	-
+/dev/uba	b	640	0	0	180	1	1	1	6
+/dev/ubb	b	640	0	0	180	8	0	0	-
+/dev/ubb	b	640	0	0	180	65	1	1	6
+
 # Floppy disk devices
 #/dev/fd	b	640	0	0	2	0	0	1	2
 #/dev/fd0d360	b	640	0	0	2	4	0	0	-
-- 
1.6.0.6
