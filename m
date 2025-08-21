Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C630CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E389F6175A;
	Thu, 21 Aug 2025 19:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7_4f6-r5exX; Thu, 21 Aug 2025 19:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E69261B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E69261B14;
	Thu, 21 Aug 2025 19:20:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E76B81C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D967B616BA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvilFWRafR1m for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A0061714
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06A0061714
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E73E98403C; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:54:31 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e36bbb0e2e02b95c25455fca1e3e67bdddcff4db
X-Git-Newrev: 3afff7b8bca772ddb729d975ad010e52fa00c16b
X-Patchwork-Hint: ignore
Message-Id: <20250821192014.E73E98403C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/setserial: update
 to 2.17-57 for compatibility with newer toolchains
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3afff7b8bca772ddb729d975ad010e52fa00c16b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Debian has a newer setserial which compiles on newer toolchains, so
let's update to it.

Noteworthy is the change from a big diff to a tarball containing the
whole debian directory. The series file which contains all patches to
apply is named properly so no need to rename 00list anymore. The patches
file extension is now .patch instead of .dpatch.

This fixes the build with BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64 external
toolchain (14.2.rel1).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 871cdeab6a00054a1366d5e0ea56bd62a53f1c76)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/setserial/setserial.hash |  4 ++--
 package/setserial/setserial.mk   | 21 +++++++--------------
 2 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/package/setserial/setserial.hash b/package/setserial/setserial.hash
index 991d2860a9..3c1ade56ff 100644
--- a/package/setserial/setserial.hash
+++ b/package/setserial/setserial.hash
@@ -1,5 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial/setserial_2.17-45.3.dsc
+# From https://snapshot.debian.org/file/98a1ce8758c5313a8b8a266d493605e578bcc4f6/setserial_2.17-57.dsc
 sha256  7e4487d320ac31558563424189435d396ddf77953bb23111a17a3d1487b5794a  setserial_2.17.orig.tar.gz
-sha256  33db87e8a86cf12b7c97efca9e056865e71358e8cfeb3931118b2647ce1eecc6  setserial_2.17-45.3.diff.gz
+sha256  e96ef61d3e5fc5a77d6e54c4c48a2caee31931732a18ee49e4c67d128ad181c9  setserial_2.17-57.debian.tar.xz
 # Locally computed
 sha256  1d7e810ed28daf370def626dfd4c502f2f77d2b678f1ac72e2ba675dd6f9af0d  debian/copyright
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 6567738e76..5bce05056a 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -6,8 +6,8 @@
 
 SETSERIAL_VERSION = 2.17
 SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial
-SETSERIAL_EXTRA_DOWNLOADS = setserial_2.17-45.3.diff.gz
+SETSERIAL_SITE = https://snapshot.debian.org/archive/debian/20250307T084701Z/pool/main/s/setserial
+SETSERIAL_EXTRA_DOWNLOADS = setserial_$(SETSERIAL_VERSION)-57.debian.tar.xz
 SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
@@ -18,26 +18,19 @@ SETSERIAL_AUTORECONF = YES
 # Extract the Debian tarball inside the sources
 define SETSERIAL_DEBIAN_EXTRACT
 	$(call suitable-extractor,$(notdir $(SETSERIAL_EXTRA_DOWNLOADS))) \
-		$(SETSERIAL_DL_DIR)/$(notdir $(SETSERIAL_EXTRA_DOWNLOADS)) > $(@D)/setserial_2.17-45.3.diff
+		$(SETSERIAL_DL_DIR)/$(notdir $(SETSERIAL_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
 endef
 
 SETSERIAL_POST_EXTRACT_HOOKS += SETSERIAL_DEBIAN_EXTRACT
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
-	# - Applying diff gotten from SETSERIAL_EXTRA_DOWNLOADS
 	# - Touching gorhack.h is needed for the Debian patch 18 to work
-	# - Rename 00list which contains the list of patches to "series" so
-	#   Buildroot knows in which order the patches need to be applied. This
-	#   is necessary because their file extension is dpatch, which isn't
-	#   supported by the APPLY_PATCHES script outside of the series
-	#   mechanism.
-	$(APPLY_PATCHES) $(@D) $(@D) setserial_2.17-45.3.diff
-
+	# - Apply patches in the order listed in debian/patches/series
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
-		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		mv $(@D)/debian/patches/00list $(@D)/debian/patches/series; \
-		sed -i '/01_makefile.dpatch/d' $(@D)/debian/patches/series; \
+		rm $(@D)/debian/patches/01_makefile.patch; \
+		sed -i '/01_makefile.patch/d' $(@D)/debian/patches/series; \
 		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches series; \
 	fi
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
