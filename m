Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB566CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 08:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 821DE605EE;
	Fri, 22 Aug 2025 08:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vx4Io9BdxUhN; Fri, 22 Aug 2025 08:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE61660A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE61660A88;
	Fri, 22 Aug 2025 08:20:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 694E41C7
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5023260A88
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8SVhZ8KkxtN for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 08:20:11 +0000 (UTC)
X-Greylist: delayed 518 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 22 Aug 2025 08:20:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E97060A8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E97060A8C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E97060A8C
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 08:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 56DC24E40BA0;
 Fri, 22 Aug 2025 08:11:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 30DB1604AD;
 Fri, 22 Aug 2025 08:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4234D1C22C90A; 
 Fri, 22 Aug 2025 10:11:31 +0200 (CEST)
Date: Fri, 22 Aug 2025 10:11:08 +0200
MIME-Version: 1.0
Message-Id: <20250822-update_star64-v1-2-83fe87fbe8ea@bootlin.com>
References: <20250822-update_star64-v1-0-83fe87fbe8ea@bootlin.com>
In-Reply-To: <20250822-update_star64-v1-0-83fe87fbe8ea@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755850291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8GtHgkG7ECfMZXKRIB80H2oMiz4ImsuvCjuuMTirqx0=;
 b=HMAP7J8yzHzQNiJz+3HYu+yRXwohCbUbPzPb8QPDdGT5mV0uqLyDx59MbmnPZb5HG5ncNj
 LzVTvkuiDVUqoayUQVq+JA20ugrODm+696eBnZ0VFRlZmS6WKH4Wh236V6oKutVCB4Omc5
 Fd+qxsQ+1a1EolTFmqHdq8IX7Pzk7ZIZeePsOW29y6w6NgfOYEWm9tDIsO5MRZMFRwGjm0
 D3nt7OwBYZubZt8793Y9s/WE1672nODAx/93d0DJFoeSwkyWmCH5y9DXgeu0mPHFx9VpuK
 lzGbO/R3wz6XldMlHGVwVDepuCK545jn1DeGONYjbVNkP2gpMfgt4Ww7DcSeXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HMAP7J8y
Subject: [Buildroot] [PATCH 2/2] package/starfive-spltool: remove the
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The starfive-spltool host package was added to Buildroot to create a
bootable image for the Starfive JH7110 SoC.
Mainline U-Boot can now build an image without it so it is not required
anymore.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 package/Config.in.host                         |  1 -
 package/starfive-spltool/Config.in.host        |  8 --------
 package/starfive-spltool/starfive-spltool.hash |  2 --
 package/starfive-spltool/starfive-spltool.mk   | 20 --------------------
 4 files changed, 31 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index b0f7529a13f983dda5e64f6dbc1b110c8aafc034..2d413bdc80aba3ad2ea71567ae7886f4fc5ea28c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -113,7 +113,6 @@ menu "Host utilities"
 	source "package/skopeo/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
-	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
 	source "package/swtpm/Config.in.host"
diff --git a/package/starfive-spltool/Config.in.host b/package/starfive-spltool/Config.in.host
deleted file mode 100644
index afb2777ca6b4adee75e76a8d7a92540efef47cee..0000000000000000000000000000000000000000
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
index 55835de31086d3c69c05126c5d34100ab462db3d..0000000000000000000000000000000000000000
--- a/package/starfive-spltool/starfive-spltool.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256  f5466225021fbe4e983cc85f32ce11d92ad30689b18e0d1390d16f6bfab74477  starfive-spltool-JH7110_VF2_515_v5.11.3.tar.gz
diff --git a/package/starfive-spltool/starfive-spltool.mk b/package/starfive-spltool/starfive-spltool.mk
deleted file mode 100644
index 559df35074d8487626ca4e6d37e1104c243885d3..0000000000000000000000000000000000000000
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

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
