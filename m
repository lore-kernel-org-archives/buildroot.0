Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB03C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 18:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C9D83E03;
	Mon, 31 Jan 2022 18:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Lq4pMTsqjAx; Mon, 31 Jan 2022 18:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332DE83DFA;
	Mon, 31 Jan 2022 18:23:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 308FA1BF2B7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D03140228
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:23:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kQEwy8LGHs1 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 18:23:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22482401CA
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 18:23:00 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id u5so12157124ilq.9
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBykz0LVBU6EEo0XYQl4MuP3mOSkSGmh4erFZemNF7I=;
 b=E1haz5fOPf2wav77ZUL90+Xwnz5XuV/zV+dQXqK7qca64uZTyKBnXa4Hqo1hwoP16y
 bYifw5EewavTerGb1k378rBsYVb/UskFLrkvjuPFoL4YZdolN+veSK6hc0qTSiBn/DZ1
 CPVGPqOGncDaZ5Y6M2AShbKOVfT/U6s0zf3/5niFVL+apeVQRhvLhicWL3TNGwZ1wSvv
 Sx6zWVnmWs6Z/NMYCcfrGCClFPKGTwEDL4OVFYm5V8WniZlG9MdD6ayu4+n3OpJVVDI4
 ZUhkx5HfKJZNZyMDU8oEmRm2T9uho+yMoczpQCbo7cZP2rhqfad5T9aVjpblIuR3nBUN
 hc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBykz0LVBU6EEo0XYQl4MuP3mOSkSGmh4erFZemNF7I=;
 b=e/JwNBpkaJ/sBypriHc/TvO4Pkt218CPIVev1tkaPDGiYy+PcvyWX1sWesKnVOxdvK
 F01tmqCJpSOgcDvtoRGAVhheh4TBfUrMZ5l8OaDfj78k4s0JUcUr2nX4e7kJbdJ1Myol
 Nc6wqHKJP1e63SmSzuniQsGBbEq6Flu4kdH8eB1ERrmzXpwjqDZ9E1WSbhhkz/IhSaCx
 q82qdZO5ZyrHt8PaA5CUvZzyQLilfV4Totln6JL17L2Nj9sukiDRjL05cOo4PSoK858G
 HZxczHtHSkhua31SLD29/0kUhMg6R29ASltwlgKYJKEKC6y6Gl5Sb0zbm2Kdfad9Yann
 76Kg==
X-Gm-Message-State: AOAM533ocNDme6q8EOVQPqkr6nQ7gMvaTFlDJ2poqB2POtzj21r8kb1u
 hWD1+wTltptMpnjc9kpKmaGSB6TofEY=
X-Google-Smtp-Source: ABdhPJzWyqBcRpcrwHi6GZIVq+fxEMMK+kmZQttAv9hPTEtEnyuHQHZgvSkCI9WEIYFQv/bSFb13uw==
X-Received: by 2002:a92:cd06:: with SMTP id z6mr13822217iln.216.1643653378982; 
 Mon, 31 Jan 2022 10:22:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r189sm15228702ior.2.2022.01.31.10.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:22:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:22:56 -0700
Message-Id: <20220131182256.4187299-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/bpftool: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move the target bpftool build out of linux-tools so that it is
up to date.

This also fixes build issues due to differences between kernel
versions. The latest version should be fully backwards compatible.

The host bpftool is needed for enabling features such as the systemd
bpf-framework(to be added in a future patch).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - fix target install
Changes v1 -> v2:
  - move target bpftool out of linux-tools into stand-alone build
---
 Config.in.legacy                             |  8 ++++
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/bpftool/Config.in                    | 18 ++++++++
 package/bpftool/bpftool.hash                 |  5 +++
 package/bpftool/bpftool.mk                   | 45 ++++++++++++++++++++
 package/linux-tools/linux-tool-bpftool.mk.in | 37 ----------------
 7 files changed, 78 insertions(+), 37 deletions(-)
 create mode 100644 package/bpftool/Config.in
 create mode 100644 package/bpftool/bpftool.hash
 create mode 100644 package/bpftool/bpftool.mk
 delete mode 100644 package/linux-tools/linux-tool-bpftool.mk.in

