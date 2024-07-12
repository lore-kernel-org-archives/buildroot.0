Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B4BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7426040685;
	Fri, 12 Jul 2024 13:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSbhadjOZvtq; Fri, 12 Jul 2024 13:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182AA4187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 182AA4187C;
	Fri, 12 Jul 2024 13:22:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 151F51BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DDF1416ED
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3AFyviBr67f for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0010440685
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0010440685
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:22:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E016D85DA8; Fri, 12 Jul 2024 13:22:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 15:04:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fb8f2e10c547fedb5a65db384c813a2850241d8
X-Git-Newrev: 21da0df09db09700948c27782d0bb446a0ad66f8
X-Patchwork-Hint: ignore
Message-Id: <20240712132202.E016D85DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21da0df09db09700948c27782d0bb446a0ad66f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 .../tests/package/sample_python_ruamel_yaml.py     | 27 ++++++++++++++++++++++
 .../tests/package/test_python_ruamel_yaml.py       | 12 ++++++++++
 3 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c0deb9e41..9dedf0a7a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2158,7 +2158,9 @@ F:	utils/diffconfig
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
