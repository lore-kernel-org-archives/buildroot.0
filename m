Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A276FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 22:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3299060B5D;
	Wed,  8 Nov 2023 22:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3299060B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kT5GAL_STs3; Wed,  8 Nov 2023 22:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B5860AFC;
	Wed,  8 Nov 2023 22:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B5860AFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A85D71BF966
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B8CC60AFC
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 22:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8CC60AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpA1FBrUH9ep for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 22:19:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6CB560A7E
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 22:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CB560A7E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A353886D81; Wed,  8 Nov 2023 22:19:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 23:18:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d208906c7a0bc2d621794f4a8bac452acc31d9d
X-Git-Newrev: 14ae33c669afa8e4efb77d127e8ac83f5d721e3b
X-Patchwork-Hint: ignore
Message-Id: <20231108221930.A353886D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_ruby.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=14ae33c669afa8e4efb77d127e8ac83f5d721e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_ruby.py | 34 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 145e73199c..12257fae8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3096,6 +3096,7 @@ F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
+F:	support/testing/tests/package/test_ruby.py
 
 N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
diff --git a/support/testing/tests/package/test_ruby.py b/support/testing/tests/package/test_ruby.py
new file mode 100644
index 0000000000..5d4c0031fb
--- /dev/null
+++ b/support/testing/tests/package/test_ruby.py
@@ -0,0 +1,34 @@
+import os
+import infra.basetest
+
+
+class TestRuby(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_RUBY=y
+        BR2_PACKAGE_ZLIB=y
+        """
+
+    def version_test(self):
+        cmd = "ruby -v"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+    def zlib_test(self, timeout=-1):
+        cmd = "ruby -e 'require \"zlib\"'"
+        _, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(exit_code, 0)
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        self.version_test()
+        self.zlib_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
