Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC594C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66F8B40B39;
	Mon, 15 Aug 2022 14:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66F8B40B39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDBZlI3kEXeJ; Mon, 15 Aug 2022 14:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABC4A4042B;
	Mon, 15 Aug 2022 14:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC4A4042B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3651F1BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1173840293
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1173840293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3ASN6ZXddbC for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:49:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75B2840195
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75B2840195
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:49:16 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N2jO8-1nMzmt0GmC-01338D; Mon, 15
 Aug 2022 16:49:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 16:49:06 +0200
Message-Id: <20220815144907.3300089-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815144907.3300089-1-laurent@vivier.eu>
References: <20220815144907.3300089-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3+gpwO18aFx2zOrrpHYKtR43zaYcS1+4kFbcptOHIEv2Y/YxI6P
 b+k3rmetGmsmSKbCVdxer++TTTAA2WBJZ5Yuus+RSd7+vFIqgGA/yo4G+csYOr0opWQO1gV
 TClpXm7DWowxQkVpYoTH0rapn2qpwdhak4kwfaqinmDj5AGY4YEdiJ3mU4qZcp9JxqCqVMH
 WcXkgSa35WQxTtzbBIOtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CZYUwhvXfJU=:iOmlKVqYHong2Etkqx2BJ/
 m794KC9/OMYTNc5jy8mbXqd3lbGYG7QQYdRiV9//t7v9NXCfylpT7ja3QsbnQyenNp/XHXCya
 6uThndPf8472K92kKRwGBy9wmswz8uiVN/bJ97cRcOjZ15YG7+op552d5ll8X6rxjTYq5iCIy
 L/mfYj0+IkISgaYbeCRf5zFDz9XKXhbBy55JEhz47q716v5azT4FwwTAHOcSevv6HjYF0rvGn
 0W06GYZc+4qfN8LF/ZQJoaPxXy4BXgR4WV/Poy0PJ/SofscwmzFeEHAxvZe8L4vgFxuXKBq2L
 8HPXw/Iv5+Q/os2QmZc+qaDsMAS0S9aksNS4vKMMqkOgrUX1FQM8QIZcoTX6hknm34dF9dOuy
 zWGHDOu9YgkmWRCTlEZMMzuKOxmfuDQxTmrcjF/6JyweYxlX1qkfIL4klvWh4XvRvIM6icvgq
 GyYTEHeTZwFBtZ6E/Y87AX7mokrYsXscqX26Xz1myzHjWwu/RyvSMSZpJVtR+Vn3X+aJNpPfq
 wxa0Tb/Y7yoqc1BAg37DJSVSv6gw3+Uh/MDNnCK08cPWcang3uwTHCbwlCP3QHgRWh+DM5wKY
 ZZRDpl8bx930SK8nL981xIm905P52zCF/y14+W0Jq7xpziFW9qBiVYl/CBIZ0F+5F5S3W8Rpt
 VlElo8maySrgPbdzjVGwp2P7Oirgv5IVH5iwC9/eD4KzRAO6CUZLOPNeYOWdWG1SlSJMPaeyD
 yYyUxl5yV7YwlIFqfQXD2EeP3oLUssytrnYXZA==
Subject: [Buildroot] [PATCH v4 1/2] package: add petitboot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

from https://github.com/glevand/petitboot--buildroot

