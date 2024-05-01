Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E347FC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A72060830;
	Wed,  1 May 2024 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdTd04k61TMF; Wed,  1 May 2024 18:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8991460BD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8991460BD0;
	Wed,  1 May 2024 18:52:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB0591BF418
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6669404D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E168uXVFlX6 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 18:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D502400A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D502400A9
 for <buildroot@buildroot.org>; Wed,  1 May 2024 18:52:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9E9A863B4; Wed,  1 May 2024 18:52:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 20:30:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8996fedefbba7e5dfded9b7389062aba4469deaa
X-Git-Newrev: 6c4a99205094dea87986c0e12e955e9ef0676771
X-Patchwork-Hint: ignore
Message-Id: <20240501185220.E9E9A863B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/starfive-spltool: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c4a99205094dea87986c0e12e955e9ef0676771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package for the Starfive SPL tool. It is used to
add a header to the Secondary Program Loader for platforms based on
the Starfive JH7110 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  3 +++
 package/Config.in.host                         |  1 +
 package/starfive-spltool/Config.in.host        |  8 ++++++++
 package/starfive-spltool/starfive-spltool.hash |  2 ++
 package/starfive-spltool/starfive-spltool.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 51a5cad167..6180d238f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2960,6 +2960,9 @@ N:	Thijs Vermeir <thijsvermeir@gmail.com>
 F:	package/ranger/
 F:	package/x265/
 
+N:	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+F:	package/starfive-spltool/
+
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
diff --git a/package/Config.in.host b/package/Config.in.host
index 9543a22ffc..986b2854d0 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -107,6 +107,7 @@ menu "Host utilities"
 	source "package/sentry-cli/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
+	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
 	source "package/swugenerator/Config.in.host"
diff --git a/package/starfive-spltool/Config.in.host b/package/starfive-spltool/Config.in.host
new file mode 100644
index 0000000000..afb2777ca6
--- /dev/null
+++ b/package/starfive-spltool/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_STARFIVE_SPLTOOL
+	bool "host starfive-spltool"
+	depends on BR2_riscv
+	help
+	  Add header to the Secondary Program Loader with the 3rd party
+	  software given by Starfive-Tech for their SoCs.
+
+	  https://github.com/starfive-tech/soft_3rdpart/tree/JH7110_VisionFive2_devel/spl_tool
diff --git a/package/starfive-spltool/starfive-spltool.hash b/package/starfive-spltool/starfive-spltool.hash
new file mode 100644
index 0000000000..55835de310
--- /dev/null
+++ b/package/starfive-spltool/starfive-spltool.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  f5466225021fbe4e983cc85f32ce11d92ad30689b18e0d1390d16f6bfab74477  starfive-spltool-JH7110_VF2_515_v5.11.3.tar.gz
diff --git a/package/starfive-spltool/starfive-spltool.mk b/package/starfive-spltool/starfive-spltool.mk
new file mode 100644
index 0000000000..559df35074
--- /dev/null
+++ b/package/starfive-spltool/starfive-spltool.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# starfive-spltool
+#
+################################################################################
+
+STARFIVE_SPLTOOL_VERSION = JH7110_VF2_515_v5.11.3
+STARFIVE_SPLTOOL_SITE = $(call github,starfive-tech,soft_3rdpart,$(STARFIVE_SPLTOOL_VERSION))
+STARFIVE_SPLTOOL_LICENSE = GPL-2.0+
+STARFIVE_SPLTOOL_FILES = spl_tool/LICENSE
+
+define HOST_STARFIVE_SPLTOOL_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/spl_tool
+endef
+
+define HOST_STARFIVE_SPLTOOL_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/spl_tool/spl_tool $(HOST_DIR)/bin/spl_tool
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
