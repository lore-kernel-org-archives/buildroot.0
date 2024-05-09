Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECE8C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B29D401FC;
	Thu,  9 May 2024 16:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-A7O2_Dcnta; Thu,  9 May 2024 16:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2266A40131
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2266A40131;
	Thu,  9 May 2024 16:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9C9B1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B64DA41D7C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSYRzCH3xi0n for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:23:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F884039D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6F884039D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:23:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC5F686CA0; Thu,  9 May 2024 16:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:22:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd45ac10d96b9a93be22a13dd3a4ac7973025008
X-Git-Newrev: b1bbc7ac6ea90baef7559fc33d2a7e067428eebc
X-Patchwork-Hint: ignore
Message-Id: <20240509162349.BC5F686CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add socat runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1bbc7ac6ea90baef7559fc33d2a7e067428eebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_socat.py | 56 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d6fec03dc9..dd43635dd3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1880,6 +1880,7 @@ F:	support/testing/tests/package/test_rdma_core.py
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
