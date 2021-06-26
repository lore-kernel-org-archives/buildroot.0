Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA01C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:19:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1017760F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1017760F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD47E82768;
	Tue,  3 Aug 2021 23:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWKZJh4MrSGw; Tue,  3 Aug 2021 23:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37EB98274D;
	Tue,  3 Aug 2021 23:19:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 150301BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F9D340677
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQP0yfGhvsG8 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 269454044C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7E2BF87B09; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 15:13:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b9cb34313e342e65a80e2cde18d44884dc10890e
X-Git-Newrev: 78f477d1367a3f1a557d5d780051e4163c4aa3e3
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.7E2BF87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zfs: bump version to
 2.0.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7362975024896025999=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============7362975024896025999==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=78f477d1367a3f1a557d5d780051e4163c4aa3e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As this version brings support for kernel up to 5.12, we update the
test cases to use the 5.12 kernel.

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zfs/zfs.hash                      | 4 ++--
 package/zfs/zfs.mk                        | 2 +-
 support/testing/tests/package/test_zfs.py | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 5a0c43d366..7f4f5a59f8 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# Locally calculated
-sha256  7d1344c5433b91823f02c2e40b33d181fa6faf286bea5591f4b1965f23d45f6c  zfs-2.0.4.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.0.5/zfs-2.0.5.sha256.asc
+sha256  3a17498d704ebf4c5d7231660f6fb44ae07a1545519f567452a4270851a86ec9  zfs-2.0.5.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index c8e33a7b1a..3b1afb419a 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.0.4
+ZFS_VERSION = 2.0.5
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index e5f5526faf..772a66c1e4 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -13,7 +13,7 @@ class TestZfsGlibc(infra.basetest.BRTest):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.23"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.13"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_ZFS=y
@@ -70,7 +70,7 @@ class TestZfsUclibc(infra.basetest.BRTest):
         BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.23"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.13"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_ZFS=y

--===============7362975024896025999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7362975024896025999==--
