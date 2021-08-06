Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC3C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:51:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B44C60231
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 12:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B44C60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36AED608FE;
	Fri,  6 Aug 2021 12:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZCxqPGO7t8d; Fri,  6 Aug 2021 12:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987776086D;
	Fri,  6 Aug 2021 12:51:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 984F21BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87DF783BA0
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 12:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6ArhBKtfnKn for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 12:50:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6395283B91
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 12:50:56 +0000 (UTC)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0069FDFA;
 Fri,  6 Aug 2021 14:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628254254;
 bh=3wtqylxTQ+k1HppZvq4kDtt6/dBMqOwH4ju/cVDd6pQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qpswi0C67qrJIY44VT/BJcg3aejstntFAyKR/5F/wq/rfY7JHDK+k6TrwXB1Z89qQ
 hBM0R+pQxcdJwD7aDFcZ9dFdfv1rKjdfkNrl3Hf8q7SCtgBwRtLWOXo9G7Mjf587RX
 rf1pUoiacRmqlq2g1+YC5obbkAkkEyDMQpuD0eoE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 15:50:47 +0300
Message-Id: <20210806125047.1832422-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
References: <20210806125047.1832422-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/kmsxx: update to latest
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Peter Seiderer <ps.report@gmx.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

We can drop all the patches as they have been sorted out in upstream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 ...0001-meson-add-use-system-fmt-option.patch | 46 ------------------
 ...meson-add-use-system-pybind11-option.patch | 43 -----------------
 ...ly-build-py-in-case-pykms-is-enabled.patch | 48 -------------------
 package/kmsxx/kmsxx.hash                      |  2 +-
 package/kmsxx/kmsxx.mk                        |  6 +--
 5 files changed, 3 insertions(+), 142 deletions(-)
 delete mode 100644 package/kmsxx/0001-meson-add-use-system-fmt-option.patch
 delete mode 100644 package/kmsxx/0002-meson-add-use-system-pybind11-option.patch
 delete mode 100644 package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch

