Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1806BC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B96EB40468;
	Mon,  5 Feb 2024 17:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B96EB40468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OzN6T0ojsu1; Mon,  5 Feb 2024 17:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8200A419C7;
	Mon,  5 Feb 2024 17:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8200A419C7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCF211BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CE941859
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CE941859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9N5LbloQyY7 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:33:13 +0000 (UTC)
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7796B41841
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7796B41841
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 9BE4D2013D;
 Mon,  5 Feb 2024 17:33:21 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Mon, 05 Feb 2024 18:25:10 +0100
Message-ID: <170715438947.30890.14026766289772625544-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <170715438947.30890.14026766289772625544-0@git.sr.ht>
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=8PFgxY8I60fgLpyrVM59RMaTa2deMnqUfmvDMEyrVmM=; 
 c=simple/simple; d=git.sr.ht;
 h=From:Date:Subject:Reply-to:In-Reply-To:To:Cc; q=dns/txt; s=20240113;
 t=1707154401; v=1;
 b=mkAXw43EcE0vrqGx/AUvxrxWY7dvNF9yOKM4cfRuq4GuFEvLiBObIm4cfFpEWP/BxCT/encT
 NO7dCWA3FH2UCuMKvx+oQMGi9KErtgUkmkLd9DI+69bQGg4kB9zVXfU7RL7VVlIgV3LgYSYY5cs
 F02H46He6siRh69QJb7MzayW6wxqf43OGljvC1dR44Py5875KIzBuZEbYcBF07vtwJL8f/hPbmV
 BHwkS9c9G144T8LKG2EFK/MgklzqdJxDyJQ4PWFg8kBAPqFMeQWMu2p3o67BQQK915S5R66BycA
 b5AApyden0rQlSoNvEikSJ/ZdqCbg8FMHZYujdfim1yUg==
Subject: [Buildroot] [PATCH buildroot 2/2] support/testing: add fastapi
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
Reply-To: ~bubu <bubu@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <bubu@bubu1.eu>

Add a runtime test for fastapi. Use uvicorn as the asgi server
application as does the fastapi hello world example [1].

Fastapi depends on PydanticV2 now which is written in rust so we need to
run the test on armv7.

[1] https://fastapi.tiangolo.com/tutorial/first-steps/
---
 .../tests/package/sample_python_fastapi.py    |  8 ++++
 .../tests/package/test_python_fastapi.py      | 47 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_fastapi.py
 create mode 100644 support/testing/tests/package/test_python_fastapi.py

diff --git a/support/testing/tests/package/sample_python_fastapi.py b/support/testing/tests/package/sample_python_fastapi.py
new file mode 100644
index 0000000000..3116df3a93
--- /dev/null
+++ b/support/testing/tests/package/sample_python_fastapi.py
@@ -0,0 +1,8 @@
+from fastapi import FastAPI
+
+app = FastAPI()
+
+@app.get("/")
+async def root():
+    return {"message": "Hello World"}
+
diff --git a/support/testing/tests/package/test_python_fastapi.py b/support/testing/tests/package/test_python_fastapi.py
new file mode 100644
index 0000000000..1a78fa6c58
--- /dev/null
+++ b/support/testing/tests/package/test_python_fastapi.py
@@ -0,0 +1,47 @@
+import os
+import time
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Fastapi(TestPythonPackageBase):
+    __test__ = True
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_FASTAPI=y
+        BR2_PACKAGE_PYTHON_UVICORN=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_CCACHE=y
+        BR2_CCACHE_DIR="/home/bubu/.buildroot-ccache"
+        """
+    sample_scripts = ["tests/package/sample_python_fastapi.py"]
+    timeout = 60
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        cmd = "uvicorn sample_python_fastapi:app > /dev/null 2>&1 &"
+
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        # Give enough time for the uvicorn server to start up
+        time.sleep(30)
+
+        cmd = "wget -q -O - http://127.0.0.1:8000/"
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], '{"message":"Hello World"}')
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
-- 
2.38.5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
