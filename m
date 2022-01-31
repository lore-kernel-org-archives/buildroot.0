Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506B1C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 18:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E9D83F76;
	Mon, 31 Jan 2022 18:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqai8R9MvPbx; Mon, 31 Jan 2022 18:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DB283E05;
	Mon, 31 Jan 2022 18:16:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 375F81BF2B7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3369083E05
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpKagtPzhYrv for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 18:16:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 16D9383486
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 18:16:39 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id p63so17184094iod.11
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 10:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ZYUCkRdxS2DTUaG84YffX3Ugbq8NZRnBhb7S4jCvZk=;
 b=ARGnuNJ2cOiIkOvrH8k4kaTOQrOzcND2dbG2z0w1JSsGM6+Pmm5DiDSYy04f+3AJFl
 dXHETb4W6ceZzZrWvF5FPEiNTPEKtGsnsmHXuyNfxppMGq4LSXk1XRfLOSbMlZVmdBwL
 +bi8hdEF7GSlwgy4/iTjZ3+5cLa/wDqdlZa7yCAPl1nlHxUo7cfSBaQucutnWU4F1JC2
 WgGeEugvvJqnTibn7JOaT7O0jL6c6+KQLwnQK2BaqH1YucgcmWlIfHfEup8lrdlAb4PX
 u5nhLem14LG4OGfgbGU0zEqgtM5YOsL/WVwbHSg8Jhlf2zr7f3Ysj1+vaH0KWX37nEtd
 ESKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ZYUCkRdxS2DTUaG84YffX3Ugbq8NZRnBhb7S4jCvZk=;
 b=ACoXFQCciYh940qGaGeo40Aw8B5PyIHzL2Xx4Sk8Qeoh++kME6iY2sZWKGmiKwfDMT
 x9qlo+t43tdSoKRNj1JhC2sY/H0P5mnnJc9ORJEWeuVFYF+OuEfTbPR+5QCU9JQ6FJC/
 QqKspGXqyNNe/x3q+0crqB3DIWMv5U75o2qkOpoSMB4hecWpDhxJF9EoQOJp7p3LVCDk
 Z9nBHyU5CtcaD2RKuBNy5YO6QElhkjPTNYLTPUyyJUrmv2GR/rWOyWrFEq6HQAMQndWq
 lG3dUvWAPae1DAvRGQGpdwP7cvr12LBbZ4xQsSmyxWNRuqe+xLXUlQWNplPO6x01IY0V
 OeTA==
X-Gm-Message-State: AOAM5307mV9FcpxQ9dYEbtiTg/QaRO9RnJ9xIfxsAE7Zoxayu/+OrasG
 5sM+Qv1gMYXVwVxJpSb3yfXJL4Jumx0=
X-Google-Smtp-Source: ABdhPJxgTNS2FpndbRoNh8VLuTvFctLMYqIUbu0wYqUPjSbBDChdk59Wrsm6NInPlmwcxEtPTC0pBg==
X-Received: by 2002:a5d:884b:: with SMTP id t11mr11456509ios.53.1643652997616; 
 Mon, 31 Jan 2022 10:16:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r9sm8658540iov.26.2022.01.31.10.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:16:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:16:35 -0700
Message-Id: <20220131181635.4165602-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/bpftool: new package
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
index 0000000000..a642759a96
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
+		-C $(@D)/src DESTDIR="$(TARGET_DIR)" prefix=/usr
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
