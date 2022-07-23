Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD101C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6257984C0E;
	Sat, 23 Jul 2022 20:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6257984C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2ISqyoq-DfC; Sat, 23 Jul 2022 20:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483E484BB6;
	Sat, 23 Jul 2022 20:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 483E484BB6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 303B41BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBA5C40926
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:18:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA5C40926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ySj2TY00xJ2 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B5040331
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B5040331
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 06CAB85143; Sat, 23 Jul 2022 20:05:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:16:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f13cf28b622c37d83a70a0899ccada50cd8c0711
X-Git-Newrev: bcdcacf0c9137fb6abdc953b1af82092f5918278
X-Patchwork-Hint: ignore
Message-Id: <20220723200510.06CAB85143@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: bump version to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bcdcacf0c9137fb6abdc953b1af82092f5918278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 36 +++++++++++-----------------
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
