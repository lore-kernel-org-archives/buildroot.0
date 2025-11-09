Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8521CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A92E406F7;
	Sun,  9 Nov 2025 21:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8H7do8FPA6k; Sun,  9 Nov 2025 21:20:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09011406F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09011406F1;
	Sun,  9 Nov 2025 21:20:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 242221CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1512460872
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKRXRZrTDWbf for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:20:40 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=2a02:2350:5:505::1;
 helo=mailrelay-egress18.pub.mailoutpod2-cph3.one.com;
 envelope-from=ayoub.zaki@embetrix.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3B6C60870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B6C60870
Received: from mailrelay-egress18.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress18.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:505::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3B6C60870
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:20:39 +0000 (UTC)
X-HalOne-ID: ec5d7f3d-bdb1-11f0-8c28-f3c0f7fef5ee
Received: from xps-13.fritz.box
 (dynamic-2a02-3102-8c10-1ae0-72ec-3970-1e4b-e6b3.310.pool.telefonica.de
 [2a02:3102:8c10:1ae0:72ec:3970:1e4b:e6b3])
 by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id ec5d7f3d-bdb1-11f0-8c28-f3c0f7fef5ee;
 Sun, 09 Nov 2025 21:20:34 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embetrix.com>
To: buildroot@buildroot.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Date: Sun,  9 Nov 2025 22:20:32 +0100
Message-ID: <20251109212032.824039-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1762723234; x=1763328034; 
 d=embetrix.com; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=sX7DrAWV+SbYB1ym2+AyD7oDEP7H5+EU2yJ0p7dZhoo=;
 b=sh9jx7qWzTf0V0XOmKYvFvLdoCgEC5TFOWfyMBflp6kgD3zt9HzSuHMKbxxKydYO22M/USIZf2xFH
 3I3rFeuGbL0Fr+NBpQaeXGQL/yB74cSit1+YlyD7LSm9F5lPtyBelorm3I+ZN1W+i5TVeA0upg3mwe
 TrY/HHyCIfWbhKkBijoQDzCxxFx6NPrZqTJpMfSlL5UOMCL091cABSmNmHZ4J2o2jwQK6Tty8GlTPT
 14GOcncktlz2qIOYwc2ugEh+F1Oj33FcVqyo5TFP44+cbf3HnmH9LqoXfHaZZ0RDzz/aTZeJn63LdD
 LAfZS+GWvQ9tTRtO74VT0jn6SiXMaKA==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1762723234; x=1763328034; 
 d=embetrix.com; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from;
 bh=sX7DrAWV+SbYB1ym2+AyD7oDEP7H5+EU2yJ0p7dZhoo=;
 b=TMhZhjR/mbWc6y/LV3oN1YSVG6OD7yxvpth12/VNaYv4FTX8VafztZsFSGNWorWnYZEfN8ZvkAeL+
 iOW5XaSBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=embetrix.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=embetrix.com
 header.i=@embetrix.com header.a=rsa-sha256 header.s=rsa1 header.b=sh9jx7qW; 
 dkim=pass header.d=embetrix.com header.i=@embetrix.com header.a=ed25519-sha256
 header.s=ed1 header.b=TMhZhjR/
Subject: [Buildroot] [PATCH] boot/systemd-boot: introduce standalone
 systemd-boot bootloader
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce systemd-boot bootloader that builds only the
UEFI bootloader without requiring or depending on
systemd being used as the init system.
This makes systemd-boot usable with other inits (e.g., BusyBox, sysvinit) while keeping the build minimal.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 DEVELOPERS                                    |   1 +
 boot/Config.in                                |   1 +
 boot/systemd-boot/Config.in                   |  30 +++++
 .../systemd-boot}/boot-files/buildroot.conf   |   0
 .../systemd-boot}/boot-files/loader.conf      |   0
 boot/systemd-boot/systemd-boot.hash           |   1 +
 boot/systemd-boot/systemd-boot.mk             | 116 ++++++++++++++++++
 package/systemd/Config.in                     |  32 -----
 package/systemd/systemd.mk                    |  17 ---
 9 files changed, 149 insertions(+), 49 deletions(-)
 create mode 100644 boot/systemd-boot/Config.in
 rename {package/systemd => boot/systemd-boot}/boot-files/buildroot.conf (100%)
 rename {package/systemd => boot/systemd-boot}/boot-files/loader.conf (100%)
 create mode 120000 boot/systemd-boot/systemd-boot.hash
 create mode 100644 boot/systemd-boot/systemd-boot.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b14c6e3875..b341a17d00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -308,6 +308,7 @@ F:	package/python-canopen/
 
 N:	Ayoub Zaki <ayoub.zaki@embetrix.com>
 F:	package/bmap-writer/
