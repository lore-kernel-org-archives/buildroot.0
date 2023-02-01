Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8002CC05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 13:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A73D813AD;
	Wed,  1 Feb 2023 13:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A73D813AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDx3tJVMpclB; Wed,  1 Feb 2023 13:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 325A581E74;
	Wed,  1 Feb 2023 13:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 325A581E74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54DB51BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FCB560BE7
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 13:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FCB560BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PzxLraIL65t1 for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 13:51:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8956E60E6A
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8956E60E6A
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 13:51:26 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N4Q4m-1ofnkX1yb8-011SLX; Wed, 01
 Feb 2023 14:46:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 14:46:09 +0100
Message-Id: <20230201134609.2040073-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201134609.2040073-1-laurent@vivier.eu>
References: <20230201134609.2040073-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cBOcLghn2DzaAiFQiAPGPRkAme9bp2TYYs/sN+75x9duxXBNuJS
 KDVKmK5rGqJjejkiZcFaPPpaeGGx2w134XilZ7YdxlNzkB4sKsO8mUdOPjuS2Wh1+yT4D0v
 nunF7/yo4LASz4k13/02P5f7qwFUfaWDbke64xj8bsnlvIVJ/4qSNqwLcBkavawxt2QTTNg
 5hTFL4Vaj/lEy1zF/MdwQ==
UI-OutboundReport: notjunk:1;M01:P0:59zJOULfA9Q=;l3aro4RQqP1P/mp5iEpBpU04FbS
 1Uxw9DS9o/ePy8QwKFzmPUJop+A9nE4kFPenPzdrKVqxiM5JeInw7IgG6dBeVod1IDz71c7bM
 tyzrTAJ8NHrPkkdrneKYzDOLEDnwkck6xULErUyHNUJmOLPjfMKrlKWDl9AQ5f+WI+5eS6VYt
 W22esNTFOGDtWV3CSvECabAQNJq4sPiqUBSuuOYJGDPucHTzfASDjM4+PXWouE3AAG6I4vpXM
 3iwmE+vMs1nCHpptQSTAScaN9v6aAC3a02fEYWm9ZRVKIm4L/+iWhjIeFI7+MikjOUPjSzgPY
 Lbl1DmctCZkkdC+ujCExZQZcO8LFUm9Bt/k80H63FG430dpT7rmbHjFcVvk5V8Y0w2W1WqEcn
 2cNTl62MubVJB5tp0kGEgvhYbHLlRqiyx/irqJieb2onNPUsyJe2LHmA0HfWF7x96HtL1YLzW
 0LbqPcXEnVuWaZyoCc/zuRy+Hlp5xBFJ2VqZD2fbZWeHuhfgNqtuFz8+4WEfx2xpLv2KNxICp
 PdO3TQVEKweqZeqZmNZeY6E99dnHhxEl69BSx7aDpOtNUYqFJOGLa8t8phCxwIMfwyIFyQ+7f
 oZcxkicu/w0y95B4ZKxVwAZ5ktsb7qQ2r4eDnDTFRemEHYpv+X1iJNI7IS+49L1VMf4CWLsDf
 uwdQwxFVLywTYjpzWHTPqJvmEG6JtD1KdJMRKWRxLg==
Subject: [Buildroot] [PATCH v9 3/3] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petitboot doesn't start a shell but a GUI.
Manage the menu to switch to the shell.
Use "poweroff -f" as we don't have init

Enable the test for qemu_m68K_virt.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
---
 configs/qemu_m68k_virt_petitboot_defconfig |  5 +++++
 support/scripts/boot-qemu-image.py         | 13 ++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
index b3497c12b46b..cb63a2deeed4 100644
--- a/configs/qemu_m68k_virt_petitboot_defconfig
+++ b/configs/qemu_m68k_virt_petitboot_defconfig
@@ -8,6 +8,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_MERGED_USR=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyGF0"
 BR2_ROOTFS_OVERLAY="package/petitboot/fs-overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
@@ -24,3 +26,6 @@ BR2_PACKAGE_RSYNC=y
 BR2_PACKAGE_PETITBOOT=y
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_XZ=y
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index ba50ea69ee9a..8dd3b4c654e1 100755
--- a/support/scripts/boot-qemu-image.py
+++ b/support/scripts/boot-qemu-image.py
@@ -36,7 +36,7 @@ def main():
     time.sleep(1)
 
     try:
-        child.expect(["buildroot login:"], timeout=600)
+        idx = child.expect(["buildroot login:", "Exit to shell"], timeout=600)
     except pexpect.EOF as e:
         # Some emulations require a fork of qemu-system, which may be
         # missing on the system, and is not provided by Buildroot.
@@ -55,7 +55,11 @@ def main():
         print("System did not boot in time, exiting.")
         sys.exit(1)
 
-    child.sendline("root\r")
+    if idx == 0:
+        child.sendline("root\r")
+    elif idx == 1:
+        time.sleep(1)
+        child.sendline("\r")
 
     try:
         child.expect(["# "], timeout=600)
@@ -66,7 +70,10 @@ def main():
         print("Timeout while waiting for shell")
         sys.exit(1)
 
-    child.sendline("poweroff\r")
+    if idx == 0:
+        child.sendline("poweroff\r")
+    elif idx == 1:
+        child.sendline("poweroff -f\r")
 
     try:
         child.expect(["System halted"], timeout=600)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
