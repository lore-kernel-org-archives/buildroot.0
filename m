Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0C9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4F360F10
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F4F360F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AFC4814B1;
	Wed,  3 Nov 2021 21:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-C3xXl_rcxJ; Wed,  3 Nov 2021 21:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 981E6814A0;
	Wed,  3 Nov 2021 21:20:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25A3F1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1432840398
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuARJkQUxLfH for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:20:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1411340389
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:20:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 687BE8A47C; Wed,  3 Nov 2021 21:17:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:20:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47db4e74c9adaba38243946b00890ce8ea716333
X-Git-Newrev: df455df19362cca4e69790ec254857bf82636fa3
X-Patchwork-Hint: ignore
Message-Id: <20211103211701.687BE8A47C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-grubenv: bump to version
 1a7db967495bbe8be53b7a69dcb42822f39d9a74
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

commit: https://git.buildroot.net/buildroot/commit/?id=df455df19362cca4e69790ec254857bf82636fa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Drop depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV as mender-grubenv no
    longer uses fw_printenv and fw_setenv and instead provides
    grub-mender-grubenv-print and grub-mender-grubenv-set

  - Update the LICENSE hash as the year has changed.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-grubenv/Config.in           | 7 -------
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index 28b4bb7074..97f785ad3f 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	bool "mender-grubenv"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER # runtime
-	# grubenv provides it's own fw_printenv.
-	depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
 	depends on BR2_TARGET_GRUB2
 	help
 	  Contains the boot scripts and tools used by Mender to
@@ -36,8 +34,3 @@ comment "mender-grubenv needs a grub2 bootloader"
 	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MENDER
 	depends on !BR2_TARGET_GRUB2
-
-comment "mender-grubenv does not work with uboot-tools fw_printenv"
-	depends on BR2_TARGET_GRUB2_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_MENDER
-	depends on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index b6b9db72a7..fcc4e02cbe 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5be4222a6934813da431ae472a633e766b73f4614020745b777c15c65bcfd032 mender-grubenv-f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b.tar.gz
-sha256 32714818ad6f98ee0185a52e23a475d89122e3efd2b2c26c733781c28e798c99 LICENSE
+sha256 00a574d2bed8d54ba6739700da789a420a02de900df56dd2cfbe0df460a98dca mender-grubenv-1a7db967495bbe8be53b7a69dcb42822f39d9a74.tar.gz
+sha256 b4acfcfa2a0ba1a8c82ec3965fbcee886cff8394ca4214e0ddac0a36beb1e05a LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index f06dbbe35c..07df25512c 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b
+MENDER_GRUBENV_VERSION = 1a7db967495bbe8be53b7a69dcb42822f39d9a74
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
