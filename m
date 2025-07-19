Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96244C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 12:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521C641B37;
	Sat, 19 Jul 2025 12:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLUkNi2tgdTp; Sat, 19 Jul 2025 12:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7936841ABA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7936841ABA;
	Sat, 19 Jul 2025 12:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B6BDDA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D98B60C2E
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrRs1Qw-Xl0Q for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 12:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DD6607B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6DD6607B7
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:43:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B45E4867A4; Sat, 19 Jul 2025 12:43:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 14:39:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f38d4e63d76e3eeca78b28d7fca80dbc13ec6eef
X-Git-Newrev: 2bc9a3bf7e154d084ae630bc38972eb8bbcc4cf9
X-Patchwork-Hint: ignore
Message-Id: <20250719124349.B45E4867A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-utgard-driver: bump to
 version 2025-07-18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4113067765315242756=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4113067765315242756==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2bc9a3bf7e154d084ae630bc38972eb8bbcc4cf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sunxi-mali-utgard-driver at git version 9926236a is failing
to build with kernel 6.15.

The issue has not been seen in autobuilder, but can be reproduced
with commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_LATEST_VERSION=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_PACKAGE_SUNXI_MALI_UTGARD=y
    EOF
    make olddefconfig
    make sunxi-mali-utgard-driver

This new version fixes the issue and builds up to Linux 6.15.

Also, _SITE URL has moved to github benetti-engineering-sas so
let's modify accordingly.

Fixes:

    linux/mali_osk_timers.c: In function ‘_mali_osk_timer_del’:
    linux/mali_osk_timers.c:59:9: error: implicit declaration of function ‘del_timer_sync’ [-Wimplicit-function-declaration]

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add commands to reproduce the issue in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index b8f96ae1b3..0b5dc9c2f8 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce73be1fb5f5d24f0e66516623db0b51c45adb30d845bfa8cb78aed9b6d8913f  sunxi-mali-utgard-driver-9926236a20904ecfca68f3365657c11f92695546.tar.gz
+sha256  b0cf26625db13989be54844d3625e6918bee6d4ae6d054da161a2bf9e3665532  sunxi-mali-utgard-driver-b47f74c92fbcbdf175a16052d1b0ce8345efc6b2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 9c68285256..ea3bc258a6 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = 9926236a20904ecfca68f3365657c11f92695546
-SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_VERSION = b47f74c92fbcbdf175a16052d1b0ce8345efc6b2
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,benetti-engineering-sas,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
 SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE

--===============4113067765315242756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4113067765315242756==--
