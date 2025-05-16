Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A3C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752F76F5B9;
	Mon, 19 May 2025 11:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFrs-FDV3vCf; Mon, 19 May 2025 11:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577F170E53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577F170E53;
	Mon, 19 May 2025 11:01:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5883AE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74D0B41995
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gNZcnB1cSMc for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9F341A17
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA9F341A17
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D810482A2E; Mon, 19 May 2025 10:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:19:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 45321879e16d97079c3d1a4431f615c73291200b
X-Git-Newrev: 5eb46878bd954ec434d288dc97de596676273bb5
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.D810482A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: new
 python-pydantic-settings runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5eb46878bd954ec434d288dc97de596676273bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS                                         |  2 ++
 .../package/sample_python_pydantic_settings.py     |  8 +++++
 .../tests/package/test_python_pydantic_settings.py | 35 ++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44056c5149..6528a63a83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,11 +2284,13 @@ F:	package/python-tzlocal/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
+F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
+F:	support/testing/tests/package/sample_python_pydantic_settings.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
diff --git a/support/testing/tests/package/sample_python_pydantic_settings.py b/support/testing/tests/package/sample_python_pydantic_settings.py
new file mode 100644
index 0000000000..c98d1ce9c1
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pydantic_settings.py
@@ -0,0 +1,8 @@
+from pydantic_settings import BaseSettings
+
+
+class Settings(BaseSettings):
+    api_key: str
+
+
+assert Settings().api_key == "ABCD1234"
diff --git a/support/testing/tests/package/test_python_pydantic_settings.py b/support/testing/tests/package/test_python_pydantic_settings.py
new file mode 100644
index 0000000000..608cbbc5b1
--- /dev/null
+++ b/support/testing/tests/package/test_python_pydantic_settings.py
@@ -0,0 +1,35 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PydanticSettings(TestPythonPackageBase):
+    __test__ = True
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_pydantic_settings.py"]
+    timeout = 30
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
+        )
+        self.emulator.login()
+
+    def run_sample_scripts(self):
+        """Run sample script while setting an environment variable"""
+        for script in self.sample_scripts:
+            cmd = (
+                "api_key=ABCD1234 " + self.interpreter + " " + os.path.basename(script)
+            )
+            self.assertRunOk(cmd, timeout=self.timeout)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