Updated to work with m68k architecture rather than PlayStation3
(focused on qemu-system-m68k virt machine)

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 DEVELOPERS                                   |  3 +
 package/Config.in                            |  1 +
 package/kexec/Config.in                      |  2 +-
 package/petitboot/63-md-raid-arrays.rules    | 41 ++++++++++
 package/petitboot/65-md-incremental.rules    | 69 +++++++++++++++++
 package/petitboot/66-add-sg-module.rules     |  2 +
 package/petitboot/Config.in                  | 23 ++++++
 package/petitboot/S14silence-console         |  9 +++
 package/petitboot/S15pb-discover             | 38 ++++++++++
 package/petitboot/fs-overlay/etc/inittab     | 34 +++++++++
 package/petitboot/fs-overlay/etc/locale      |  1 +
 package/petitboot/fs-overlay/init            |  8 ++
 package/petitboot/kexec-restart              |  8 ++
 package/petitboot/petitboot-console-ui.rules |  6 ++
 package/petitboot/petitboot.hash             |  2 +
 package/petitboot/petitboot.mk               | 78 ++++++++++++++++++++
 package/petitboot/removable-event-poll.rules |  4 +
 package/petitboot/shell_config               | 19 +++++
 package/petitboot/shell_profile              |  2 +
 19 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 package/petitboot/63-md-raid-arrays.rules
 create mode 100644 package/petitboot/65-md-incremental.rules
 create mode 100644 package/petitboot/66-add-sg-module.rules
 create mode 100644 package/petitboot/Config.in
 create mode 100755 package/petitboot/S14silence-console
 create mode 100755 package/petitboot/S15pb-discover
 create mode 100644 package/petitboot/fs-overlay/etc/inittab
 create mode 100644 package/petitboot/fs-overlay/etc/locale
 create mode 100755 package/petitboot/fs-overlay/init
 create mode 100755 package/petitboot/kexec-restart
 create mode 100644 package/petitboot/petitboot-console-ui.rules
 create mode 100644 package/petitboot/petitboot.hash
 create mode 100644 package/petitboot/petitboot.mk
 create mode 100644 package/petitboot/removable-event-poll.rules
 create mode 100644 package/petitboot/shell_config
 create mode 100755 package/petitboot/shell_profile

diff --git a/DEVELOPERS b/DEVELOPERS
index d2bd0d809a6a..45fa4c7e0686 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1742,6 +1742,9 @@ F:	package/aircrack-ng/
 N:	Laurent Charpentier <laurent_pubs@yahoo.com>
 F:	package/open-lldp/
 
+N:	Laurent Vivier <laurent@vivier.eu>
+F:	package/petitboot/
+
 N:	Lee Jones <lee.jones@linaro.org>
 F:	boot/afboot-stm32/
 
diff --git a/package/Config.in b/package/Config.in
index d1c098c48f56..e3cdc6c375a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2613,6 +2613,7 @@ menu "System tools"
 	source "package/openrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
+	source "package/petitboot/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
 	source "package/procps-ng/Config.in"
diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 90a7bc2672bd..092a80b171fc 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_KEXEC
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x
+		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k
 	help
 	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with
