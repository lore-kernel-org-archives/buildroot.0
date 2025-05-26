Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93881C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BCD83E78;
	Sat, 31 May 2025 16:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuVjG7e63FjD; Sat, 31 May 2025 16:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64EF683E79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64EF683E79;
	Sat, 31 May 2025 16:55:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42111235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DD77401D4
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y01HDQqJbvq for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC234401EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC234401EB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BABCB87708; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:45:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af57a992734991afe347fe1748b58d9f1b6ce0b5
X-Git-Newrev: b1ea70d9eabd44b4d14b284b785e450043e3ca10
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.BABCB87708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: new
 python-pydantic runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1ea70d9eabd44b4d14b284b785e450043e3ca10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

While in theory, the fastapi tests finds problems with the pydantic
package, it's not obvious that this test should be run when the pydantic
package is updated.

Add a new test that just covers pydantic.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 45321879e16d97079c3d1a4431f615c73291200b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                         |  2 ++
 .../tests/package/sample_python_pydantic.py        | 32 ++++++++++++++++++++++
 .../testing/tests/package/test_python_pydantic.py  | 27 ++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 95b7d19cb9..16631bbf0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2258,9 +2258,11 @@ F:	package/python-pydantic-settings/
 F:	package/python-ruamel-yaml-clib/
 F:	package/python-waitress/
 F:	support/testing/tests/package/test_python_fastapi.py
+F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_fastapi.py
+F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
diff --git a/support/testing/tests/package/sample_python_pydantic.py b/support/testing/tests/package/sample_python_pydantic.py
new file mode 100644
index 0000000000..4c22f5ede4
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pydantic.py
@@ -0,0 +1,32 @@
+from datetime import datetime
+
+from pydantic import BaseModel, PositiveInt
+
+
+class User(BaseModel):
+    id: int
+    name: str = "John Doe"
+    signup_ts: datetime | None
+    tastes: dict[str, PositiveInt]
+
+
+external_data = {
+    "id": 123,
+    "signup_ts": "2019-06-01 12:22",
+    "tastes": {
+        "wine": 9,
+        b"cheese": 7,
+        "cabbage": "1",
+    },
+}
+
+user = User(**external_data)
+expected_user_dump = {
+    "id": 123,
+    "name": "John Doe",
+    "signup_ts": datetime(2019, 6, 1, 12, 22),
+    "tastes": {"wine": 9, "cheese": 7, "cabbage": 1},
+}
+
+assert user.id == 123
+assert user.model_dump() == expected_user_dump
diff --git a/support/testing/tests/package/test_python_pydantic.py b/support/testing/tests/package/test_python_pydantic.py
new file mode 100644
index 0000000000..1369d82f59
--- /dev/null
+++ b/support/testing/tests/package/test_python_pydantic.py
@@ -0,0 +1,27 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pydantic(TestPythonPackageBase):
+    __test__ = True
+    config = """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYDANTIC=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    sample_scripts = ["tests/package/sample_python_pydantic.py"]
+    timeout = 30
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
+        )
+        self.emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
