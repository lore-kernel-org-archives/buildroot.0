Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49496C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 16:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E63DF613DD;
	Sun,  7 May 2023 16:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63DF613DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBKj_ALw5q7D; Sun,  7 May 2023 16:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D8A613E9;
	Sun,  7 May 2023 16:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D8A613E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03D611BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1F6D81C56
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 16:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F6D81C56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpYbdu3XRGUW for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 16:53:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B382381B26
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B382381B26
 for <buildroot@buildroot.org>; Sun,  7 May 2023 16:53:55 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N7zW7-1qGgTS0dox-014yxj; Sun, 07
 May 2023 18:53:45 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 18:53:40 +0200
Message-Id: <20230507165340.42151-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507165340.42151-1-laurent@vivier.eu>
References: <20230507165340.42151-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:s27G0f6FSt1iQKyQecPfHTqNYtkhc2RPlgmQ4G564j+e1e+K9cj
 VV6fVRlfEyJP6r31g1zTzmwKXuXLSGQPP1m5kxu+MLXe16MI0KYUYq2BCyMR2fwn32MphJt
 hMnXYt1F0xK+yOu8WTomNHxjqU8Nqei5HhK+S6a4lKzA+sHmBBCdy7gmbmFgSkRpP3L/TWy
 vSlhGshzCUC+54oVONRrg==
UI-OutboundReport: notjunk:1;M01:P0:tS8R3RYKQ2g=;abCzY0ods7u89BKH8zluO7rNW5m
 4VIWRfVT+WZlkZW7OSFzb8RsqHfZGnT39gtFQ5hC5MkMB+RjtIdK/qrZQZ4+kwcHNX9iE5hk+
 MYaDRrmurJ+vgEvDUiaYVzEyTaPt5ZLSgt2imADN2eSpnvY9zPj4a2bP3ZcO1oBHOJe5Q2Z1P
 bqLX+svjMuLMfLSxFPXnAtRiAXy0gzRTOlQ5YxX4Hdxm3Z4D2U7yjpucVFtUpjKl54I1hoQeg
 WFfPo/JsEu4dq45xnOUNKBSP9/pB+3+XBIoYJ9jkIiJ4iBhAxx4KQZ8h+exZewVviFzlDTTm8
 VYhBmF9t+l/ZawBH4OdFLQMrztoWUvgt1wAmPn9xg8MRnb+VLFEjjzQHoumFbMFC3M8/jiyYG
 bKdb+sQzO36SBdzak+XuPFG0OQWIm5icpxPRVRuY1G1w/N9kV5f7hId1jHT7odZwhP+62l7mP
 vVRWlDMl4b0HDJhz0+voSHKCc2sreqmiHi/yFQKQDalG2TCq0Jyz3PAQpDQUdDxSs310WbmG0
 q/GUEqwI++SnzzzJ/FH5tl2hFeHc3h2XvJ0ac+cKZbAVf8+X2lx8vwCGHEEsJ9QbXa67gGhpw
 1mTy8XUmnEcJ2iVbqiqFdOlsiVwgGk0spIp5aQ9glx/mtRQMJtL2E0wgGzV0B/unDr8QudPKb
 CW+HF2W1dxi4JMPp9TvIxYgLW2QFoaKagBV/wX4cEA==
Subject: [Buildroot] [PATCH v12 5/5] support/scripts/boot-qemu-image.py:
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petitboot doesn't start a shell but a GUI.
Manage the menu to switch to the shell.

Enable the test for qemu_m68K_virt.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 configs/qemu_m68k_virt_petitboot_defconfig | 5 +++++
 support/scripts/boot-qemu-image.py         | 8 ++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_m68k_virt_petitboot_defconfig b/configs/qemu_m68k_virt_petitboot_defconfig
index a109553187b4..454c8e353f2a 100644
--- a/configs/qemu_m68k_virt_petitboot_defconfig
+++ b/configs/qemu_m68k_virt_petitboot_defconfig
@@ -6,6 +6,8 @@ BR2_RELRO_NONE=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Petitboot"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_MERGED_USR=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19"
@@ -22,3 +24,6 @@ BR2_PACKAGE_RSYNC=y
 BR2_PACKAGE_PETITBOOT=y
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_XZ=y
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
diff --git a/support/scripts/boot-qemu-image.py b/support/scripts/boot-qemu-image.py
index ba50ea69ee9a..c94b7a5c969d 100755
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
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
