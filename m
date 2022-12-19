Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA95C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 22:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0D360E30;
	Mon, 19 Dec 2022 22:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0D360E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auKReqUlD5OE; Mon, 19 Dec 2022 22:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEDB60BF8;
	Mon, 19 Dec 2022 22:14:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEDB60BF8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A58201BF8B4
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DFBF819F8
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DFBF819F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ra8mzbiIDs86 for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 22:13:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6079E81959
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 22:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6079E81959
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EFD986A0E; Mon, 19 Dec 2022 22:13:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 22:26:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73125c7412d4c73eb69d237f059718a1d1ba0bd8
X-Git-Newrev: 3ddf15854deb5f03a4c98afa6c86f9f3b4d6893c
X-Patchwork-Hint: ignore
Message-Id: <20221219221348.4EFD986A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcnano-binaries: bump version to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ddf15854deb5f03a4c98afa6c86f9f3b4d6893c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 30 +++++++++++-----------------
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
