Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BDFCD80B7
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 12:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE95541517;
	Tue, 10 Oct 2023 12:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE95541517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWWOL_yiy309; Tue, 10 Oct 2023 12:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6906B415D9;
	Tue, 10 Oct 2023 12:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6906B415D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00ABB1BF318
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 12:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAA5B415D9
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 12:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAA5B415D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIpTJ2VlMlfx for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 12:02:53 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EEEC41517
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 12:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EEEC41517
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso966771166b.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 05:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696939371; x=1697544171;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFf2gYi5yw7WK+yWdknOeKt49rkxDW21NWlV1pUGFnU=;
 b=rFjc+GL1rstqNBlwXrUgjZS6siIMMNF8aJcNJXYwFry5E5Gw01Dnkfv93dPdbumbkO
 iV859g7p1oeOrOTmxvZSQqRyswjQZYhySa+GJsmRh7AHauvn5CF6RXWPnIXfJ33fKcHq
 rBrB/cZgwD+RnKrvy4ExhTs5eHNEB14+kj3gu11R/b032T9Cwz6oanOlmuG4+r6ynsh4
 55H6wxX+qGqtdn69RFduwU5qzVIGqmfB7p/pj3sT+4q0jGdp6MUpVHeYn1g13Yw43O2R
 Wo4T7kg2phFFdiws+xr6JYv74CFvghJ0tWQpQzzRGdSfKZ6fIiJu2aq30LBUxU3TWkiz
 /cmw==
X-Gm-Message-State: AOJu0YyNGKGEeyxJUfccsp6K3U9ttW+H4ul8/LU3BZp+YU4MBaFaFzVv
 81JrP3XkZoHmKHt+ma3H5EmDFgH2HtN6YJCCWz0QOQ==
X-Google-Smtp-Source: AGHT+IGvp2Aq7LzWrSm3snL3Y69XA7s8rWwmvXAlsCMEJwTBZR8yMZWszEkt9GtWLcqfW7CqW3Cvtg==
X-Received: by 2002:a17:906:c801:b0:9b2:8df4:f2cd with SMTP id
 cx1-20020a170906c80100b009b28df4f2cdmr16063446ejb.18.1696939368663; 
 Tue, 10 Oct 2023 05:02:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a1709060b0d00b009ad87d1be17sm8339044ejg.22.2023.10.10.05.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 05:02:47 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 14:02:38 +0200
Message-ID: <20231010120238.1064684-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696939371; x=1697544171;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rFf2gYi5yw7WK+yWdknOeKt49rkxDW21NWlV1pUGFnU=;
 b=U8gUxAPfRS3pyEIXXisb40F/XX6Hp2kyfOXOZ4gK7UP9TFxgdiu6djqvfiQcBfkeS4
 gMBXXth89gDa6NWAhc+ASJN84o75vUHtpjO0Wcu9qr2froeRQqI93yG3dS2FFwbl6hiq
 s6sJygyW9YBqG6jX+K+ZdjfEaZxWTNn0dOm4M=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=U8gUxAPf
Subject: [Buildroot] [PATCH v2 1/1] package/nodejs: bump version to 18.18.0
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refactor 0001-add-qemu-wrapper-support.patch for 18.18.0

  - NodeJS now requires GCC 8.3 due to the introduction of the charconv
    header. However, as there is no BR2_TOOLCHAIN_GCC_AT_LEAST_8_3, we
    round up to BR2_TOOLCHAIN_GCC_AT_LEAST_9.

  - Update support/testing/tests/package/test_nodejs.py to use
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN, otherwise the test fails as the
    gcc version selected will be 7.

  - Update the hash file for LICENSE.txt due to numerous changes, such
    as the addition of new libraries and updated dates. No new license
    types are added.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 ->. v2: Rebase off of 4c66ee3cda45bebf9044d09f0d2ceec2ea4298cd

 package/nodejs/Config.in                      |  8 +++---
 .../0001-add-qemu-wrapper-support.patch       | 25 ++++++++++---------
 ...ules-cjs-loader.js-adjust-default-pa.patch |  2 +-
 package/nodejs/nodejs.hash                    | 15 ++++++-----
 package/nodejs/nodejs.mk                      |  2 +-
 support/testing/tests/package/test_nodejs.py  |  2 ++
 6 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index c684f8eb86..76058ebc80 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,19 +7,19 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 9, wchar, host gcc >= 9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
+		!BR2_HOST_GCC_AT_LEAST_9 || !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on BR2_USE_WCHAR
 	# uses fork()
 	depends on BR2_USE_MMU
diff --git a/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch b/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
index 184f3d19b7..ea55cc48bc 100644
--- a/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
+++ b/package/nodejs/nodejs-src/0001-add-qemu-wrapper-support.patch
@@ -15,6 +15,7 @@ qemu-wrapper, so add @MAYBE_WRAPPER@ to the needed files and sed the path to
 the qemu-wrapper on target builds, and remove @MAYBE_WRAPPER@ entirely on
 host-builds.
 
+[Adam: Update for 18.18.0]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  node.gyp                 |  4 ++--
@@ -25,16 +26,7 @@ diff --git a/node.gyp b/node.gyp
 index 97cdbb531d..db5cf51ce6 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -319,7 +319,7 @@
