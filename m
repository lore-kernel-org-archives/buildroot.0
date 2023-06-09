Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D4C7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 11:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C3A3424B3;
	Fri,  9 Jun 2023 11:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C3A3424B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnhzfLsLExKC; Fri,  9 Jun 2023 11:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09988424BA;
	Fri,  9 Jun 2023 11:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09988424BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0811BF37F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11D9B841EC
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D9B841EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFf-UnwQ4gAE for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 11:25:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B3B8841E9
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B3B8841E9
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 11:25:33 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Macay-1paARB041y-00c8Iv; Fri, 09
 Jun 2023 13:25:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 13:25:22 +0200
Message-Id: <20230609112522.97790-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609112522.97790-1-laurent@vivier.eu>
References: <20230609112522.97790-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XCKKQrB7KSdL5iGdbYyMo3wRP1Bm6PfzaLKtvQFe6Ky7ttgbSrA
 YpdeiN3jg3px1NybHbSKNjtxCDqPbW7bGuyCJu2fZXrrPF3kil33uiUaYbTWrIvu/6oDC7a
 Os6q5QAABjXfFIu1tZedyw8ODWmqOF2tnOvbBaG0F2h0VGJufwh+Ah58fOF00Np+tmGJttX
 bHniOoU/grEurF39S1cNA==
UI-OutboundReport: notjunk:1;M01:P0:m6jhp3wfOqE=;ADD41XAZCXibA9LaUUsIcMOfEEK
 G8gbiqN7eqszOSGU2B+EpD6axUDSMqwYXMAJgvNRKlrm8FRaLGZyRTFVxCS77l8Pzrf4e8+Ea
 Bmv9MKYiOTjseMlL7mxjBKnafGmOxElZnAcuzEhlplbglJYtVTzyyiTzRNrV4ZXcVU15Nnl7V
 TSn2JCB+LJHoHlx8K/rMyx6F0NKKYg8s9wHwwd82ijbsC8Uh0KLUFirJ4pFuGaDAYSVmvrNiC
 A94qJcB5t5XijnX/6N4MpqIJBGqxhE8tmGt8375vgnr8YZ+5P86xtf8PjUwql6YOSTHwOY7Wz
 HFVolgCq5B7/7ahnhKUsY1hh2XhBmRkExDzXv1JdWZJ1tUj8jBXDMR9g7C/UNh+Z8DMKXvNi+
 KupN8cRVkghCB2bgGDiJkzYdA+Fhp89mHPJFLDwned34MK7LGTeDkonCFRaPZYsve4n/Ff8V7
 RDmURjBAbhn1ymVLTYM4ZEISZA1WRlRCO6gOBUUnftx6IjGdzfBJfgZ1Ak3q27anFTW13kkCc
 OzMpHx9v6MxP+MgUYD61xt16BCWgA5utus3JiDwvH8tYOledxfOMFadQ/DHQAfFGZagWJe8Ex
 So6YpZoOxk8Ua3lvmDPdJ0WeduR7pHPJcBrSETPIJu/3wGNLVlz3wEiYhV2v7EUwa5CCRMJ+h
 8HO3I5DQC0qqxPezDiO2nuWxvMhAxRKF7J3Oewfpew==
Subject: [Buildroot] [PATCH v13 4/4] support/scripts/boot-qemu-image.py:
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
