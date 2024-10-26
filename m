Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A762D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF60403A8;
	Sat, 26 Oct 2024 14:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRxHMVcGps3C; Sat, 26 Oct 2024 14:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3004049A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3004049A;
	Sat, 26 Oct 2024 14:48:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9902318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F87740175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Q40PS74Juxl for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 330F7401CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 330F7401CC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F0D583CD6; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:47:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cbc240ac2c3a5d7cbbec9826fb99854bdd156a7
X-Git-Newrev: 356f5c420e2642cb1f16b34e7175537bcf95d010
X-Patchwork-Hint: ignore
Message-Id: <20241026144835.1F0D583CD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-fm-ucode: bump to version
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

commit: https://git.buildroot.net/buildroot/commit/?id=356f5c420e2642cb1f16b34e7175537bcf95d010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update this package to the same NXP software release as the ls1046a
board. The only upstream change was to rename the license file.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/ls1046a-frwy/readme.txt    | 2 +-
 package/qoriq-fm-ucode/qoriq-fm-ucode.hash | 4 ++--
 package/qoriq-fm-ucode/qoriq-fm-ucode.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/freescale/ls1046a-frwy/readme.txt b/board/freescale/ls1046a-frwy/readme.txt
index 846e4ebfe3..1af6fccbf5 100644
--- a/board/freescale/ls1046a-frwy/readme.txt
+++ b/board/freescale/ls1046a-frwy/readme.txt
@@ -16,7 +16,7 @@ the components from NXP are:
   - rcw, LSDK 21.08
   - atf (fork), lf-6.6.23-2.0.0
   - uboot (fork), lf-6.6.23-2.0.0
-  - qoriq-fm-ucode (blob), LSDK 21.08
+  - qoriq-fm-ucode (blob), lf-6.6.23-2.0.0
   - linux (fork), lf-6.6.23-2.0.0
 
 Build
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
index 5c664356c0..67efd675cc 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2e431dd726c4aa1db558931d80b318149abdf71fec6e39de9d5aa33399df1fb1  qoriq-fm-ucode-LSDK-21.08.tar.gz
-sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
+sha256  c994367c74dd2ff6cd70ea269cf1bc775c5f4e11294a8db414491ce6c2eb9dc3  qoriq-fm-ucode-lf-6.6.23-2.0.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
index 5dfdf1e8f8..84360533eb 100644
--- a/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
+++ b/package/qoriq-fm-ucode/qoriq-fm-ucode.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-QORIQ_FM_UCODE_VERSION = LSDK-21.08
+QORIQ_FM_UCODE_VERSION = lf-6.6.23-2.0.0
 QORIQ_FM_UCODE_SITE = $(call github,nxp-qoriq,qoriq-fm-ucode,$(QORIQ_FM_UCODE_VERSION))
 QORIQ_FM_UCODE_LICENSE = NXP Binary EULA
-QORIQ_FM_UCODE_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_FM_UCODE_LICENSE_FILES = LICENSE
 QORIQ_FM_UCODE_INSTALL_IMAGES = YES
 QORIQ_FM_UCODE_INSTALL_TARGET = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
