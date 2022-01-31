Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77CFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 18:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6029460F05;
	Mon, 31 Jan 2022 18:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcGQHnPQvMf3; Mon, 31 Jan 2022 18:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655F160EF9;
	Mon, 31 Jan 2022 18:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB5E1BF2B7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 082A760EF9
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mckp-wyoAf2N for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 18:51:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E674860750
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 18:51:57 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id i2so3515729ilm.12
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 10:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RHjP+9/p/1wszGbOc/szFLhMgHEAUCf6DjjWtt1qgs=;
 b=A1KMp8wUvJAJIvRAnS+5AgsY8nPYSCf68AzD7LPTRg3cgVnRQQR/XjqFB/p1PP3aQU
 VkMT+nYFXeXIHNZlgr9Q0pao3EfiJgENt9sTIuks/y/5XOA0YyKhhBlMv7X3x4yoJCe2
 FfQ/lUEl+OMe46KP64kJWhbqv2k2qQw+vWWIl3G1jsLF/+qBwzVod20ID/hctocw7/rT
 TiIPDmCxX7WPRKnmlpUM5hOP/Ud3WqVgbLw+yiTi8iwAkAsO198iymO6pts3Da4wk5kl
 bqaPbANXKSoDZRWFk44JIARXB+QfR6bAYHotxHLxDo35huqCYrFxMMrzvAv6WnfWj5YJ
 m+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RHjP+9/p/1wszGbOc/szFLhMgHEAUCf6DjjWtt1qgs=;
 b=PZUuNuf0vYkYOHrOjDdW1Iy76YvZEKirsgCcJm+9sHjs70r/pcD3lHYdJosY0iMgz3
 tpB93Bp5eyNhV6DWMaUA4uhyp0g9+rSW26KLzKdWoQ3XL8d9GdHZm0dquzXGA5koI67v
 s0ptcC731uWoVzw1yJ9YATA29sfWPL2Y6NprrBOonA749giU2Nk+fOKNCtn1VgGPT0LQ
 E6IvohaNUnhsRhVdKoekEzmWpaioKlXLQy4Ly9J0Wo0a327X9mH2SWAk6jVFQs5uN6YP
 KJW6P4lghVUhL8klIT87tgMsiXXf3aOAkaoTTybhUyJsBTlc3wTOb6PCXNdAWL8GfsJi
 AjgA==
X-Gm-Message-State: AOAM533BjFxJGI2cb59AFOHKA1N/jyC+msB7yww5hxlNBtPn+5udCaQn
 gbzlti0P1LZOtWxVEgIIa44/+wxl9pI=
X-Google-Smtp-Source: ABdhPJzN3Ai4Bg6c47s7lfnLWCBQu6p8VY5uZcNbAm9Dc1VJdMthGw9kekJiVLaQP01SYiMjPFxEVA==
X-Received: by 2002:a05:6e02:1c23:: with SMTP id
 m3mr12900104ilh.258.1643655116811; 
 Mon, 31 Jan 2022 10:51:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id g11sm17932195iom.45.2022.01.31.10.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:51:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:51:54 -0700
Message-Id: <20220131185154.26343-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/bpftool: new package
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
Changes v3 -> v4:
  - remove linux-tools bpftool kconfig entry
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
 package/linux-tools/Config.in                | 22 ----------
 package/linux-tools/linux-tool-bpftool.mk.in | 37 ----------------
 8 files changed, 78 insertions(+), 59 deletions(-)
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
diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 28641dccdd..f459b41762 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -5,28 +5,6 @@ menu "Linux Kernel Tools"
 config BR2_PACKAGE_LINUX_TOOLS
 	bool
 
-config BR2_PACKAGE_LINUX_TOOLS_BPFTOOL
-	bool "bpftool"
-	depends on !BR2_nios2 # binutils
-	depends on BR2_USE_WCHAR # binutils, elfutils
-	depends on !BR2_STATIC_LIBS # elfutils
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
-	select BR2_PACKAGE_LINUX_TOOLS
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_ELFUTILS
-	help
-	  bpftool is a tool for for inspection and simple manipulation
-	  of eBPF programs and maps.
-
-	  These tools are available only from kernel version 4.15.
-
-comment "bpftool needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
-	depends on !BR2_nios2
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
 	select BR2_PACKAGE_LINUX_TOOLS
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
