Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0BC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 16:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EC581095;
	Sun,  1 Jun 2025 16:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UP9WsRhQn_Gk; Sun,  1 Jun 2025 16:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B4908108B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4908108B;
	Sun,  1 Jun 2025 16:02:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E95291F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3CF408B7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STAZVkGGuxuE for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 16:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257B940894
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 257B940894
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 16:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 102BD878BB; Sun,  1 Jun 2025 16:02:26 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Jun 2025 17:50:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ee019524109f6246d592befb0b0d8f6efb306f5
X-Git-Newrev: 9d3b9d2220398d8d843151ca95101ccdcf091bb5
X-Patchwork-Hint: ignore
Message-Id: <20250601160226.102BD878BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tree runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9d3b9d2220398d8d843151ca95101ccdcf091bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_tree.py | 54 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d471b9ab6f..a7bb3bd834 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2031,6 +2031,7 @@ F:	support/testing/tests/package/test_tesseract_ocr.py
 F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
+F:	support/testing/tests/package/test_tree.py
 F:	support/testing/tests/package/test_unbound.py
 F:	support/testing/tests/package/test_unbound/
 F:	support/testing/tests/package/test_usbip.py
diff --git a/support/testing/tests/package/test_tree.py b/support/testing/tests/package/test_tree.py
new file mode 100644
index 0000000000..3865932642
--- /dev/null
+++ b/support/testing/tests/package/test_tree.py
@@ -0,0 +1,54 @@
+import json
+import os
+import xml.etree.ElementTree as ET
+
+import infra.basetest
+
+
+class TestTree(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_TREE=y
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
+        self.assertRunOk("tree --version")
+
+        # Simple invocations on a path.
+        self.assertRunOk("tree /usr")
+        self.assertRunOk("tree -d /usr")
+        self.assertRunOk("tree -dx /")
+
+        # Check we see the /usr/bin/tree file in the output.
+        out, ret = self.emulator.run("tree -f /usr")
+        self.assertEqual(ret, 0)
+        self.assertIn("/usr/bin/tree", "\n".join(out))
+
+        # Check we can parse the JSON output and the summary report.
+        out, ret = self.emulator.run("tree -J /usr")
+        self.assertEqual(ret, 0)
+        json_str = "\n".join(out)
+        json_data = json.loads(json_str)
+        # Report is the last element.
+        json_report = json_data[-1]
+        self.assertEqual(json_report["type"], "report")
+        self.assertGreater(json_report["directories"], 0)
+        self.assertGreater(json_report["files"], 0)
+
+        # Check we can parse the XML output and the summary report.
+        out, ret = self.emulator.run("tree -X /usr")
+        self.assertEqual(ret, 0)
+        xml_str = "\n".join(out)
+        xml_root = ET.fromstring(xml_str)
+        self.assertEqual(xml_root.tag, "tree")
+        xml_report = xml_root.find("report")
+        self.assertGreater(int(xml_report.find("directories").text), 0)
+        self.assertGreater(int(xml_report.find("files").text), 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
