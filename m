Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8701C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F53B83A8E;
	Wed,  7 Feb 2024 11:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3K2cU-zTqJY; Wed,  7 Feb 2024 11:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D26A83A8A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D26A83A8A;
	Wed,  7 Feb 2024 11:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE5611BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB6DB612FA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0ZijoRtWge1 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 234C660B5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 234C660B5D
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:38:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AD7987564; Wed,  7 Feb 2024 11:38:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 12:38:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef199d362985031d473754c42a64f7ab2e9e57d1
X-Git-Newrev: 8a232ee101d70c8e1f72e9e9eaac3144543dd5cd
X-Patchwork-Hint: ignore
Message-Id: <20240207113846.0AD7987564@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-uvloop runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a232ee101d70c8e1f72e9e9eaac3144543dd5cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../testing/tests/package/sample_python_uvloop.py  |  6 ++++++
 .../testing/tests/package/test_python_uvloop.py    | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
