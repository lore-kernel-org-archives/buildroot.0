Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB06C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 13:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A59401A1;
	Mon, 19 Dec 2022 13:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A59401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ng1Ma56Tnxtl; Mon, 19 Dec 2022 13:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB1040148;
	Mon, 19 Dec 2022 13:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB1040148
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE581BF2C5
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FAFA4038D
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 13:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FAFA4038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3K8C3ocOPYM3 for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 13:39:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AFB740116
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AFB740116
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 13:39:34 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5BC260005;
 Mon, 19 Dec 2022 13:39:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 14:39:30 +0100
Message-Id: <20221219133930.231407-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1671457172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oulhsn58j33LyOqvleijzA+tS8jKxLpRRa3n56fMbvQ=;
 b=MI9npuZVVwT2lHOIQU1fGeY8FF5oBk2t5vv7JhOjXJ9F09HpqTQ96MDazp+HKj4v/TL6m3
 xfkJPkZXQ74GdCEHO2lklzrd/M7Nugp8saqkUynnsC+/UYlWWSvh0S20lHbL4oekDHAAHr
 690WxIdo7mI8B8K2bgWppo4xVjWePbY4SwVYuN6Z7zsj+MsXbLm6qUARfxKkpxzew09WlY
 1s5ndSrMrly6cY8hbzgS6Fnn43kaVM/ghkKSl8vKKlzAdvXulmxoc1x7DXC3b5i5asV/0/
 NRCAaCGldSp2vCFYmlcqIu95PFyBt3fDWiuzH63AmZvftad3W1LNLaL0yFxplA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MI9npuZV
Subject: [Buildroot] [PATCH v2] package/gcnano-binaries: bump version to
 6.4.9
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Jens Kleintje <scooby22@web.de>,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the last v5.15-stm32mp-r2 kernel from the
STMicroelectronics BSP.

The management of libraries links have now changed. We moved on from
a version with several links present but few of them missing to no links
at all. Now, all the links are made by the build system. The loop
mechanism to make them are imported from the ST Yocto layer.

The packageconfig have also changed, no need to update prefix and version
value anymore.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Notes:
    Change on V2: update the commmit message to explain the changes

 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 30 ++++++++------------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index 1ed66e3753..7bb942e6da 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3aebbc87ca27e743fdd21d71025cdf0761af748907bbdd7b193262eb48ab3c7  gcnano-binaries-a20611434ef048d3d0c04f55b6cd7d75a2156d43.tar.gz
+sha256  b122a0cd7a1bd2cee8c6117b259ef977a765d24e48655f639694cbef471da99b  gcnano-binaries-0ac1a89d7a59d040a69745a85f0da7e98644cc4b.tar.gz
 sha256  7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index d9c47bf64e..83261f3b7c 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.7
+GCNANO_BINARIES_LIB_VERSION = 6.4.9
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20220524
-GCNANO_BINARIES_VERSION = a20611434ef048d3d0c04f55b6cd7d75a2156d43
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20221206
+GCNANO_BINARIES_VERSION = 0ac1a89d7a59d040a69745a85f0da7e98644cc4b
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
@@ -38,31 +38,25 @@ GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER
 
 GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	KERNEL_DIR=$(LINUX_DIR) \
-	SOC_PLATFORM=st-st \
+	SOC_PLATFORM=st-mp1 \
 	AQROOT=$(@D) \
 	DEBUG=0
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
 
-# This creates:
-#   libGLESv2.so.2    -> libGLESv2.so
-#   libGLESv1_CM.so.1 -> libGLESv1_CM.so
-# symlinks, as most OpenGL implementations have them, and they are
-# expected by some users such as libepoxy.
 define GCNANO_BINARIES_INSTALL
 	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
 	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
-	find . -type l -exec cp -a {} $(1)/usr/lib \;
-	ln -sf libGLESv2.so $(1)/usr/lib/libGLESv2.so.2
-	ln -sf libGLESv1_CM.so $(1)/usr/lib/libGLESv1_CM.so.1
+	for sharelib in *.so.*; do \
+		dev_lib_name=`echo $${sharelib} | awk -F'.so' '{print $$1}'`.so ; \
+		link_name=`$(TARGET_OBJDUMP) -x $${sharelib} 2>/dev/null | grep SONAME | sed 's/.* //'` ; \
+		ln -sf $${sharelib} $(1)/usr/lib/$${dev_lib_name} ; \
+		ln -sf $${sharelib} $(1)/usr/lib/$${link_name} ; \
+	done
 	mkdir -p $(1)/usr/include
 	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
-	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
-	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
-	for file in *.pc ; do \
-		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|21.1.1|" $$file > $$file.temp ; \
-		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
-	done
+	mkdir -p $(1)/usr/lib/pkgconfig/
+	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/*  $(1)/usr/lib/pkgconfig/
 endef
 
 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
