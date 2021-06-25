Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AE7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:17:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CAB60F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01CAB60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF71415F8;
	Tue,  3 Aug 2021 23:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3YrQhpLlN9Y; Tue,  3 Aug 2021 23:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A704157E;
	Tue,  3 Aug 2021 23:17:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 197C31BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6424E40669
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNDnz2vRXq8B for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7318F40624
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CA31C8767D; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Jun 2021 14:24:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3cf2782906d5cc05a3966c25518d2ce01f11afc8
X-Git-Newrev: 1023f742b8e4213685b9e4efe23f75885482fd8d
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.CA31C8767D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_bmap_tools: new test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=1023f742b8e4213685b9e4efe23f75885482fd8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch implements a simple test in which a dummy file system image
is created, then `bmaptool create` and `bmaptool copy` are used to copy
it to another file.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[Thomas: several reworks, add myself to DEVELOPERS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: check the two files are identical]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/sample_bmap_tools.sh | 16 ++++++
 support/testing/tests/package/test_bmap_tools.py   | 61 ++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b5df54386..98dde8773b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1988,7 +1988,9 @@ N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
 F:	package/php-xdebug/
 F:	package/python-augeas/
+F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_python_augeas.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
diff --git a/support/testing/tests/package/sample_bmap_tools.sh b/support/testing/tests/package/sample_bmap_tools.sh
new file mode 100755
index 0000000000..08605b3b99
--- /dev/null
+++ b/support/testing/tests/package/sample_bmap_tools.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# simple test which creates a dummy file system image, then use bmaptool create
+# and bmaptool copy to copy it to another file
+
+set -xeu
+
+# create the necessary test files
+dd if=/dev/zero of=disk.img bs=2M count=1
+mkfs.ext4 disk.img
+fallocate -d disk.img
+dd if=/dev/zero of=copy.img bs=2M count=1
+
+# do a test copy of the file system image
+bmaptool create -o disk.img.bmap disk.img
+bmaptool copy disk.img copy.img
+cmp disk.img copy.img
diff --git a/support/testing/tests/package/test_bmap_tools.py b/support/testing/tests/package/test_bmap_tools.py
new file mode 100644
index 0000000000..e8802fc057
--- /dev/null
+++ b/support/testing/tests/package/test_bmap_tools.py
@@ -0,0 +1,61 @@
+import os
+import infra
+
+from infra.basetest import BRTest
+
+
+class TestBmapTools(BRTest):
+    __test__ = False
+    sample_script = "tests/package/sample_bmap_tools.sh"
+    copy_script = 'tests/package/copy-sample-script-to-target.sh'
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a8=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_BMAP_TOOLS=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="65536"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_UTIL_LINUX=y
+        BR2_PACKAGE_UTIL_LINUX_FALLOCATE=y
+        BR2_PACKAGE_E2FSPROGS=y
+        BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
+        """.format(infra.filepath(copy_script),
+                   infra.filepath(sample_script))
+    timeout = 60
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=ext4"],
+                           options=["-drive", "file={},if=sd,format=raw".format(img)])
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+        cmd = "/root/{}".format(os.path.basename(self.sample_script))
+        _, exit_code = self.emulator.run(cmd, timeout=20)
+        self.assertEqual(exit_code, 0)
+
+
+class TestPy2BmapTools(TestBmapTools):
+    __test__ = True
+    config = TestBmapTools.config + \
+        """
+        BR2_PACKAGE_PYTHON=y
+        """
+
+
+class TestPy3BmapTools(TestBmapTools):
+    __test__ = True
+    config = TestBmapTools.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        """
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
