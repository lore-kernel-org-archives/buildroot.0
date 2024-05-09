Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A9BC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29A341E69;
	Thu,  9 May 2024 16:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9j6CYmLXrrTY; Thu,  9 May 2024 16:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B7041E61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B7041E61;
	Thu,  9 May 2024 16:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29AEE1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20FFA820A6
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urmvNG0eXjtm for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F47483E74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F47483E74
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:22:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F39786C81; Thu,  9 May 2024 16:22:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:21:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54a412d2c123849a32d9a5c01826f081671db58c
X-Git-Newrev: dd45ac10d96b9a93be22a13dd3a4ac7973025008
X-Patchwork-Hint: ignore
Message-Id: <20240509162201.2F39786C81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add lrzsz runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd45ac10d96b9a93be22a13dd3a4ac7973025008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_lrzsz.py | 42 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 76d76c981e..d6fec03dc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1837,6 +1837,7 @@ F:	support/testing/tests/package/test_libjxl.py
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
