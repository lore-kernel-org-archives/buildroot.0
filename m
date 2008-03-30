From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 13:45:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device/AMD/DBAu1500/target_skele etc...
Message-ID: <20080330204543.164973C531@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-30 13:45:42 -0700 (Sun, 30 Mar 2008)
New Revision: 21586

Log:
target_skeleton: mark empty directories with .empty files

Mark empty directories in target skeletons with .empty files
and remove them while copying to target (like it's already done for
svn and cvs files) to better support version control system which don't
handle empty directories (E.G. git-svn).


Added:
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/bin/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/pts/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/home/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/lib/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/mnt/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/opt/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/proc/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/root/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/sbin/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/tmp/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/bin/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/lib/.empty
   trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/sbin/.empty
   trunk/buildroot/target/device/Atmel/atngw100-expanded/target_skeleton/dev/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/boot/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/config/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/dev/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/home/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/lib/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/mnt/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/opt/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/sbin/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/cache/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lib/pcmcia/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lock/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/log/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/pcmcia/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/run/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/spool/.empty
   trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/tmp/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/bin/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/boot/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/config/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/dev/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/home/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/lib/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/mnt/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/opt/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/sbin/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/cache/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lib/pcmcia/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lock/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/log/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/pcmcia/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/run/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/spool/.empty
   trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/tmp/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/bin/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/boot/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/config/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/dev/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/ld.so.conf.d/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/home/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/lib/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/mnt/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/opt/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/proc/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/root/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/sbin/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/tmp/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/bin/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/include/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/lib/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/man/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/sbin/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/src/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/cache/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lib/pcmcia/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lock/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/log/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/pcmcia/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/run/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/spool/.empty
   trunk/buildroot/target/device/Atmel/root/target_skeleton/var/tmp/.empty
   trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/root/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/bin/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/dev/pts/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/home/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/lib/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/mnt/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/opt/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/proc/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/root/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/sbin/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/tmp/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/usr/bin/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/usr/lib/.empty
   trunk/buildroot/target/device/jp/q5/target_skeleton/usr/sbin/.empty
   trunk/buildroot/target/device/valka/target_skeleton/etc/fonts/.empty
   trunk/buildroot/target/device/valka/target_skeleton/etc/init.d/.empty
   trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-down.d/.empty
   trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-post-down.d/.empty
   trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-pre-up.d/.empty
   trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-up.d/.empty
   trunk/buildroot/target/device/valka/target_skeleton/var/db/.empty
   trunk/buildroot/target/device/valka/target_skeleton/var/run/.empty
   trunk/buildroot/target/device/valka/target_skeleton/web/.empty
   trunk/buildroot/target/generic/target_skeleton/bin/.empty
   trunk/buildroot/target/generic/target_skeleton/dev/pts/.empty
   trunk/buildroot/target/generic/target_skeleton/etc/ld.so.conf.d/.empty
   trunk/buildroot/target/generic/target_skeleton/home/.empty
   trunk/buildroot/target/generic/target_skeleton/lib/.empty
   trunk/buildroot/target/generic/target_skeleton/mnt/.empty
   trunk/buildroot/target/generic/target_skeleton/opt/.empty
   trunk/buildroot/target/generic/target_skeleton/proc/.empty
   trunk/buildroot/target/generic/target_skeleton/root/.empty
   trunk/buildroot/target/generic/target_skeleton/sbin/.empty
   trunk/buildroot/target/generic/target_skeleton/tmp/.empty
   trunk/buildroot/target/generic/target_skeleton/usr/bin/.empty
   trunk/buildroot/target/generic/target_skeleton/usr/lib/.empty
   trunk/buildroot/target/generic/target_skeleton/usr/sbin/.empty

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-30 20:42:40 UTC (rev 21585)
+++ trunk/buildroot/Makefile	2008-03-30 20:45:42 UTC (rev 21586)
@@ -330,6 +330,7 @@
 	fi
 	-find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
 	-find $(TARGET_DIR) -type d -name .svn | xargs rm -rf
+	-find $(TARGET_DIR) -type d -name .empty | xargs rm -rf	
 	touch $@
 
 $(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/dev/pts/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/home/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/mnt/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/opt/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/proc/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/tmp/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/AMD/DBAu1500/target_skeleton/usr/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/boot/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/config/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/dev/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/home/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/mnt/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/opt/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/cache/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lib/pcmcia/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/lock/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/log/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/pcmcia/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/run/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/spool/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/var/tmp/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atngw100-expanded/target_skeleton/dev/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/boot/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/config/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/dev/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/home/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/mnt/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/opt/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/cache/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lib/pcmcia/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/lock/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/log/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/pcmcia/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/run/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/spool/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/atstk1002/target_skeleton/var/tmp/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/boot/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/config/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/dev/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/etc/ld.so.conf.d/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/home/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/mnt/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/opt/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/proc/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/tmp/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/include/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/man/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/usr/src/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/cache/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lib/pcmcia/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/lock/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/log/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/pcmcia/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/run/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/spool/.empty
===================================================================

Added: trunk/buildroot/target/device/Atmel/root/target_skeleton/var/tmp/.empty
===================================================================

Added: trunk/buildroot/target/device/Sharp/LNode80/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/dev/pts/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/home/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/mnt/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/opt/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/proc/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/tmp/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/usr/bin/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/usr/lib/.empty
===================================================================

Added: trunk/buildroot/target/device/jp/q5/target_skeleton/usr/sbin/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/etc/fonts/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/etc/init.d/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-down.d/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-post-down.d/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-pre-up.d/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/etc/network/if-up.d/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/var/db/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/var/run/.empty
===================================================================

Added: trunk/buildroot/target/device/valka/target_skeleton/web/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/bin/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/dev/pts/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/etc/ld.so.conf.d/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/home/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/lib/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/mnt/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/opt/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/proc/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/root/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/sbin/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/tmp/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/usr/bin/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/usr/lib/.empty
===================================================================

Added: trunk/buildroot/target/generic/target_skeleton/usr/sbin/.empty
===================================================================
