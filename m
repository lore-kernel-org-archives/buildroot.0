Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F35C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87C241B35;
	Mon, 25 Jul 2022 22:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87C241B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3ZmZVrowP7E; Mon, 25 Jul 2022 22:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C0B41A5C;
	Mon, 25 Jul 2022 22:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54C0B41A5C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E67481BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD5396115E
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD5396115E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4zBsBGDwXXE for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A0DA60E57
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A0DA60E57
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A569C85E6F; Mon, 25 Jul 2022 22:15:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 00:11:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eaa1a43ab7281f70754405441501712a4e2b9981
X-Git-Newrev: a3ab6e43fc88efb85e6e84e837180513f3584dfa
X-Patchwork-Hint: ignore
Message-Id: <20220725221520.A569C85E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/beaglev-secondboot: bump to
 version e17302
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3ab6e43fc88efb85e6e84e837180513f3584dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The filename was changed from bootloader-BEAGLEV to bootloader-JH7100, update
the documentation for the beaglev board as well.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/beaglev/readme.txt                        | 6 +++---
 boot/beaglev-secondboot/beaglev-secondboot.hash | 2 +-
 boot/beaglev-secondboot/beaglev-secondboot.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
index 60678059e1..472d6b1cf1 100644
--- a/board/beaglev/readme.txt
+++ b/board/beaglev/readme.txt
@@ -17,7 +17,7 @@ Build results
 
 After building, output/images contains:
 
-+ bootloader-BEAGLEV-buildroot.bin.out
++ bootloader-JH7100-buildroot.bin.out
 + ddrinit-2133-buildroot.bin.out
 + Image
 + fw_payload.bin
@@ -30,7 +30,7 @@ After building, output/images contains:
 
 The four important files are:
 
- - bootloader-BEAGLEV-buildroot.bin.out, the first stage bootloader
+ - bootloader-JH7100-buildroot.bin.out, the first stage bootloader
 
  - ddrinit-2133-buildroot.bin.out, the DDR initialization firmware
 
@@ -109,7 +109,7 @@ You can flash them as follows:
    "expert" features.
 
  - Then, press 0 and send over X-modem the
-   bootloader-BEAGLEV-buildroot.bin.out file.
+   bootloader-JH7100-buildroot.bin.out file.
 
  - Then, press 1 and send over X-modem the
    ddrinit-2133-buildroot.bin.out.
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
index efc93347b1..d35d3a3856 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ b/boot/beaglev-secondboot/beaglev-secondboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe4d37f3ff38e7f2da70a08f9cb1668c0b928e85d2e0935bd985f910b3ce30e9  beaglev-secondboot-2d20047960044308126117ad56bc08a1164e82b2.tar.gz
+sha256  bf152500e9f7e467bb1dee95a2291f9ecfaaebe1d64b93f6d403cfaf50e540e0  beaglev-secondboot-e17302063c9a4b74475b18ff24dd149c27257354.tar.gz
 sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
index a423c6c6a6..7e5f5681f4 100644
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ b/boot/beaglev-secondboot/beaglev-secondboot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = 2d20047960044308126117ad56bc08a1164e82b2
+BEAGLEV_SECONDBOOT_VERSION = e17302063c9a4b74475b18ff24dd149c27257354
 BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
 BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
 BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
@@ -15,14 +15,14 @@ BEAGLEV_SECONDBOOT_LICENSE_FILES = LICENSE
 
 define BEAGLEV_SECONDBOOT_BUILD_CMDS
 	$(MAKE) -C $(@D)/build \
-		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
 		SUFFIX=buildroot \
 		GIT_VERSION=$(BEAGLEV_SECONDBOOT_VERSION)
 endef
 
 define BEAGLEV_SECONDBOOT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-BEAGLEV-buildroot.bin.out \
-		$(BINARIES_DIR)/bootloader-BEAGLEV-buildroot.bin.out
+	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-JH7100-buildroot.bin.out \
+		$(BINARIES_DIR)/bootloader-JH7100-buildroot.bin.out
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
