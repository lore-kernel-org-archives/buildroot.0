Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B536AC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71ADE61042;
	Tue,  6 Feb 2024 16:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71ADE61042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-Qj3r7LUt_4; Tue,  6 Feb 2024 16:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9616160BA1;
	Tue,  6 Feb 2024 16:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9616160BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4E31BF976
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 451D1612C5
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451D1612C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27WsWGV-JS4c for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62969612CB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62969612CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FD9687179; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:57:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11b439ce1bd28506051fff14646f8bbdbbbe58d8
X-Git-Newrev: f1bfab23d0cc024425a0b6d69a8cd6e7c6b50432
X-Patchwork-Hint: ignore
Message-Id: <20240206165731.4FD9687179@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============1794298696923730407=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1794298696923730407==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f1bfab23d0cc024425a0b6d69a8cd6e7c6b50432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package for building gcc for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  2 +
 package/gcc-bare-metal/13.2.0              |  1 +
 package/gcc-bare-metal/gcc-bare-metal.hash |  1 +
 package/gcc-bare-metal/gcc-bare-metal.mk   | 61 ++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f93746015..0a6e5a9c06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1387,6 +1387,7 @@ F:	package/python-rpi-gpio/
 
 N:	Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
+F:	package/gcc-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
@@ -2272,6 +2273,7 @@ F:	configs/zynqmp_zcu104_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
+F:	package/gcc-bare-metal/
 F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
diff --git a/package/gcc-bare-metal/13.2.0 b/package/gcc-bare-metal/13.2.0
new file mode 120000
index 0000000000..b7a75dc7dd
--- /dev/null
+++ b/package/gcc-bare-metal/13.2.0
@@ -0,0 +1 @@
+../gcc/13.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-metal/gcc-bare-metal.hash
new file mode 120000
index 0000000000..d417b0dc77
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.hash
@@ -0,0 +1 @@
+../gcc/gcc.hash
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
new file mode 100644
index 0000000000..f391f094fe
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -0,0 +1,61 @@
+################################################################################
+#
+# gcc-bare-metal
+#
+################################################################################
+
+HOST_GCC_BARE_METAL_VERSION = 13.2.0
+HOST_GCC_BARE_METAL_SITE = \
+	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
+HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
+
+HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+
+HOST_GCC_BARE_METAL_DEPENDENCIES = \
+	host-binutils-bare-metal \
+	host-gmp \
+	host-mpc \
+	host-mpfr \
+	host-isl
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+define GCC_BARE_METAL_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -sf ../configure $(@D)/build/configure
+endef
+
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
+HOST_GCC_BARE_METAL_SUBDIR = build
+
+HOST_GCC_BARE_METAL_MAKE_OPTS = \
+	$(HOST_GCC_COMMON_MAKE_OPTS) \
+	all-gcc \
+	all-target-libgcc
+
+HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
+
+HOST_GCC_BARE_METAL_CONF_OPTS = \
+	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+	--disable-initfini_array \
+	--disable-__cxa_atexit \
+	--disable-libstdcxx-pch \
+	--with-newlib \
+	--disable-threads \
+	--enable-plugins \
+	--with-gnu-as \
+	--disable-libitm \
+	--without-long-double-128 \
+	--without-headers \
+	--enable-languages=c \
+	--disable-multilib \
+	--with-gmp=$(HOST_DIR) \
+	--with-mpc=$(HOST_DIR) \
+	--with-mpfr=$(HOST_DIR) \
+	--with-isl=$(HOST_DIR) \
+	--with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
+	AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
+	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
+
+$(eval $(host-autotools-package))

--===============1794298696923730407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1794298696923730407==--
