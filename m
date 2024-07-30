Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F80C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 21:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3BFD40BE1;
	Tue, 30 Jul 2024 21:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMNzPFw2kqTS; Tue, 30 Jul 2024 21:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E81440BDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E81440BDC;
	Tue, 30 Jul 2024 21:45:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA3971BF5AE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EAB860732
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 21:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oo3hpJ39aN2P for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 21:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943D66082C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 943D66082C
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 21:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81CFB83734; Tue, 30 Jul 2024 21:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 23:37:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cc21e5e842747916c7f751394539c925601f9c8
X-Git-Newrev: 38f3bb5fd7702a74ee5eb16ee59c6d8221aed452
X-Patchwork-Hint: ignore
Message-Id: <20240730214451.81CFB83734@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone_qt5: move patches to
 beaglebone-qt5 folder
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38f3bb5fd7702a74ee5eb16ee59c6d8221aed452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compared to the beaglebone_defconfig, updating the Linux kernel for
beaglebone_qt5 is more tricky because it may also involve updating the
ti-sgx-{km,um} packages. Therefore, it is unlikely that the two
configurations can share the same software versions for the Linux
kernel, and consequently a single path for the patches. For this
reason, and with the foresight of adding the hash files for the
beaglebone_defconfig as well, the hash files and patches are moved to
a separate board/beagleboard/beaglebone-qt5/patches/ directory. This
way, future conflicts in managing the patches for the two
configurations (i.e., beaglebone[_qt5]_defconfig) are avoided.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                     | 2 +-
 .../patches/linux-headers/linux-headers.hash                            | 0
 .../patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch         | 0
 .../0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch     | 0
 .../0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch      | 0
 .../patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch     | 0
 .../beagleboard/{beaglebone => beaglebone-qt5}/patches/linux/linux.hash | 0
 .../beagleboard/{beaglebone => beaglebone-qt5}/patches/uboot/uboot.hash | 0
 configs/beaglebone_qt5_defconfig                                        | 2 +-
 9 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b10a277eae..b488a05902 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -8,7 +8,7 @@ board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
 board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
-board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
+board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beagleboard/beaglebone/post-build.sh Shellcheck
 board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
 board/beagleboard/beagleboneai/post-build.sh Shellcheck
diff --git a/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash b/board/beagleboard/beaglebone-qt5/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
rename to board/beagleboard/beaglebone-qt5/patches/linux-headers/linux-headers.hash
diff --git a/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
rename to board/beagleboard/beaglebone-qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/beagleboard/beaglebone-qt5/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
rename to board/beagleboard/beaglebone-qt5/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch b/board/beagleboard/beaglebone-qt5/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
rename to board/beagleboard/beaglebone-qt5/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch b/board/beagleboard/beaglebone-qt5/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
rename to board/beagleboard/beaglebone-qt5/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone-qt5/patches/linux/linux.hash
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/linux.hash
rename to board/beagleboard/beaglebone-qt5/patches/linux/linux.hash
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone-qt5/patches/uboot/uboot.hash
similarity index 100%
rename from board/beagleboard/beaglebone/patches/uboot/uboot.hash
rename to board/beagleboard/beaglebone-qt5/patches/uboot/uboot.hash
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index e58255a108..4121065ee3 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone-qt5/patches"
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
