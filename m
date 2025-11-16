Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56052CCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 20:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6394360BAF;
	Sun, 16 Nov 2025 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VWI9-5Fry-M; Sun, 16 Nov 2025 20:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A24D960BB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24D960BB2;
	Sun, 16 Nov 2025 20:21:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 904A1D5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7700582243
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSq0SHAXzVWQ for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 20:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BA40821D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA40821D2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BA40821D2
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 20:21:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Vu-1val1d2wUo-00U1Uw; Sun, 16
 Nov 2025 21:21:19 +0100
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 16 Nov 2025 21:20:53 +0100
Message-ID: <20251116202053.3276072-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251116202053.3276072-1-fiona.klute@gmx.de>
References: <20251116202053.3276072-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:T+ePYDEE8PV3OFayaT/DgIkfhrYrzKUxmZHgyEFn/CTTosJ80KW
 0ZIZ0yp07kTlBn5dNIny5ngONvUSDHdRxaXnTUcni7BjxvmaHJUJRiDzaWjT+hJBOYOLafz
 xL3P827q2f/C04f8p+Y/vozdcDrCHkV+alfYMAEJtEaQx4bcSxt9IvSbQL8uFmLp8AZCO3x
 YfLe9En59zGHxYuVJy5iQ==
UI-OutboundReport: notjunk:1;M01:P0:qoylasEdLRg=;p2sSHQza86cA7pXVW06t7uwLMxx
 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
 iefwiy3zpQXQ1L4X4/GRfQL/Rt6FV
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1763324480; x=1763929280; i=fiona.klute@gmx.de;
 bh=VQ/knfaNw8H8LO12SLu4l1hVx2pJ9Zo52pBCgvna0nE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BjBpdM658RAd4/us1mwPMpG0Xh9uxZTzCyRJQ/8uuHwpAOd0iDN3rVutk/BgezJ0
 92Hj+CJOfY8aSc4oyO+BjwahL/wacZS1Nw3jcNWBVTHMihk8STlovugvz23Hv4zg3
 eN8aiiAk34VrqjjnXyYgaovl4c4ZxJWbsvE3gJn0i9b3K1PH7FX2w0QzurXLfO3EM
 8vs5B52KhDdG+f6I/RQYiIQ+Y1yeTHEb11VePCoN7xr4VQUe14Z4h4Qg7MpGdEwrz
 Rj5GTDR1Bh3nBtXjw4KPK7xfa2CTUhrNcGTfUme93d8DduQZfBw3+ATfd3CC3UO8g
 8aKCW5RhPJTYwh37gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BjBpdM65
Subject: [Buildroot] [PATCH 3/3] support/testing: add tests for FIT hash
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The tests check if all supported hash algorithms are usable in
mkimage, for both host and target packages. Additionally, as a
necessary tool, it verifies the previous fix for FIT output from
dumpimage.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .../testing/tests/package/test_uboot_tools.py | 98 +++++++++++++++++++
 .../package/test_uboot_tools/example.its      | 48 +++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 support/testing/tests/package/test_uboot_tools.py
 create mode 100644 support/testing/tests/package/test_uboot_tools/example.its

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
new file mode 100644
index 0000000000..01b86e5d1e
--- /dev/null
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -0,0 +1,98 @@
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
+    config = f"""\
+        BR2_aarch64=y
+        BR2_cortex_a72=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PER_PACKAGE_DIRECTORIES=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.17.8"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_PACKAGE_UBOOT_TOOLS=y
+        BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        """
+
+    def test_run(self):
+        ramdisk = Path(self.builddir) / "images/rootfs.cpio"
+        kernel = Path(self.builddir) / "images/Image"
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=str(kernel),
+            options=["-M", "virt", "-cpu", "cortex-a72", "-initrd", str(ramdisk)])
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
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
