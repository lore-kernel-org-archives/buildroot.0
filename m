Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41713EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EAD180C3D;
	Thu,  1 Jan 2026 22:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1aPOS7Ay0UI; Thu,  1 Jan 2026 22:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 284BA80C4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304888;
	bh=Zkev5CRa+0VIljs/VbV8tJuHHHIuzRWxO3ZBtdBRTgI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ooQRQn7ufg5kjSv5409Js6zNu83SMYp5KTYs6ruAK9yD2zZeMnszq01Bk2SVF8wAw
	 ATCwPLYJRaWLzremY9z4UP9i1fpIXngrxtxYi316slPJn9cGfj02cs1ycdRVLAp0gx
	 x+ZlUW10Xi006nQOn0OZcWubszg2ilDPM2Iy4mNrT9saE3VyeBndm8+5gXIvJujmxh
	 o8v4eWvv6h2nRI2clc1EMTpun9OxQMALkAm7BCqWkgAXasNq5UnByxTVIU5US0Gf8o
	 HHplyH7KZtKrJit6X7Lz3PtZ82TxIBmf9toxRqLb/Q6aCueVySeuL9n6U8xvkmNA00
	 AkyOdAz2Y5vDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284BA80C4A;
	Thu,  1 Jan 2026 22:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 811FA206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7253840387
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sz3kQH0MBu7R for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9F8B401EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F8B401EB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A97687F4B; Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:58:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53044437c8ba83eb4409a4af89fdfe13de7fb737
X-Git-Newrev: 4ae42d874de8748847e16e2f2cd163ca4bc7ef5e
X-Patchwork-Hint: ignore
Message-Id: <20260101220125.8A97687F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_quazip:
 new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ae42d874de8748847e16e2f2cd163ca4bc7ef5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_quazip.py | 43 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a06ebe73e5..14ebccc611 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3542,3 +3542,4 @@ F:	package/quazip/
 F:	package/shapelib/
 F:	package/simple-mail/
 F:	package/tinc/
+F:	support/testing/tests/package/test_quazip.py
diff --git a/support/testing/tests/package/test_quazip.py b/support/testing/tests/package/test_quazip.py
new file mode 100644
index 0000000000..154481fe4a
--- /dev/null
+++ b/support/testing/tests/package/test_quazip.py
@@ -0,0 +1,43 @@
+import os
+
+import infra.basetest
+
+
+class TestQuazipQt6(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_QT6=y
+        BR2_PACKAGE_QUAZIP=y
+        BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # qztest returns non-zero if any of the tests failed
+        self.assertRunOk("/usr/bin/qztest", 120)
+
+
+class TestQuazipQt5(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_QT5=y
+        BR2_PACKAGE_QUAZIP=y
+        BR2_PACKAGE_QUAZIP_INSTALL_TESTS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # qztest returns non-zero if any of the tests failed
+        self.assertRunOk("/usr/bin/qztest", 120)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
