Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70377C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 15:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25694406BE;
	Sun, 16 Aug 2026 15:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cY9yAI5U6Cd; Sun, 16 Aug 2026 15:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B5CB406BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786892666;
	bh=wvlMJpXLF+2T1v1t6howzMiUwXVWCgAKIIYYz2t1t+4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TzfOt6ZSyz1OcA56LETE7JpOg3TwdL1z9Cww7lnxHpnyDGSKMqU5D+cuHDBGpxIe1
	 hynHPFS3dY0FH16jMsFgrcLj0u1UsYospg7P5Vl8OE3mQgXeNhPn82EBfW8Ri7AG/Y
	 MoVrqZJT2MKfSByFvlMvdoucMCgmGQVIBK+MBlHF9S2Pjt18toZPXU0MpTrvBHIgos
	 HZAeidrIeMXgxIM3/qqp//71xmQBbkFQQxpLKWg/B8J4P3lwtYZJ2DmpVQyBUU1jrL
	 Dpcb/Sz518hP89rs/tMkur+BxP7MY+x7auOHIBwYhFnVUASvl7cmcN0xnoJH2c9b5j
	 +C/VMjZPhNnMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B5CB406BF;
	Sun, 16 Aug 2026 15:04:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0C74337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C64B960604
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U33IJmAXttQi for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 15:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC8B605D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EC8B605D8
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 15:04:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED9DF8DAB1; Sun, 16 Aug 2026 15:03:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 16:56:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1006666f67ba2837ba4cf1014186f3b1cc8f3415
X-Git-Newrev: 0c349a881332d76ef6f0526a3224facc0c8a7a48
X-Patchwork-Hint: ignore
Message-Id: <20260816150332.ED9DF8DAB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestApache: use read-only
 rootfs image
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c349a881332d76ef6f0526a3224facc0c8a7a48
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With this the test verifies not only that Apache can work in
principle, but also that it works with a read-only rootfs. Because of
the read-only rootfs the test itself cannot write to /root, so store
the test download in /tmp.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
