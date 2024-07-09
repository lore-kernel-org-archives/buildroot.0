Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA3FC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 21:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801A780C4B;
	Tue,  9 Jul 2024 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhOKlcwTc_hw; Tue,  9 Jul 2024 21:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21D9280C08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21D9280C08;
	Tue,  9 Jul 2024 21:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7CDC1BF41D
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB18C40448
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 21:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIE0Xh2EH0rJ for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 21:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBB8A403CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBB8A403CF
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 21:19:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5D277FDF4; Tue,  9 Jul 2024 21:19:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 23:18:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbd9a3f3114ef52d6ff9a14ec2648926909fd46e
X-Git-Newrev: 5dcae8480c4a6ba62e80a6080b299b15ee8dbe3e
X-Patchwork-Hint: ignore
Message-Id: <20240709211911.B5D277FDF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnvme: bump to version 1.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5dcae8480c4a6ba62e80a6080b299b15ee8dbe3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with libnvme commit [0] MMU is required so let's add a depends
on BR2_USE_MMU accordingly.

[0]:
https://github.com/linux-nvme/libnvme/commit/7d927f5f38ebd7c90abebb5ebac4701a1bad0993

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in | 1 +
 package/libnvme/Config.in     | 1 +
 package/libnvme/libnvme.hash  | 2 +-
 package/libnvme/libnvme.mk    | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 7494b0f6b7..62ecaa1ac2 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -59,6 +59,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
 
 config BR2_PACKAGE_LIBBLOCKDEV_NVME
 	bool "nvme"
+	depends on BR2_USE_MMU # libnvme
 	select BR2_PACKAGE_LIBNVME
 
 config BR2_PACKAGE_LIBBLOCKDEV_PART
diff --git a/package/libnvme/Config.in b/package/libnvme/Config.in
index f298046563..bf169f4a90 100644
--- a/package/libnvme/Config.in
+++ b/package/libnvme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNVME
 	bool "libnvme"
+	depends on BR2_USE_MMU # malloc_usable_size()
 	help
 	  libnvme provides type definitions for NVMe specification
 	  and utilities for nvme devices handling in Linux.
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index 469006d632..99c633882a 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  d59939a280eec41eb7a716e1681d0d0c612099385204ffb55d07134a6be08d75  libnvme-1.8.tar.gz
+sha256  455867060d2b7563eab59fe21779dff469d98465028997178c7efbe4b8763206  libnvme-1.9.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index bf131d2a38..da8707db7d 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.8
+LIBNVME_VERSION = 1.9
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
