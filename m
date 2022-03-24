Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79861C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 05:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F400A4059D;
	Thu, 24 Mar 2022 05:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-iWQFWFXOQq; Thu, 24 Mar 2022 05:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716564058E;
	Thu, 24 Mar 2022 05:56:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683451BF957
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 05:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7B2419B3
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 05:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9m1gz7GJ4Ox for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 05:56:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D07E41892
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 05:56:36 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id b188so3901028oia.13
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 22:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1oiP0eoic9nxCMrfQJIYyDNjcgb2bB/QuPE3O7EDvI=;
 b=RDk9c4JLPi8RJENjxrFEyCGULdu0VCMqX25cGRxcT/d+5Ekvy8mtgAUAekLLge40jO
 yTm8nBI69lE26fV0xnzmRqe8DOQmzOFP8+0ujLE9TyQq6LZn6G2Vv0gzb22+QK4HnA2z
 qZVHsyaFn6cVZR7HHth4RWlGrai1lVDFo3ZO/ulnaAVd66ohasUs3vQHRWkSgUbF+nJd
 hbN5uL6Tpb7zV/k0Y1yOL8l0Tja4G/g+qq8r/OgseBsEqzuII97bMyLswJN6r1CDHDSx
 w7IA2IEZLfMPxt5R2YykIJFivqghM/QW4mYUrMXxLZRvvIOx0rvhRKGra5RPzfMyog84
 SQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m1oiP0eoic9nxCMrfQJIYyDNjcgb2bB/QuPE3O7EDvI=;
 b=OygNbZ69CX5d3wIY0o6H9Og0TKFUJ49LwC3EifCcVLDfzTbVteDKTI/OPuE4T4DO+N
 s9vs3Y7q8ASXM+yWiAl/keP/4UfMlZ7Msf/vjJx9tO+YC0DVI4EXJwsvTBZnM3OcgrGs
 Rh/15tguhRPQIQNdKJbLv4uV+nYkV/28fsFnBFMl1erkFNajw5b3LKk9GKKpKQ4TBCRE
 PDGSfsqZhUHSQHnR2oJAArpn+XlfRHMZPtcXAIbgKnkXK3yvHPqPeN7x7AfV+1YQlsZh
 ShVTttYTTgpOMKiMQ9Qpbecg7rO+52z3+NALPpqrzpzrp/n6Y+kEEJrBF2flHgEAh+/V
 jbtg==
X-Gm-Message-State: AOAM531GCnqB3KXjr4iGPBoo30ZmkWOwI2t6C531fruZL9vTvuQrnzW8
 rNXNcsNQCRQHqcdalrNjBMjgWRFJV7Jccw==
X-Google-Smtp-Source: ABdhPJybamOhhLwVcZ/mkWhjiE7lg8d1m58rRu4s9rWsSSIVVhWPJvlaj2Wkk0BQ0tcW8uRR5GyrVQ==
X-Received: by 2002:a05:6808:10d3:b0:2ec:ddb3:c82d with SMTP id
 s19-20020a05680810d300b002ecddb3c82dmr1752277ois.250.1648101394922; 
 Wed, 23 Mar 2022 22:56:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 g18-20020a9d6c52000000b005af7c7cb702sm932589otq.34.2022.03.23.22.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 22:56:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 23:56:02 -0600
Message-Id: <20220324055602.3021498-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: add cmake dependency
 support
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Meson dependencies and variables can be provided by cmake similar to
how they can be provided by pkgconfig, for this to work we need to
ensure that cmake_prefix_path is set for both cross and native
targets along with the cmake binary path.

See:
https://mesonbuild.com/Dependencies.html#cmake
https://mesonbuild.com/Dependencies.html#arbitrary-variables-from-dependencies-that-can-be-found-multiple-ways
https://mesonbuild.com/Machine-files.html#meson-builtin-options

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-meson.mk                   | 2 ++
 support/misc/cross-compilation.conf.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 85de98e03a..9e70d49b60 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -79,6 +79,7 @@ define PKG_MESON_CROSSCONFIG_SED
         -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$($(strip $(1))))%g" \
         -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$($(strip $(3))))%g" \
         -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$($(strip $(2))))%g" \
+        -e "s%@BR2_CMAKE@%$(BR2_CMAKE)%g" \
         -e "s%@PKGCONF_HOST_BINARY@%$(HOST_DIR)/bin/pkgconf%g" \
         -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
         -e "s%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g" \
@@ -136,6 +137,7 @@ define $(2)_CONFIGURE_CMDS
 		-Db_pie=false \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
+		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
diff --git a/support/misc/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
index 18cf258a8e..1977a83501 100644
--- a/support/misc/cross-compilation.conf.in
+++ b/support/misc/cross-compilation.conf.in
@@ -8,6 +8,7 @@ c = '@TARGET_CC@'
 cpp = '@TARGET_CXX@'
 ar = '@TARGET_AR@'
 strip = '@TARGET_STRIP@'
+cmake = '@BR2_CMAKE@'
 pkgconfig = '@PKGCONF_HOST_BINARY@'
 g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
 g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
@@ -18,6 +19,7 @@ c_link_args = [@TARGET_LDFLAGS@]
 cpp_args = [@TARGET_CXXFLAGS@]
 cpp_link_args = [@TARGET_LDFLAGS@]
 wrap_mode = 'nodownload'
+cmake_prefix_path = '@STAGING_DIR@/usr/lib/cmake'
 
 [properties]
 needs_exe_wrapper = true
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
