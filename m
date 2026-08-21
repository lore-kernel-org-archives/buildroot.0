Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E245C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DFF381EB8;
	Fri, 21 Aug 2026 15:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3i6vsLZ9D_v; Fri, 21 Aug 2026 15:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325142;
	bh=DPbCT6kMg8T1p7q/m9iAUgmV+vv7fI6N0Z8lZO8m+6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qNKkCxcxkchayjtIJg6Db+Zks81imOotDhzc1nm8Mc7kTJHYwflkh1bgMzS0eQ2Os
	 Iuw0p9kWiCTEfIx+bJ9uopZtgtB6158ntRQohwSXE7IiPDZb2CMcDbILY22eJV6d25
	 BdRJweOY9DXHpBg5i/AzEIs2YULnM99L6Pu213t7vifSFv+5vEKKXqciDiSbYeqHYu
	 q4/4HQCbeCXi+3bZ3+Xzy9HNbVrayqRtab1Sv02vrKcfNMEq6H3PabPEasCJDftMee
	 z9bKzpXvof7iyMdtb9mgm2XE5FNMa1ssaXkR6QSzE+bCjxAkVzhzar5m5TlS2zbI1R
	 J75+zdw3NhDGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE99981E8E;
	Fri, 21 Aug 2026 15:12:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E96EEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AA6E400AB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rt5NUk9Gu2ze for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5ABD4004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5570F8D5CE; Fri, 21 Aug 2026 15:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 11:48:54 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 583e189d42ffcb8713734f99991b25bb89d3639a
X-Git-Newrev: 409214de5f3771ab6067e8378afa9ebaa9517097
X-Patchwork-Hint: ignore
Message-Id: <20260821151018.5570F8D5CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 TestApache: use read-only rootfs image
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/409214de5f3771ab6067e8378afa9ebaa9517097
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

With this the test verifies not only that Apache can work in
principle, but also that it works with a read-only rootfs. Because of
the read-only rootfs the test itself cannot write to /root, so store
the test download in /tmp.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0c349a881332d76ef6f0526a3224facc0c8a7a48)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/testing/tests/package/test_apache.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_apache.py b/support/testing/tests/package/test_apache.py
index f29f4e2524..d44e7927bd 100644
--- a/support/testing/tests/package/test_apache.py
+++ b/support/testing/tests/package/test_apache.py
@@ -1,5 +1,6 @@
 import os
 
+import infra
 import infra.basetest
 
 
@@ -7,17 +8,22 @@ class TestApache(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_APACHE=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
+        rootfs = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        infra.img_round_power2(rootfs)
+        self.emulator.boot(arch="armv7",
                            kernel="builtin",
-                           options=["-initrd", cpio_file])
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=squashfs"],
+                           options=["-drive",
+                                    "file={},if=sd,format=raw".format(rootfs)])
         self.emulator.login()
 
         self.assertRunOk("httpd -V")
-        self.assertRunOk("wget http://localhost/index.html")
-        self.assertRunOk("grep -F 'It works!' index.html")
+        self.assertRunOk("wget -O /tmp/index.html http://localhost/index.html")
+        self.assertRunOk("grep -F 'It works!' /tmp/index.html")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
