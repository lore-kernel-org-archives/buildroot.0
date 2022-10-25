Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CADFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6E360B79;
	Tue, 25 Oct 2022 20:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6E360B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ysDB4GgLN1Q; Tue, 25 Oct 2022 20:59:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 136C760B01;
	Tue, 25 Oct 2022 20:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136C760B01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D49271BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE1F860ACD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1F860ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NsNR8L6J8rtP for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:58:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4616059C
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC4616059C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC28487093; Tue, 25 Oct 2022 20:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 22:58:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6833dd5079b8017bde37b7d3ef201d35450a12e6
X-Git-Newrev: a9f5a9926f089bf0c7943049751fefa6035ce469
X-Patchwork-Hint: ignore
Message-Id: <20221025205852.AC28487093@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: bump to version 1.50.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9f5a9926f089bf0c7943049751fefa6035ce469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

drop cross-compile patch which is now upstream (again).

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...le-unconditionally-downloading-api-repos.patch} |  0
 .../grpc/0004-fix-grpc-plugin-cross-compile.patch  | 43 ----------------------
 package/grpc/grpc.hash                             |  2 +-
 package/grpc/grpc.mk                               |  2 +-
 4 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/grpc/0005-disable-unconditionally-downloading-api-repos.patch b/package/grpc/0004-disable-unconditionally-downloading-api-repos.patch
similarity index 100%
rename from package/grpc/0005-disable-unconditionally-downloading-api-repos.patch
rename to package/grpc/0004-disable-unconditionally-downloading-api-repos.patch
diff --git a/package/grpc/0004-fix-grpc-plugin-cross-compile.patch b/package/grpc/0004-fix-grpc-plugin-cross-compile.patch
deleted file mode 100644
index d4e18a7853..0000000000
--- a/package/grpc/0004-fix-grpc-plugin-cross-compile.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6798193f062676fddf7fee6d0c928f8ce6d92894 Mon Sep 17 00:00:00 2001
-From: Michael Nosthoff <buildroot@heine.tech>
-Date: Thu, 21 Jul 2022 22:14:32 +0200
-Subject: [PATCH] cmake: fix cross-compilation with
- gRPC_BUILD_GRPC_CPP_PLUGIN=OFF
-
-commit 99752b173cfa reintroduced the cross-compilation issue which was fixed by da10b795e177
-
-upstream PR: https://github.com/grpc/grpc/pull/30378
-
-Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
-
----
- CMakeLists.txt                    | 2 +-
- templates/CMakeLists.txt.template | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9cad96a12f95..11e7ae2b67df 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -514,7 +514,7 @@ function(protobuf_generate_grpc_cpp_with_import_path_correction FILE_LOCATION IM
-          --plugin=protoc-gen-grpc=${_gRPC_CPP_PLUGIN}
-          ${_protobuf_include_path}
-          ${REL_FIL}
--    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION} ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} grpc_cpp_plugin
-+    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION} ${ABS_FIL} ${_gRPC_PROTOBUF_PROTOC} ${_gRPC_CPP_PLUGIN}
-     WORKING_DIRECTORY ${_gRPC_PROTO_SRCS_DIR}
-     COMMENT "Running gRPC C++ protocol buffer compiler for ${IMPORT_PATH}"
-     VERBATIM)
-diff --git a/templates/CMakeLists.txt.template b/templates/CMakeLists.txt.template
-index 161cf46798f1..82fe4217913a 100644
---- a/templates/CMakeLists.txt.template
-+++ b/templates/CMakeLists.txt.template
-@@ -498,7 +498,7 @@
-            --plugin=protoc-gen-grpc=<%text>${_gRPC_CPP_PLUGIN}</%text>
-            <%text>${_protobuf_include_path}</%text>
-            <%text>${REL_FIL}</%text>
--      DEPENDS <%text>${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION}</%text> <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> grpc_cpp_plugin
-+      DEPENDS <%text>${CMAKE_CURRENT_SOURCE_DIR}/${FILE_LOCATION}</%text> <%text>${ABS_FIL}</%text> <%text>${_gRPC_PROTOBUF_PROTOC}</%text> <%text>${_gRPC_CPP_PLUGIN}</%text>
-       WORKING_DIRECTORY <%text>${_gRPC_PROTO_SRCS_DIR}</%text>
-       COMMENT "Running gRPC C++ protocol buffer compiler for <%text>${IMPORT_PATH}</%text>"
-       VERBATIM)
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 9ef976a60a..4d838703cc 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5071b630e2a14707ad060636990f1b25b0984bd168c7ea1ab95e48a3bdc0081f  grpc-1.49.1.tar.gz
+sha256  76900ab068da86378395a8e125b5cc43dfae671e09ff6462ddfef18676e2165a  grpc-1.50.0.tar.gz
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 5f28e86113..9aac241e47 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.49.1
+GRPC_VERSION = 1.50.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
