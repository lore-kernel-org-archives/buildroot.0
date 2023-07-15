Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07F4C001DC
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 19:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E7081DF3;
	Sat, 15 Jul 2023 19:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E7081DF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8VD3624iHYV; Sat, 15 Jul 2023 19:48:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88B6B819BE;
	Sat, 15 Jul 2023 19:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B6B819BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 566D41BF2E5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AF82404FE
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 19:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF82404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgAABBLIkukB for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 19:47:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E307D400E5
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E307D400E5
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 19:47:44 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id CCEB6A03D1;
 Sat, 15 Jul 2023 21:47:42 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id AD6D9A03C3;
 Sat, 15 Jul 2023 21:47:42 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 3E268100136;
 Sat, 15 Jul 2023 21:47:42 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 21:47:33 +0200
Message-Id: <20230715194735.15286-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230715194735.15286-1-kilian.zinnecker@mail.de>
References: <20230715194735.15286-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 6059
X-purgate-ID: 154282::1689450462-3D7FE7B6-94AE93DB/2/53637512152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1689450462;
 bh=R1qUqj1NGtXc9PsVcNkmnXipKDvW15OvPYLkEY1s1Nk=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=Dit30KEes96y/J5hT2ZAR0vituxQbMIaqx+cpPtXU2FWQqZ5vApeRdp++yPTWvHqo
 0Z0xR7napJQQzFahZNcRvmuqBYDbWloSYH84rOHpJU9OdFNOMF+9kauv3NWDZOWt1z
 dmRW3gC8VrW3O7qZP0kyjZCq35NbJqFD4O1EClbC7O2BOoYOnXSI/27D6gQt+nltNY
 /PjKRY67gpN3tT2esTSC8EvnbCr/9+3Hqtn9aY6hPMZcji50EpMwhSOHjXmzY5+nfR
 mBg0WmgzLJH3PXw9h6Fafkxyma6Uh66ljkz2F8Xc50QvdOKSwK4wksDKrjFrIOogxv
 tE5jASPdUM5lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=Dit30KEe
Subject: [Buildroot] [PATCH v7 1/3] package/rockchip-rkbin: new package
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds a package for the Rockchip ATF binary blobs. These
binaries are needed to build U-Boot for some Rockchip SoCs (e.g.,
RK3588). One can config a custom version and manually define which
blobs (for bl31, tpl and optee) to use from the repository.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 DEVELOPERS                                 |  3 ++
 package/Config.in                          |  1 +
 package/rockchip-rkbin/Config.in           | 47 ++++++++++++++++++++++
 package/rockchip-rkbin/rockchip-rkbin.hash |  2 +
 package/rockchip-rkbin/rockchip-rkbin.mk   | 46 +++++++++++++++++++++
 5 files changed, 99 insertions(+)
 create mode 100644 package/rockchip-rkbin/Config.in
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.hash
 create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 405ccd645a..d506e82ff8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1797,6 +1797,9 @@ F:	package/ramsmp/
 N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
 F:	package/libcamera/
 
+N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
+F:	package/rockchip-rkbin/
+
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
diff --git a/package/Config.in b/package/Config.in
index 57d3646566..1e076d40a8 100644
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
index 0000000000..08ca5d4d98
--- /dev/null
+++ b/package/rockchip-rkbin/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_ROCKCHIP_RKBIN
+	bool "rockchip-rkbin"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  This package provides Rockchip SoC binary blobs for U-Boot.
+
+if BR2_PACKAGE_ROCKCHIP_RKBIN
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+	bool "Use a custom version"
+	help
+	  This option allows to use a specific version.
+if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE
+	string "Rockchip rkbin version"
+	depends on BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION
+	string
+	default "d6ccfe401ca84a98ca3b85c12b9554a1a43a166c" \
+		if !BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+	default BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE \
+		if BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME
+	string "Rockchip rkbin tpl file path"
+	help
+	  Full path to the tpl file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as tpl.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME
+	string "Rockchip rkbin bl31 file path"
+	help
+	  Full path to the bl31 file inside the rkbin repository. The
+	  specified file will be copied and used by U-Boot as bl31.
+
+config BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME
+	string "Rockchip rkbin tee file path"
+	help
+	  Full path to the TEE file inside the rkbin repository.
+	  The specified file will be copied and used by U-Boot as
+	  TEE.
+
+endif # BR2_PACKAGE_ROCKCHIP_RKBIN
diff --git a/package/rockchip-rkbin/rockchip-rkbin.hash b/package/rockchip-rkbin/rockchip-rkbin.hash
new file mode 100644
index 0000000000..71ac3ea259
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6f7b58fe35108101031ebfd3cc6eb7a186f258a1cdbd93c4256888997ab52c8f  rockchip-rkbin-d6ccfe401ca84a98ca3b85c12b9554a1a43a166c-br1.tar.gz
diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk b/package/rockchip-rkbin/rockchip-rkbin.mk
new file mode 100644
index 0000000000..e80aaefab8
--- /dev/null
+++ b/package/rockchip-rkbin/rockchip-rkbin.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# rockchip-rkbin
+#
+################################################################################
+
+ROCKCHIP_RKBIN_VERSION = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_VERSION))
+ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
+ROCKCHIP_RKBIN_SITE_METHOD = git
+ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
+ROCKCHIP_RKBIN_REDISTRIBUTE = NO
+
+ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
+ROCKCHIP_RKBIN_INSTALL_TARGET = NO
+
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME),"")
+ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
+endif
+
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME),"")
+ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
+endif
+
+ifneq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME),"")
+ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))
+endif
+
+define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
+	$(if $(ROCKCHIP_RKBIN_BL31_FILENAME), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_BL31_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_BL31_FILENAME##*/})
+	$(if $(ROCKCHIP_RKBIN_TPL_FILENAME), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TPL_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TPL_FILENAME##*/})
+	$(if $(ROCKCHIP_RKBIN_TEE_FILENAME), \
+		cp $(@D)/$(ROCKCHIP_RKBIN_TEE_FILENAME) $(BINARIES_DIR)/${ROCKCHIP_RKBIN_TEE_FILENAME##*/})
+endef
+
+ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE)),)
+$(error No custom rockchip-rkbin version specified. Check your BR2_PACKAGE_ROCKCHIP_RKBIN_CUSTOM_VERSION_VALUE setting)
+endif
+ifeq ($(BR_BUILDING),y)
+BR_NO_CHECK_HASH_FOR += rockchip-rkbin-$(ROCKCHIP_RKBIN_VERSION)-br1.tar.gz
+endif
+endif
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
