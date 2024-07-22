Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EB4C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 08:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD118403CB;
	Mon, 22 Jul 2024 08:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyKbFjoaLmKv; Mon, 22 Jul 2024 08:05:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44546403D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44546403D1;
	Mon, 22 Jul 2024 08:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B96B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CDCD40281
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 08:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1ees6k4bhM8 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05AC540256
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05AC540256
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 08:05:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E40DC86FC2; Mon, 22 Jul 2024 08:05:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 09:41:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bb67c230b9d32d91bc85e5563f3453cb50d7a38
X-Git-Newrev: 5510d2890fc628bf08805f83e3430d759c15a8ec
X-Patchwork-Hint: ignore
Message-Id: <20240722080536.E40DC86FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add nmap runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5510d2890fc628bf08805f83e3430d759c15a8ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_nmap.py | 42 ++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 333e26d74e..60f6b740c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1918,6 +1918,7 @@ F:	support/testing/tests/package/test_netsnmp/
 F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
+F:	support/testing/tests/package/test_nmap.py
 F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
diff --git a/support/testing/tests/package/test_nmap.py b/support/testing/tests/package/test_nmap.py
new file mode 100644
index 0000000000..92b085ece9
--- /dev/null
+++ b/support/testing/tests/package/test_nmap.py
@@ -0,0 +1,42 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestNmap(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NMAP=y
+        BR2_PACKAGE_NMAP_NCAT=y
+        BR2_PACKAGE_NMAP_NMAP=y
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
+        # Check the program can execute.
+        self.assertRunOk("nmap --version")
+
+        # We open few ports, using the nmap netcat "nc" commands.
+        ports = [21, 23, 25, 80]
+        for port in ports:
+            cmd = f"nc -l -p {port} </dev/null &>/dev/null &"
+            self.assertRunOk(cmd)
+
+        time.sleep(1 * self.timeout_multiplier)
+
+        # We run a local port scan. We should see in the output the
+        # ports we previously opened.
+        out, ret = self.emulator.run("nmap -n -sS 127.0.0.1", timeout=20)
+        self.assertEqual(ret, 0)
+        nmap_out = "\n".join(out)
+        for port in ports:
+            self.assertRegex(nmap_out, f"{port}/tcp *open")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
