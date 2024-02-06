Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BA1C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2904A60BA1;
	Tue,  6 Feb 2024 16:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2904A60BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mb9z1LAEAZsm; Tue,  6 Feb 2024 16:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F89A60B27;
	Tue,  6 Feb 2024 16:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F89A60B27
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E181BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C06441586
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C06441586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRZff_C1fhwM for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70502400E7
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70502400E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CF2087177; Tue,  6 Feb 2024 16:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:57:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1bfab23d0cc024425a0b6d69a8cd6e7c6b50432
X-Git-Newrev: 3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
X-Patchwork-Hint: ignore
Message-Id: <20240206165731.5CF2087177@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: new package
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
Content-Type: multipart/mixed; boundary="===============3188923288188518017=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3188923288188518017==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3b95ff658bf4859eb5cffd28cbbedd1826fad9a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package for building newlib for a bare-metal toolchain.
The cpu architecture is defined by a toolchain-bare-metal virtual package.
While any cpu architecture could be used, the default configuration will be a
Xilinx microblaze little endian architecture, so that buildroot will be able
to build the microblaze firmware applications for zynqmp and versal.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  2 +
 package/newlib-bare-metal/Config.in              |  2 +
 package/newlib-bare-metal/newlib-bare-metal.hash |  8 ++++
 package/newlib-bare-metal/newlib-bare-metal.mk   | 52 ++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0a6e5a9c06..c103bdadf8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1388,6 +1388,7 @@ F:	package/python-rpi-gpio/
 N:	Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
 F:	package/binutils-bare-metal/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
 N:	Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
@@ -2274,6 +2275,7 @@ F:	configs/zynqmp_zcu106_defconfig
 F:	package/binutils-bare-metal/
 F:	package/bootgen/
 F:	package/gcc-bare-metal/
+F:	package/newlib-bare-metal/
 F:	package/versal-firmware/
 F:	toolchain/toolchain-bare-metal-buildroot/
 
diff --git a/package/newlib-bare-metal/Config.in b/package/newlib-bare-metal/Config.in
new file mode 100644
index 0000000000..1ff3d5d8ec
--- /dev/null
+++ b/package/newlib-bare-metal/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_NEWLIB_BARE_METAL
+	bool
diff --git a/package/newlib-bare-metal/newlib-bare-metal.hash b/package/newlib-bare-metal/newlib-bare-metal.hash
new file mode 100644
index 0000000000..f8c553cf86
--- /dev/null
+++ b/package/newlib-bare-metal/newlib-bare-metal.hash
@@ -0,0 +1,8 @@
+# Locally calculated
+sha256  0c166a39e1bf0951dfafcd68949fe0e4b6d3658081d6282f39aeefc6310f2f13  newlib-4.4.0.20231231.tar.gz
+
+# Hashes for license files locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  f3b7f3e4426b1fa6f60198dae7adfedd94b77b28db2d108adc0253575011e0ff  COPYING.LIBGLOSS
+sha256  422aa40293093fb54fc66e692a0d68fd0b24ed5602e5d1d33ad05ba3909057e9  COPYING.NEWLIB
diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk b/package/newlib-bare-metal/newlib-bare-metal.mk
new file mode 100644
index 0000000000..452bc4da25
--- /dev/null
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# newlib-bare-metal
+#
+################################################################################
+
+NEWLIB_BARE_METAL_VERSION = 4.4.0
+NEWLIB_BARE_METAL_SITE = ftp://sourceware.org/pub/newlib
+NEWLIB_BARE_METAL_SOURCE = newlib-$(NEWLIB_BARE_METAL_VERSION).20231231.tar.gz
+NEWLIB_BARE_METAL_DEPENDENCIES = host-gcc-bare-metal
+NEWLIB_BARE_METAL_ADD_TOOLCHAIN_DEPENDENCY = NO
+NEWLIB_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+NEWLIB_BARE_METAL_LICENSE_FILES = \
+	COPYING \
+	COPYING.LIB \
+	COPYING.LIBGLOSS \
+	COPYING.NEWLIB
+
+NEWLIB_BARE_METAL_INSTALL_STAGING = YES
+NEWLIB_BARE_METAL_INSTALL_TARGET = NO
+
+define NEWLIB_BARE_METAL_CONFIGURE_CMDS
+	(cd $(@D) && \
+		PATH=$(BR_PATH) \
+		./configure \
+			--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
+			--prefix=/usr \
+			--enable-newlib-io-c99-formats \
+			--enable-newlib-io-long-long \
+			--enable-newlib-io-float \
+			--enable-newlib-io-long-double \
+			--disable-multilib \
+	)
+endef
+
+define NEWLIB_BARE_METAL_BUILD_CMDS
+	PATH=$(BR_PATH) $(MAKE1) -C $(@D)
+endef
+
+define NEWLIB_BARE_METAL_INSTALL_STAGING_CMDS
+	PATH=$(BR_PATH) $(MAKE1) -C $(@D) DESTDIR=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) install
+endef
+
+define NEWLIB_BARE_METAL_FIXUP
+	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/include \
+		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/include
+	mv $(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)/lib \
+		$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT)/usr/lib
+endef
+NEWLIB_BARE_METAL_POST_INSTALL_STAGING_HOOKS += NEWLIB_BARE_METAL_FIXUP
+
+$(eval $(generic-package))

--===============3188923288188518017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3188923288188518017==--
