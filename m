Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4061C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B153410E8;
	Mon,  4 Apr 2022 12:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFA3Jq_x3lAT; Mon,  4 Apr 2022 12:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4045410DC;
	Mon,  4 Apr 2022 12:45:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C54BB1BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3FF3409F5
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFBRgcyAqJ9J for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:45:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07DDF409B3
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:45:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 00E1C861B6; Mon,  4 Apr 2022 12:35:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:44:17 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b8d6d7c3d317e5b52686857b7d08ffe2533e8ff2
X-Git-Newrev: 626226eccb9ac3dcef5b660d9d8ca8950d8bf021
X-Patchwork-Hint: ignore
Message-Id: <20220404123535.00E1C861B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package: replace git://
 URLs with https:// URLs where possible
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

commit: https://git.buildroot.net/buildroot/commit/?id=626226eccb9ac3dcef5b660d9d8ca8950d8bf021
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Replace the remaining git:// URLs with their https:// equivalents as
this is more secure and also more palatable to corporate firewalls.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
[yann.morin.1998@free.fr: convert dahdi-linux too]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6626bf7c5fc1f5f47fcade03090de212a6121db3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 3 ++-
 package/aer-inject/aer-inject.mk                  | 3 ++-
 package/dahdi-linux/dahdi-linux.mk                | 3 ++-
 package/flashbench/flashbench.mk                  | 3 ++-
 package/mmc-utils/mmc-utils.mk                    | 3 ++-
 package/mxsldr/mxsldr.mk                          | 3 ++-
 package/open62541/open62541.mk                    | 2 +-
 package/psplash/psplash.mk                        | 3 ++-
 package/rtc-tools/rtc-tools.mk                    | 3 ++-
 package/rtmpdump/rtmpdump.mk                      | 3 ++-
 package/sox/sox.mk                                | 2 +-
 package/tftpd/tftpd.mk                            | 3 ++-
 package/wilink-bt-firmware/wilink-bt-firmware.mk  | 2 +-
 13 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 3a1af9b02c..30b352f8e7 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 BOOT_WRAPPER_AARCH64_VERSION = 8d5a765251d9113c3c0f9fa14de42a9e7486fe8a
-BOOT_WRAPPER_AARCH64_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
+BOOT_WRAPPER_AARCH64_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
+BOOT_WRAPPER_AARCH64_SITE_METHOD = git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause
 BOOT_WRAPPER_AARCH64_LICENSE_FILES = LICENSE.txt
 BOOT_WRAPPER_AARCH64_DEPENDENCIES = linux
diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
index 72495bbea2..6bc9cb44da 100644
--- a/package/aer-inject/aer-inject.mk
+++ b/package/aer-inject/aer-inject.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
-AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
+AER_INJECT_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
+AER_INJECT_SITE_METHOD = git
 AER_INJECT_LICENSE = GPL-2.0
 AER_INJECT_LICENSE_FILES = README
 AER_INJECT_DEPENDENCIES = host-flex host-bison
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index b9d5911953..93124f0e02 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 DAHDI_LINUX_VERSION = 5c840cf43838e0690873e73409491c392333b3b8
-DAHDI_LINUX_SITE = git://git.asterisk.org/dahdi/linux.git
+DAHDI_LINUX_SITE = https://gerrit.asterisk.org/dahdi-linux
+DAHDI_LINUX_SITE_METHOD = git
 
 # We need to download all those firmware blobs ourselves, otherwise
 # dahdi-linux will try to download them at install time.
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index e89a250aa3..f5791c3e95 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
-FLASHBENCH_SITE = git://git.linaro.org/people/arnd/flashbench.git
+FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
+FLASHBENCH_SITE_METHOD = git
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 8c264a454a..c847378692 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MMC_UTILS_VERSION = d40ec535b9d4e4c974e8c2fbfb422cd0348cc5e8
-MMC_UTILS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git
+MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = mmc.h
 
