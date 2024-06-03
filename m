Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175CBC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB40040893;
	Mon,  3 Jun 2024 15:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwzYaXDBB4G6; Mon,  3 Jun 2024 15:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAD3E408FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD3E408FC;
	Mon,  3 Jun 2024 15:57:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7E11BF228
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADCC260A5D
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ExqOJsvWPeP for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CF860854
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0CF860854
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D84387F8BE; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:32:48 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 59a0b5c9fd736cf133b26956e5a93f7f9f2b294e
X-Git-Newrev: 079b471563e92be1ba15dd044b4387db3a0e52f6
X-Patchwork-Hint: ignore
Message-Id: <20240603155719.D84387F8BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 socat runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=079b471563e92be1ba15dd044b4387db3a0e52f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1bbc7ac6ea90baef7559fc33d2a7e067428eebc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_socat.py | 56 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bba212def5..de9585bd3f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1853,6 +1853,7 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
+F:	support/testing/tests/package/test_socat.py
 F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
diff --git a/support/testing/tests/package/test_socat.py b/support/testing/tests/package/test_socat.py
new file mode 100644
index 0000000000..67b3244843
--- /dev/null
+++ b/support/testing/tests/package/test_socat.py
@@ -0,0 +1,56 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestSoCat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NETCAT=y
+        BR2_PACKAGE_SOCAT=y
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
+        # Some values, for the test.
+        msg = "Hello Buildroot!"
+        out_file = "output.txt"
+        port1 = 11111
+        port2 = 22222
+
+        # Check the program can execute.
+        self.assertRunOk("socat -V")
+
+        # We start the receiver netcat on tcp/port2.
+        cmd = f"nc -n -l -p {port2} > {out_file} 2> /dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(2 * self.timeout_multiplier)
+
+        # We start socat in background to listen on tcp/port1 and
+        # forward to tcp/port2.
+        cmd = f"socat TCP4-LISTEN:{port1} TCP4:127.0.0.1:{port2} &"
+        self.assertRunOk(cmd)
+
+        time.sleep(2 * self.timeout_multiplier)
+
+        # We write a message on tcp/port1. Socat is expected to
+        # forward the message to the receiver on tcp/port2, and write
+        # our message in a file.
+        cmd = f"echo '{msg}' | nc -n -c 127.0.0.1 {port1}"
+        self.assertRunOk(cmd)
+
+        # We check the output file contains our message.
+        cmd = f"cat {out_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
