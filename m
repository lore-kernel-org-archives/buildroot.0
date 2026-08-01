Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5175FC55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 14:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAA7D80A67;
	Sat,  1 Aug 2026 14:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu7fUWFZZ__8; Sat,  1 Aug 2026 14:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 799D880D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785593887;
	bh=ZsmnTOzWUbnhIRNo1fHwXN08KZujJkFSozA7ltePpug=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ihjOCHdIPEnBNDuQyk7R7GhjlfSzb/3Qv349AP/nwF+hfjFRYZkoezw2NTwKEwFPE
	 cxEP7G6VsKeicO9a5mi+qN2dP9jrpo+WGFxH5tZL/L0BusRU8v4iOb8FP4MurQpc1e
	 VDBeSZD9/G9eUg7U7Ty+0HVB/+UMzgBOtcdDieN66CU7+Ap2ejwSo2bEsXNzWBwJlJ
	 /SNQ5VWkmRvd6j8OWbQsxKWkRb1Q2eZo5NU+K4AwOTscaTK+wM+BH4sJXJztg1HHyy
	 btyLwdsjbw8sqPZz/zB62OTn5IEkK3s0YT4ryWN+l09zSmwagIouZuhNnVCn3DgKu1
	 /s1jYbVxi7wWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 799D880D64;
	Sat,  1 Aug 2026 14:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E79F032E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A3D80D64
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04LK2DTi5yx6 for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 14:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2795780A67
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2795780A67
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 757668707D; Sat,  1 Aug 2026 14:17:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 16:07:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af3e7a4b128688bc89d814cfa0f8c28ff2735510
X-Git-Newrev: 46b5c95647577febda3cc4556fc1e7eed017bce5
X-Patchwork-Hint: ignore
Message-Id: <20260801141720.757668707D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: bump to 4.21.1
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
Content-Type: multipart/mixed; boundary="===============2031610060375298143=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2031610060375298143==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46b5c95647577febda3cc4556fc1e7eed017bce5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump Xen from 4.19.5 to 4.21.1.

Resolved in version bump:
- 0002-Arm-platforms-fix-build-with-gcc15.patch
  Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=39f95089e2ba15c5438ce904c0cbbd8d79d3e6e7

The git-checkout.sh fix for non-master branch checkout is now included:
  https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commitdiff;h=01fb23dd71006d87e874f310e9c50f31582f274e

Remaining patches refreshed for updated context:
- 0001-No-trace-backend.patch (Buildroot specific, cross-compile workaround)
- 0002-Update-linker-flags.patch (Buildroot specific, cross-compile workaround)

Starting with Xen 4.20, qemu-xen is no longer bundled in the release
tarball. Add a new qemu-xen package that provides the qemu-xen source
tree with required meson subprojects pre-populated. This avoids any
network access during the build.

