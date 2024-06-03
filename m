Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF3CC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A8FB408E6;
	Mon,  3 Jun 2024 15:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1t-yct3XHGv8; Mon,  3 Jun 2024 15:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A25CA408EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25CA408EC;
	Mon,  3 Jun 2024 15:57:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6FC1BF865
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEB9D607CC
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YiYC1BqVeqd for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E895660A44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E895660A44
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C239087A02; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:26:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 72ca72c4b9d7eeb5046d2ebb8783ce7ddcc53c77
X-Git-Newrev: 59a0b5c9fd736cf133b26956e5a93f7f9f2b294e
X-Patchwork-Hint: ignore
Message-Id: <20240603155719.C239087A02@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 lrzsz runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59a0b5c9fd736cf133b26956e5a93f7f9f2b294e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dd45ac10d96b9a93be22a13dd3a4ac7973025008)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_lrzsz.py | 42 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 853d8d6c90..bba212def5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1810,6 +1810,7 @@ F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
+F:	support/testing/tests/package/test_lrzsz.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_lrzsz.py b/support/testing/tests/package/test_lrzsz.py
new file mode 100644
index 0000000000..23b4cdc531
--- /dev/null
+++ b/support/testing/tests/package/test_lrzsz.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestLrzsz(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LRZSZ=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        fifo = "/tmp/return-fifo"
+        data_fname = "data"
+        data_path = f"/tmp/{data_fname}"
+
+        # We check a program can execute.
+        self.assertRunOk("sz --version")
+
+        # We create a data file, to be transferred.
+        cmd = f"dd if=/dev/urandom of={data_path} bs=1M count=1"
+        self.assertRunOk(cmd)
+
+        # We create a fifo, used as a return fifo.
+        self.assertRunOk(f"mkfifo {fifo}")
+
+        # We transfer the test data using ZMODEM over the pipe and our
+        # return fifo.
+        self.assertRunOk(f"sz {data_path} < {fifo} | rz > {fifo}")
+
+        # The rz command is supposed to have created the received file
+        # in the current directory. We expect the received data to be
+        # the same as the original input file.
+        self.assertRunOk(f"cmp {data_path} {data_fname}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
