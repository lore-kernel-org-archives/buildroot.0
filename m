From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Sep 2012 16:04:07 +0200
Subject: [Buildroot] [PATCH 2/4] New top-level directory: system
In-Reply-To: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346767209.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bf2cdf7779649494ec8e4436a75c6d22b79d2a7b.1346767209.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This directory groups the following elements:
 * the default root filesystem skeleton
 * the default device tables
 * the Config.in options for system configuration (UART port for
   getty, system hostname, etc.)
 * the make rules to apply the system configuration options

Even though the skeleton and device tables could have lived in fs/, it
would have been strange to have the UART, system hostname and other
related options into fs/. A new system/ directory makes more sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                          |    2 +-
 Makefile                                           |    1 +
 {target/generic => system}/Config.in               |    2 +-
 {target/generic => system}/device_table.txt        |    0
 {target/generic => system}/device_table_dev.txt    |    0
 {fs => system}/skeleton/bin/.empty                 |    0
 {fs => system}/skeleton/dev/log                    |    0
 {fs => system}/skeleton/dev/pts/.empty             |    0
 {fs => system}/skeleton/etc/TZ                     |    0
 {fs => system}/skeleton/etc/fstab                  |    0
 {fs => system}/skeleton/etc/group                  |    0
 {fs => system}/skeleton/etc/hostname               |    0
 {fs => system}/skeleton/etc/hosts                  |    0
 {fs => system}/skeleton/etc/init.d/S20urandom      |    0
 {fs => system}/skeleton/etc/init.d/S40network      |    0
 {fs => system}/skeleton/etc/init.d/rcK             |    0
 {fs => system}/skeleton/etc/init.d/rcS             |    0
 {fs => system}/skeleton/etc/inittab                |    0
 {fs => system}/skeleton/etc/inputrc                |    0
 {fs => system}/skeleton/etc/issue                  |    0
 {fs => system}/skeleton/etc/ld.so.conf.d/.empty    |    0
 {fs => system}/skeleton/etc/mtab                   |    0
 .../skeleton/etc/network/if-down.d/.empty          |    0
 .../skeleton/etc/network/if-post-down.d/.empty     |    0
 .../skeleton/etc/network/if-pre-up.d/.empty        |    0
 {fs => system}/skeleton/etc/network/if-up.d/.empty |    0
 {fs => system}/skeleton/etc/network/interfaces     |    0
 {fs => system}/skeleton/etc/passwd                 |    0
 {fs => system}/skeleton/etc/profile                |    0
 {fs => system}/skeleton/etc/protocols              |    0
 {fs => system}/skeleton/etc/random-seed            |  Bin 512 -> 512 bytes
 {fs => system}/skeleton/etc/resolv.conf            |    0
 {fs => system}/skeleton/etc/securetty              |    0
 {fs => system}/skeleton/etc/services               |    0
 {fs => system}/skeleton/etc/shadow                 |    0
 {fs => system}/skeleton/home/ftp/.empty            |    0
 {fs => system}/skeleton/lib/.empty                 |    0
 {fs => system}/skeleton/media/.empty               |    0
 {fs => system}/skeleton/mnt/.empty                 |    0
 {fs => system}/skeleton/opt/.empty                 |    0
 {fs => system}/skeleton/proc/.empty                |    0
 {fs => system}/skeleton/root/.bash_history         |    0
 {fs => system}/skeleton/root/.bash_logout          |    0
 {fs => system}/skeleton/root/.bash_profile         |    0
 {fs => system}/skeleton/root/.empty                |    0
 {fs => system}/skeleton/run                        |    0
 {fs => system}/skeleton/sbin/.empty                |    0
 {fs => system}/skeleton/sys/.empty                 |    0
 {fs => system}/skeleton/tmp/.empty                 |    0
 {fs => system}/skeleton/usr/bin/.empty             |    0
 {fs => system}/skeleton/usr/lib/.empty             |    0
 {fs => system}/skeleton/usr/sbin/.empty            |    0
 {fs => system}/skeleton/var/cache                  |    0
 {fs => system}/skeleton/var/lib/misc               |    0
 {fs => system}/skeleton/var/lib/pcmcia             |    0
 {fs => system}/skeleton/var/lock                   |    0
 {fs => system}/skeleton/var/log                    |    0
 {fs => system}/skeleton/var/pcmcia                 |    0
 {fs => system}/skeleton/var/run                    |    0
 {fs => system}/skeleton/var/spool                  |    0
 {fs => system}/skeleton/var/tmp                    |    0
 target/generic/Makefile.in => system/system.mk     |    0
 62 files changed, 3 insertions(+), 2 deletions(-)
 rename {target/generic => system}/Config.in (99%)
 rename {target/generic => system}/device_table.txt (100%)
 rename {target/generic => system}/device_table_dev.txt (100%)
 rename {fs => system}/skeleton/bin/.empty (100%)
 rename {fs => system}/skeleton/dev/log (100%)
 rename {fs => system}/skeleton/dev/pts/.empty (100%)
 rename {fs => system}/skeleton/etc/TZ (100%)
 rename {fs => system}/skeleton/etc/fstab (100%)
 rename {fs => system}/skeleton/etc/group (100%)
 rename {fs => system}/skeleton/etc/hostname (100%)
 rename {fs => system}/skeleton/etc/hosts (100%)
 rename {fs => system}/skeleton/etc/init.d/S20urandom (100%)
 rename {fs => system}/skeleton/etc/init.d/S40network (100%)
 rename {fs => system}/skeleton/etc/init.d/rcK (100%)
 rename {fs => system}/skeleton/etc/init.d/rcS (100%)
 rename {fs => system}/skeleton/etc/inittab (100%)
 rename {fs => system}/skeleton/etc/inputrc (100%)
 rename {fs => system}/skeleton/etc/issue (100%)
 rename {fs => system}/skeleton/etc/ld.so.conf.d/.empty (100%)
 rename {fs => system}/skeleton/etc/mtab (100%)
 rename {fs => system}/skeleton/etc/network/if-down.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-post-down.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-pre-up.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/if-up.d/.empty (100%)
 rename {fs => system}/skeleton/etc/network/interfaces (100%)
 rename {fs => system}/skeleton/etc/passwd (100%)
 rename {fs => system}/skeleton/etc/profile (100%)
 rename {fs => system}/skeleton/etc/protocols (100%)
 rename {fs => system}/skeleton/etc/random-seed (100%)
 rename {fs => system}/skeleton/etc/resolv.conf (100%)
 rename {fs => system}/skeleton/etc/securetty (100%)
 rename {fs => system}/skeleton/etc/services (100%)
 rename {fs => system}/skeleton/etc/shadow (100%)
 rename {fs => system}/skeleton/home/ftp/.empty (100%)
 rename {fs => system}/skeleton/lib/.empty (100%)
 rename {fs => system}/skeleton/media/.empty (100%)
 rename {fs => system}/skeleton/mnt/.empty (100%)
 rename {fs => system}/skeleton/opt/.empty (100%)
 rename {fs => system}/skeleton/proc/.empty (100%)
 rename {fs => system}/skeleton/root/.bash_history (100%)
 rename {fs => system}/skeleton/root/.bash_logout (100%)
 rename {fs => system}/skeleton/root/.bash_profile (100%)
 rename {fs => system}/skeleton/root/.empty (100%)
 rename {fs => system}/skeleton/run (100%)
 rename {fs => system}/skeleton/sbin/.empty (100%)
 rename {fs => system}/skeleton/sys/.empty (100%)
 rename {fs => system}/skeleton/tmp/.empty (100%)
 rename {fs => system}/skeleton/usr/bin/.empty (100%)
 rename {fs => system}/skeleton/usr/lib/.empty (100%)
 rename {fs => system}/skeleton/usr/sbin/.empty (100%)
 rename {fs => system}/skeleton/var/cache (100%)
 rename {fs => system}/skeleton/var/lib/misc (100%)
 rename {fs => system}/skeleton/var/lib/pcmcia (100%)
 rename {fs => system}/skeleton/var/lock (100%)
 rename {fs => system}/skeleton/var/log (100%)
 rename {fs => system}/skeleton/var/pcmcia (100%)
 rename {fs => system}/skeleton/var/run (100%)
 rename {fs => system}/skeleton/var/spool (100%)
 rename {fs => system}/skeleton/var/tmp (100%)
 rename target/generic/Makefile.in => system/system.mk (100%)

