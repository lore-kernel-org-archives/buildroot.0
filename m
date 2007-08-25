From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 25 Aug 2007 04:20:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070825112032.35188A685A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-25 04:20:31 -0700 (Sat, 25 Aug 2007)
New Revision: 19693

Log:
- adjust config


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2007-08-25 11:16:18 UTC (rev 19692)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2007-08-25 11:20:31 UTC (rev 19693)
@@ -43,7 +43,7 @@
 # CONFIG_UTS_NS is not set
 # CONFIG_AUDIT is not set
 # CONFIG_IKCONFIG is not set
-# CONFIG_SYSFS_DEPRECATED is not set
+CONFIG_SYSFS_DEPRECATED=y
 # CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE=""
@@ -52,9 +52,9 @@
 CONFIG_EMBEDDED=y
 CONFIG_UID16=y
 CONFIG_SYSCTL_SYSCALL=y
-CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS is not set
 # CONFIG_KALLSYMS_EXTRA_PASS is not set
-# CONFIG_HOTPLUG is not set
+CONFIG_HOTPLUG=y
 CONFIG_PRINTK=y
 CONFIG_BUG=y
 # CONFIG_ELF_CORE is not set
@@ -322,10 +322,12 @@
 #
 # PCCARD (PCMCIA/CardBus) support
 #
+# CONFIG_PCCARD is not set
 
 #
 # PCI Hotplug Support
 #
+# CONFIG_HOTPLUG_PCI is not set
 
 #
 # Executable file formats
@@ -780,6 +782,8 @@
 CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_BLK_DEV_RAM_SIZE=16384
 CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
+CONFIG_LZMA_INITRD=y
+CONFIG_LZMA_INITRD_KMALLOC_ONLY=y
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
 
@@ -1323,7 +1327,7 @@
 CONFIG_SENSORS_FSCPOS=m
 CONFIG_SENSORS_GL518SM=m
 CONFIG_SENSORS_GL520SM=m
-# CONFIG_SENSORS_IPMI is not set
+CONFIG_SENSORS_IPMI=m
 CONFIG_SENSORS_IT87=m
 CONFIG_SENSORS_LM63=m
 CONFIG_SENSORS_LM75=m
@@ -1615,6 +1619,7 @@
 CONFIG_EDAC_MM_EDAC=m
 CONFIG_EDAC_AMD76X=m
 CONFIG_EDAC_E7XXX=m
+CONFIG_EDAC_E752X=m
 # CONFIG_EDAC_I82875P is not set
 CONFIG_EDAC_I82860=m
 CONFIG_EDAC_R82600=m
@@ -1765,6 +1770,7 @@
 CONFIG_JFFS2_RTIME=y
 # CONFIG_JFFS2_RUBIN is not set
 CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_HPFS_FS is not set
 # CONFIG_QNX4FS_FS is not set
@@ -1853,7 +1859,7 @@
 # Distributed Lock Manager
 #
 # CONFIG_DLM is not set
-
+# CONFIG_AUFS is not set
 #
 # Instrumentation Support
 #
