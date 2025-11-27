Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147DDD111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D72906151B;
	Thu, 27 Nov 2025 20:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efSWzisk90_E; Thu, 27 Nov 2025 20:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49AB60AC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E49AB60AC5;
	Thu, 27 Nov 2025 20:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49A052A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B4D360AC5
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIbfnIe-rcN9 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F15A6083C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F15A6083C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:28:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F296838AA; Thu, 27 Nov 2025 20:28:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Nov 2025 21:02:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dca6a203a51c7fe8a073e7eb4910c66eade71032
X-Git-Newrev: c0abf446307bb9b495d296b8845177dff5824b2b
X-Patchwork-Hint: ignore
Message-Id: <20251127202813.1F296838AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/starfive-spltool: remove the
 starfive-spltool package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0abf446307bb9b495d296b8845177dff5824b2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The starfive-spltool host package was added to Buildroot to create a
bootable image for the Starfive JH7110 SoC.
Mainline U-Boot can now build an image without it so it is not required
anymore.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
[Julien: remove DEVELOPERS entry]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  1 -
 package/Config.in.host                         |  1 -
 package/starfive-spltool/Config.in.host        |  8 --------
 package/starfive-spltool/starfive-spltool.hash |  2 --
 package/starfive-spltool/starfive-spltool.mk   | 20 --------------------
 5 files changed, 32 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index db001d6bb0..5e1fa6401f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3172,7 +3172,6 @@ F:	package/x265/
 N:	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
 F:	board/pine64/star64
 F:	configs/pine64_star64_defconfig
-F:	package/starfive-spltool/
 
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
diff --git a/package/Config.in.host b/package/Config.in.host
index d0088364d0..f76d0ce36a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -114,7 +114,6 @@ menu "Host utilities"
 	source "package/sloci-image/Config.in.host"
 	source "package/snagboot/Config.in.host"
 	source "package/squashfs/Config.in.host"
-	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
 	source "package/swtpm/Config.in.host"
diff --git a/package/starfive-spltool/Config.in.host b/package/starfive-spltool/Config.in.host
deleted file mode 100644
index afb2777ca6..0000000000
--- a/package/starfive-spltool/Config.in.host
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_HOST_STARFIVE_SPLTOOL
-	bool "host starfive-spltool"
-	depends on BR2_riscv
-	help
-	  Add header to the Secondary Program Loader with the 3rd party
-	  software given by Starfive-Tech for their SoCs.
-
-	  https://github.com/starfive-tech/soft_3rdpart/tree/JH7110_VisionFive2_devel/spl_tool
diff --git a/package/starfive-spltool/starfive-spltool.hash b/package/starfive-spltool/starfive-spltool.hash
deleted file mode 100644
index 55835de310..0000000000
--- a/package/starfive-spltool/starfive-spltool.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  f5466225021fbe4e983cc85f32ce11d92ad30689b18e0d1390d16f6bfab74477  starfive-spltool-JH7110_VF2_515_v5.11.3.tar.gz
diff --git a/package/starfive-spltool/starfive-spltool.mk b/package/starfive-spltool/starfive-spltool.mk
deleted file mode 100644
index 559df35074..0000000000
--- a/package/starfive-spltool/starfive-spltool.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# starfive-spltool
-#
-################################################################################
-
-STARFIVE_SPLTOOL_VERSION = JH7110_VF2_515_v5.11.3
-STARFIVE_SPLTOOL_SITE = $(call github,starfive-tech,soft_3rdpart,$(STARFIVE_SPLTOOL_VERSION))
-STARFIVE_SPLTOOL_LICENSE = GPL-2.0+
-STARFIVE_SPLTOOL_FILES = spl_tool/LICENSE
-
-define HOST_STARFIVE_SPLTOOL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/spl_tool
-endef
-
-define HOST_STARFIVE_SPLTOOL_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/spl_tool/spl_tool $(HOST_DIR)/bin/spl_tool
-endef
-
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
