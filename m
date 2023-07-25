Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE85C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C321481FD4;
	Tue, 25 Jul 2023 13:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C321481FD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ca7CTUK9JsfT; Tue, 25 Jul 2023 13:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEDDD81FE3;
	Tue, 25 Jul 2023 13:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEDDD81FE3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51E5C1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BD3F60F90
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD3F60F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlW0K5PU71nE for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:19 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC36F60AD5
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC36F60AD5
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fde57684d7so12601265e9.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293076; x=1690897876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6nCHObc5nEw5Xi0bx812O1kI5Z++gdoNFWV4SrWpQ9k=;
 b=ZE+A3M8GD2HGcDVfrzqSOG0qaUA+AQqWJCylDa8bVmdMtTiRNXEH1WVNZGp04/Nal6
 uIQ6XnKajZ8h7B0xbK6s3vraLlmzmQHa9c9+wmupuCM01nfGwcb76lXOj9MIipEDR0Sp
 /3N0jvy9O+Q/nDCBEFraJPdjIyNw1xepAxOH97u//mYyLvJdkUNpPU1WR95XLTEVyMMf
 mrsEIjjEDlQKY1zROeYrlz3qLJmg6h66l0DH56UZo2Tav/zdPb0q/Y91lwfWT9s2cHXW
 baZ0dlopEZzatPghnk5Q+gmISsL4XOZQBtdIQeNptcAGJl5TzgSBAajTD8PbCpBn+iCO
 UtQQ==
X-Gm-Message-State: ABy/qLbEf2u1P4tQZ/kpOB7WKSWmEVSDKmZuVztdpnqLM45N+4sx6P8v
 xMxFvyCjFoTFcMUUjTqvCRIyIbWGVZ3sEg6ZEO0=
X-Google-Smtp-Source: APBJJlECo6RiSPAWrBgssR2QeU7UX4hkOYxBegd6wRkVcxT81EGvDg+CMN+3HGJgnoyrfTHl1zTaFw==
X-Received: by 2002:a7b:cd0c:0:b0:3fd:2996:9d88 with SMTP id
 f12-20020a7bcd0c000000b003fd29969d88mr6655430wmj.25.1690293076740; 
 Tue, 25 Jul 2023 06:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:16 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:50:58 +0200
Message-Id: <20230725135105.536310-4-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293076; x=1690897876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nCHObc5nEw5Xi0bx812O1kI5Z++gdoNFWV4SrWpQ9k=;
 b=zeMIz1UODw8DXR8jgo/yU9UybmvkRsIK9m+VSbdU2PDv2EJqd2FiWKu9CLTXwxRPdx
 EDVcC+plMRm5vLfDiG01PiVkVmIt7IhSCBCYE3bKFspnQTV3+apgRGit44uMALR+peYR
 sSI1e5gSOwAMzgWRiOp4LBZJ4aj4pnTSVNPqfi+JfehdhxFhcBSfrO4JQUgkwR5QHnU1
 u7/tsx46hNT42d64RGkBIQUvsSNUTYpaBDu9J3IydNnU5B19aaKgH++qc/+SLBsH+ZEZ
 xfgjoRw9w77GwBnxyPDsM0gpUHMTrJXXq+md0CZHDcWGmmV5sbHqpebJXcwlTwQAjkTC
 y/oQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=zeMIz1UO
Subject: [Buildroot] [PATCH 3/9] package/pkg-meson.mk: add rust
 cross-compiler support
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
 Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

This change is needed to be able to build target packages requiring
rust. If a package has rust in its project or in an add_language()
call in their meson.build file, meson will try to find a suitable
compiler for this language[1]. If the language is classified as
required but not found, it will abort the build.

It is necessary to specify rust and rust_ld separately in
support/misc/cross-compilation.conf.in. If you specify it in one line
just as "rust", it will generate the following warning:
    WARNING: Please do not put -C linker= in your compiler command,
    set rust_ld=command in your cross file or use the RUST_LD environment
    variable, otherwise meson will override your selection.

[1] https://mesonbuild.com/Reference-manual_functions.html#add_languages

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/pkg-meson.mk                   | 13 +++++++++++++
 support/misc/cross-compilation.conf.in |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 65cabf23ba..25dd4f0d7f 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -82,6 +82,16 @@ else
 PKG_MESON_TARGET_FC = /bin/false
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
+PKG_MESON_TARGET_RUSTC = $(HOST_DIR)/bin/rustc
+PKG_MESON_TARGET_RUSTC_LINKER = $(notdir $(TARGET_CROSS))gcc
+PKG_MESON_TARGET_RUSTC_TARGET_NAME = $(RUSTC_TARGET_NAME)
+else
+PKG_MESON_TARGET_RUSTC = /bin/false
+PKG_MESON_TARGET_RUSTC_LINKER = /bin/false
+PKG_MESON_TARGET_RUSTC_TARGET_NAME =
+endif
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -91,6 +101,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
         -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
         -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
+        -e "s%@TARGET_RUSTC@%$(PKG_MESON_TARGET_RUSTC)%g" \
         -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
         -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
         -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
@@ -99,6 +110,8 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@TARGET_RUSTC_LINKER@%$(PKG_MESON_TARGET_RUSTC_LINKER)%g" \
+        -e "s%@RUSTC_TARGET_NAME@%$(PKG_MESON_TARGET_RUSTC_TARGET_NAME)%g" \
         -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
         -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
         -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 7053df472b..3c5812b131 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -13,6 +13,8 @@ fortran = '@TARGET_FC@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
+rust = ['@TARGET_RUSTC@', '--target', '@RUSTC_TARGET_NAME@' ]
+rust_ld = '@TARGET_RUSTC_LINKER@'
 
 [built-in options]
 c_args = [@TARGET_CFLAGS@]
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
