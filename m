Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64284C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E64B660BCB;
	Fri,  3 Dec 2021 21:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCx1m-UZwEf8; Fri,  3 Dec 2021 21:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69B860BC2;
	Fri,  3 Dec 2021 21:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5641BF2CA
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AF7340270
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 21:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-qTnjFeZQJT for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 21:54:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26C5E4013F
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 21:54:49 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d24so8646512wra.0
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 13:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Da4kqTg1jd45mCIk/Q7kpHRtQGrnm7Onm519zgIVLPM=;
 b=E0hKsip4Aozr9ub59A7U3ifoHEg5rkAzdNX8WfVYWclHL9Kiei2E6oRyUxVpeGNiF2
 4OsH1uwrDfOPD9jiklmaSfQjuQoLMIrcwB1IM3CRxZ4oz0Q6QXGTlWJdiL0hgYraq08Q
 tP/C+mN8Fm4W40eP6xERe1KSDLXOwkZTCbtrEuhtV2VPXKeSAyN+FYxq+b3mm2Nqnopt
 4I+HSDYfZ8u3xREHDiJ81T4p1niH0HCGY6HSgSChKHGaVLbUbMlxFfZNLgozFQolkBk4
 GMr9uI3vVA2j6LuUNzEWDqAMvQq6+qLf1AVaqjUeooF9+2EB5A3LB6ZPTY7hvkZb11CF
 JkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Da4kqTg1jd45mCIk/Q7kpHRtQGrnm7Onm519zgIVLPM=;
 b=h9TC5cDZ8hdVPGI+xrxZE9AukDF55hDgwpssm82ZaYOFTQLTTK0H1vypHK0jJtcL3p
 xDiTHBfdPd/w8/y3MC53Dh3UlOglPziXrqcYF4GnWfjYRZVWa5V9+xOdL7TtFrc67FTz
 w2XRUvGuKEgsq4f4Fjt7COf+XJq4682/zPrgkVWf91ZVnqiJFOMyn6XGobwubudZQajM
 1huLmhYHjMvt+0rV0Ud/57/0zLMvfu0r9cTNKmkyIuTfwD9n/PPm1GBY1bE+sZqAd0nZ
 5CokX1lFSJRfr/zPlbroH6nEDgN/+oBijwLR6DND5Cm1ct8/TyKlsTLbC0L/5j7mPAOt
 tp+A==
X-Gm-Message-State: AOAM530/9tMOdVkACgJ7YxVmULlxdFcqx6ihWr+Zi5FN94JB7czEna17
 y0bPIke9cmjPHjXrMWTyGyY6/5Wc62gRPVnY
X-Google-Smtp-Source: ABdhPJzJ5ogQjgS0ZwS9CGc5SWiw1nW+vCgLMckz7qJXrn69+8f9rQHQN0YycowV8Qx8o3FGWBaTCg==
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr23978089wrp.56.1638568487268; 
 Fri, 03 Dec 2021 13:54:47 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id q24sm5966889wmj.21.2021.12.03.13.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 13:54:46 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Dec 2021 22:54:38 +0100
Message-Id: <20211203215438.213437-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211203215438.213437-1-nolange79@gmail.com>
References: <20211203215438.213437-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/pkg-meson: improve generation of
 cross-compilation file
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
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed a few variables, as they were only used to communicate
between the meson package and pkg-meson.mk and are not needed
anymore.

Moved cross-compilation.conf.in out of meson package.

Creating the cross-compilation.conf files for packages is now
using the original template.
To avoid duplicate code, the common sed pattern is stored in
a make variable.

Use explicit Buildroot variables for compiler tools,
and some fixes. (TARGET_LDFLAGS and TARGET_CXXFLAGS
were mixed up with PKG_TARGET_CFLAGS)

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v2->v3:
-   rebase

v1->v2:
-   squash 2 commits, really hard to separate as moving and renaming
    variables from 2 to one location affects alot code.
-   use TOOLCHAIN_POST_INSTALL_STAGING_HOOKS again.
-   consistently use double quotes for sed patterns

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-meson.mk                          | 58 +++++++++----------
 .../misc}/cross-compilation.conf.in           | 10 ++--
 2 files changed, 33 insertions(+), 35 deletions(-)
 rename {package/meson => support/misc}/cross-compilation.conf.in (84%)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 4914486665..77dc2b46b0 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -67,19 +67,9 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
-	sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
-	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
-	    -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
-	    -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
-	    -e "s%@TARGET_CFLAGS@%$$(call make-sq-comma-list,$$($(2)_CFLAGS))%g" \
-	    -e "s%@TARGET_LDFLAGS@%$$(call make-sq-comma-list,$$($(2)_LDFLAGS))%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$$(call make-sq-comma-list,$$($(2)_CXXFLAGS))%g" \
-	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
-	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
-	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
-	    -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
+	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
-	    package/meson/cross-compilation.conf.in \
+	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS) \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
@@ -223,31 +213,39 @@ else
 PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
-HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
-HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
+# Generates sed patterns for patching the cross-compilation.conf template,
+# since Flags might contain commas the arguments are passed indirectly by
+# variable name (stripped to deal with whitespaces).
+# Arguments are variable containing cflags, cxxflags, ldflags.
+define PKG_MESON_CROSSCONFIG_SED
+        -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
+        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
+        -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
+        -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
+        -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
+        -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
+        -e "s%@TARGET_ENDIAN@%$(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))%g" \
+        -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
+        -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
+        -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
+        -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
+        -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
+        $(TOPDIR)/support/misc/cross-compilation.conf.in
+endef
 
 # Generate a Meson cross-compilation.conf suitable for use with the
 # SDK; also install the file as a template for users to add their
 # own flags if they need to.
 define PKG_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
-	sed -e 's%@TARGET_CROSS@%$(TARGET_CROSS)%g' \
-	    -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
-	    -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
-	    -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
-	    -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
-	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
-	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
-	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
-	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
+	sed -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_LDFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CXXFLAGS@%g" \
+	    $(call PKG_MESON_CROSSCONFIG_SED) \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
-	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
-	    -e 's%@PKG_TARGET_LDFLAGS@%%g' \
-	    -e 's%@PKG_TARGET_CXXFLAGS@%%g' \
-	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
+	sed $(call PKG_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
-TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
diff --git a/package/meson/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
similarity index 84%
rename from package/meson/cross-compilation.conf.in
rename to support/misc/cross-compilation.conf.in
index 7a7ece97ae..18cf258a8e 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -4,11 +4,11 @@
 # - Buildroot's 'target' is Meson's 'host'
 
 [binaries]
-c = '@TARGET_CROSS@gcc'
-cpp = '@TARGET_CROSS@g++'
-ar = '@TARGET_CROSS@ar'
-strip = '@TARGET_CROSS@strip'
-pkgconfig = '@HOST_DIR@/bin/pkgconf'
+c = '@TARGET_CC@'
+cpp = '@TARGET_CXX@'
+ar = '@TARGET_AR@'
+strip = '@TARGET_STRIP@'
+pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
