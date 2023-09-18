Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58041CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 08:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F423C41780;
	Mon, 18 Sep 2023 08:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F423C41780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2vb9t-_s-4v; Mon, 18 Sep 2023 08:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044F34176F;
	Mon, 18 Sep 2023 08:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 044F34176F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA031BF5A8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF4F34176F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4F34176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vs6EZq4Er0ii for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 08:25:14 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50BA24174F
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 08:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50BA24174F
Received: by helium.openadk.org (Postfix, from userid 1000)
 id F13D0352BDF9; Mon, 18 Sep 2023 10:25:11 +0200 (CEST)
Date: Mon, 18 Sep 2023 10:25:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZQgJZxHHCj8iLCdW@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1695025512; bh=b231YRu2WXtB1Ayhi8re8amD05TCAr9C2rMSCtqzjBM=;
 h=Date:From:To:Subject:From;
 b=blnNJ+bwenwC+yRb94AZ5qTDMBVyxdj7f6+cp46x+kq1vHBQ9SC31oeYNS7T1ZW1h
 Q94qsgBKwrgPmx7sHHzrzO2Gkbjc71VOO66e+TMgUsAFKDvUdCIFqoNWphSGBhbWLY
 nRMa4nCI0Xc57EJDWV3U735R7Decap5P9os39Kj6LD8t1NE8guEq3cx80i0qGUn7WY
 H6a3LSWgSwhfw6C/1v+YbIAnaBcNVc27wPUvQ0bK1E1IjQAb2/ivhqG+EpdG7dwENy
 AAlln6N5s1zuZ6g/eTF/t9rmTMezkY+DudOKbtUl5+rVtH6yeReMtWCCdoawoYk3Gg
 8RS+iTsAz5Hlw==
Subject: [Buildroot] [PATCH] support/testing/tests/package/test_ruby.py: new
 runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 support/testing/tests/package/test_ruby.py | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 support/testing/tests/package/test_ruby.py

diff --git a/support/testing/tests/package/test_ruby.py b/support/testing/tests/package/test_ruby.py
new file mode 100644
index 0000000000..bedd9afb1c
--- /dev/null
+++ b/support/testing/tests/package/test_ruby.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestRubyBase(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    interpreter = "ruby"
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+class TestRuby(TestRubyBase):
+    config = TestRubyBase.config + \
+        """
+        BR2_PACKAGE_RUBY=y
+        BR2_PACKAGE_ZLIB=y
+        """
+
+    def version_test(self):
+        cmd = self.interpreter + " -v"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+    def zlib_test(self, timeout=-1):
+        cmd = self.interpreter + " -e 'require \"zlib\"'"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+    def test_run(self):
+        self.login()
+        self.version_test()
+        self.zlib_test()
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
