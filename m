Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231AEC3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E367780BAE;
	Wed, 31 Jul 2024 16:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xAyByudwnjh; Wed, 31 Jul 2024 16:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E791380A51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E791380A51;
	Wed, 31 Jul 2024 16:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4761BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 255D940E1C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Them-910wa5f for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F5EE40259
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F5EE40259
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 138AF8041A; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 17:25:15 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 6c8122b48cde07b4325f5c20de01de83288d4cd9
X-Git-Newrev: 648478ee858d248f5a9a17874d8a774565de691d
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.138AF8041A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add new
 python-ruamel-yaml runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=648478ee858d248f5a9a17874d8a774565de691d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 21da0df09db09700948c27782d0bb446a0ad66f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 ++
 .../tests/package/sample_python_ruamel_yaml.py     | 27 ++++++++++++++++++++++
 .../tests/package/test_python_ruamel_yaml.py       | 12 ++++++++++
 3 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a25cc6c2f..8243bca10b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2150,7 +2150,9 @@ F:	utils/diffconfig
 N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/python-jc/
 F:	support/testing/tests/package/test_python_fastapi.py
+F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/sample_python_fastapi.py
+F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
 F:	package/libatasmart/
diff --git a/support/testing/tests/package/sample_python_ruamel_yaml.py b/support/testing/tests/package/sample_python_ruamel_yaml.py
new file mode 100644
index 0000000000..5b3a079471
--- /dev/null
+++ b/support/testing/tests/package/sample_python_ruamel_yaml.py
@@ -0,0 +1,27 @@
+from ruamel.yaml import YAML
+
+yaml_text = """
+Rootkey:
+  - ListEntry
+AnotherRootKey: some-string
+
+ListRoot:
+  - float-value: '1.0'
+    int-value: 10234
+    NestedList:
+      - 1
+      - 2
+
+  - another-float: '1.1'
+    another-int: 1111
+
+OneMoreRootKey: 9.99
+"""
+
+# Tests the pure python based implementation
+yaml = YAML(typ='safe', pure=True)
+
+parsed = yaml.load(yaml_text)
+
+assert parsed['OneMoreRootKey'] == 9.99
+assert parsed['ListRoot'][1]['another-int'] == 1111
diff --git a/support/testing/tests/package/test_python_ruamel_yaml.py b/support/testing/tests/package/test_python_ruamel_yaml.py
new file mode 100644
index 0000000000..15062b4455
--- /dev/null
+++ b/support/testing/tests/package/test_python_ruamel_yaml.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3RuamelYaml(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_RUAMEL_YAML=y
+        """
+    sample_scripts = ["tests/package/sample_python_ruamel_yaml.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
