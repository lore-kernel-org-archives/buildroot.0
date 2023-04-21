Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196FBC7618E
	for <buildroot@archiver.kernel.org>; Fri, 21 Apr 2023 18:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59FF7000F;
	Fri, 21 Apr 2023 18:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59FF7000F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVqakGgHc9K6; Fri, 21 Apr 2023 18:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FEF70002;
	Fri, 21 Apr 2023 18:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6FEF70002
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B11A1BF2C2
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3DA5417C9
 for <buildroot@lists.busybox.net>; Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3DA5417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9LTirjwNN44p for <buildroot@lists.busybox.net>;
 Fri, 21 Apr 2023 18:50:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2A304048F
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2A304048F
 for <buildroot@buildroot.org>; Fri, 21 Apr 2023 18:50:13 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEC8L-1q096D46LN-00AIqK; Fri, 21
 Apr 2023 20:50:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Fri, 21 Apr 2023 20:50:03 +0200
Message-Id: <20230421185003.1221000-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421185003.1221000-1-laurent@vivier.eu>
References: <20230421185003.1221000-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u/AjRmiZGeRzAJTupqFDOl6cL9d6c3mJXKG7phgh0a2pD9M+J7R
 8yu86ha2mWT48C8b6gwAj34xp+XuAlTsnAr5wXFLngL31c9NFJ/A7MiksVZnGp+QlXggfLi
 lphevwZTmoGHsbU79v8fjpj5zEqbjleiP7WHmEWGyBh00Wz0hVpyUfvCpCrm8RX6dzBnJnw
 RdnEY/xIZNJNN/avbbcqw==
UI-OutboundReport: notjunk:1;M01:P0:uEeAp5bLT2U=;SEFP7mQyeO3hBRQmliIzDej50gf
 KAWv9A7WN0d4s0o04cvX3MpX617KYtruVSaUrdS69ERIhA40SzPrxi+pl4UmmXsJGHeoF12Cv
 j0tCcIY5qCPJ8ixQMyyrjxM8Qcnb7U4dLCGL4UCaezh3cN2AbKYT+Vn73ghASdJhYbJvw6ISu
 mpC0N/p2aqeBHlcGceFy6GWbwho9tEnP+yl+YMQFF+nLtzWXl1jVEgHiazy2WCYVZWeNAOfYs
 TAwpiUyejSeyoiihSxEI3UebNInZFNwJGNiv4QUP/M/WwLE3lPa/Bvc9VEA+XJJGZg95B2ncp
 RZGcMnkcc+11cGThWbeQzY+/xMtvQAC++sPQvUSKOZ0qPLp27KH+N6ZlGX3b9oe3ehXD5tNX1
 8jpcWzjpr0lACEgGLB+fI5j/A8cdsXCMaB1ho61+Jb/NZRvxgFwLeV98z9EpW7k/aOxch4RGT
 wy7EXjAe7WsGO315eHpUSVnxNV59/AyKSlGZYlefViXFh5YefnB+d3po7x7nYAp1RJhEmT5x7
 V2u3hTIOA/XR0k4bE6/tvcqZkWVyl9hdEH4WfSmfdLzC9RsLYYAscyWDuSgVPRgoFoKYFlAYf
 fFYHO5mfJWFAOy1+FFB3jZrI5cA3mZMy0FnweEM+AU1a/kcppjs6iLVetcU9n4iMtmVCEbXRZ
 i353RDGEE2ipBh0D4wwmd4Lddr61oJKPObaEuhgUuQ==
Subject: [Buildroot] [PATCH v11 5/5] support/scripts/boot-qemu-image.py:
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
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