diff --git a/package/mxsldr/mxsldr.mk b/package/mxsldr/mxsldr.mk
index 239b40ad29..2375b9f42b 100644
--- a/package/mxsldr/mxsldr.mk
+++ b/package/mxsldr/mxsldr.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 MXSLDR_VERSION = 2793a657ab7a22487d21c1b020957806f8ae8383
-MXSLDR_SITE = git://git.denx.de/mxsldr.git
+MXSLDR_SITE = https://git.denx.de/mxsldr.git
+MXSLDR_SITE_METHOD = git
 MXSLDR_LICENSE = GPL-2.0+
 MXSLDR_LICENSE_FILES = COPYING
 HOST_MXSLDR_DEPENDENCIES = host-libusb host-pkgconf
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 8adf09a79d..74aa2b10b9 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -7,7 +7,7 @@
 OPEN62541_VERSION = 1.0
 OPEN62541_DL_VERSION = v$(OPEN62541_VERSION)
 OPEN62541_SITE_METHOD = git
-OPEN62541_SITE = git://github.com/open62541/open62541.git
+OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
 OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index a0f01869b4..2f1138b3f8 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PSPLASH_VERSION = fd33a9b3d68c89fa22ff6873f4f9fd28bd85830c
-PSPLASH_SITE = git://git.yoctoproject.org/psplash
+PSPLASH_SITE = https://git.yoctoproject.org/psplash
+PSPLASH_SITE_METHOD = git
 PSPLASH_LICENSE = GPL-2.0+
 PSPLASH_LICENSE_FILES = COPYING
 PSPLASH_AUTORECONF = YES
diff --git a/package/rtc-tools/rtc-tools.mk b/package/rtc-tools/rtc-tools.mk
index 2ef850a81f..2882c88575 100644
--- a/package/rtc-tools/rtc-tools.mk
+++ b/package/rtc-tools/rtc-tools.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RTC_TOOLS_VERSION = 33ef4aa1c92b0c92a351284d93d1ac5570de9cc7
-RTC_TOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
+RTC_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git
+RTC_TOOLS_SITE_METHOD = git
 RTC_TOOLS_LICENSE = GPL-2.0
 RTC_TOOLS_LICENSE_FILES = COPYING
 
diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index db79a796dc..fb381d0e10 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 RTMPDUMP_VERSION = c5f04a58fc2aeea6296ca7c44ee4734c18401aa3
-RTMPDUMP_SITE = git://git.ffmpeg.org/rtmpdump
+RTMPDUMP_SITE = https://git.ffmpeg.org/rtmpdump
+RTMPDUMP_SITE_METHOD = git
 RTMPDUMP_INSTALL_STAGING = YES
 # Note that rtmpdump is GPL-2.0 but librtmp has its own license and since we only
 # care about librtmp, it's LGPL-2.1+
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
index 4b09b94bc3..1896437ad4 100644
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SOX_VERSION = 7524160b29a476f7e87bc14fddf12d349f9a3c5e
-SOX_SITE = git://git.code.sf.net/p/sox/code
+SOX_SITE = https://git.code.sf.net/p/sox/code
 SOX_SITE_METHOD = git
 SOX_DEPENDENCIES = host-autoconf-archive host-pkgconf
 SOX_LICENSE = GPL-2.0+ (sox binary), LGPL-2.1+ (libraries)
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index ffd52ce0d0..b8602442fb 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 TFTPD_VERSION = b2b34cecc8cbc18ff6f1fc00bda6ae6e9011e6c7
-TFTPD_SITE = git://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
+TFTPD_SITE = https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
+TFTPD_SITE_METHOD = git
 TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
diff --git a/package/wilink-bt-firmware/wilink-bt-firmware.mk b/package/wilink-bt-firmware/wilink-bt-firmware.mk
index 722c4655cd..a5f3a82609 100644
--- a/package/wilink-bt-firmware/wilink-bt-firmware.mk
+++ b/package/wilink-bt-firmware/wilink-bt-firmware.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WILINK_BT_FIRMWARE_VERSION = 43fca73c6a98c63fcb98f82af5bf83761778e005
-WILINK_BT_FIRMWARE_SITE = git://git.ti.com/ti-bt/service-packs.git
+WILINK_BT_FIRMWARE_SITE = https://git.ti.com/git/ti-bt/service-packs.git
 WILINK_BT_FIRMWARE_SITE_METHOD = git
 WILINK_BT_FIRMWARE_LICENSE = PROPRIETARY
 WILINK_BT_FIRMWARE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
