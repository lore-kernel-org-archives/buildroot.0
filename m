Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432F3D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7F741559;
	Wed,  7 Jan 2026 18:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2j8BkEYOJKZ; Wed,  7 Jan 2026 18:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A98F44153F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808975;
	bh=PO9y/8Gt0ChHayootZTjfdMgh+U91Pn4Ld4KQWoMuVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tG+/04QeeYhZUpyf7+VJzV/EgZcPgidN0r6GelnkfPfYfHnbdi/Bi4krpAJuOX2eg
	 1xrzOjHMyqvNix8cfkE6TgV+DS49pJ2mbF1UdSRlPA+TtcfSf9jizTuXg6QM+uEGBh
	 r3n1DPpP7cKVX091aMxnnI2c8BXV/50aQdPTxcpo/TEnwya7byq02bCXvfCB6t/bHI
	 Tiw0feeynutbSCJliFyK+NOyuX6BVNrl+54mjfHMupD396X9/pr4HzVLCKRAHr1K8b
	 omzmFxmRP1VZzhf4GR7b1p70Ya1sbIhKbo1SAXOmEurtatrDs05ATI72wWal5TPEcD
	 PyxXqakbQ3viQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98F44153F;
	Wed,  7 Jan 2026 18:02:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 139F6A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F579812CF
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUGihlgZ_k57 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EC1980EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EC1980EB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DD5B81340; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:01 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ca558fb399b10a14c1295589d6c2e85fb364a86c
X-Git-Newrev: f244566d7f1fda005fc226df1ced034f5d98626c
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.1DD5B81340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing: add tio
 runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f244566d7f1fda005fc226df1ced034f5d98626c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7c8c8e01fa4ea1eb0fc1370e1e52f8dcec12e1f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_tio.py | 74 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f5ad587424..e3896c6278 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2020,6 +2020,7 @@ F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
+F:	support/testing/tests/package/test_tio.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_tree.py
diff --git a/support/testing/tests/package/test_tio.py b/support/testing/tests/package/test_tio.py
new file mode 100644
index 0000000000..f7d612b9dd
--- /dev/null
+++ b/support/testing/tests/package/test_tio.py
@@ -0,0 +1,74 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestTio(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_SOCAT=y
+        BR2_PACKAGE_TIO=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def get_tty_name(self):
+        out, ret = self.emulator.run("tty")
+        self.assertEqual(ret, 0)
+        return out[0]
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can run
+        self.assertRunOk("tio --version")
+
+        # We save our tty name for later.
+        initial_tty = self.get_tty_name()
+
+        # We define two arbitrary pseudo-terminals, for our test.
+        pty1 = "pty1_getty"
+        pty2 = "pty2_tio"
+
+        # We create our 2 PTYs with socat and connect them together.
+        cmd = "( socat"
+        for pty in [pty1, pty2]:
+            cmd += f" PTY,link=/dev/{pty},rawer,b115200"
+        cmd += " &> /dev/null & )"
+        self.assertRunOk(cmd)
+
+        # We wait for socat to be ready...
+        for attempt in range(3 * self.timeout_multiplier):
+            time.sleep(1)
+            cmd = f"test -e /dev/{pty1} -a -e /dev/{pty2}"
+            _, ret = self.emulator.run(cmd)
+            if ret == 0:
+                break
+        else:
+            self.fail("Timeout while waiting for socat.")
+
+        # We start getty on our first PTY.
+        self.assertRunOk(f"setsid getty {pty1} 115200 vt100")
+
+        # We start tio on our second PTY and send a new line.
+        # We wait for tio to be ready then send a new line.
+        # After that, we expect to see a new login.
+        self.emulator.qemu.sendline(f"tio /dev/{pty2}")
+        self.emulator.qemu.expect(f"Connected to /dev/{pty2}")
+        self.emulator.qemu.sendline()
+
+        # We try to re-login, in tio this time.
+        self.emulator.login()
+
+        # We get again our tty name.
+        tio_tty = self.get_tty_name()
+
+        # We check our second login TTY name is different from the one
+        # in the first login.
+        self.assertNotEqual(initial_tty, tio_tty)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
