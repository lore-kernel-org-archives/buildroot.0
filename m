Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5255EC433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 14:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A27610AA;
	Fri, 18 Nov 2022 14:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0A27610AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4We-zcy3pdCj; Fri, 18 Nov 2022 14:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECA8610A5;
	Fri, 18 Nov 2022 14:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ECA8610A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24A3C1BF966
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 14:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C97F94179D
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 14:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C97F94179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 930uw1yKeadW for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 14:14:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A0884179B
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A0884179B
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 14:14:45 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MxmFk-1p9hwE0CVi-00zCdk; Fri, 18
 Nov 2022 15:14:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 18 Nov 2022 15:14:35 +0100
Message-Id: <20221118141435.1084565-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118141435.1084565-1-laurent@vivier.eu>
References: <20221118141435.1084565-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:g+xTcb+86fBoiONn3BDipw9YfZYSvKdWl+WQ0/iTkT6Gv8h3rsC
 XbPE86eXeRz6bg8CuxenhsoKkF7zT2z7KzwMNZihxwcl7xQNDgf8hrLk8FtrVBqhROWq4/b
 J0cphvcPyrbXLiu0vo1+n8FR6C4sZ9skTuFq4JUZ8tr+anS+pC8UKFqMxTz6RB9/GeI5OhK
 skturwjSJoebphoskk+aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F58+b+wKivI=:jOZ5rOnoWNwmeVcscWTXY2
 gs0z6vn8FgIKIxVHGOj5C3Wp/iSBwvYT1QgyNOvo6PrPdSfr8mIXgKfgXE7kBfkvku2pjFBZa
 Bi+dOlLs+TgkctPJvt5W9XbzI/KTbUy+amGhiUFst537JvXg4bk2R90CwGUEWtreQt9Lv4oDg
 emFmJftq+0cON3iKttahBo6dVT52YtWQoGaKvfio6oW2OUhygFusgV5nJLnPIiYsWLzdDMHpV
 scV8EGa1r6qTqQ59sU2/uPDCc0LYOs1F1sj4BktTjP0wAzHY8kQRLFnVFXyRELydC/HHILSdU
 I++UPEgQ2frVr12M+Uovcn+BiknsrQMyBGvQyDucMTpiG96IfZws2dIo6paqRbHHZv4afK6GM
 mkPAWxZBE9HvQAze/Of9k8ijIZfubIuo/4w9p6x/GuCQWW6y81J4PYqsHt/wztzC7TUEFsqVP
 sRP44rejWfqmHV3AuzW56PCarcHyjGvb/GPlL78Kwwp0IxtuVt7/TchZsIOYyvFBC6IZ/MkXR
 biWC+aWmzqR8eWt1QQ9+1R6n+cKh2CEmLVve6tQQNJDmUdSupimdf55m/xVQvmqrMazTUyBCK
 ZyQD4a1ZWbU8H/uLTtEHJQF2JeZDzWkb36YyMXslm+neBZDTFNCIUYIgocaleMHb+/pg7qkSc
 ViIN/DymdrlfFQdYgaNuhmSggyh7lV2871RPfwui4ovaEOfmybi0Hyzj341j84rT3Oe0C5eFT
 BCxMDzTcSpDasp8m2SNG62aQaMRJ2BoZWU1DGaWxt5l+peoUYNuZ2jyzos4idsHNuxZi9NHwv
 8SMA4bs
Subject: [Buildroot] [PATCH v7 3/3] support/scripts/boot-qemu-image.py:
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
---
 configs/qemu_m68k_virt_petitboot_defconfig |  5 +++++
 support/scripts/boot-qemu-image.py         | 13 ++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
index 5ddd9837161f..c83827855f07 100644
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
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
