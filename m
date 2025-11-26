Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87012CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BAFF61BC0;
	Thu, 27 Nov 2025 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVjMYtd9RMcY; Thu, 27 Nov 2025 20:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B079361BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B079361BC1;
	Thu, 27 Nov 2025 20:36:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F131DE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83598843C0
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoKGiun-9r8i for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7FAD843CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7FAD843CA
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5C8A8355B; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:29:00 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 87f544957e993a95ee40fd84f7abfd2556fad564
X-Git-Newrev: 1237472aeffe4f729ec3249cf6f3eeeacb812ce1
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.D5C8A8355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/openjdk{,
 -bin}: fix wrong version reporting
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1237472aeffe4f729ec3249cf6f3eeeacb812ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Before:

$ java --version
openjdk 17 2024-07-16
OpenJDK Runtime Environment (build 17+17)
OpenJDK 64-Bit Server VM (build 17+17, mixed mode)

After:

$ java --version
openjdk 17.0.12 2024-07-16
OpenJDK Runtime Environment (build 17.0.12+7)
OpenJDK 64-Bit Server VM (build 17.0.12+7, mixed mode)

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ccee2be221772f6d456fd852b237adb7f5bbe51)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openjdk-bin/openjdk-bin.mk |  8 +++++---
 package/openjdk/openjdk.mk         | 13 ++++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 17056e80b7..e6c74cf6d8 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,10 +6,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.4_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.4
+HOST_OPENJDK_BIN_VERSION_BUILD = 7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.12_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.12
+HOST_OPENJDK_BIN_VERSION_BUILD = 7
 endif
 
 ifeq ($(HOSTARCH),x86_64)
@@ -19,7 +21,7 @@ ifeq ($(HOSTARCH),aarch64)
 HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
 endif
 
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)_$(HOST_OPENJDK_BIN_VERSION_BUILD)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 446e4aa3c2..6868ca191d 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,12 +6,15 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
-OPENJDK_VERSION_MINOR = 0.4+7
+OPENJDK_VERSION_MINOR = 0.4
+OPENJDK_VERSION_BUILD = 7
+
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.12+7
+OPENJDK_VERSION_MINOR = 0.12
+OPENJDK_VERSION_BUILD = 7
 endif
-OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
@@ -106,8 +109,8 @@ OPENJDK_CONF_OPTS = \
 	--with-native-debug-symbols=none \
 	--without-version-pre \
 	--with-sysroot=$(STAGING_DIR) \
-	--with-version-build="$(OPENJDK_VERSION_MAJOR)" \
-	--with-version-string="$(OPENJDK_VERSION_MAJOR)"
+	--with-version-build="$(OPENJDK_VERSION_BUILD)" \
+	--with-version-string="$(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)"
 
 # If building for AArch64, use the provided CPU port.
 ifeq ($(BR2_aarch64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
