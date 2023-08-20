Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C1BEE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 10:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5B3960BE1;
	Sun, 20 Aug 2023 10:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B3960BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDdjlx0sTlDu; Sun, 20 Aug 2023 10:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F5F60B33;
	Sun, 20 Aug 2023 10:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F5F60B33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 150B21BF322
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 10:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E07E860B33
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 10:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E07E860B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xe2Q2xmMBIb for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 10:33:59 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D6C460B26
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 10:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6C460B26
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6DEAA13F88E;
 Sun, 20 Aug 2023 12:33:53 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 12:33:43 +0200
Message-ID: <20230820103343.353423-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692527636;
 bh=AhpM2+QU0LG1LAzHmMyQJa+jodqUdSzLWHYHV2TZlls=;
 h=From:To:Cc:Subject:Date:From;
 b=c7wiOz7k2wj1XrCc8mZIwVoKbZmfLX4WLhPw3usvjeN17iP9uxVAtkLNV5TEyw5aB
 /G+H4mBnOkiGgI0I944ZircYmJIlmIPcUdnbTvynyL2YRnDgcPaBcbxsZd3qF0NvD4
 eOBcJPrVsl78BGcJRrGp2O7PjreXfAzc7bj4/PUkeJEJhxMFNztpaA5mmF8txz4+6Z
 Mn9auAZaL3abRcGvDOswssnsK5Gv/jBoVXxJq8fRVerNqWdzmE0o76+GUnV8I96UU1
 LDn+M+Tc4CjfxRPraXeqYcLhoA/zMtUjTsql0thq0+kxT/Y9gvkoMblSxozjBucxFZ
 WG0UG6CZk4FxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c7wiOz7k
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_nftables.py: new runtime test
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This runtime test was suggested in discussion [1]. It should detect
potential runtime failures such as the one fixed in commit eb74998125
"package/nftables: fix the build of the pyhon bindings".

[1] https://lists.buildroot.org/pipermail/buildroot/2023-August/672864.html

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit eb74998 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_nftables
    ...
    OK
---
 DEVELOPERS                                    |   2 +
 .../testing/tests/package/test_nftables.py    | 110 ++++++++++++++++++
 .../test_nftables/rootfs-overlay/root/nft.py  |  22 ++++
 3 files changed, 134 insertions(+)
 create mode 100644 support/testing/tests/package/test_nftables.py
 create mode 100755 support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ffa3ee693..9b500f3701 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1776,6 +1776,8 @@ F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
+F:	support/testing/tests/package/test_nftables.py
+F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
new file mode 100644
index 0000000000..7fcc2902b6
--- /dev/null
+++ b/support/testing/tests/package/test_nftables.py
@@ -0,0 +1,110 @@
+import os
+
+import infra.basetest
+
+
+class TestNftables(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.46"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_NFTABLES=y
+        BR2_PACKAGE_NFTABLES_PYTHON=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+                infra.filepath("tests/package/test_nftables/rootfs-overlay"))
+
+    def nftables_test(self, prog="nft"):
+        # Table/Chain names for the test
+        nft_table = "br_ip_table"
+        nft_chain = "br_ip_chain_in"
+
+        # We flush all nftables rules, to start from a known state.
+        self.assertRunOk(f"{prog} flush ruleset")
+
+        # We create an ip table.
+        self.assertRunOk(f"{prog} add table ip {nft_table}")
+
+        # We should be able to list this table.
+        list_cmd = f"{prog} list tables ip"
+        output, exit_code = self.emulator.run(list_cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn(nft_table, output[0])
+
+        # We create an ip input chain in our table.
+        cmd = f"{prog} add chain ip"
+        cmd += f" {nft_table} {nft_chain}"
+        cmd += " { type filter hook input priority 0 \\; }"
+        self.assertRunOk(cmd)
+
+        # We list our chain.
+        cmd = f"{prog} list chain ip {nft_table} {nft_chain}"
+        self.assertRunOk(cmd)
+
+        # We add a filter rule to drop pings (icmp echo-requests) to
+        # the 127.0.0.2 destination.
+        cmd = f"{prog} add rule ip {nft_table} {nft_chain}"
+        cmd += " ip daddr 127.0.0.2 icmp type echo-request drop"
+        self.assertRunOk(cmd)
+
+        # We list our rule.
+        self.assertRunOk(f"{prog} list ruleset ip")
+
+        # A ping to 127.0.0.1 is expected to work, because it's not
+        # matching our rule. We expect 3 replies (-c), with 0.5s
+        # internal (-i), and set a maximum timeout of 2s.
+        ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
+        self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
+
+        # A ping to 127.0.0.2 is expected to fail, because our rule is
+        # supposed to drop it.
+        ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
+        _, exit_code = self.emulator.run(ping_test_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # We completely delete the table. This should also delete the
+        # chain and the rule.
+        self.assertRunOk(f"{prog} delete table ip {nft_table}")
+
+        # We should no longer see the table in the list.
+        output, exit_code = self.emulator.run(list_cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertNotIn(nft_table, "\n".join(output))
+
+        # Since we deleted the rule, the ping test command which was
+        # supposed to fail earlier is now supposed to succeed.
+        self.assertRunOk(ping_test_cmd)
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("nft --version")
+
+        # We run the nftables test sequence using the default "nft"
+        # user space configuration tool.
+        self.nftables_test()
+
+        # We run again the same test sequence using our simple nft
+        # python implementation, to check the language bindings.
+        self.nftables_test(prog="/root/nft.py")
diff --git a/support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py b/support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py
new file mode 100755
index 0000000000..89de8e25d1
--- /dev/null
+++ b/support/testing/tests/package/test_nftables/rootfs-overlay/root/nft.py
@@ -0,0 +1,22 @@
+#! /usr/bin/env python3
+#
+# This is a simple reimplementation of the "nft" user-space tool in
+# Python, in order to test language bindings. It does not support any
+# command line argument supported by the nftables "nft" tool, but
+# supports all nftables commands used in the Buildroot runtime test.
+
+import sys
+
+import nftables
+
+
+nft = nftables.nftables.Nftables()
+cmd = " ".join(sys.argv[1:])
+ret_code, output, error = nft.cmd(cmd)
+
+if len(output) > 0:
+    print(output.strip())
+if len(error) > 0:
+    print(error.strip())
+
+sys.exit(ret_code)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
