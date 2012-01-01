From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun,  1 Jan 2012 12:26:36 -0500
Subject: [Buildroot] [PATCH] Add ttyO devices to the mdev configuration and
	the static device table.
Message-ID: <1325438796-3287-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These are needed to support the serial ports on OMAP/AM335x devices
such as the BeagleBone.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/busybox/mdev.conf           |    1 +
 target/generic/device_table_dev.txt |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/busybox/mdev.conf b/package/busybox/mdev.conf
index 247c0ed..7fb71bc 100644
--- a/package/busybox/mdev.conf
+++ b/package/busybox/mdev.conf
@@ -20,6 +20,7 @@ tty		root:tty 666
 tty[0-9]*	root:tty 660
 vcsa*[0-9]*	root:tty 660
 ttyS[0-9]*	root:root 660
+ttyO[0-9]*	root:root 660
 
 # alsa sound devices
 pcm.*		root:audio 660 =snd/
diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
index 71cd083..b02963e 100644
--- a/target/generic/device_table_dev.txt
+++ b/target/generic/device_table_dev.txt
@@ -24,6 +24,7 @@
 /dev/ptmx	c	666	0	0	5	2	-	-	-
 /dev/ttyP	c	666	0	0	57	0	0	1	4
 /dev/ttyS	c	666	0	0	4	64	0	1	4
+/dev/ttyO	c	666	0	0	253	0	0	1	4
 /dev/fb		c	640	0	5	29	0	0	1	4
 #/dev/ttySA	c	666	0	0	204	5	0	1	3
 /dev/psaux	c	666	0	0	10	1	0	0	-
-- 
1.7.0.4