-               'action_name': 'run_mkcodecache',
-               'process_outputs_as_sources': 1,
-               'inputs': [
--                '<(mkcodecache_exec)',
-+                @MAYBE_WRAPPER@ '<(mkcodecache_exec)',
-               ],
-               'outputs': [
-                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
-@@ -346,7 +346,7 @@
+@@ -322,7 +322,7 @@
                    'action_name': 'node_mksnapshot',
                    'process_outputs_as_sources': 1,
                    'inputs': [
@@ -43,6 +35,15 @@ index 97cdbb531d..db5cf51ce6 100644
                      '<(node_snapshot_main)',
                    ],
                    'outputs': [
+@@ -342,7 +342,7 @@
+                   'action_name': 'node_mksnapshot',
+                   'process_outputs_as_sources': 1,
+                   'inputs': [
+-                    '<(node_mksnapshot_exec)',
++                    @MAYBE_WRAPPER@ '<(node_mksnapshot_exec)',
+                   ],
+                   'outputs': [
+                     '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
 diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
 index 73099a03e4..88ca91efb4 100644
 --- a/tools/v8_gypfiles/v8.gyp
@@ -74,7 +75,7 @@ index 73099a03e4..88ca91efb4 100644
            ],
            'outputs': [
              '<(generate_bytecode_builtins_list_output)',
-@@ -395,7 +395,7 @@
+@@ -400,7 +400,7 @@
              ],
            },
            'inputs': [
@@ -83,7 +84,7 @@ index 73099a03e4..88ca91efb4 100644
            ],
            'outputs': [
              '<(INTERMEDIATE_DIR)/snapshot.cc',
-@@ -1505,7 +1505,7 @@
+@@ -1569,7 +1569,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
index 5b93998e5e..f1cdad3d9c 100644
--- a/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
+++ b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
@@ -21,7 +21,7 @@ diff --git a/lib/internal/modules/cjs/loader.js b/lib/internal/modules/cjs/loade
 index f1971c40a4..5fe3884156 100644
 --- a/lib/internal/modules/cjs/loader.js
 +++ b/lib/internal/modules/cjs/loader.js
-@@ -1261,7 +1261,8 @@ Module._initPaths = function() {
+@@ -1391,7 +1391,8 @@ Module._initPaths = function() {
      path.resolve(process.execPath, '..') :
      path.resolve(process.execPath, '..', '..');
  
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index eaf41f6437..2fff229ed7 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,9 +1,8 @@
-# From https://nodejs.org/dist/v16.20.0/SHASUMS256.txt.asc
-sha256  aca4794ca60f2e17689a700eeaa95d7adcd5fd01cdd2e4f9d596ac41b600b796  node-v16.20.0-linux-arm64.tar.xz
-sha256  5b79addab37bbdc31b442f8e648efad0b5d3aa5f3e0d682f23f4db483408eb2a  node-v16.20.0-linux-armv7l.tar.xz
-sha256  b439a8f874e8c2fad287ba75a3229407551f5ff9eb41e45e43e9bf67f184f618  node-v16.20.0-linux-ppc64le.tar.xz
-sha256  dff21020b555cc165a1ac36da7d4f6c810b35409c94e00afc51d5d370aae47ae  node-v16.20.0-linux-x64.tar.xz
-sha256  e0990f992234e40a51fe11f92c3816c93a77e1b081145d3dd762cd1026345349  node-v16.20.0.tar.xz
-
+# From https://nodejs.org/dist/v18.18.0/SHASUMS256.txt.asc
+sha256  e2931643cc3ee37375ae5c6dc2028ff526948a227d9fd5d481316240de6e58a5  node-v18.18.0-linux-arm64.tar.xz
+sha256  afcc9e01345243a19fbc05ce662b693568f31925679e8e0e7067d752296831f1  node-v18.18.0-linux-armv7l.tar.xz
+sha256  121204a93ac931146b3325a1748ae06d8b4d75db37566a792032e1c859bc8911  node-v18.18.0-linux-ppc64le.tar.xz
+sha256  3008408e9098f2462f7b1a0f6a48b8a46079beb1c92b6ec43b04713265c96978  node-v18.18.0-linux-x64.tar.xz
+sha256  e4d4dbac3634d99f892f00db47da78f98493c339582e8a95fb2dd59f5cfe0f90  node-v18.18.0.tar.xz
 # Locally calculated
-sha256  ba325815d3df8819bebaf37cad67d6e1f82271e1e4a1189b53abd28e261977d6  LICENSE
+sha256  a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2a8c570932..90560d05ff 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 16.20.0
+NODEJS_COMMON_VERSION = 18.18.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
diff --git a/support/testing/tests/package/test_nodejs.py b/support/testing/tests/package/test_nodejs.py
index b63d44c97e..c793391649 100644
--- a/support/testing/tests/package/test_nodejs.py
+++ b/support/testing/tests/package/test_nodejs.py
@@ -10,6 +10,7 @@ class TestNodeJSBasic(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -34,6 +35,7 @@ class TestNodeJSModuleHostBin(infra.basetest.BRTest):
         BR2_cortex_a9=y
         BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_PACKAGE_NODEJS=y
         BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="lodash"
         BR2_PACKAGE_HOST_NODEJS_BIN=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