+F:	boot/systemd-boot/
 
 N:	Bagas Sanjaya <bagasdotme@gmail.com>
 F:	package/git/
diff --git a/boot/Config.in b/boot/Config.in
index 08a6c8353d..1b29bc1b44 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -23,6 +23,7 @@ source "boot/opensbi/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/systemd-boot/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
new file mode 100644
index 0000000000..b160431ded
--- /dev/null
+++ b/boot/systemd-boot/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_SYSTEMD_BOOT
+	bool "systemd-boot"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBXCRYPT
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	help
+	  systemd-boot is a simple UEFI boot manager which executes
+	  configured EFI images. The default entry is selected by a
+	  configured pattern (glob) or an on-screen menu.
+
+	  systemd-boot operates on the EFI System Partition (ESP)
+	  only. Configuration file fragments, kernels, initrds, other
+	  EFI images need to reside on the ESP. Linux kernels need to
+	  be built with CONFIG_EFI_STUB to be able to be directly
+	  executed as an EFI image.
+
+	  See the Grub2 help text for details on preparing an EFI
+	  capable disk image using systemd-boot: the instructions are
+	  exactly the same, except that the systemd-boot configuration
+	  files will be located in /loader/ inside the EFI partition.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
+
+config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
+	string
+	default "ia32"  if BR2_i386
+	default "x64"   if BR2_x86_64
+	depends on BR2_PACKAGE_SYSTEMD_BOOT
diff --git a/package/systemd/boot-files/buildroot.conf b/boot/systemd-boot/boot-files/buildroot.conf
similarity index 100%
rename from package/systemd/boot-files/buildroot.conf
rename to boot/systemd-boot/boot-files/buildroot.conf
diff --git a/package/systemd/boot-files/loader.conf b/boot/systemd-boot/boot-files/loader.conf
similarity index 100%
rename from package/systemd/boot-files/loader.conf
rename to boot/systemd-boot/boot-files/loader.conf
diff --git a/boot/systemd-boot/systemd-boot.hash b/boot/systemd-boot/systemd-boot.hash
new file mode 120000
index 0000000000..4259f40c21
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.hash
@@ -0,0 +1 @@
+../../package/systemd/systemd.hash
\ No newline at end of file
diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
new file mode 100644
index 0000000000..ce46f5e25b
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.mk
@@ -0,0 +1,116 @@
+################################################################################
+#
+# systemd-boot -  Bootloader Only
+#
+################################################################################
+
+SYSTEMD_BOOT_VERSION = $(SYSTEMD_VERSION)
+SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
+SYSTEMD_BOOT_SOURCE = systemd-$(SYSTEMD_BOOT_VERSION).tar.gz
+SYSTEMD_BOOT_LICENSE = $(SYSTEMD_LICENSE)
+SYSTEMD_BOOT_LICENSE_FILES =  $(SYSTEMD_LICENSE_FILES)
+SYSTEMD_BOOT_CPE_ID_VALID = YES
+SYSTEMD_BOOT_INSTALL_TARGET = NO
+SYSTEMD_BOOT_INSTALL_IMAGES = YES
+SYSTEMD_BOOT_DEPENDENCIES =  \
+                            host-pkgconf host-meson \
+                            host-ninja host-python-jinja2 \
+                            host-python-pyelftools \
+                            gnu-efi libcap libxcrypt util-linux-libs
+
+#meson options : Disable everything except the bootloader/efi
+SYSTEMD_BOOT_CONF_OPTS = \
+	-Dstandalone-binaries=false \
+	-Defi=true \
+	-Dbootloader=enabled \
+	-Dmode=release \
+	-Dman=disabled \
+	-Dtests=false \
+	-Dsysusers=false \
+	-Dtmpfiles=false \
+	-Dhwdb=false \
+	-Dglib=disabled \
+	-Dlibarchive=disabled \
+	-Dacl=disabled \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Delfutils=disabled \
+	-Dlibiptc=disabled \
+	-Dlibidn=disabled -Dlibidn2=disabled \
+	-Dseccomp=disabled \
+	-Dxkbcommon=disabled \
+	-Dbzip2=disabled \
+	-Dzstd=disabled \
+	-Dlz4=disabled \
+	-Dpam=disabled \
+	-Dfdisk=disabled \
+	-Dkmod=disabled \
+	-Dxz=disabled \
+	-Dzlib=disabled \
+	-Dlibcurl=disabled \
+	-Dgcrypt=disabled \
+	-Dp11kit=disabled \
+	-Dpcre2=disabled \
+	-Dblkid=disabled \
+	-Dinitrd=false \
+	-Dkernel-install=false \
+	-Danalyze=false \
+	-Dpwquality=disabled \
+	-Dremote=disabled -Dmicrohttpd=disabled \
+	-Dqrencode=disabled \
+	-Dselinux=disabled \
+	-Dhwdb=false \
+	-Dbinfmt=false \
+	-Dutmp=false \
+	-Dvconsole=false \
+	-Dvmspawn=disabled \
+	-Dquotacheck=false \
+	-Dsysusers=false \
+	-Dstoragetm=false \
+	-Dfirstboot=false \
+	-Drandomseed=false \
+	-Dbacklight=false \
+	-Drfkill=false \
+	-Dlogind=false \
+	-Dmachined=false -Dnss-mymachines=disabled \
+	-Dimportd=disabled \
+	-Dhomed=disabled \
+	-Dhostnamed=false \
+	-Dnsresourced=false \
+	-Dnss-myhostname=false \
+	-Dtimedated=false \
+	-Dlocaled=false \
+	-Drepart=disabled \
+	-Dmountfsd=false \
+	-Duserdb=false \
+	-Dcoredump=false \
+	-Dpstore=false \
+	-Doomd=false \
+	-Dpolkit=disabled \
+	-Dportabled=false \
+	-Dsysext=false \
+	-Dsysupdate=disabled \
+	-Dnetworkd=false \
+	-Dnss-resolve=disabled -Dresolve=false \
+	-Dtimesyncd=false \
+	-Dsmack=false \
+	-Dhibernate=false \
+	-Dtpm2=disabled \
+	-Dtests=false \
+	-Dbpf-framework=disabled \
+	-Dauto_features=disabled
+
+SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
+
+define SYSTEMD_BOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/boot-files/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/boot-files/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+
+$(eval $(meson-package))
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 931134911a..c7d7982a37 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -112,29 +112,6 @@ if BR2_PACKAGE_SYSTEMD
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
-config BR2_PACKAGE_SYSTEMD_BOOT
-	bool "systemd-boot"
-	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_GNU_EFI
-	select BR2_PACKAGE_SYSTEMD_EFI
-	help
-	  systemd-boot is a simple UEFI boot manager which executes
-	  configured EFI images. The default entry is selected by a
-	  configured pattern (glob) or an on-screen menu.
-
-	  systemd-boot operates on the EFI System Partition (ESP)
-	  only. Configuration file fragments, kernels, initrds, other
-	  EFI images need to reside on the ESP. Linux kernels need to
-	  be built with CONFIG_EFI_STUB to be able to be directly
-	  executed as an EFI image.
-
-	  See the Grub2 help text for details on preparing an EFI
-	  capable disk image using systemd-boot: the instructions are
-	  exactly the same, except that the systemd-boot configuration
-	  files will be located in /loader/ inside the EFI partition.
-
-	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
-
 config BR2_PACKAGE_SYSTEMD_INITRD
 	bool "Services for booting from initrd"
 	help