New dependencies:
- qemu-xen (provides qemu-xen source for tools build)
- host-python-distlib (needed by QEMU's mkvenv)

The qemu-xen package:
- Fetches qemu-xen via git (without recursive submodules to avoid
  massive ROM downloads)
- Pre-populates required meson subprojects (keycodemapdb,
  berkeley-softfloat-3, berkeley-testfloat-3) from gitlab archives
- Applies packagefiles overlays (meson.build) for subprojects that
  need them
- Removes .wrap files for unused subprojects to prevent any network
  access attempts during the build
- Patches xen_native.h #error to #warning for cross-compile

Tested with:
    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_xen.TestXenAarch64
    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_xen.TestXenArmv7

Both aarch64 and arm32 runtime tests pass.

Quick build defconfig used for iteration:
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
    BR2_PACKAGE_XEN=y
    BR2_PACKAGE_XEN_HYPERVISOR=y
    BR2_PACKAGE_XEN_TOOLS=y
    # BR2_TARGET_ROOTFS_TAR is not set

Related prior attempts:
  https://patchwork.ozlabs.org/project/buildroot/patch/20260211055138.719459-1-matthew.l.weber@gmail.com/
  https://patchwork.ozlabs.org/project/buildroot/patch/20251007164756.893264-1-titouan.christophe@mind.be/

Cc: Neal Frager <neal.frager@amd.com>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Cc: John Ernberg <john.ernberg@actia.se>
Signed-off-by: Matthew Weber <mathew.l.weber3@boeing.com>
[Julien:
 - update qemu-xen package url in Config.in
 - split XEN_DEPENDENCIES lines
 - add COPYING license hash in qemu-xen.hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu-xen/Config.in                         |  9 ++++
 package/qemu-xen/qemu-xen.hash                     |  6 +++
 package/qemu-xen/qemu-xen.mk                       | 57 ++++++++++++++++++++++
 package/xen/0001-No-trace-backend.patch            |  2 +-
 .../0002-Arm-platforms-fix-build-with-gcc15.patch  | 46 -----------------
 ...-flags.patch => 0002-Update-linker-flags.patch} | 10 +++-
 package/xen/Config.in                              |  3 ++
 package/xen/xen.hash                               |  4 +-
 package/xen/xen.mk                                 | 32 ++++++++++--
 9 files changed, 115 insertions(+), 54 deletions(-)

diff --git a/package/qemu-xen/Config.in b/package/qemu-xen/Config.in
new file mode 100644
index 0000000000..944f334f41
--- /dev/null
+++ b/package/qemu-xen/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QEMU_XEN
+	bool "qemu-xen"
+	help
+	  The qemu-xen source tree, a QEMU fork maintained by the Xen
+	  project for use as the device model in Xen tool stacks.
+	  Starting with Xen 4.20, this is no longer bundled in the Xen
+	  release tarball.
+
+	  https://xenbits.xen.org/gitweb/?p=qemu-xen.git
diff --git a/package/qemu-xen/qemu-xen.hash b/package/qemu-xen/qemu-xen.hash
new file mode 100644
index 0000000000..318dcd8a74
--- /dev/null
+++ b/package/qemu-xen/qemu-xen.hash
@@ -0,0 +1,6 @@
+# Locally computed
+sha256  631aae8cab7e9688256d705f63e203c9b8f30c6574239a7fdaea8ccb6cdd2551  qemu-xen-e064f42c80be6f6ff8c12dcb2a663bdf70f965f6-git4.tar.gz
+sha256  d014b53382dbb17b8196ad12f50de7f20d0ef1b9f7d54b0be51a6cbb14209195  keycodemapdb-f5772a62ec52591ff6870b7e8ef32482371f22c6.tar.gz
+sha256  faae889814ea6a292f7ca03d9b36e6c7e95bab2a64777804883cc822b8d48757  berkeley-softfloat-3-b64af41c3276f97f0e181920400ee056b9c88037.tar.gz
+sha256  e7a09d51dc7e96cb8422c919c85fc3833d4f788567638c9162ef5cd7db59b1df  berkeley-testfloat-3-e7af9751d9f9fd3b47911f51a5cfd08af256a9ab.tar.gz
+sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
diff --git a/package/qemu-xen/qemu-xen.mk b/package/qemu-xen/qemu-xen.mk
new file mode 100644
index 0000000000..8414fa75ae
--- /dev/null
+++ b/package/qemu-xen/qemu-xen.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# qemu-xen
+#
+################################################################################
+
+# We do NOT use GIT_SUBMODULES = YES because qemu-xen has massive ROM
+# submodules (edk2, u-boot, etc.) that are not needed for the Xen tools
+# cross-build. Instead, we pre-populate only the required meson
+# subprojects and remove .wrap files for the rest to prevent any network
+# access during the build.
+
+# Determined from Xen repo's hash for this repo @ XEN_VERSION
+QEMU_XEN_VERSION = e064f42c80be6f6ff8c12dcb2a663bdf70f965f6
+QEMU_XEN_SITE = https://xenbits.xen.org/git-http/qemu-xen.git
+QEMU_XEN_SITE_METHOD = git
+QEMU_XEN_LICENSE = GPL-2.0
+QEMU_XEN_LICENSE_FILES = COPYING
+QEMU_XEN_REDISTRIBUTE = NO
+
+# Required meson subprojects for the QEMU build
+QEMU_XEN_KEYCODEMAPDB_VERSION = f5772a62ec52591ff6870b7e8ef32482371f22c6
+QEMU_XEN_SOFTFLOAT3_VERSION = b64af41c3276f97f0e181920400ee056b9c88037
+QEMU_XEN_TESTFLOAT3_VERSION = e7af9751d9f9fd3b47911f51a5cfd08af256a9ab
+
+QEMU_XEN_EXTRA_DOWNLOADS = \
+	https://gitlab.com/qemu-project/keycodemapdb/-/archive/$(QEMU_XEN_KEYCODEMAPDB_VERSION)/keycodemapdb-$(QEMU_XEN_KEYCODEMAPDB_VERSION).tar.gz \
+	https://gitlab.com/qemu-project/berkeley-softfloat-3/-/archive/$(QEMU_XEN_SOFTFLOAT3_VERSION)/berkeley-softfloat-3-$(QEMU_XEN_SOFTFLOAT3_VERSION).tar.gz \
+	https://gitlab.com/qemu-project/berkeley-testfloat-3/-/archive/$(QEMU_XEN_TESTFLOAT3_VERSION)/berkeley-testfloat-3-$(QEMU_XEN_TESTFLOAT3_VERSION).tar.gz
+
+define QEMU_XEN_INSTALL_SUBPROJECTS
+	rm -rf $(@D)/subprojects/keycodemapdb
+	mkdir -p $(@D)/subprojects/keycodemapdb
+	$(TAR) --strip-components=1 -C $(@D)/subprojects/keycodemapdb \
+		-xf $(QEMU_XEN_DL_DIR)/keycodemapdb-$(QEMU_XEN_KEYCODEMAPDB_VERSION).tar.gz
+	rm -rf $(@D)/subprojects/berkeley-softfloat-3
+	mkdir -p $(@D)/subprojects/berkeley-softfloat-3
+	$(TAR) --strip-components=1 -C $(@D)/subprojects/berkeley-softfloat-3 \
+		-xf $(QEMU_XEN_DL_DIR)/berkeley-softfloat-3-$(QEMU_XEN_SOFTFLOAT3_VERSION).tar.gz
+	cp -f $(@D)/subprojects/packagefiles/berkeley-softfloat-3/* \
+		$(@D)/subprojects/berkeley-softfloat-3/
+	rm -rf $(@D)/subprojects/berkeley-testfloat-3
+	mkdir -p $(@D)/subprojects/berkeley-testfloat-3
+	$(TAR) --strip-components=1 -C $(@D)/subprojects/berkeley-testfloat-3 \
+		-xf $(QEMU_XEN_DL_DIR)/berkeley-testfloat-3-$(QEMU_XEN_TESTFLOAT3_VERSION).tar.gz
+	cp -f $(@D)/subprojects/packagefiles/berkeley-testfloat-3/* \
+		$(@D)/subprojects/berkeley-testfloat-3/
+	# Remove .wrap files for subprojects we do NOT pre-provide to prevent
+	# meson from attempting any network access during the build.
+	rm -f $(@D)/subprojects/dtc.wrap
+	rm -f $(@D)/subprojects/libblkio.wrap
+	rm -f $(@D)/subprojects/libvfio-user.wrap
+	rm -f $(@D)/subprojects/slirp.wrap
+endef
+QEMU_XEN_POST_EXTRACT_HOOKS += QEMU_XEN_INSTALL_SUBPROJECTS
+
+$(eval $(generic-package))
diff --git a/package/xen/0001-No-trace-backend.patch b/package/xen/0001-No-trace-backend.patch
index dd9924645e..5bd2e30b76 100644
--- a/package/xen/0001-No-trace-backend.patch
+++ b/package/xen/0001-No-trace-backend.patch
@@ -16,7 +16,7 @@ diff --git a/tools/Makefile b/tools/Makefile
 index 7d172117..a9a3196e 100644
 --- a/tools/Makefile
 +++ b/tools/Makefile
-@@ -217,13 +217,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
+@@ -162,13 +162,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
  	fi; \
  	mkdir -p qemu-xen-build; \
  	cd qemu-xen-build; \
diff --git a/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch b/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
deleted file mode 100644
index 1b48026276..0000000000
--- a/package/xen/0002-Arm-platforms-fix-build-with-gcc15.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d12666d74dc742bb06c30b96d6b874a3e14c6b46 Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Tue, 26 Aug 2025 08:41:18 +0200
-Subject: [PATCH] Arm/platforms: fix build with gcc15
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-For two of the headers gcc15 complains "header guard ... followed by
-'#define' of a different macro". Misra certainly wouldn't have liked
-this either, if these headers were covered by a scan.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Acked-by: Michal Orzel <michal.orzel@amd.com>
-Upstream: https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=39f95089e2ba15c5438ce904c0cbbd8d79d3e6e7
-Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
----
- xen/arch/arm/include/asm/platforms/midway.h | 2 +-
- xen/arch/arm/include/asm/platforms/omap5.h  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xen/arch/arm/include/asm/platforms/midway.h b/xen/arch/arm/include/asm/platforms/midway.h
-index 099e435..6914393 100644
---- a/xen/arch/arm/include/asm/platforms/midway.h
-+++ b/xen/arch/arm/include/asm/platforms/midway.h
-@@ -1,5 +1,5 @@
- #ifndef __ASM_ARM_PLATFORMS_MIDWAY_H
--#define __ASM_ASM_PLATFORMS_MIDWAY_H
-+#define __ASM_ARM_PLATFORMS_MIDWAY_H
- 
- /* addresses of SREG registers for resetting the SoC */
- #define MW_SREG_PWR_REQ             0xfff3cf00
-diff --git a/xen/arch/arm/include/asm/platforms/omap5.h b/xen/arch/arm/include/asm/platforms/omap5.h
-index c559c84..8867b45 100644
---- a/xen/arch/arm/include/asm/platforms/omap5.h
-+++ b/xen/arch/arm/include/asm/platforms/omap5.h
-@@ -1,5 +1,5 @@
- #ifndef __ASM_ARM_PLATFORMS_OMAP5_H
--#define __ASM_ASM_PLATFORMS_OMAP5_H
-+#define __ASM_ARM_PLATFORMS_OMAP5_H
- 
- #define REALTIME_COUNTER_BASE                   0x48243200
- #define INCREMENTER_NUMERATOR_OFFSET            0x10
--- 
-2.53.0
-
diff --git a/package/xen/0003-Update-linker-flags.patch b/package/xen/0002-Update-linker-flags.patch
similarity index 86%
rename from package/xen/0003-Update-linker-flags.patch
rename to package/xen/0002-Update-linker-flags.patch
index 7e91c6d2e5..ac02722781 100644
--- a/package/xen/0003-Update-linker-flags.patch
+++ b/package/xen/0002-Update-linker-flags.patch
@@ -6,10 +6,16 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+The -I$(XEN_ROOT)/tools/include added to QEMU's extra-cflags causes
+__XEN_INTERFACE_VERSION__ to be defined before xen_native.h is included,
+triggering an include-order assertion. Downgrade to a warning since the
+version is consistent in cross-compile.
+Ref: https://github.com/qemu/qemu/commit/e2abfe5ec6
+
 Upstream: Buildroot specific. This is a temporary patch for an intermediate bump.
 Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
 ---
- tools/Makefile                             | 29 +++++++++++++++++++++-
+ tools/Makefile                              | 29 ++++++++++++++++++++-
  tools/qemu-xen/include/hw/xen/xen_native.h |  2 +-
  2 files changed, 29 insertions(+), 2 deletions(-)
 
@@ -30,7 +36,7 @@ index a9a3196e..5d289651 100644
  SUBDIRS-$(OCAML_TOOLS) += ocaml
  
  ifeq ($(CONFIG_RUMP),y)
-@@ -236,8 +240,31 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
+@@ -189,8 +193,31 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
  		-DXC_WANT_COMPAT_GNTTAB_API=1 \
  		-DXC_WANT_COMPAT_MAP_FOREIGN_API=1 \
  		-DXC_WANT_COMPAT_DEVICEMODEL_API=1 \
diff --git a/package/xen/Config.in b/package/xen/Config.in
index dc4d434810..d63a3f6002 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -37,6 +37,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_BASH # runtime (scripts)
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
 	select BR2_PACKAGE_COREUTILS # runtime (stat)
+	select BR2_PACKAGE_QEMU_XEN
 	help
 	  The Xen tools can be accessed by the xl command.
 
@@ -44,4 +45,6 @@ comment "xen tools need a toolchain w/ wchar, threads, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
 
+source "package/qemu-xen/Config.in"
+
 endif
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 035f876ee1..c41f0fda60 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking pgp signature from:
-# https://downloads.xenproject.org/release/xen/4.19.5/xen-4.19.5.tar.gz.sig
+# https://downloads.xenproject.org/release/xen/4.21.1/xen-4.21.1.tar.gz.sig
 # with key 23E3222C145F4475FA8060A783FE14C957E82BD9
-sha256  8143ccc38982193142cc2e537a82d4e6b72d9053084372429e1d7ff0ed41ae2e  xen-4.19.5.tar.gz
+sha256  e2a69289d6d13c0a71d4f3a39a597741c85c0282d9af1ec5dac495bdcb2872bb  xen-4.21.1.tar.gz
 sha256  9eeacf4e4f91bdbcd16b3282bb86779e3122da032953ebccad4fccdfcf4cb3ac  COPYING
 sha256  aeab99f147957cd25fe8cc008992d5e5426ea73fb7d429923b5428a1ef1a59ce  LICENSES/GPL-2.0
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 5756dfc68c..75252d1123 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,14 +4,20 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.19.5
+XEN_VERSION = 4.21.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING LICENSES/GPL-2.0
 XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
-XEN_DEPENDENCIES = host-acpica host-meson host-pkgconf host-python3
+
+XEN_DEPENDENCIES = \
+	host-acpica \
+	host-meson \
+	host-pkgconf \
+	host-python3 \
+	host-python-distlib
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
@@ -26,6 +32,8 @@ XEN_CONF_OPTS = \
 	--with-initddir=/etc/init.d \
 	--disable-werror
 
+# Xen 4.20+ would normally fetch qemu-xen via git at build time; we
+# pre-provide it via the qemu-xen package instead.
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python3
 XEN_MAKE_ENV = \
 	XEN_TARGET_ARCH=$(XEN_ARCH) \
@@ -46,7 +54,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
 XEN_DEPENDENCIES += \
-	dtc libaio libglib2 ncurses openssl pixman slirp util-linux yajl
+	dtc \
+	libaio \
+	libglib2 \
+	ncurses \
+	openssl \
+	pixman \
+	qemu-xen \
+	slirp \
+	util-linux \
+	yajl
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 XEN_DEPENDENCIES += argp-standalone
 endif
@@ -54,6 +71,15 @@ XEN_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-tools
 XEN_MAKE_OPTS += dist-tools
 XEN_CONF_OPTS += --with-extra-qemuu-configure-args="--disable-sdl --disable-opengl"
 
+# Place the pre-downloaded qemu-xen source where the Xen build expects it.
+# This prevents Xen from trying to git-clone qemu-xen during the build.
+# Use cp -a (not symlink) so meson can write into subprojects/.
+define XEN_INSTALL_QEMU_XEN_SRC
+	rm -rf $(@D)/tools/qemu-xen
+	cp -a $(QEMU_XEN_DIR) $(@D)/tools/qemu-xen
+endef
+XEN_POST_EXTRACT_HOOKS += XEN_INSTALL_QEMU_XEN_SRC
+
 define XEN_INSTALL_INIT_SYSV
 	mv $(TARGET_DIR)/etc/init.d/xencommons $(TARGET_DIR)/etc/init.d/S50xencommons
 	mv $(TARGET_DIR)/etc/init.d/xen-watchdog $(TARGET_DIR)/etc/init.d/S50xen-watchdog

--===============2031610060375298143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2031610060375298143==--
