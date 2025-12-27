Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47FDE92723
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4299C60818;
	Sat, 27 Dec 2025 23:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAz1QQAY70w3; Sat, 27 Dec 2025 23:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6418360812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878804;
	bh=Ngu5U4Lc7q77sSdEWWCiEzRNWWyS/miYiX1wg6D+beM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sE3oDILvUYk8dwDj2aLUge79xsQfKtnaVDLjBSnkL64scd4TROIJp9U++MWuLvqdJ
	 8VBZPUT++YrEXLseBqvvUuSHEMUZH5hQzlWPnnru+YSUzBu9oSGWmT2nsvH9Eq2moa
	 UXxdw/1x//A/DdfWJtgyGmOCwIWJhX95SsLrB1BzLYvfz3zl4M8BLA5i71xr8URXyR
	 wXLlKqHEFtzxO5mhONlKGoSmtbWPMjNMVWH4Gvydz+2AgJW8TaiNvkeZrJVthnE2Bt
	 vq5YlUMaORJcMPap0eIwzWCJjrepwcIsqlD0tvUustkWqJ13HBfygSpJqQG5KCLQdq
	 JFeapWnX3tzOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6418360812;
	Sat, 27 Dec 2025 23:40:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F51471
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BEEB80FB7
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K7ZcwB_G05C for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E16F80FB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E16F80FB0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66C878790E; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:39:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 289b5aab18d68521c4faac1208066c8947aa6070
X-Git-Newrev: c3d5f2c25480693bc6915b44b36e99b9febc371b
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.66C878790E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: ddrescue: use f-string
 for test config
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3d5f2c25480693bc6915b44b36e99b9febc371b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_ddrescue.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index eb3f63ae53..bd34694737 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -10,8 +10,10 @@ class TestDdrescue(infra.basetest.BRTest):
     #   mapper dm-dust, which are used to simulate a failing storage
     #   block device.
     # - lvm2 user space package is needed to configure dm-dust with dmsetup
+    kernel_fragment = \
+        infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
     config = \
-        """
+        f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -20,16 +22,14 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.2"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_DDRESCUE=y
         BR2_PACKAGE_LVM2=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(
-            infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
-        )
+        """
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
