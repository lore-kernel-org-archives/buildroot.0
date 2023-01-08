Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AF6C53210
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 16:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3499410A1;
	Sun,  8 Jan 2023 16:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3499410A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huwxV5AuFZ50; Sun,  8 Jan 2023 16:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E8E2410A8;
	Sun,  8 Jan 2023 16:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8E2410A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 412CE1BF304
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CD4A607CE
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 16:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CD4A607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aabGaDndxNuu for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 16:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE0B60777
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AE0B60777
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 16:54:46 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEVFi-1oyZa50rpC-00FwsG; Sun, 08
 Jan 2023 17:54:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 17:54:38 +0100
Message-Id: <20230108165438.1250779-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230108165438.1250779-1-laurent@vivier.eu>
References: <20230108165438.1250779-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:raIH4bby8AYEE1kCdAMKlFCStHw9ZvXOGzTl7zLZqmhnHY+eKBQ
 /RMUl84KaKKzS/XBc8sO0im25tFKQ4I9ZZFm9vRRzXe/IKeeP1EUKTIffcQdChFou1TysUM
 f0m4EtYUU8ebQG6XnFaVtLFQjRhsvlqf/VTFiDBVltuzpWDt1fSI4isAl/Cae9gCImNG3c/
 tRwdUX76kBckezQZ5U30Q==
UI-OutboundReport: notjunk:1;M01:P0:0hEVESygkX8=;Qjm7BJE+ZKYCWZj8K1WgVA8lMHD
 UKEwLiKvMKS9W7QoNrs41G4OqXd76wkY0cRC6FKqeFirW+xJQZ8kmBQGVQIUQ6UptMg4AVd6T
 k8ZLxSoLH/RMGS7TIgK6n8QF1NoNS+fBa3J4bLBOHRbwrcTK0JOdasmUjAAgsSQZUgTPsnI6e
 mFAtQ5lotHmDglIgjvOYYGQ92EWWyHhv3I7GCzPYgpF0N4Ctb13SG8IMYdFlrEzx/+SgRj6Jy
 vn9uMSE0TvhxUn/UAp8pX8mbaaJ1euQ2CfcjpBKO5LXq+Xf4nBUuDL0E4infMyfFtnm2PbdZH
 MuZoB6SYA6ANMGpxAFe9Dtogqq3yEdblIw/D3pBkJPNsN0rMmdBcodhwriTsVWN6pLribtP9t
 uaX2L2Ss02tF1947CP4gUpXteul/HrUYliCgTg/e6HMJQCNEL5/6FdVv6ie7EuZR0u800Cihu
 9eHeLmmnudT4gILf7GhKyYtxEQEjT9VlnstyFJwJthAJyaSZZVewG6DCqbyBtDo7j/vWP8qIF
 WjNoyo1lMcyGwzPPc64AFMDXPW+19gWNZprX8vW+YXum+8FOnsocWXA6mF37l+R4pWttWKs3p
 ZQt5ZqAk64Le909Mh5pv7nGMymCFzHwURAFcNHSD2CujkxzFAY3bGveguopzjbJkrNupOmitQ
 K8YGWipDhwa2n/myuh8SvbXol8An5uaaptVw2Am2/w==
Subject: [Buildroot] [PATCH v8 3/3] support/scripts/boot-qemu-image.py:
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
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
