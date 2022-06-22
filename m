Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B574AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 483F560B2C;
	Wed, 22 Jun 2022 13:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 483F560B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHhROJzJWWsj; Wed, 22 Jun 2022 13:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32367607F7;
	Wed, 22 Jun 2022 13:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32367607F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8C21C1135
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 13:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0F8640199
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 13:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F8640199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wb3hXzz-kb1O for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 13:52:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4D040012
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D4D040012
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:52:51 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00C8C1C0011;
 Wed, 22 Jun 2022 13:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 15:52:48 +0200
Message-Id: <20220622135248.1246416-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655905969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dt3ss382M3qTig8G9yEekMFyCbeuyOMQ4kM/P0YoWC8=;
 b=g+MmDpYk+iX/lDWdv9MH1jGYk7MIIEfoUldVYVYEV2g9dJmHaDmiRGs8bVU+uXXehtHYt0
 86tT+yKturCOsX1vpyhJFYVxRgWWxyDadDzocRmZBayOqVXxfOjvdgyeAKF2qjBHvNQioJ
 e9eoNbniWtKOJ5rp68I7jldQaDIgkeBbQvYPSk7i5Pv9UNhBPH0IUA7zZXkvdiJYF2h1cw
 Ro2BqHhuW77bLwllzUMJ6liONbzkKO3pQykdeiz90l+zOcy+1xTg4mG2x92osTdeABElGA
 MITEFBjN0S6BshHKSMO9gzzUSh8vlE3KuQq7AQlI4GQfvIXAiCqap2aVX794KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g+MmDpYk
Subject: [Buildroot] [PATCH v2] package/gcnano-binaries: bump version to
 6.4.7
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

Change since v1:
- fix subject version error.
- made few code cleaning from Thomas review.
- add "-f" to link creation to avoid "File exists" message error.

 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 36 ++++++++------------
 2 files changed, 15 insertions(+), 23 deletions(-)

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
index affe0a6063..dc309ec3c2 100644
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
@@ -44,26 +42,20 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
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
+	find . -type l -exec cp -a {} $(1)/usr/lib \;
 	mkdir -p $(1)/usr/include
-	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
-	$(foreach pkgconfig,$(GCNANO_BINARIES_PKG_CONFIGS), \
-		$(INSTALL) -D -m 0644 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/pkgconfig/$(pkgconfig).pc \
-			$(1)/usr/lib/pkgconfig/$(pkgconfig).pc
-	)
+	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
+	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
+	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
+	for file in *.pc ; do \
+		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
+		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
+	done
 endef
 
 define GCNANO_BINARIES_INSTALL_TARGET_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
