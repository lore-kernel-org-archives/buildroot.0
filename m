Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD90C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE58940541;
	Sun, 21 Jan 2024 10:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE58940541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpCLF_Oo9j08; Sun, 21 Jan 2024 10:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5208404C4;
	Sun, 21 Jan 2024 10:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5208404C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 407E71BF37C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22E0C4039D
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E0C4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bluFxcXIvCNp for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18FD3403A7
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FD3403A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05ECD8639D; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 11:17:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c20bf23fe920b7caefdc6f29339fb11c98c24439
X-Git-Newrev: ad40b23f2bb9301ba35cf1b42fae12d5919f7407
X-Patchwork-Hint: ignore
Message-Id: <20240121101814.05ECD8639D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add ngrep runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad40b23f2bb9301ba35cf1b42fae12d5919f7407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_ngrep.py | 49 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cb4783aa8..aa0815b9a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1796,6 +1796,7 @@ F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_netcat.py
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
+F:	support/testing/tests/package/test_ngrep.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_ngrep.py b/support/testing/tests/package/test_ngrep.py
new file mode 100644
index 0000000000..29aaa55c2c
--- /dev/null
+++ b/support/testing/tests/package/test_ngrep.py
@@ -0,0 +1,49 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNgrep(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NETCAT=y
+        BR2_PACKAGE_NGREP=y
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
+        port = 12345
+        msg = 'Hello Buildroot'
+
+        # Check the program can execute.
+        self.assertRunOk("ngrep -V")
+
+        # Start a netcat server in background accepting connections
+        cmd = f"nc -l -p {port} >/dev/null </dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        # Start a netcat client in background, sending one message
+        # every seconds
+        cmd = "( while true ; do "
+        cmd += f"echo '{msg}'; "
+        cmd += "sleep 1 ; "
+        cmd += "done) | "
+        cmd += f"nc 127.0.0.1 {port} &"
+        self.assertRunOk(cmd)
+
+        time.sleep(1)
+
+        # Capture 3 packets with the message.
+        cmd = f"ngrep -n 3 '{msg}'"
+        self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
