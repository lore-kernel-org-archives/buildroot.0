Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05517C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A229D40B3B;
	Tue,  7 Feb 2023 21:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A229D40B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHYZiyLHwxvs; Tue,  7 Feb 2023 21:52:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C18B40B26;
	Tue,  7 Feb 2023 21:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C18B40B26
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECA171BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1E896105A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1E896105A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAeHekpAGO_9 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F7876104D
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F7876104D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B8AE843A9; Tue,  7 Feb 2023 21:51:54 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:51:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e
X-Git-Newrev: a2c823d1f548d5a0120d27d6c000603192360f7b
X-Patchwork-Hint: ignore
Message-Id: <20230207215154.6B8AE843A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to version 252.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2c823d1f548d5a0120d27d6c000603192360f7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following files changed *license* from CC0-1.0 to MIT-0:

-   src/systemctl/systemd-sysv-install.SKELETON
-   config files
-   examples under /network

The file LICENSES/MIT-0.txt has been added for this reason,
hashes added, corrected for LICENSES/README.md.

Kernel version 3.15 is now the bare minimum, but only
version 4.15 and higher are fully supported and tested:

-   bump kernel header dependencies
-   correct kconfig description
-   improvements to make the kconfig description better reflect
    the information from the README

Set new options to their default, remove -Defi-cc option.

Set -Ddbus=false to ensure dbus dependency is runtime only.

Set -Ddbus-interfaces-dir=no as interface XML file generation is
not supported when cross compiling.

Set -Ddefault-user-shell=/bin/sh to the always available shell.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/systemd/Config.in    | 12 +++++++++---
 package/systemd/systemd.hash |  5 +++--
 package/systemd/systemd.mk   | 16 ++++++++++++++--
 system/Config.in             |  6 +++---
 4 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 33ac03e584..0d4147840d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -51,7 +51,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.13 with the following
+	  Kernel versions below 4.15 ("recommended baseline") have
+	  significant gaps in functionality and are not recommended
+	  for use with this version of systemd.
+
+	  Systemd requires a Linux kernel >= 3.15 with the following
 	  options enabled:
 
 	  - CONFIG_DEVTMPFS
@@ -66,9 +70,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  - CONFIG_PROC_FS
 	  - CONFIG_FHANDLE (libudev, mount and bind mount handling)
 
-	  - CONFIG_NET_NS (needed by PrivateNetwork=, used in some
+	  - CONFIG_NET_NS (Required for PrivateNetwork=, used in some
 	    systemd units)
 
+	  - CONFIG_USER_NS (Required for PrivateUsers=)
+
 	  - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
 	  - CONFIG_TMPFS_POSIX_ACL
 	  - CONFIG_TMPFS_XATTR
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3b98566f32..00c08edcd9 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  638a2fc78828765fc97bc73f428205b6dc1d359149b6c6bfe4d2a649cba2cca8  systemd-250.8.tar.gz
+sha256  cf2d27e67663d599a045101c7178cf0ec63d9df2962a54adf7de0d0357724f00  systemd-252.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -8,7 +8,8 @@ sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENS
 sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
 sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
 sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
+sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENSES/MIT-0.txt
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
+sha256  da9b2c7b8cd10516fd2c4279b82496ea61787148f13e899c62fc8988c5fac34f  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f191542866..a38eeba1a8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.8
+SYSTEMD_VERSION = 252.4
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -29,6 +29,7 @@ SYSTEMD_LICENSE = \
 	BSD-3-Clause (tools/chromiumos), \
 	CC0-1.0 (few source files, see LICENSES/README.md), \
 	GPL-2.0 with Linux-syscall-note (linux kernel headers), \
+	MIT-0 (few source files, see LICENSES/README.md), \
 	MIT (few source files, see LICENSES/README.md), \
 	OFL-1.1 (Heebo fonts)
 SYSTEMD_LICENSE_FILES = \
@@ -40,6 +41,7 @@ SYSTEMD_LICENSE_FILES = \
 	LICENSES/LGPL-2.0-or-later.txt \
 	LICENSES/Linux-syscall-note.txt \
 	LICENSES/lookup3-public-domain.txt \
+	LICENSES/MIT-0.txt \
 	LICENSES/MIT.txt \
 	LICENSES/murmurhash2-public-domain.txt \
 	LICENSES/OFL-1.1.txt \
@@ -61,7 +63,13 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
+	-Ddbus=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddefault-compression='auto' \
 	-Ddefault-hierarchy=unified \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
+	-Dfirst-boot-full-preset=false \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
@@ -72,6 +80,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
 	-Dmode=release \
+	-Dnspawn-locale='C.UTF-8' \
 	-Dnss-systemd=true \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
@@ -82,6 +91,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsysupdate=false \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
@@ -558,7 +568,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
 SYSTEMD_CONF_OPTS += \
 	-Defi=true \
 	-Dgnu-efi=true \
-	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=bfd \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
@@ -798,6 +807,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbinfmt=false \
 	-Drepart=false \
 	-Dcoredump=false \
+	-Ddbus=false \
+	-Ddbus-interfaces-dir=no \
 	-Dpstore=false \
 	-Doomd=false \
 	-Dlogind=false \
@@ -806,6 +817,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmachined=false \
 	-Dportabled=false \
 	-Dsysext=false \
+	-Dsysupdate=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnetworkd=false \
diff --git a/system/Config.in b/system/Config.in
index deb464f4d0..6100d965e7 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,19 +124,19 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
