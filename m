Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F331CCD183
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 11:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4FF4810B1;
	Sun, 19 Oct 2025 11:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-b71Gt0QlnA; Sun, 19 Oct 2025 11:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C56810D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C56810D7;
	Sun, 19 Oct 2025 11:23:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2FC11CC
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 11:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8B7740A76
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 11:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-q_JYjc2Hvt for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 11:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0572240A11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0572240A11
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 11:23:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E593787513; Sun, 19 Oct 2025 11:23:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 11:07:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0ce0acfcf7bf1cdd546fa1de0524e64823a342d
X-Git-Newrev: f75faf43506e5090857eb4a9d876d430ff34a972
X-Patchwork-Hint: ignore
Message-Id: <20251019112356.E593787513@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvme: bump version to 2.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f75faf43506e5090857eb4a9d876d430ff34a972
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched build system to meson and added dependency to libnvme:
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.0-rc0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nvme/Config.in |  2 ++
 package/nvme/nvme.hash |  2 +-
 package/nvme/nvme.mk   | 34 +++++++---------------------------
 3 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/package/nvme/Config.in b/package/nvme/Config.in
index dd8655fa1a..16b8726144 100644
--- a/package/nvme/Config.in
+++ b/package/nvme/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NVME
 	bool "nvme"
+	depends on BR2_USE_MMU # libnvme
+	select BR2_PACKAGE_LIBNVME
 	help
 	  NVME utility, a utility for interacting with standard NVM
 	  Express (optimized PCI Express SSD interface) devices.
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index a7ce51ca74..c6fb9c9aa8 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a75270e65a4a7a6add48f748ba216d8f68d78f90f8cb77e88e9753b74d527991  nvme-1.12.tar.gz
+sha256  93282c426f22dd1ea6d172dec8af043c4e9ff80189becfbbb5378fe1ca0a74ad  nvme-2.15.tar.gz
 sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 53f9dff753..9f2b086d2a 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,37 +4,17 @@
 #
 ################################################################################
 
-NVME_VERSION = 1.12
+NVME_VERSION = 2.15
 NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
+NVME_DEPENDENCIES = libnvme
 
-# Yes, LIBUUID=0 means libuuid support enabled.
-# LIBUUID=1 means libuuid support disabled.
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-NVME_DEPENDENCIES += util-linux
-NVME_MAKE_OPTS += LIBUUID=0
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+NVME_CONF_OPTS += -Djson-c=enabled
+NVME_DEPENDENCIES += json-c
 else
-NVME_MAKE_OPTS += LIBUUID=1
+NVME_CONF_OPTS += -Djson-c=disabled
 endif
 
-# Yes, HAVE_SYSTEMD=0 means systemd support enabled.
-# HAVE_SYSTEMD=1 means systemd support disabled.
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-NVME_DEPENDENCIES += systemd
-NVME_MAKE_OPTS += HAVE_SYSTEMD=0
-else
-NVME_MAKE_OPTS += HAVE_SYSTEMD=1
-endif
-
-define NVME_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		$(NVME_MAKE_OPTS) -C $(@D)
-endef
-
-define NVME_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(NVME_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr install-bin
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
