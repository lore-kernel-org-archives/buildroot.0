Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F32AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 055C460AD7;
	Thu,  5 May 2022 20:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2kwaaB0x55r; Thu,  5 May 2022 20:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B179160AAD;
	Thu,  5 May 2022 20:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7A21BF342
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E20981D19
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1cJk1csAmFN for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:52:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50CA181D0B
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:52:06 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id d3so3630407ilr.10
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A7ZNU9rtAx1fEUMTiXUI1sNRyTVnqLqGWpZLINd3jGo=;
 b=ftAnNCx+YJ2XfRXG0YdZNCQzBit2BSM/PZ44YfOA+wCJJ6IIh5eRB43wHNti4cgLFo
 my8Rq2Uvwi8fF8o1aav0OfTHQHoHAl7oN2MUJZUaJUmg0gCQUyuLesoomUlsrU2c39Hq
 Va4bkE9DP4c6+esatMTpuBKHrsESsQro4ni5PYvwWqi/0PczqX9IIlUv7CVjkDGQ4rMQ
 OTABieEn14ge++cAkJAnoQ8yatWaxM0f4w0mbe3VXg8Q+7E/yxi9iErDM+Tqz6hedaQr
 NG9xhEhYQ6cG9R1dYgi8jE5+wBDaPNeItE22NlrnAzhfwQMHy/NX+lWMXR772xc6+99V
 PYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A7ZNU9rtAx1fEUMTiXUI1sNRyTVnqLqGWpZLINd3jGo=;
 b=yqU+4dZO67OixYV0xkl+ZjYs8TtmYzZiilBk4wQLzU0UaGt5MLycLfInuvlj8Ikyxc
 OKfjZJm6HtGNHaGSFO5whQXt2KICoGY/AXjX0PSvDF8xbor00EVLeX/fHVxmzL2HaZGD
 4+bMXTIahhuY7xvYs7mk76YRU94qu+cyHAI/Kmnvck2JY55iccDMCZYMOBJP1cOntcdJ
 fZePls8+/SVKiX3nUdXQ15IPSA/HJRQC1fx/zA1nA8nzMpyMd/zrrK16N3PJyMUCiAAC
 OTk3blpVr5836WPTKiCNbPP8QUs8fagJtlmG8FO5xzFzLpJh6VUY9rOza+H5wArSI/2M
 8opg==
X-Gm-Message-State: AOAM5334hxgtWsH1OLinL6Y2hAwPy82He8+XKY/ACIRSaYmpW/KsZWVx
 kcOSEb1pzWMAKQpiZiSU3f74NzAqjIo=
X-Google-Smtp-Source: ABdhPJwefobL0kgDKG8NPu+17+exbEh9aESRt/jNgtjdD9329QPEJ5nd1RXgJqnTKVBrVq84ReHgWQ==
X-Received: by 2002:a05:6e02:1cac:b0:2cf:55af:2dd9 with SMTP id
 x12-20020a056e021cac00b002cf55af2dd9mr6104ill.259.1651783925153; 
 Thu, 05 May 2022 13:52:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 ck19-20020a0566383f1300b0032b62accd1bsm757146jab.98.2022.05.05.13.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 13:52:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 14:52:03 -0600
Message-Id: <20220505205203.1079204-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of version 0.54.0 meson has had the ability to build and install
packages rather than having to run ninja directly as before.

This will allow us to use features such as meson install tags in
the future which require meson to be used for the installation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update docs
---
 docs/manual/adding-packages-meson.txt         |  4 +-
 .../gobject-introspection.mk                  |  4 +-
 package/pkg-meson.mk                          | 52 ++++++++++++++-----
 package/systemd/systemd.mk                    |  4 +-
 4 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 029c8c2488..c8aed65c2f 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -125,8 +125,8 @@ will therefore only use a few of them.
   +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
   +pkg_config_libdir+.
 
-* +FOO_NINJA_ENV+, to specify additional environment variables to pass to
-  +ninja+, meson companion tool in charge of the build operations. By default,
+* +FOO_MESON_ENV+, to specify additional environment variables to pass to
+  +meson+, meson tool in charge of the build/install operations. By default,
   empty.
 
 * +FOO_NINJA_OPTS+, to specify a space-separated list of targets to build. By
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 41d64171a7..ea5100247d 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -30,14 +30,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
 	host-python3
 
 # g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
-GOBJECT_INTROSPECTION_NINJA_ENV += \
+GOBJECT_INTROSPECTION_MESON_ENV += \
 	CC="$(TARGET_CC)"
 
 # When building, gobject-introspection uses tools/g-ir-scanner to build several
 # .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
 # links to the system-installed libglib2 path. To remedy this issue, defining
 # LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
-HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
+HOST_GOBJECT_INTROSPECTION_MESON_ENV += \
 	LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 9987fb73bb..3872c85d1c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -21,13 +21,13 @@
 ################################################################################
 
 #
-# Pass PYTHONNOUSERSITE environment variable when invoking Meson or Ninja, so
+# Pass PYTHONNOUSERSITE environment variable when invoking Meson, so
 # $(HOST_DIR)/bin/python3 will not look for Meson modules in
 # $HOME/.local/lib/python3.x/site-packages
 #
-MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
-NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
-NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+MESON              = PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
+MESON_BUILD_OPTS   = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+MESON_INSTALL_OPTS = --no-rebuild
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
 ifeq ($(BR2_arcle)$(BR2_arceb),y)
@@ -179,13 +179,23 @@ $(2)_DEPENDENCIES += host-meson
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+	$$(TARGET_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		compile \
+		$$(MESON_BUILD_OPTS) \
+		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+	$$(HOST_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		compile \
+		$$(MESON_BUILD_OPTS) \
+		$$(if $$($$(PKG)_NINJA_OPTS),--ninja-args $$($$(PKG)_NINJA_OPTS)) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 endif
@@ -196,8 +206,12 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+	$$(HOST_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		install \
+		$$(MESON_INSTALL_OPTS) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
@@ -207,8 +221,13 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+	$$(TARGET_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		install \
+		$$(MESON_INSTALL_OPTS) \
+		--destdir $$(STAGING_DIR) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
@@ -218,8 +237,13 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+	$$(TARGET_MAKE_ENV) \
+	$$($$(PKG)_MESON_ENV) \
+	$$(MESON) \
+		install \
+		$$(MESON_INSTALL_OPTS) \
+		--destdir $$(TARGET_DIR) \
+		-C $$($$(PKG)_SRCDIR)/build
 endef
 endif
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b309507e12..ea6f5febc2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -746,7 +746,7 @@ endef
 SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
-SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_MESON_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
@@ -849,8 +849,6 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-python-jinja2
 
-HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
-
 # Fix RPATH After installation
 # * systemd provides a install_rpath instruction to meson because the binaries
 #   need to link with libsystemd which is not in a standard path
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
