Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDF6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44426604AC
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44426604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 192E94013E;
	Sat,  4 Sep 2021 18:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-VpmgR4eWIg; Sat,  4 Sep 2021 18:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D3A401DF;
	Sat,  4 Sep 2021 18:39:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9BC41BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83D08402B5
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ok29joAC7NNw for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A08A8401FE
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7547C8834A; Sat,  4 Sep 2021 18:23:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:27:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95ad161fe933b01986b426c47f019d58900d62a2
X-Git-Newrev: ecb72b118a3d2b25cbfe2e1dfd3c9d9f3d3df91d
X-Patchwork-Hint: ignore
Message-Id: <20210904182353.7547C8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmsxx: update to latest
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ecb72b118a3d2b25cbfe2e1dfd3c9d9f3d3df91d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can drop all the patches as they have been sorted out in upstream.

The wrapped fmt was dropped, so drop the corresponding option.

The option to use a system pybind11 was named differently upstream, as a
feature rather as a boolean. Adapt accordingly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
[yann.morin.1998@free.fr: explain dropped/changed options]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-meson-add-use-system-fmt-option.patch     | 46 ---------------------
 ...0002-meson-add-use-system-pybind11-option.patch | 43 -------------------
 ...on-only-build-py-in-case-pykms-is-enabled.patch | 48 ----------------------
 package/kmsxx/kmsxx.hash                           |  2 +-
 package/kmsxx/kmsxx.mk                             |  5 +--
 5 files changed, 3 insertions(+), 141 deletions(-)

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
index 871ecaf85c..8ebdffaad1 100644
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
@@ -14,8 +14,7 @@ KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
 	-Dpykms=disabled \
 	-Domap=disabled \
-	-Duse-system-fmt=true \
-	-Duse-system-pybind11=true
+	-Dsystem-pybind11=enabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
