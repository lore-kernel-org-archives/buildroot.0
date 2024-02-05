Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82A4C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A75541A78;
	Mon,  5 Feb 2024 22:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A75541A78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfztXF1zKvGr; Mon,  5 Feb 2024 22:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86C941929;
	Mon,  5 Feb 2024 22:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86C941929
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C42C31BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97DF460F0A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DF460F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ty4haArw7hg1 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:11:46 +0000 (UTC)
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAC7F606D3
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC7F606D3
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id CC26C201E5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:11:54 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Mon, 05 Feb 2024 22:47:17 +0100
Message-ID: <170717110256.12359.16509380444438086733-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=uK9U3ZQQ0sUteNT221a7Z+2AsUkHDwGgESVfvNI6vTE=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To; q=dns/txt;
 s=20240113; t=1707171114; v=1;
 b=khnYJhZuBZE4p2RxdAmW6eMoj3WgmT1rfYLAhcoOGjYRy8yoaN+f3n0EzIh6BK7oLMkCohKS
 7zJNVo+HdY73ozNg74JFabanSB36mTbtb/Plis36iUPCLdsHyeLVOgUMVlsQdY8w+WKl2IKVZWA
 HL8/56sIrKLtj34zqsQzAdrPigHmWmG1f9sMNdMSuLc8Qczmd2a1etlv/8QyHYt8O6sIcjv/DK7
 3+PcCbBAgBr0v3TmvuVv3FV+SxaG/ObDXaMUR8Ix8YT3YOFZc9WL6wh/uuGUL920qjNybI4yoAT
 7vzbv0t9uwwqN918tnYEK5HWlGG4+glzKugVImZBH6UQg==
Subject: [Buildroot] [PATCH buildroot] support/testing: add python-uvloop
 runtime test
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
Reply-To: ~bubu <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <buildroot@bubu1.eu>

---
 .../tests/package/sample_python_uvloop.py     |  6 +++++
 .../tests/package/test_python_uvloop.py       | 22 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_uvloop.py
 create mode 100644 support/testing/tests/package/test_python_uvloop.py

diff --git a/support/testing/tests/package/sample_python_uvloop.py b/support/testing/tests/package/sample_python_uvloop.py
new file mode 100644
index 0000000000..dc85d3e04e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_uvloop.py
@@ -0,0 +1,6 @@
+import uvloop
+
+async def main():
+    print("Hello world!")
+
+uvloop.run(main())
diff --git a/support/testing/tests/package/test_python_uvloop.py b/support/testing/tests/package/test_python_uvloop.py
new file mode 100644
index 0000000000..c5079ba59c
--- /dev/null
+++ b/support/testing/tests/package/test_python_uvloop.py
@@ -0,0 +1,22 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Uvloop(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_UVLOOP=y
+        """
+    sample_scripts = ["tests/package/sample_python_uvloop.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "Hello world!")
-- 
2.38.5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
