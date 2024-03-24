Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6CDC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9246A40608;
	Sun, 24 Mar 2024 15:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwVpgVLyhI4e; Sun, 24 Mar 2024 15:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBF1540740
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBF1540740;
	Sun, 24 Mar 2024 15:11:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6135B1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B014F60754
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ab86M5FOZa7G for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C120960725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C120960725
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD5C783B61; Sun, 24 Mar 2024 15:11:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:02:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9496ff57e54c136d6961294aa2c5f8d560673ebf
X-Git-Newrev: 94e072849e6c86a8c75402b1e600642673ebfb57
X-Patchwork-Hint: ignore
Message-Id: <20240324151125.AD5C783B61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to v3.0.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94e072849e6c86a8c75402b1e600642673ebfb57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes:
- https://fluentbit.io/announcements/v3.0.0/

Also drop 0004-wasm-restore-support-for-some-targets-8401.patch,
which was accepted upstream.
(See: https://github.com/fluent/fluent-bit/commit/40bb0fbe17efa6b4b1a96940e9ff7374b1a0c3eb)

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...asm-restore-support-for-some-targets-8401.patch | 43 ----------------------
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch b/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
deleted file mode 100644
index ed6206268f..0000000000
--- a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4a6c5f56cd1a979b91c168fb8e245587c2927aca Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Mon, 22 Jan 2024 19:27:56 +0100
-Subject: [PATCH] wasm: restore support for some targets (#8401)
-
-Somehow, support for ARC, MIPS, and XTENSA got dropped by bumping to v1.3.0,
-so restore it now. Remark that those targets are mentioned in the section above.
-
-See commit fa6a248746f9f481b5f6aef49716141fa0222650.
-
-Upstream: https://github.com/fluent/fluent-bit/pull/8401
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- src/wasm/CMakeLists.txt | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/wasm/CMakeLists.txt b/src/wasm/CMakeLists.txt
-index a258dc063..4ea7eba65 100644
---- a/src/wasm/CMakeLists.txt
-+++ b/src/wasm/CMakeLists.txt
-@@ -51,6 +51,10 @@ elseif (WAMR_BUILD_TARGET MATCHES "AARCH64.*")
- elseif (WAMR_BUILD_TARGET MATCHES "ARM.*")
-   add_definitions(-DBUILD_TARGET_ARM)
-   add_definitions(-DBUILD_TARGET="${WAMR_BUILD_TARGET}")
-+elseif (WAMR_BUILD_TARGET STREQUAL "MIPS")
-+  add_definitions(-DBUILD_TARGET_MIPS)
-+elseif (WAMR_BUILD_TARGET STREQUAL "XTENSA")
-+  add_definitions(-DBUILD_TARGET_XTENSA)
- elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64" OR WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64D")
-   add_definitions(-DBUILD_TARGET_RISCV64_LP64D)
- elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64")
-@@ -59,6 +63,8 @@ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32" OR WAMR_BUILD_TARGET STREQUAL "RISC
-   add_definitions(-DBUILD_TARGET_RISCV32_ILP32D)
- elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32_ILP32")
-   add_definitions(-DBUILD_TARGET_RISCV32_ILP32)
-+elseif (WAMR_BUILD_TARGET STREQUAL "ARC")
-+  add_definitions(-DBUILD_TARGET_ARC)
- else ()
-   message (FATAL_ERROR "-- Build target isn't set")
- endif ()
--- 
-2.34.1
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 2c34583f7a..cc9c976d60 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e7e951b2907e9d29508699c71c8949a4a22d750d54ffa5ee5b96537e59371dd  fluent-bit-2.2.2.tar.gz
+sha256  e70ae5be2f0ca1cb842a1c8d2762437907c522765f79b5c0c391eaa1b57c9f4c  fluent-bit-3.0.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 00a8904c55..33054bea66 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.2.2
+FLUENT_BIT_VERSION = 3.0.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
