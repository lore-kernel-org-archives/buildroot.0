Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE37D0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E3AE40240;
	Wed,  7 Jan 2026 18:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4iTX8WjXMZg; Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1D60412F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808908;
	bh=LlvdhYGhCZBvllbUGa3sBgGaTE7lnR1PSky63yGtizs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SazErRWI89JOO4cJCSnrb9Mx613kMCkptlZ5mjlNUSbQ+2cv9C7iRrHo0lbi7+nlc
	 DEozKfoTlpVzxwEFaRlBAs7ud7kg77gDlH5AFoOTknMozUr9aQHwetPYnGPYE1zM3y
	 Kfe2P3sSGaoWNrT9h0Lq9ddzSWRqx4ixc/vhZc1pBwwPGYRsv10GK/KPivLwaxQbiE
	 Q0t5Bl5cNhCtvT8AMaV8emnhhtKDQOkGFMtw0w3iLQctCIi2UjVBm3J2EXkJtaADCH
	 BFlfcIvfrOfnnryyiCD8SVwLWUecJ8UiUhc3Z9Sv26Be6kLozW4xlogfGMBAr0IPBd
	 2Maq+XiriugMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1D60412F5;
	Wed,  7 Jan 2026 18:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 344F125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 058436083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d-VRTGOL3hA for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4509160643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4509160643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 434468268F; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:55:52 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 0a258ddc56791e633a05aaecd9d85c12f320e8c5
X-Git-Newrev: 8fb28e79f2d1290ac34fb393bc50b89f5adb775a
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.434468268F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing:
 ddrescue: use f-string for test config
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fb28e79f2d1290ac34fb393bc50b89f5adb775a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c3d5f2c25480693bc6915b44b36e99b9febc371b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_ddrescue.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 042431eb7b..ff2af80cfa 100644
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
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.15"
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