diff --git a/package/kmsxx/0001-meson-add-use-system-fmt-option.patch b/package/kmsxx/0001-meson-add-use-system-fmt-option.patch
deleted file mode 100644
index e9d67b1202..0000000000
--- a/package/kmsxx/0001-meson-add-use-system-fmt-option.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 61db7d5520f50564da8f2c9ac952eadb31f70727 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 29 Nov 2020 11:13:41 +0100
-Subject: [PATCH] meson: add use-system-fmt option
-
-[Upstream: https://github.com/tomba/kmsxx/pull/60]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- meson.build       | 10 +++++++---
- meson_options.txt |  2 ++
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 9652009..29080f4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -31,9 +31,13 @@ endif
- 
- add_global_link_arguments(link_arguments, language : 'cpp')
- 
--libfmt_includes = include_directories('ext/fmt/include')
--libfmt_dep = declare_dependency(include_directories : libfmt_includes,
--                                compile_args : '-DFMT_HEADER_ONLY')
-+if get_option('use-system-fmt')
-+    libfmt_dep = dependency('fmt')
-+else
-+    libfmt_includes = include_directories('ext/fmt/include')
-+    libfmt_dep = declare_dependency(include_directories : libfmt_includes,
-+                                    compile_args : '-DFMT_HEADER_ONLY')
-+endif
- 
- pybind11_includes = include_directories('ext/pybind11/include')
- pybind11_dep = declare_dependency(include_directories : pybind11_includes)
-diff --git a/meson_options.txt b/meson_options.txt
-index cd854ab..48176a8 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -3,3 +3,5 @@ option('pykms', type : 'feature', value : 'auto')
- option('omap', type : 'feature', value : 'auto')
- option('static-libc', type : 'boolean', value : false)
- option('utils', type : 'boolean', value : true)
-+
-+option('use-system-fmt', type : 'boolean', value : false)
--- 
-2.29.2
-
diff --git a/package/kmsxx/0002-meson-add-use-system-pybind11-option.patch b/package/kmsxx/0002-meson-add-use-system-pybind11-option.patch
deleted file mode 100644
index be58b65b42..0000000000
--- a/package/kmsxx/0002-meson-add-use-system-pybind11-option.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 27f15549ce67194e4152c57db2b762b7a443b4c7 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 29 Nov 2020 11:14:41 +0100
-Subject: [PATCH] meson: add use-system-pybind11 option
-
-[Upstream: https://github.com/tomba/kmsxx/pull/60]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- meson.build       | 8 ++++++--
- meson_options.txt | 1 +
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 29080f4..4b3e7c3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -39,8 +39,12 @@ else
-                                     compile_args : '-DFMT_HEADER_ONLY')
- endif
- 
--pybind11_includes = include_directories('ext/pybind11/include')
--pybind11_dep = declare_dependency(include_directories : pybind11_includes)
-+if get_option('use-system-pybind11')
-+    pybind11_dep = dependency('pybind11')
-+else
-+    pybind11_includes = include_directories('ext/pybind11/include')
-+    pybind11_dep = declare_dependency(include_directories : pybind11_includes)
-+endif
- 
- libdrmomap_dep = dependency('libdrm_omap', required : get_option('omap'))
- 
-diff --git a/meson_options.txt b/meson_options.txt
-index 48176a8..095c6f2 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -5,3 +5,4 @@ option('static-libc', type : 'boolean', value : false)
- option('utils', type : 'boolean', value : true)
- 
- option('use-system-fmt', type : 'boolean', value : false)
-+option('use-system-pybind11', type : 'boolean', value : false)
--- 
-2.29.2
-
diff --git a/package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch b/package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch
deleted file mode 100644
index a908521381..0000000000
--- a/package/kmsxx/0003-meson-only-build-py-in-case-pykms-is-enabled.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0ef36b2e22c2ac0331b3096b7adc69fb08044048 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 29 Nov 2020 11:37:26 +0100
-Subject: [PATCH] meson: only build py in case pykms is enabled
-
-[Upstream: https://github.com/tomba/kmsxx/pull/60]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- meson.build | 16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 4b3e7c3..1810b17 100644
---- a/meson.build
-+++ b/meson.build
-@@ -39,11 +39,13 @@ else
-                                     compile_args : '-DFMT_HEADER_ONLY')
- endif
- 
--if get_option('use-system-pybind11')
--    pybind11_dep = dependency('pybind11')
--else
--    pybind11_includes = include_directories('ext/pybind11/include')
--    pybind11_dep = declare_dependency(include_directories : pybind11_includes)
-+if get_option('pykms').enabled()
-+    if get_option('use-system-pybind11')
-+        pybind11_dep = dependency('pybind11')
-+    else
-+        pybind11_includes = include_directories('ext/pybind11/include')
-+        pybind11_dep = declare_dependency(include_directories : pybind11_includes)
-+    endif
- endif
- 
- libdrmomap_dep = dependency('libdrm_omap', required : get_option('omap'))
-@@ -55,7 +57,9 @@ if get_option('utils')
-     subdir('utils')
- endif
- 
--subdir('py')
-+if get_option('pykms').enabled()
-+    subdir('py')
-+endif
- 
- if get_option('kmscube')
-     subdir('kmscube')
--- 
-2.29.2
-
diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index 1eeb1e6a7e..c141ef7e07 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a682328b03c28ff1f6cfcafc48d30c3feb5ef98ed07e5dd3bbd9e6a1d4a47cc  kmsxx-548905611c130ea9d31929a0caf7a198d8bac462.tar.gz
+sha256  99759fe9334369ccd80ab0bbfe1110ee47e74f1e20abc2d7b2f028067ea0a0c3  kmsxx-824bbb1f4cd062d66b457faca50f904b34dfd96c.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 871ecaf85c..ab0158d1ed 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSXX_VERSION = 548905611c130ea9d31929a0caf7a198d8bac462
+KMSXX_VERSION = 824bbb1f4cd062d66b457faca50f904b34dfd96c
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
@@ -13,9 +13,7 @@ KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
 KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
 	-Dpykms=disabled \
-	-Domap=disabled \
-	-Duse-system-fmt=true \
-	-Duse-system-pybind11=true
+	-Domap=disabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
