Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F950C636D7
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 20:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C634409A0;
	Wed,  1 Feb 2023 20:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C634409A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNWdkTvx3Q3f; Wed,  1 Feb 2023 20:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D2240947;
	Wed,  1 Feb 2023 20:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D2240947
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A75401BF95C
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E5B160D4E
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 20:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5B160D4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKOQnuZSg0qa for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 20:48:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FBB60C04
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68FBB60C04
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 20:48:56 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQdtO-1p1nIw0im6-00NkqQ; Wed, 01
 Feb 2023 21:48:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 21:48:48 +0100
Message-Id: <20230201204848.2099336-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201204848.2099336-1-laurent@vivier.eu>
References: <20230201204848.2099336-1-laurent@vivier.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ec8ELMjHz28uCna8n3t5S3LAuZlvikvEEPbq8VuE1O2+IqhyGot
 JA/r5KwEkLlyHe+413lx1vw7tiOfQ82IYLYkKgQGhhikeZ54/cJRhn3hjGbBXGP6prLGEuq
 ennEiVkxxXWoN5EqeosxRgfmXLC4K7+YztUYhbhzDx5IcVR7dtpYB0G2O5ULyJuj+K2xo4N
 Fft1wYyYfeAASyIgLV26Q==
UI-OutboundReport: notjunk:1;M01:P0:sc8PGrFd/J4=;nD3Tket/zEXarDASNkMpbUzoaHz
 TjWIjw67dlNxR1BprCgf4YiLOVsbWcQF5VC+QmzsFo8JBW2WWMM9ma8McB4H1+zvX/ZIQ04+Z
 qluueWDKpIbwO/AyydSo9Mcr+LL0fVl0asDiwgGWoFXd/8wYi9MhBc8Z3PEU8r1SaIuLxjMUR
 2OcsKUu108MhWEJcTjOZ1WHmEw8wj4XCNt1JrNLq48O2trhRnBigQQo2op34lcMeOV29c+0vP
 7tjGtIKZYu+c4JTZwkK9nffzSRBuC96oeGH0s8q24TOtMsZH5XWfvMVZxPtQddSnbk/cM8XPH
 S2XpFaTG8Bfriih0xrFP2C8foEYmlOeMa0S4oNYNNA6Am/lPT7AOD4xjHWLMtsL8Ek6ohkSvo
 lk7LE/1UQ3xn64mayrdiUQIRiSwaNylX6MgsgzfbTt5dt1KvahwnJsk0fHwWjkRN2O1ivY1Zy
 fopI1N/ZhsEWH9GGisVp7FPJUqClYiJXKwZ+RuK+XOLQ9KLyiV9tr0PULsxr06XrqrTIOpGol
 Gu6rRr2xt+FeDf/bKljm696CANNiqLdUKj0WCjeZalvTTVAfKAUonPcnfwq4x7HHtELAn1YLQ
 u8boWBDmc/Lbt1OMCZenn9yk3CI9ndLiempUE557SjnuvmoYoAZEKl8cKD84cdgt//sxpjqUl
 CBG4wwQ5dVWDr+esh/4EVhKRQY2lFAkAvfvibwi33A==
Subject: [Buildroot] [PATCH v10 3/3] support/scripts/boot-qemu-image.py:
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