@@ -159,15 +136,6 @@ config BR2_PACKAGE_SYSTEMD_ANALYZE
 	  It is also used to access special functions useful for
 	  advanced system manager debugging.
 
-config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
-	string
-	default "ia32"  if BR2_i386
-	default "x64"   if BR2_x86_64
-	depends on BR2_PACKAGE_SYSTEMD_BOOT
-
-config BR2_PACKAGE_SYSTEMD_EFI
-	bool "enable EFI support"
-
 config BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
 	bool "enable journal remote tools"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6d04ee2581..09b086a46c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -642,24 +642,7 @@ else
 SYSTEMD_CONF_OPTS += -Dtpm2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
-SYSTEMD_INSTALL_IMAGES = YES
-SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
-SYSTEMD_CONF_OPTS += -Dbootloader=enabled
-
-SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
-define SYSTEMD_INSTALL_BOOT_FILES
-	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
-		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
-	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
-		$(BINARIES_DIR)/efi-part/loader/loader.conf
-	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/buildroot.conf \
-		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
-endef
-
-else
 SYSTEMD_CONF_OPTS += -Dbootloader=disabled
-endif # BR2_PACKAGE_SYSTEMD_BOOT == y
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_EFI),y)
 SYSTEMD_CONF_OPTS += -Defi=true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
