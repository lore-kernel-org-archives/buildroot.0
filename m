From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:53 +0100
Subject: [Buildroot] [PATCH 11/14] target: Added ttyAS[0-3] devices
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-12-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Some set top boxes use /dev/ttyAS[0-3] devices to output traces.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 target/generic/Config.in        |   16 ++++++++++++++++
 target/generic/device_table.txt |    9 +++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 54ff1d6..c995341 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -102,6 +102,18 @@ config BR2_TARGET_GENERIC_GETTY_TTYCPM2
 config BR2_TARGET_GENERIC_GETTY_TTYCPM3
 	bool "ttyCPM3"
 	depends on BR2_powerpc
+config BR2_TARGET_GENERIC_GETTY_TTYAS0
+	bool "ttyAS0"
+	depends on BR2_sh
+config BR2_TARGET_GENERIC_GETTY_TTYAS1
+	bool "ttyAS1"
+	depends on BR2_sh
+config BR2_TARGET_GENERIC_GETTY_TTYAS2
+	bool "ttyAS2"
+	depends on BR2_sh
+config BR2_TARGET_GENERIC_GETTY_TTYAS3
+	bool "ttyAS3"
+	depends on BR2_sh
 endchoice
 
 config BR2_TARGET_GENERIC_GETTY_PORT
@@ -134,6 +146,10 @@ config BR2_TARGET_GENERIC_GETTY_PORT
 	default "ttyCPM1"	if BR2_TARGET_GENERIC_GETTY_TTYCPM1
 	default "ttyCPM2"	if BR2_TARGET_GENERIC_GETTY_TTYCPM2
 	default "ttyCPM3"	if BR2_TARGET_GENERIC_GETTY_TTYCPM3
+	default "ttyAS0"	if BR2_TARGET_GENERIC_GETTY_TTYAS0
+	default "ttyAS1"	if BR2_TARGET_GENERIC_GETTY_TTYAS1
+	default "ttyAS2"	if BR2_TARGET_GENERIC_GETTY_TTYAS2
+	default "ttyAS3"	if BR2_TARGET_GENERIC_GETTY_TTYAS3
 
 choice
 	prompt "Baudrate to use"
diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index c054000..bdaec77 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -1,5 +1,5 @@
 # When building a target filesystem, it is desirable to not have to
-# become root and then run 'mknod' a thousand times.  Using a device 
+# become root and then run 'mknod' a thousand times.  Using a device
 # table you can create device nodes and directories "on the fly".
 #
 # This is a sample device table file for use with genext2fs.  You can
@@ -14,17 +14,17 @@
 # I could just use the following two table entries:
 #   /dev/hda    b       640     0       0       3       0       0       0       -
 #   /dev/hda    b       640     0       0       3       1       1       1       15
-# 
+#
 # Device table entries take the form of:
 # <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
-# where name is the file name,  type can be one of: 
+# where name is the file name,  type can be one of:
 #       f       A regular file
 #       d       Directory
 #       c       Character special device file
 #       b       Block special device file
 #       p       Fifo (named pipe)
 # uid is the user id for the target file, gid is the group id for the
-# target file.  The rest of the entries (major, minor, etc) apply only 
+# target file.  The rest of the entries (major, minor, etc) apply only
 # to device special files.
 
 # Have fun
@@ -78,6 +78,7 @@
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
 /dev/ttymxc	c	666	0	0	207	16	0	1	3
+/dev/ttyAS	c	666	0	0	204	40	0	1	4
 
 # Input stuff
 /dev/input		d	755	0	0	-	-	-	-	-
-- 
1.6.6