diff --git a/package/petitboot/63-md-raid-arrays.rules b/package/petitboot/63-md-raid-arrays.rules
new file mode 100644
index 000000000000..92aec36e69d4
--- /dev/null
+++ b/package/petitboot/63-md-raid-arrays.rules
@@ -0,0 +1,41 @@
+# do not edit this file, it will be overwritten on update
+
+SUBSYSTEM!="block", GOTO="md_end"
+
+# handle md arrays
+ACTION!="add|change", GOTO="md_end"
+KERNEL!="md*", GOTO="md_end"
+
+# partitions have no md/{array_state,metadata_version}, but should not
+# for that reason be ignored.
+ENV{DEVTYPE}=="partition", GOTO="md_ignore_state"
+
+# container devices have a metadata version of e.g. 'external:ddf' and
+# never leave state 'inactive'
+ATTR{md/metadata_version}=="external:[A-Za-z]*", ATTR{md/array_state}=="inactive", GOTO="md_ignore_state"
+TEST!="md/array_state", ENV{SYSTEMD_READY}="0", GOTO="md_end"
+ATTR{md/array_state}=="|clear|inactive", ENV{SYSTEMD_READY}="0", GOTO="md_end"
+LABEL="md_ignore_state"
+
+IMPORT{program}="/sbin/mdadm --detail --export $devnode"
+ENV{DEVTYPE}=="disk", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}", OPTIONS+="string_escape=replace"
+ENV{DEVTYPE}=="disk", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}"
+ENV{DEVTYPE}=="disk", ENV{MD_DEVNAME}=="?*", SYMLINK+="md/$env{MD_DEVNAME}"
+ENV{DEVTYPE}=="partition", ENV{MD_NAME}=="?*", SYMLINK+="disk/by-id/md-name-$env{MD_NAME}-part%n", OPTIONS+="string_escape=replace"
+ENV{DEVTYPE}=="partition", ENV{MD_UUID}=="?*", SYMLINK+="disk/by-id/md-uuid-$env{MD_UUID}-part%n"
+ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[^0-9]", SYMLINK+="md/$env{MD_DEVNAME}%n"
+ENV{DEVTYPE}=="partition", ENV{MD_DEVNAME}=="*[0-9]", SYMLINK+="md/$env{MD_DEVNAME}p%n"
+
+IMPORT{builtin}="blkid"
+OPTIONS+="link_priority=100"
+OPTIONS+="watch"
+ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{ID_FS_UUID_ENC}=="?*", SYMLINK+="disk/by-uuid/$env{ID_FS_UUID_ENC}"
+ENV{ID_FS_USAGE}=="filesystem|other", ENV{ID_FS_LABEL_ENC}=="?*", SYMLINK+="disk/by-label/$env{ID_FS_LABEL_ENC}"
+
+ENV{MD_LEVEL}=="raid[1-9]*", ENV{SYSTEMD_WANTS}+="mdmonitor.service"
+
+# Tell systemd to run mdmon for our container, if we need it.
+ENV{MD_LEVEL}=="raid[1-9]*", ENV{MD_CONTAINER}=="?*", PROGRAM="/usr/bin/readlink $env{MD_CONTAINER}", ENV{MD_MON_THIS}="%c"
+ENV{MD_MON_THIS}=="?*", PROGRAM="/usr/bin/basename $env{MD_MON_THIS}", ENV{SYSTEMD_WANTS}+="mdmon@%c.service"
+
+LABEL="md_end"
diff --git a/package/petitboot/65-md-incremental.rules b/package/petitboot/65-md-incremental.rules
new file mode 100644
index 000000000000..153d12fe6f7e
--- /dev/null
+++ b/package/petitboot/65-md-incremental.rules
@@ -0,0 +1,69 @@
+# This file causes block devices with Linux RAID (mdadm) signatures to
+# automatically cause mdadm to be run.
+# See udev(8) for syntax
+
+# Don't process any events if anaconda is running as anaconda brings up
+# raid devices manually
+ENV{ANACONDA}=="?*", GOTO="md_end"
+
+# Also don't process disks that are slated to be a multipath device
+ENV{DM_MULTIPATH_DEVICE_PATH}=="?*", GOTO="md_end"
+
+# We process add events on block devices (since they are ready as soon as
+# they are added to the system), but we must process change events as well
+# on any dm devices (like LUKS partitions or LVM logical volumes) and on
+# md devices because both of these first get added, then get brought live
+# and trigger a change event.  The reason we don't process change events
+# on bare hard disks is because if you stop all arrays on a disk, then
+# run fdisk on the disk to change the partitions, when fdisk exits it
+# triggers a change event, and we want to wait until all the fdisks on
+# all member disks are done before we do anything.  Unfortunately, we have
+# no way of knowing that, so we just have to let those arrays be brought
+# up manually after fdisk has been run on all of the disks.
+
+# First, process all add events (md and dm devices will not really do
+# anything here, just regular disks, and this also won't get any imsm
+# array members either)
+SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	RUN+="/sbin/mdadm -I --export $env{DEVNAME}"
+
+# Next, check to make sure the BIOS raid stuff wasn't turned off via cmdline
+IMPORT{cmdline}="noiswmd"
+IMPORT{cmdline}="nodmraid"
+ENV{noiswmd}=="?*", GOTO="md_imsm_inc_end"
+ENV{nodmraid}=="?*", GOTO="md_imsm_inc_end"
+SUBSYSTEM=="block", ACTION=="add", ENV{ID_FS_TYPE}=="isw_raid_member", \
+	RUN+="/sbin/mdadm -I $env{DEVNAME}"
+LABEL="md_imsm_inc_end"
+
+SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}=="?*", \
+	RUN+="/sbin/mdadm -If $name --path $env{ID_PATH}"
+SUBSYSTEM=="block", ACTION=="remove", ENV{ID_PATH}!="?*", \
+	RUN+="/sbin/mdadm -If $name"
+
+# Next make sure that this isn't a dm device we should skip for some reason
+ENV{DM_UDEV_RULES_VSN}!="?*", GOTO="dm_change_end"
+ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}=="1", GOTO="dm_change_end"
+ENV{DM_SUSPENDED}=="1", GOTO="dm_change_end"
+KERNEL=="dm-*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+LABEL="dm_change_end"
+
+# Finally catch any nested md raid arrays.  If we brought up an md raid
+# array that's part of another md raid array, it won't be ready to be used
+# until the change event that occurs when it becomes live
+KERNEL=="md*", SUBSYSTEM=="block", ENV{ID_FS_TYPE}=="linux_raid_member", \
+	ACTION=="change", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+
+# In case the initramfs only started some of the arrays in our container,
+# run incremental assembly on the container itself.  Note: we ran mdadm
+# on the container in 64-md-raid.rules, and that's how the MD_LEVEL
+# environment variable is already set.  If that disappears from the other
+# file, we will need to add this line into the middle of the next rule:
+#	IMPORT{program}="/sbin/mdadm -D --export $tempnode", \
+
+SUBSYSTEM=="block", ACTION=="add|change", KERNEL=="md*", \
+	ENV{MD_LEVEL}=="container", RUN+="/sbin/mdadm -I $env{DEVNAME}"
+
+
+LABEL="md_end"
diff --git a/package/petitboot/66-add-sg-module.rules b/package/petitboot/66-add-sg-module.rules
new file mode 100644
index 000000000000..ae18d28c570e
--- /dev/null
+++ b/package/petitboot/66-add-sg-module.rules
@@ -0,0 +1,2 @@
+# load modules to scsi disks, if they aren't in kernel
+SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST!="[module/sg]", RUN+="/sbin/modprobe sg"
diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
new file mode 100644
index 000000000000..fdcb26ccc924
--- /dev/null
+++ b/package/petitboot/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_PETITBOOT
+	bool "petitboot"
+	# petitboot needs udev /dev management
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	# run-time dependency only
+	select BR2_PACKAGE_KEXEC_LITE if !BR2_PACKAGE_KEXEC
+	# run-time dependency only
+	select BR2_PACKAGE_POWERPC_UTILS if (( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le ) && ! BR2_PACKAGE_PS3_UTILS )
+	# run-time dependency only
+	select BR2_PACKAGE_NVME if (( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le ) && ! BR2_PACKAGE_PS3_UTILS )
+	help
+	  Petitboot is a small kexec-based bootloader
+
+	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
+
+comment "petitboot requires udev to be enabled"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/petitboot/S14silence-console b/package/petitboot/S14silence-console
new file mode 100755
index 000000000000..2ce6b39f427b
--- /dev/null
+++ b/package/petitboot/S14silence-console
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+case "$1" in
+    start)
+        echo 1 1 1 1 > /proc/sys/kernel/printk
+        ;;
+esac
+
+exit 0
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
new file mode 100755
index 000000000000..9d9ec57de3f0
--- /dev/null
+++ b/package/petitboot/S15pb-discover
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+LOGFILE=/var/log/petitboot/pb-discover.log
+PIDFILE=/var/run/petitboot.pid
+
+PATH=/usr/bin:/usr/sbin:/bin:/sbin
+export PATH
+
+verbose=
+if pb-config debug | grep -q enabled
+then
+	verbose=-v
+fi
+
+case "$1" in
+    start)
+        ulimit -c unlimited
+        mkdir -p -m 0775 $(dirname $LOGFILE)
+        mkdir -p -m 0775 /var/petitboot
+        # Set permissions for normal users
+        chown -R root:petitgroup $(dirname $LOGFILE)
+        chown -R root:petitgroup /var/petitboot
+
+        export $(cat /etc/locale)
+        pb-discover -l $LOGFILE $verbose &
+        echo $! > $PIDFILE
+        ;;
+    stop)
+        pid=$(cat $PIDFILE)
+        [ -n "$pid" ] && kill -TERM $pid
+        ;;
+    *)
+        echo "Usage: $0 {start|stop}"
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/package/petitboot/fs-overlay/etc/inittab b/package/petitboot/fs-overlay/etc/inittab
new file mode 100644
index 000000000000..1f503d5d56f7
--- /dev/null
+++ b/package/petitboot/fs-overlay/etc/inittab
@@ -0,0 +1,34 @@
+# /etc/inittab
+#
+# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
+#
+# Note: BusyBox init doesn't support runlevels.  The runlevels field is
+# completely ignored by BusyBox init. If you want runlevels, use
+# sysvinit.
+#
+# Format for each entry: <id>:<runlevels>:<action>:<process>
+#
+# id        == tty to run on, or empty for /dev/console
+# runlevels == ignored
+# action    == one of sysinit, respawn, askfirst, wait, and once
+# process   == program to run
+
+# Startup the system
+::sysinit:/bin/mount -t proc proc /proc
+::sysinit:/bin/mount -o remount,rw / # REMOUNT_ROOTFS_RW
+::sysinit:/bin/mkdir -p /dev/pts
+::sysinit:/bin/mkdir -p /dev/shm
+::sysinit:/bin/mount -a
+::sysinit:/bin/hostname -F /etc/hostname
+# now run any rc scripts
+::sysinit:/etc/init.d/rcS
+::sysinit:/sbin/petitboot-nc
+# Stuff to do for the 3-finger salute
+::ctrlaltdel:/sbin/reboot
+
+# Stuff to do before rebooting
+::shutdown:/etc/init.d/rcK
+::shutdown:/bin/umount -a -r
+::shutdown:/sbin/swapoff -a
+
+::restart:/usr/sbin/kexec-restart
diff --git a/package/petitboot/fs-overlay/etc/locale b/package/petitboot/fs-overlay/etc/locale
new file mode 100644
index 000000000000..655683630776
--- /dev/null
+++ b/package/petitboot/fs-overlay/etc/locale
@@ -0,0 +1 @@
+LANG=en_US.utf-8
diff --git a/package/petitboot/fs-overlay/init b/package/petitboot/fs-overlay/init
new file mode 100755
index 000000000000..1e56178db162
--- /dev/null
+++ b/package/petitboot/fs-overlay/init
@@ -0,0 +1,8 @@
+#!/bin/sh
+# devtmpfs does not get automounted for initramfs
+/bin/mount -t devtmpfs devtmpfs /dev
+exec 0</dev/console
+exec 1>/dev/console
+exec 2>/dev/console
+exec /sbin/init "$@"
+
diff --git a/package/petitboot/kexec-restart b/package/petitboot/kexec-restart
new file mode 100755
index 000000000000..0175e76df4cd
--- /dev/null
+++ b/package/petitboot/kexec-restart
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+/usr/sbin/kexec -f -e
+
+while :
+do
+    sleep 1
+done
diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
new file mode 100644
index 000000000000..cbf1b7e1d765
--- /dev/null
+++ b/package/petitboot/petitboot-console-ui.rules
@@ -0,0 +1,6 @@
+
+# spawn a petitboot UI on common user-visible interface devices
+SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
+SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
+SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
+SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty=/sbin/agetty --detach -- -a petituser -n -i $name linux"
diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
new file mode 100644
index 000000000000..859e438e956a
--- /dev/null
+++ b/package/petitboot/petitboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 b42ae4fb2a81e9cf68f727c3f54c6312788c654bd97628ec9ba61b19a68990e6  petitboot-v1.13.tar.gz
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
new file mode 100644
index 000000000000..0b9214d0d553
--- /dev/null
+++ b/package/petitboot/petitboot.mk
@@ -0,0 +1,78 @@
+################################################################################
+#
+# petitboot
+#
+################################################################################
+
+PETITBOOT_VERSION = v1.13
+PETITBOOT_SOURCE = petitboot-$(PETITBOOT_VERSION).tar.gz
+PETITBOOT_SITE ?= https://github.com/open-power/petitboot/releases/download/$(PETITBOOT_VERSION)
+PETITBOOT_DEPENDENCIES = elfutils ncurses udev host-bison host-flex lvm2
+PETITBOOT_LICENSE = GPLv2
+PETITBOOT_LICENSE_FILES = COPYING
+
+PETITBOOT_CONF_OPTS += --with-ncurses --without-twin-x11 --without-twin-fbdev \
+	      --localstatedir=/var \
+	      --enable-crypt \
+	      HOST_PROG_KEXEC=/usr/sbin/kexec \
+	      HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart \
+	      $(if $(BR2_PACKAGE_BUSYBOX),--with-tftp=busybox --enable-busybox)
+
+ifdef PETITBOOT_DEBUG
+PETITBOOT_CONF_OPTS += --enable-debug
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+PETITBOOT_CONF_OPTS += --with-ncursesw MENU_LIB=-lmenuw FORM_LIB=-lformw
+endif
+
+define PETITBOOT_POST_INSTALL
+	$(INSTALL) -D -m 0755 $(@D)/utils/bb-kexec-reboot \
+		$(TARGET_DIR)/usr/libexec/petitboot
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/petitboot/boot.d
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/01-create-default-dtb \
+		$(TARGET_DIR)/etc/petitboot/boot.d/
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
+		$(TARGET_DIR)/etc/petitboot/boot.d/
+
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S14silence-console \
+		$(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
+		$(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/kexec-restart \
+		$(TARGET_DIR)/usr/sbin/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/removable-event-poll.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/63-md-raid-arrays.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/65-md-incremental.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/66-add-sg-module.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/
+
+	ln -sf /usr/sbin/pb-udhcpc \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
+
+	mkdir -p $(TARGET_DIR)/home/petituser
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_profile \
+		$(TARGET_DIR)/home/petituser/.profile
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/shell_config \
+		$(TARGET_DIR)/home/petituser/.shrc
+
+	$(MAKE) -C $(@D)/po DESTDIR=$(TARGET_DIR) install
+endef
+
+define PETITBOOT_POST_INSTALL_DTB
+	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/30-dtb-updates \
+		$(TARGET_DIR)/etc/petitboot/boot.d/
+endef
+
+PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL
+
+ifeq ($(BR2_PACKAGE_DTC),y)
+	PETITBOOT_POST_INSTALL_TARGET_HOOKS += PETITBOOT_POST_INSTALL_DTB
+endif
+
+$(eval $(autotools-package))
diff --git a/package/petitboot/removable-event-poll.rules b/package/petitboot/removable-event-poll.rules
new file mode 100644
index 000000000000..b736aef6101f
--- /dev/null
+++ b/package/petitboot/removable-event-poll.rules
@@ -0,0 +1,4 @@
+
+# petitboot needs notification for media change events on removable devices,
+# which we only get if we've set the poll_msecs sysfs attribute.
+ACTION!="remove", ATTR{removable}=="1", ATTR{events_poll_msecs}="2000"
diff --git a/package/petitboot/shell_config b/package/petitboot/shell_config
new file mode 100644
index 000000000000..59337ff53039
--- /dev/null
+++ b/package/petitboot/shell_config
@@ -0,0 +1,19 @@
+#!bin/sh
+
+reset
+
+echo "Exiting petitboot. Type 'exit' to return."
+echo "You may run 'pb-sos' to gather diagnostic data"
+
+if [[ "$(id -u)" != "0" ]]; then
+	echo "" | sudo -S /bin/true 2&>1 >> /dev/null
+	if [[ $? = 0 ]]; then
+		echo "No password set, running as root. You may set a password in the System Configuration screen."
+		sudo -i
+		sudo -K
+		exit
+	fi
+	export PS1='$ '
+else
+	export PS1='# '
+fi
diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
new file mode 100755
index 000000000000..40062b423b79
--- /dev/null
+++ b/package/petitboot/shell_profile
@@ -0,0 +1,2 @@
+export ENV="/home/petituser/.shrc"
+/usr/libexec/petitboot/pb-console
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
