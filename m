Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C94E6748C
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 22:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FC8408DE;
	Sat, 20 Dec 2025 22:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZLHhaQFySFb; Sat, 20 Dec 2025 22:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B534F408E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766270186;
	bh=O0xsNpyj54erHOhGB5raJWR0RWLynxsLiYbHRtzwwMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m9DmBsZ85TRL/+2ElbDoQuO4mCZZOBSJA7UiZ+K3f3hQ5DagwB90RGPX79V9XAueu
	 EqyCPAfCGiGFUC763gJfREl8bn3gPJNc+csAHuCLGZiSad9x3K9tZAz8ylbFKEJ/sF
	 dz3zvmf6w77ZvewgIEWtddMM5rz5/UX1jCSa59LsRKL0rXshup9l6F29heAJ1JrxZf
	 UawrVir7vkeYl/EOxfe6Bxn9Gk2gA23+qr2zAWA2Re0A0IMW0yBT2CqHLRf67Gz/0T
	 YRoAg/vK0YsUBzA2d9mH/Di2EhGMnUcU/XORmId8tTc8xse2js85OPWasookxR3avy
	 a1ZqKBpmlAlIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B534F408E3;
	Sat, 20 Dec 2025 22:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EE722A8
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40731608D7
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxAut2_MUlF4 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45E86608B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45E86608B4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3729D86E1A; Sat, 20 Dec 2025 22:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 23:16:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: befb6ae81d274342d316061a648c2f276e44db23
X-Git-Newrev: 2dbe71dba6eb5a813b2685bc5136d78a132a1580
X-Patchwork-Hint: ignore
Message-Id: <20251220223622.3729D86E1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tests for FIT hash
 support in package/uboot-tools
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2dbe71dba6eb5a813b2685bc5136d78a132a1580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tests check if all supported hash algorithms are usable in
mkimage, for both host and target packages. Additionally, as a
necessary tool, it verifies the previous fix for FIT output from
dumpimage.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: use builtin kernel for faster testing]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_uboot_tools.py  | 88 ++++++++++++++++++++++
 .../tests/package/test_uboot_tools/example.its     | 48 ++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
new file mode 100644
index 0000000000..5e5b44af30
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -0,0 +1,88 @@
+import hashlib
+import re
+import zlib
+from pathlib import Path
+
+import infra.basetest
+
+EXAMPLE_ITS = Path(__file__).parent / "test_uboot_tools/example.its"
+
+
+def get_hashes(output: str) -> dict[str, str]:
+    """Get hashes from dumpimage output (assumes exactly one image in FIT)"""
+    pat = re.compile(
+        r"Hash algo:\s+(\S+)$\s+Hash value:\s+(\w+)$", flags=re.MULTILINE)
+    return dict(pat.findall(output))
+
+
+def calc_hashes(data: bytes) -> dict[str, str]:
+    """Calculate the hashes dumpimage should report for a given blob"""
+    return {
+        "crc32": f"{zlib.crc32(data):08x}",
+        "md5": hashlib.md5(data).hexdigest(),
+        "sha1": hashlib.sha1(data).hexdigest(),
+        "sha256": hashlib.sha256(data).hexdigest(),
+        "sha384": hashlib.sha384(data).hexdigest(),
+        "sha512": hashlib.sha512(data).hexdigest(),
+    }
+
+
+class TestUbootTools(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_uboot_tools")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_UBOOT_TOOLS=y
+        BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        ramdisk = Path(self.builddir) / "images/rootfs.cpio"
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", str(ramdisk)])
+        self.emulator.login()
+
+        self.assertRunOk(f"mkimage -f /{EXAMPLE_ITS.name} /tmp/test.fit")
+
+        cmd = "dumpimage -l /tmp/test.fit"
+        out, exit_code = self.emulator.run(cmd, -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        reported = get_hashes("\n".join(out))
+        expected = calc_hashes(EXAMPLE_ITS.read_bytes())
+        for h in expected:
+            with self.subTest(hash=h):
+                self.assertEqual(expected[h], reported[h])
+        # Python does not have built-in CRC16 support, just check it is present
+        self.assertIn("crc16-ccitt", reported)
+
+
+class TestHostUbootTools(infra.basetest.BRHostPkgTest):
+    hostpkgs = ["host-uboot-tools"]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+        BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+        """
+
+    def test_run(self):
+        cmd = ["host/bin/mkimage", "-f", str(EXAMPLE_ITS), "test.fit"]
+        infra.run_cmd_on_host(self.builddir, cmd)
+
+        cmd = ["host/bin/dumpimage", "-l", "test.fit"]
+        reported = get_hashes(infra.run_cmd_on_host(self.builddir, cmd))
+        expected = calc_hashes(EXAMPLE_ITS.read_bytes())
+        for h in expected:
+            with self.subTest(hash=h):
+                self.assertEqual(expected[h], reported[h])
+        # Python does not have built-in CRC16 support, just check it is present
+        self.assertIn("crc16-ccitt", reported)
diff --git a/support/testing/tests/package/test_uboot_tools/example.its b/support/testing/tests/package/test_uboot_tools/example.its
new file mode 100644
index 0000000000..24291b4e56
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_tools/example.its
@@ -0,0 +1,48 @@
+/dts-v1/;
+
+/ {
+    description = "Test FIT (build only)";
+    #address-cells = <1>;
+
+    images {
+        kernel {
+            description = "This file, pretending to be kernel";
+            data = /incbin/("example.its");
+            type = "kernel";
+            arch = "arm64";
+            os = "linux";
+            compression = "none";
+            load = <0x40400000>;
+            entry = <0x40400000>;
+            hash-1 {
+                algo = "crc16-ccitt";
+            };
+            hash-2 {
+                algo = "crc32";
+            };
+            hash-3 {
+                algo = "md5";
+            };
+            hash-4 {
+                algo = "sha1";
+            };
+            hash-5 {
+                algo = "sha256";
+            };
+            hash-6 {
+                algo = "sha384";
+            };
+            hash-7 {
+                algo = "sha512";
+            };
+        };
+    };
+
+    configurations {
+        default = "config-1";
+        config-1 {
+            description = "Test entry";
+            kernel = "kernel";
+        };
+    };
+};
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
