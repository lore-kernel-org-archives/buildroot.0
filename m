Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78166D10BFE
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 400DF606E7;
	Sat, 26 Oct 2024 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P83HqYk9fkT0; Sat, 26 Oct 2024 14:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35F8F606AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F8F606AA;
	Sat, 26 Oct 2024 14:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E1F5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EDF740361
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-DUtpYrfnTI for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC8D403A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC8D403A1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A28883CD0; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:47:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 356f5c420e2642cb1f16b34e7175537bcf95d010
X-Git-Newrev: 72a30e20860e051d0ef0218e133cfeeb5bd1452a
X-Patchwork-Hint: ignore
Message-Id: <20241026144835.2A28883CD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-rcw: bump to version
 lf-6.6.23-2.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72a30e20860e051d0ef0218e133cfeeb5bd1452a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update this package to the same NXP software release as the ls1046a
board.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/ls1028ardb/readme.txt   | 2 +-
 board/freescale/ls1046a-frwy/readme.txt | 2 +-
 package/qoriq-rcw/qoriq-rcw.hash        | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index af6af65757..6633d60b90 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -12,7 +12,7 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
   - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
 
 the components from NXP are:
-  - rcw, LSDK 21.08
+  - rcw, lf-6.6.23-2.0.0
   - atf (fork), lf-6.6.23-2.0.0
   - uboot (fork), lf-6.6.23-2.0.0
   - cadence-dp-firmware (blob), LSDK 20.12
diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 1af6fccbf5..4d1e0e1dcd 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -13,7 +13,7 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
   - https://www.nxp.com/docs/en/user-guide/LSDKUG_Rev21.08.pdf
 
 the components from NXP are:
-  - rcw, LSDK 21.08
+  - rcw, lf-6.6.23-2.0.0
   - atf (fork), lf-6.6.23-2.0.0
   - uboot (fork), lf-6.6.23-2.0.0
   - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 2a887d57d4..1f664842f5 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f199c10e50bd18d7bed0d60f5b68194240dea4f1aa164cec98332723727a4796  qoriq-rcw-LSDK-21.08.tar.gz
+sha256  52dfb95a3d8e811609dd8a982a5c6f3ba88fac096ea8448a27b571b7c25e3a83  qoriq-rcw-lf-6.6.23-2.0.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index b9c9e99222..c6cfe59a56 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = LSDK-21.08
+QORIQ_RCW_VERSION = lf-6.6.23-2.0.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
