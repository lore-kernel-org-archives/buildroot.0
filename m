Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF2C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C42040E3F;
	Thu,  8 Aug 2024 19:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRPi_Ip9kXJJ; Thu,  8 Aug 2024 19:40:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 468F140E33
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468F140E33;
	Thu,  8 Aug 2024 19:40:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDAD1BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 794BC40E78
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LCjeb-v-T26 for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ADAB40E7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ADAB40E7B
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13A90848C0; Thu,  8 Aug 2024 19:39:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 19:05:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c21eeed18221496bfbca311d367a4d20e4685d4
X-Git-Newrev: 7f7a5f0374e51812b17b08d5e45d544d70bb974e
X-Patchwork-Hint: ignore
Message-Id: <20240808193950.13A90848C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-sdk-bin: bump version to
 3.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f7a5f0374e51812b17b08d5e45d544d70bb974e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of https://github.com/flutter/engine/pull/51943, by default, flutter now
uses and provides the AOT snapshot frontend server instead of the
frontend_server.dart.snapshot.

The depfile produced by dart has been renamed from kernel_snapshot.d to
kernel_snapshot_program.d.

Flutter programs must compile with the dartaotruntime binary instead of the
dart binary, or else errors occure stating that the dartaotruntime must be
used.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index b697b9cc90..4f3622e725 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6590607e7f2fb23bcc7e0a2d6aac292f9208cbf12a40862c281058c758604fb3  flutter_linux_3.19.5-stable.tar.xz
+sha256  d52a5d12f17d8bcf868d1ccc01fe0f7ffb05b53d9628aa21b07a18f9d33621f2  flutter_linux_3.24.0-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 321c08680f..26415551bc 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.19.5
+FLUTTER_SDK_BIN_VERSION = 3.24.0
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -68,11 +68,11 @@ HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
 endif
 
 # The Order matters.Taken from:
-# https://github.com/meta-flutter/meta-flutter/blob/kirkstone/classes/flutter-app.inc
+# https://github.com/meta-flutter/meta-flutter/blob/scarthgap/conf/include/common.inc
 HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--verbose \
 	--disable-analytics \
-	--disable-dart-dev $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/linux-x64/frontend_server.dart.snapshot \
+	--disable-dart-dev $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/linux-x64/frontend_server_aot.dart.snapshot \
 	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
 	--target=flutter \
 	--no-print-incremental-dependencies \
@@ -85,7 +85,7 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--target-os linux \
 	--packages .dart_tool/package_config.json \
 	--output-dill .dart_tool/flutter_build/*/app.dill \
-	--depfile .dart_tool/flutter_build/*/kernel_snapshot.d
+	--depfile .dart_tool/flutter_build/*/kernel_snapshot_program.d
 
 # Helper wrapper to run flutter when building flutter applications.
 HOST_FLUTTER_SDK_BIN_FLUTTER = \
@@ -95,7 +95,7 @@ HOST_FLUTTER_SDK_BIN_FLUTTER = \
 # Helper wrapper to run dart when building flutter applications.
 HOST_FLUTTER_SDK_BIN_DART_BIN = \
 	$(HOST_FLUTTER_SDK_BIN_ENV) \
-	$(HOST_FLUTTER_SDK_BIN_DART_SDK)/bin/dart \
+	$(HOST_FLUTTER_SDK_BIN_DART_SDK)/bin/dartaotruntime \
 	$(HOST_FLUTTER_SDK_BIN_DART_ARGS)
 
 $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
