Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C79C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F7E24F364;
	Tue, 21 Feb 2023 00:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F7E24F364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d21T1hDDtsV6; Tue, 21 Feb 2023 00:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F47C4F35A;
	Tue, 21 Feb 2023 00:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F47C4F35A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DFA51BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4EF4417D7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4EF4417D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tviLpJwwHXL for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F7BA417CD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F7BA417CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A8AC86495; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:06:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 485b47e025541a58358d8852c600b8e7644b4ec6
X-Git-Newrev: 9ae48b70aedf38bf6e90a7bbea5bf28a7c55bdbb
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.9A8AC86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-proxy: drop
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ae48b70aedf38bf6e90a7bbea5bf28a7c55bdbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The docker-proxy binary (libnetwork) has been merged into the docker-engine
source (moby). Drop the docker-proxy package and add cmd/docker-proxy as a build
target of docker-engine instead.

https://github.com/moby/libnetwork/commit/563fe8e248f3afac75a270f693f38bdc3eea7bf3

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                       |  8 ++++++++
 DEVELOPERS                             |  1 -
 package/Config.in                      |  1 -
 package/docker-engine/Config.in        |  1 -
 package/docker-engine/docker-engine.mk |  2 +-
 package/docker-proxy/Config.in         | 19 -------------------
 package/docker-proxy/docker-proxy.hash |  3 ---
 package/docker-proxy/docker-proxy.mk   | 21 ---------------------
 8 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ad80522451..72deb03c35 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2023.02"
 
+config BR2_PACKAGE_DOCKER_PROXY
+	bool "docker-proxy removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DOCKER_ENGINE
+	help
+	  docker-proxy has been dropped by upstream since version
+	  563fe8. it has been merged into docker-engine (moby).
+
 config BR2_PACKAGE_PYTHON_BUNCH
 	bool "python-bunch removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index cad8d6affa..f10036f7f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -545,7 +545,6 @@ F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-compose/
 F:	package/docker-engine/
-F:	package/docker-proxy/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
diff --git a/package/Config.in b/package/Config.in
index 8b9570c447..aa87f1305d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2618,7 +2618,6 @@ menu "System tools"
 	source "package/docker-cli/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-engine/Config.in"
-	source "package/docker-proxy/Config.in"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1f0efb8fcc..b5a356eab9 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_USE_MMU # containerd
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
-	select BR2_PACKAGE_DOCKER_PROXY # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
 	help
 	  Docker is a platform to build, ship,
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c50f08245d..ca1aa27b0a 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -24,7 +24,7 @@ DOCKER_ENGINE_LDFLAGS = \
 	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.Version="$(DOCKER_ENGINE_VERSION)"
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
-DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
+DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
deleted file mode 100644
index 7e40536537..0000000000
--- a/package/docker-proxy/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_DOCKER_PROXY
-	bool "docker-proxy"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  Libnetwork is a Container Network Model that provides a
-	  consistent programming interface and the required network
-	  abstractions for applications.
-
-	  This package provides docker-proxy, a run-time dependency of
-	  Docker.
-
-	  https://github.com/docker/libnetwork
-
-comment "docker-proxy needs a toolchain w/ threads"
-	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
deleted file mode 100644
index 63296f14c1..0000000000
--- a/package/docker-proxy/docker-proxy.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  05bf95637bae134d12d02bd7a7854cd0c768e6fccb662c2c64523f05b997b204  docker-proxy-f6ccccb1c082a432c2a5814aaedaca56af33d9ea.tar.gz
-sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
deleted file mode 100644
index fe7982e8f6..0000000000
--- a/package/docker-proxy/docker-proxy.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# docker-proxy
-#
-################################################################################
-
-DOCKER_PROXY_VERSION = f6ccccb1c082a432c2a5814aaedaca56af33d9ea
-DOCKER_PROXY_SITE = $(call github,moby,libnetwork,$(DOCKER_PROXY_VERSION))
-
-DOCKER_PROXY_LICENSE = Apache-2.0
-DOCKER_PROXY_LICENSE_FILES = LICENSE
-
-DOCKER_PROXY_DEPENDENCIES = host-pkgconf
-
-DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
-
-define DOCKER_PROXY_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/proxy $(TARGET_DIR)/usr/bin/docker-proxy
-endef
-
-$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
