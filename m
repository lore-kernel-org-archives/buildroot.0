Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01513C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE6B84178E;
	Wed, 26 Jul 2023 21:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE6B84178E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoHMXQAD79zM; Wed, 26 Jul 2023 21:25:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2C3040C51;
	Wed, 26 Jul 2023 21:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2C3040C51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C1B81BF983
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E940B41E75
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E940B41E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRz_Xixwmy1K for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8B4841E6F
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8B4841E6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7DCC835E7; Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:25:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0cbbb0190a49439d80b03f779d9b253275b0c48b
X-Git-Newrev: 8d1180aa483b624f1be27bd0858c2f6665ebf36c
X-Patchwork-Hint: ignore
Message-Id: <20230726212528.B7DCC835E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-rkbin: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d1180aa483b624f1be27bd0858c2f6665ebf36c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a package for the Rockchip ATF binary blobs. These
binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
RK3588).

As there as so many binary blobs, for each suported SoCs, it is not
practical to introduce a choice, so one must manually define which
blobs (for bl31, tpl and optee) to use from the repository, that
match their actual board.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
[yann.morin.1998@free.fr:
  - drop custom version
  - simplify copying blobs
  - slightly tweak help texts
  - add hash for license file
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 27 +++++++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  3 +++
 package/rockchip-rkbin/rockchip-rkbin.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d8b43c31e..464d1db552 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1803,6 +1803,9 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
+F:	package/rockchip-rkbin/
+
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
diff --git a/package/Config.in b/package/Config.in
index 1e551d17c4..1237281701 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
+	source "package/rockchip-rkbin/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-rkbin/Config.in b/package/rockchip-rkbin/Config.in
new file mode 100644
index 0000000000..ae5601db41
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "rockchip-rkbin"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  This package provides Rockchip SoC binary blobs for U-Boot.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
+	string "Rockchip rkbin tpl file path"
+	help
+	  Fath to the tpl file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as tpl.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
+	string "Rockchip rkbin bl31 file path"
+	help
+	  Path to the bl31 file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as bl31.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME
+	string "Rockchip rkbin tee file path"
+	help
+	  Path to the TEE file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as TEE.
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
new file mode 100644
index 0000000000..a4b6cbeaa7
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bd8d19ace202ff26d1c0b4d7744cd467cd0093801dc674dde57290159eedee2b  rockchip-rkbin-b4558da0860ca48bf1a571dd33ccba580b9abe23-br1.tar.gz
+sha256  1f2e25ae65f3af774e6f141f84253d6a05d489fb0b88b311220d70471c023c9c  LICENSE
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
new file mode 100644
index 0000000000..49271084eb
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
+ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE
+
+ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
+ROCKCHIP_RKBIN_INSTALL_TARGET = NO
+
+ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
+ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
+ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
+
+define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
+	$(foreach f, \
+		$(ROCKCHIP_RKBIN_BL31_FILENAME) \
+		$(ROCKCHIP_RKBIN_TPL_FILENAME) \
+		$(ROCKCHIP_RKBIN_TEE_FILENAME) \
+		, \
+		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(f)
+	)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