diff --git a/Config.in b/Config.in
index dab7787..cce4619 100644
--- a/Config.in
+++ b/Config.in
@@ -419,7 +419,7 @@ endmenu
 
 source "toolchain/Config.in"
 
-source "target/generic/Config.in"
+source "system/Config.in"
 
 source "package/Config.in"
 
diff --git a/Makefile b/Makefile
index 9e1bcfd..791fd72 100644
--- a/Makefile
+++ b/Makefile
@@ -329,6 +329,7 @@ TARGETS+=target-generatelocales
 endif
 endif
 
+include system/system.mk
 include fs/common.mk
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
diff --git a/target/generic/Config.in b/system/Config.in
similarity index 99%
rename from target/generic/Config.in
rename to system/Config.in
index b8472f4..c30c6f7 100644
--- a/target/generic/Config.in
+++ b/system/Config.in
@@ -111,7 +111,7 @@ endchoice
 if BR2_ROOTFS_SKELETON_CUSTOM
 config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	string "custom target skeleton path"
-	default "fs/skeleton"
+	default "system/skeleton"
 	help
 	  Path custom target skeleton.
 endif
diff --git a/target/generic/device_table.txt b/system/device_table.txt
similarity index 100%
rename from target/generic/device_table.txt
rename to system/device_table.txt
diff --git a/target/generic/device_table_dev.txt b/system/device_table_dev.txt
similarity index 100%
rename from target/generic/device_table_dev.txt
rename to system/device_table_dev.txt
diff --git a/fs/skeleton/bin/.empty b/system/skeleton/bin/.empty
similarity index 100%
rename from fs/skeleton/bin/.empty
rename to system/skeleton/bin/.empty
diff --git a/fs/skeleton/dev/log b/system/skeleton/dev/log
similarity index 100%
rename from fs/skeleton/dev/log
rename to system/skeleton/dev/log
diff --git a/fs/skeleton/dev/pts/.empty b/system/skeleton/dev/pts/.empty
similarity index 100%
rename from fs/skeleton/dev/pts/.empty
rename to system/skeleton/dev/pts/.empty
diff --git a/fs/skeleton/etc/TZ b/system/skeleton/etc/TZ
similarity index 100%
rename from fs/skeleton/etc/TZ
rename to system/skeleton/etc/TZ
diff --git a/fs/skeleton/etc/fstab b/system/skeleton/etc/fstab
similarity index 100%
rename from fs/skeleton/etc/fstab
rename to system/skeleton/etc/fstab
diff --git a/fs/skeleton/etc/group b/system/skeleton/etc/group
similarity index 100%
rename from fs/skeleton/etc/group
rename to system/skeleton/etc/group
diff --git a/fs/skeleton/etc/hostname b/system/skeleton/etc/hostname
similarity index 100%
rename from fs/skeleton/etc/hostname
rename to system/skeleton/etc/hostname
diff --git a/fs/skeleton/etc/hosts b/system/skeleton/etc/hosts
similarity index 100%
rename from fs/skeleton/etc/hosts
rename to system/skeleton/etc/hosts
diff --git a/fs/skeleton/etc/init.d/S20urandom b/system/skeleton/etc/init.d/S20urandom
similarity index 100%
rename from fs/skeleton/etc/init.d/S20urandom
rename to system/skeleton/etc/init.d/S20urandom
diff --git a/fs/skeleton/etc/init.d/S40network b/system/skeleton/etc/init.d/S40network
similarity index 100%
rename from fs/skeleton/etc/init.d/S40network
rename to system/skeleton/etc/init.d/S40network
diff --git a/fs/skeleton/etc/init.d/rcK b/system/skeleton/etc/init.d/rcK
similarity index 100%
rename from fs/skeleton/etc/init.d/rcK
rename to system/skeleton/etc/init.d/rcK
diff --git a/fs/skeleton/etc/init.d/rcS b/system/skeleton/etc/init.d/rcS
similarity index 100%
rename from fs/skeleton/etc/init.d/rcS
rename to system/skeleton/etc/init.d/rcS
diff --git a/fs/skeleton/etc/inittab b/system/skeleton/etc/inittab
similarity index 100%
rename from fs/skeleton/etc/inittab
rename to system/skeleton/etc/inittab
diff --git a/fs/skeleton/etc/inputrc b/system/skeleton/etc/inputrc
similarity index 100%
rename from fs/skeleton/etc/inputrc
rename to system/skeleton/etc/inputrc
diff --git a/fs/skeleton/etc/issue b/system/skeleton/etc/issue
similarity index 100%
rename from fs/skeleton/etc/issue
rename to system/skeleton/etc/issue
diff --git a/fs/skeleton/etc/ld.so.conf.d/.empty b/system/skeleton/etc/ld.so.conf.d/.empty
similarity index 100%
rename from fs/skeleton/etc/ld.so.conf.d/.empty
rename to system/skeleton/etc/ld.so.conf.d/.empty
diff --git a/fs/skeleton/etc/mtab b/system/skeleton/etc/mtab
similarity index 100%
rename from fs/skeleton/etc/mtab
rename to system/skeleton/etc/mtab
diff --git a/fs/skeleton/etc/network/if-down.d/.empty b/system/skeleton/etc/network/if-down.d/.empty
similarity index 100%
rename from fs/skeleton/etc/network/if-down.d/.empty
rename to system/skeleton/etc/network/if-down.d/.empty
diff --git a/fs/skeleton/etc/network/if-post-down.d/.empty b/system/skeleton/etc/network/if-post-down.d/.empty
similarity index 100%
rename from fs/skeleton/etc/network/if-post-down.d/.empty
rename to system/skeleton/etc/network/if-post-down.d/.empty
diff --git a/fs/skeleton/etc/network/if-pre-up.d/.empty b/system/skeleton/etc/network/if-pre-up.d/.empty
similarity index 100%
rename from fs/skeleton/etc/network/if-pre-up.d/.empty
rename to system/skeleton/etc/network/if-pre-up.d/.empty
diff --git a/fs/skeleton/etc/network/if-up.d/.empty b/system/skeleton/etc/network/if-up.d/.empty
similarity index 100%
rename from fs/skeleton/etc/network/if-up.d/.empty
rename to system/skeleton/etc/network/if-up.d/.empty
diff --git a/fs/skeleton/etc/network/interfaces b/system/skeleton/etc/network/interfaces
similarity index 100%
rename from fs/skeleton/etc/network/interfaces
rename to system/skeleton/etc/network/interfaces
diff --git a/fs/skeleton/etc/passwd b/system/skeleton/etc/passwd
similarity index 100%
rename from fs/skeleton/etc/passwd
rename to system/skeleton/etc/passwd
diff --git a/fs/skeleton/etc/profile b/system/skeleton/etc/profile
similarity index 100%
rename from fs/skeleton/etc/profile
rename to system/skeleton/etc/profile
diff --git a/fs/skeleton/etc/protocols b/system/skeleton/etc/protocols
similarity index 100%
rename from fs/skeleton/etc/protocols
rename to system/skeleton/etc/protocols
diff --git a/fs/skeleton/etc/random-seed b/system/skeleton/etc/random-seed
similarity index 100%
rename from fs/skeleton/etc/random-seed
rename to system/skeleton/etc/random-seed
diff --git a/fs/skeleton/etc/resolv.conf b/system/skeleton/etc/resolv.conf
similarity index 100%
rename from fs/skeleton/etc/resolv.conf
rename to system/skeleton/etc/resolv.conf
diff --git a/fs/skeleton/etc/securetty b/system/skeleton/etc/securetty
similarity index 100%
rename from fs/skeleton/etc/securetty
rename to system/skeleton/etc/securetty
diff --git a/fs/skeleton/etc/services b/system/skeleton/etc/services
similarity index 100%
rename from fs/skeleton/etc/services
rename to system/skeleton/etc/services
diff --git a/fs/skeleton/etc/shadow b/system/skeleton/etc/shadow
similarity index 100%
rename from fs/skeleton/etc/shadow
rename to system/skeleton/etc/shadow
diff --git a/fs/skeleton/home/ftp/.empty b/system/skeleton/home/ftp/.empty
similarity index 100%
rename from fs/skeleton/home/ftp/.empty
rename to system/skeleton/home/ftp/.empty
diff --git a/fs/skeleton/lib/.empty b/system/skeleton/lib/.empty
similarity index 100%
rename from fs/skeleton/lib/.empty
rename to system/skeleton/lib/.empty
diff --git a/fs/skeleton/media/.empty b/system/skeleton/media/.empty
similarity index 100%
rename from fs/skeleton/media/.empty
rename to system/skeleton/media/.empty
diff --git a/fs/skeleton/mnt/.empty b/system/skeleton/mnt/.empty
similarity index 100%
rename from fs/skeleton/mnt/.empty
rename to system/skeleton/mnt/.empty
diff --git a/fs/skeleton/opt/.empty b/system/skeleton/opt/.empty
similarity index 100%
rename from fs/skeleton/opt/.empty
rename to system/skeleton/opt/.empty
diff --git a/fs/skeleton/proc/.empty b/system/skeleton/proc/.empty
similarity index 100%
rename from fs/skeleton/proc/.empty
rename to system/skeleton/proc/.empty
diff --git a/fs/skeleton/root/.bash_history b/system/skeleton/root/.bash_history
similarity index 100%
rename from fs/skeleton/root/.bash_history
rename to system/skeleton/root/.bash_history
diff --git a/fs/skeleton/root/.bash_logout b/system/skeleton/root/.bash_logout
similarity index 100%
rename from fs/skeleton/root/.bash_logout
rename to system/skeleton/root/.bash_logout
diff --git a/fs/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
similarity index 100%
rename from fs/skeleton/root/.bash_profile
rename to system/skeleton/root/.bash_profile
diff --git a/fs/skeleton/root/.empty b/system/skeleton/root/.empty
similarity index 100%
rename from fs/skeleton/root/.empty
rename to system/skeleton/root/.empty
diff --git a/fs/skeleton/run b/system/skeleton/run
similarity index 100%
rename from fs/skeleton/run
rename to system/skeleton/run
diff --git a/fs/skeleton/sbin/.empty b/system/skeleton/sbin/.empty
similarity index 100%
rename from fs/skeleton/sbin/.empty
rename to system/skeleton/sbin/.empty
diff --git a/fs/skeleton/sys/.empty b/system/skeleton/sys/.empty
similarity index 100%
rename from fs/skeleton/sys/.empty
rename to system/skeleton/sys/.empty
diff --git a/fs/skeleton/tmp/.empty b/system/skeleton/tmp/.empty
similarity index 100%
rename from fs/skeleton/tmp/.empty
rename to system/skeleton/tmp/.empty
diff --git a/fs/skeleton/usr/bin/.empty b/system/skeleton/usr/bin/.empty
similarity index 100%
rename from fs/skeleton/usr/bin/.empty
rename to system/skeleton/usr/bin/.empty
diff --git a/fs/skeleton/usr/lib/.empty b/system/skeleton/usr/lib/.empty
similarity index 100%
rename from fs/skeleton/usr/lib/.empty
rename to system/skeleton/usr/lib/.empty
diff --git a/fs/skeleton/usr/sbin/.empty b/system/skeleton/usr/sbin/.empty
similarity index 100%
rename from fs/skeleton/usr/sbin/.empty
rename to system/skeleton/usr/sbin/.empty
diff --git a/fs/skeleton/var/cache b/system/skeleton/var/cache
similarity index 100%
rename from fs/skeleton/var/cache
rename to system/skeleton/var/cache
diff --git a/fs/skeleton/var/lib/misc b/system/skeleton/var/lib/misc
similarity index 100%
rename from fs/skeleton/var/lib/misc
rename to system/skeleton/var/lib/misc
diff --git a/fs/skeleton/var/lib/pcmcia b/system/skeleton/var/lib/pcmcia
similarity index 100%
rename from fs/skeleton/var/lib/pcmcia
rename to system/skeleton/var/lib/pcmcia
diff --git a/fs/skeleton/var/lock b/system/skeleton/var/lock
similarity index 100%
rename from fs/skeleton/var/lock
rename to system/skeleton/var/lock
diff --git a/fs/skeleton/var/log b/system/skeleton/var/log
similarity index 100%
rename from fs/skeleton/var/log
rename to system/skeleton/var/log
diff --git a/fs/skeleton/var/pcmcia b/system/skeleton/var/pcmcia
similarity index 100%
rename from fs/skeleton/var/pcmcia
rename to system/skeleton/var/pcmcia
diff --git a/fs/skeleton/var/run b/system/skeleton/var/run
similarity index 100%
rename from fs/skeleton/var/run
rename to system/skeleton/var/run
diff --git a/fs/skeleton/var/spool b/system/skeleton/var/spool
similarity index 100%
rename from fs/skeleton/var/spool
rename to system/skeleton/var/spool
diff --git a/fs/skeleton/var/tmp b/system/skeleton/var/tmp
similarity index 100%
rename from fs/skeleton/var/tmp
rename to system/skeleton/var/tmp
diff --git a/target/generic/Makefile.in b/system/system.mk
similarity index 100%
rename from target/generic/Makefile.in
rename to system/system.mk
-- 
1.7.9.5
