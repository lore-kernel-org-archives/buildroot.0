Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92A8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:52:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D946108B
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91D946108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5D96068B;
	Sat,  6 Nov 2021 10:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTaqZMCptbsG; Sat,  6 Nov 2021 10:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4BF6F94D;
	Sat,  6 Nov 2021 10:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE1FE1BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA44382741
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i42VMrCHc7HH for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E64C82542
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:52:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 072888B3F2; Sat,  6 Nov 2021 10:48:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:51:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f7598034c00f6b51a7e2679401d45cada14be3f
X-Git-Newrev: 3cdaccb52c963cd18fe19cd88a47d75483dec3dd
X-Patchwork-Hint: ignore
Message-Id: <20211106104826.072888B3F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/mips*-malta: switch from IDE
 disk to SCSI disk
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3cdaccb52c963cd18fe19cd88a47d75483dec3dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A following patch will switch to the kernel 5.15 for all qemu
defconfigs but the IDE support (used by mips malta) has been
removed from the Linux kernel since 5.14 release [1].

Enable the SCSI support and update the kernel command line.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b7fb14d3ac63117e0e8beabe75f4ea52051fbe3a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/mips32r2-malta/linux.config   | 8 +++-----
 board/qemu/mips32r2-malta/readme.txt     | 2 +-
 board/qemu/mips32r2el-malta/linux.config | 8 +++-----
 board/qemu/mips32r2el-malta/readme.txt   | 2 +-
 board/qemu/mips32r6-malta/linux.config   | 8 +++-----
 board/qemu/mips32r6-malta/readme.txt     | 2 +-
 board/qemu/mips32r6el-malta/linux.config | 8 +++-----
 board/qemu/mips32r6el-malta/readme.txt   | 2 +-
 board/qemu/mips64-malta/linux.config     | 8 +++-----
 board/qemu/mips64-malta/readme.txt       | 2 +-
 board/qemu/mips64el-malta/linux.config   | 8 +++-----
 board/qemu/mips64el-malta/readme.txt     | 2 +-
 board/qemu/mips64r6-malta/linux.config   | 8 +++-----
 board/qemu/mips64r6-malta/readme.txt     | 2 +-
 board/qemu/mips64r6el-malta/readme.txt   | 2 +-
 15 files changed, 29 insertions(+), 43 deletions(-)

diff --git a/board/qemu/mips32r2-malta/linux.config b/board/qemu/mips32r2-malta/linux.config
index 3a26ac830f..db8ad1760e 100644
--- a/board/qemu/mips32r2-malta/linux.config
+++ b/board/qemu/mips32r2-malta/linux.config
@@ -11,11 +11,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index db1db65b1e..77518ccec9 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user # qemu_mips32r2_malta_defconfig
+ qemu-system-mips -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -net nic,model=pcnet -net user # qemu_mips32r2_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips32r2el-malta/linux.config b/board/qemu/mips32r2el-malta/linux.config
index 79d7352474..916e522292 100644
--- a/board/qemu/mips32r2el-malta/linux.config
+++ b/board/qemu/mips32r2el-malta/linux.config
@@ -12,11 +12,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index 4dc0e64e02..2a1e84a0fb 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user # qemu_mips32r2el_malta_defconfig
+ qemu-system-mipsel -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -net nic,model=pcnet -net user # qemu_mips32r2el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
diff --git a/board/qemu/mips32r6-malta/linux.config b/board/qemu/mips32r6-malta/linux.config
index d559676615..fbfffe2065 100644
--- a/board/qemu/mips32r6-malta/linux.config
+++ b/board/qemu/mips32r6-malta/linux.config
@@ -11,11 +11,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 9ad4959f09..ff5f1e36be 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips32r6_malta_defconfig
+ qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -nographic # qemu_mips32r6_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/mips32r6el-malta/linux.config b/board/qemu/mips32r6el-malta/linux.config
index d559676615..fbfffe2065 100644
--- a/board/qemu/mips32r6el-malta/linux.config
+++ b/board/qemu/mips32r6el-malta/linux.config
@@ -11,11 +11,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index 96c9dc88bf..29a5a1e02b 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -net nic,model=pcnet -net user -nographic # qemu_mips32r6el_malta_defconfig
+ qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -net nic,model=pcnet -net user -nographic # qemu_mips32r6el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/mips64-malta/linux.config b/board/qemu/mips64-malta/linux.config
index cd0b560634..66932fb3db 100644
--- a/board/qemu/mips64-malta/linux.config
+++ b/board/qemu/mips64-malta/linux.config
@@ -15,11 +15,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 7432dac1a1..d148a1394a 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" # qemu_mips64_malta_defconfig
+ qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" # qemu_mips64_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips64el-malta/linux.config b/board/qemu/mips64el-malta/linux.config
index c6b46d4d7f..516b05b5c6 100644
--- a/board/qemu/mips64el-malta/linux.config
+++ b/board/qemu/mips64el-malta/linux.config
@@ -16,11 +16,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index f67ac91ac4..4545fcd9df 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" # qemu_mips64el_malta_defconfig
+ qemu-system-mips64el -M malta -kernel output/images/vmlinux -serial stdio -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" # qemu_mips64el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
diff --git a/board/qemu/mips64r6-malta/linux.config b/board/qemu/mips64r6-malta/linux.config
index 0ebfdbdb05..020e02f1d1 100644
--- a/board/qemu/mips64r6-malta/linux.config
+++ b/board/qemu/mips64r6-malta/linux.config
@@ -15,11 +15,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
index 252a543192..6712d668cc 100644
--- a/board/qemu/mips64r6-malta/readme.txt
+++ b/board/qemu/mips64r6-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips64r6_malta_defconfig
+ qemu-system-mips64 -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -nographic # qemu_mips64r6_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index e9d02e772a..150ce75228 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
- qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/hda" -nographic # qemu_mips64r6el_malta_defconfig
+ qemu-system-mips64el -M malta -cpu I6400 -kernel output/images/vmlinux -drive file=output/images/rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -nographic # qemu_mips64r6el_malta_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