diff --git a/Config.in.legacy b/Config.in.legacy
index 62717463df..dce236b3b4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
+	bool "bpftool was moved"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BPFTOOL
+	help
+	  The linux-tools bpftool build has been moved out
+	  of the linux-tools package.
+
 config BR2_PACKAGE_RPI_BT_FIRMWARE
 	bool "rpi-bt-firmware package was renamed"
 	depends on BR2_arm || BR2_aarch64
diff --git a/DEVELOPERS b/DEVELOPERS
index a1ec9a091e..51b52871ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1282,6 +1282,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
+F:	package/bpftool/
 F:	package/exfatprogs/
 F:	package/gensio/
 F:	package/lua-std-debug/
diff --git a/package/Config.in b/package/Config.in
index e4ca195beb..dbdcc3919b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -86,6 +86,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/babeltrace2/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
+	source "package/bpftool/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/coremark/Config.in"
diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
new file mode 100644
index 0000000000..39475aa962
--- /dev/null
+++ b/package/bpftool/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_BPFTOOL
+	bool "bpftool"
+	depends on !BR2_nios2 # binutils
+	depends on BR2_USE_WCHAR # binutils, elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ELFUTILS
+	help
+	  bpftool is a tool for for inspection and simple manipulation
+	  of eBPF programs and maps.
+
+comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+	depends on !BR2_nios2
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
new file mode 100644
index 0000000000..c7d4ae250e
--- /dev/null
+++ b/package/bpftool/bpftool.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  c868cb85bf44195ec6cd20649c3db4f7aff64a38d950a1c2911d981fb2d7042c  bpftool-a7f0e7f057283ae8af3de4578bcb8b7ee80b7144-br1.tar.gz
+sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
new file mode 100644
index 0000000000..4276f91958
--- /dev/null
+++ b/package/bpftool/bpftool.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# bpftool
+#
+################################################################################
+
+BPFTOOL_VERSION = a7f0e7f057283ae8af3de4578bcb8b7ee80b7144
+BPFTOOL_SITE = https://github.com/libbpf/bpftool
+BPFTOOL_SITE_METHOD = git
+BPFTOOL_GIT_SUBMODULES = YES
+BPFTOOL_LICENSE = GPL-2.0, BSD-2-Clause
+BPFTOOL_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.GPL-2.0
+BPFTOOL_DEPENDENCIES = binutils elfutils
+HOST_BPFTOOL_DEPENDENCIES = host-elfutils host-pkgconf host-zlib
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+BPFTOOL_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+BPFTOOL_DEPENDENCIES += zlib
+endif
+
+define BPFTOOL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src
+endef
+
+define HOST_BPFTOOL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src
+endef
+
+define BPFTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install DESTDIR="$(TARGET_DIR)" prefix=/usr
+endef
+
+define HOST_BPFTOOL_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
+		-C $(@D)/src install DESTDIR="$(HOST_DIR)" prefix=/usr
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/linux-tools/linux-tool-bpftool.mk.in b/package/linux-tools/linux-tool-bpftool.mk.in
deleted file mode 100644
index 0c4d3693a3..0000000000
--- a/package/linux-tools/linux-tool-bpftool.mk.in
+++ /dev/null
@@ -1,37 +0,0 @@
-################################################################################
-#
-# bpftool
-#
-################################################################################
-
-LINUX_TOOLS += bpftool
-
-BPFTOOL_DEPENDENCIES = binutils elfutils
-
-ifeq ($(BR2_PACKAGE_LIBCAP),y)
-BPFTOOL_DEPENDENCIES += libcap
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-BPFTOOL_DEPENDENCIES += zlib
-endif
-
-BPFTOOL_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
-
-define BPFTOOL_BUILD_CMDS
-	$(Q)if ! grep install $(LINUX_DIR)/tools/bpf/bpftool/Makefile >/dev/null 2>&1 ; then \
-		echo "Your kernel version is too old and does not have install section in the bpf tools." ; \
-		echo "At least kernel 4.15 must be used." ; \
-		exit 1 ; \
-	fi
-
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
-		$(BPFTOOL_MAKE_OPTS)
-endef
-
-define BPFTOOL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/bpf/bpftool \
-		$(BPFTOOL_MAKE_OPTS) \
-		DESTDIR=$(TARGET_DIR) \
-		install
-endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
