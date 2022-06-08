Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049BEC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 13:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5D3041154;
	Wed,  8 Jun 2022 13:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_8SjbQbF8mv; Wed,  8 Jun 2022 13:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2EF74058D;
	Wed,  8 Jun 2022 13:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9F61BF3AE
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 13:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 281E841894
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 13:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ASgtSM5BpuS for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 13:30:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 739A84188F
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 13:30:01 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0E114E0010;
 Wed,  8 Jun 2022 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654694998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=16dDcoto0tZZ0CITPw6prNcWnW8qISfeVXVxIUBcPl4=;
 b=kbWupbZJb8/gLB1ClLF57lAfS7CZOm2nEQuzRWJXmC4M7k78elbcic6z0zlZS+6q8p0XlS
 5n31sdTj5VvqQNGJ2LbyNEH0YMopHU59uabrkRYCmjXXHgsmCF21BPjKE8GV75NNd2Ipgr
 6yXloPC6Y/aGOu4BO6cVEIP8p509/KjirOhJF5Y9HHg4Pz7bMzds/4MG8QcFfjPEjT1QNN
 tJskgNXT/qxXOrJbFYyYc+fLF8mNECCmD7T8NV4Y5JU8dqo64lZuyZqSj+WhsDr0A7VGDy
 G4zHswDoUpQqhbPxkJs3/F9wnRETB9WkqCdH8Rr71iLtvHxlorc5smO5JYeJ4w==
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 15:29:57 +0200
Message-Id: <20220608132957.68895-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gcnano-binaries: bump version to 4.3.7
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, scooby22@web.de,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Update to the latest version of the gcnano-binaries blobs, which are
compatible with the soon-to-be-released 5.15 kernel from the
STMicroelectronics BSP.

As we are installing all the libraries and the pkgconfig files we do not
need to list them anymore. Therefore this patch removes
GCNANO_BINARIES_LIBRARIES and GCNANO_BINARIES_PKG_CONFIGS variables.
It also updates the installation command to follow the path and naming
of the new version and the pkgconfig files to fill the prefix variable with
the right value.

The new version of gcnano has gbm.h header installed in a gbm folder,
this break the build of other packages. The patch fixes it with a simple
link.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 37 ++++++++------------
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index d4ad96672a..1ed66e3753 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32d91d6ce6e6551cb7ad0eee4698041fdeb10a4f216e6564adb06408476edc38  gcnano-binaries-969d11518529bb70a132909b02ddcc5736c92d91.tar.gz
+sha256  d3aebbc87ca27e743fdd21d71025cdf0761af748907bbdd7b193262eb48ab3c7  gcnano-binaries-a20611434ef048d3d0c04f55b6cd7d75a2156d43.tar.gz
 sha256  7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index affe0a6063..4814db10c9 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4
-GCNANO_BINARIES_LIB_REVISION = 3
-GCNANO_BINARIES_LIB_FULL_VERSION = $(GCNANO_BINARIES_LIB_VERSION).$(GCNANO_BINARIES_LIB_REVISION)
-GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20210726
-GCNANO_BINARIES_VERSION = 969d11518529bb70a132909b02ddcc5736c92d91
+GCNANO_BINARIES_LIB_VERSION = 6.4.7
+GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20220524
+GCNANO_BINARIES_VERSION = a20611434ef048d3d0c04f55b6cd7d75a2156d43
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
@@ -44,26 +42,21 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	AQROOT=$(@D) \
 	DEBUG=0
 
-GCNANO_BINARIES_LIBRARIES = \
-	libgbm_viv libEGL libGAL libgbm libGLESv1_CM \
-	libGLESv2 libGLSLC libOpenVG libVSC
-
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
 
-GCNANO_BINARIES_PKG_CONFIGS = egl gbm glesv1_cm glesv2 vg
-
 define GCNANO_BINARIES_INSTALL
-	$(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
-		$(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
-			$(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
-		cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
-	)
+	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/drivers/ ; \
+	find . -type f -exec $(INSTALL) -D -m 0755 {} $(1)/usr/lib/{} \; ; \
+	find . -type l -exec cp -a {} $(1)/usr/lib \; ; \
 	mkdir -p $(1)/usr/include
-	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
-	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
-		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
-			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
-	)
+	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
+	ln -s gbm/gbm.h $(1)/usr/include/gbm.h
+	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
+	for file in * ; do \
+		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
+		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
+		rm $$file.temp ; \
+	done
 endef
 
 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
