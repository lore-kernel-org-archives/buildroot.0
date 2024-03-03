Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3ABC54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 20:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8484187A;
	Tue,  5 Mar 2024 20:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsXicBF6LCnu; Tue,  5 Mar 2024 20:45:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 789564188A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 789564188A;
	Tue,  5 Mar 2024 20:45:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 377D21BF3FD
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DE2060C33
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:44:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlCqnI2mFN66 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5735560F35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5735560F35
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 548588812F; Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 21:32:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4308c270a7ee4300e29e39d9d7f1de91179679ba
X-Git-Newrev: 2ce680b991d390a75990e7cb1a55acc9ace7ae81
X-Patchwork-Hint: ignore
Message-Id: <20240305204440.548588812F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jc: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ce680b991d390a75990e7cb1a55acc9ace7ae81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All dependencies are optional, and thus only mentioned in the package
help text.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Arnout:
 - add to DEVELOPERS;
 - add BSD-3-Clause license for vendored pbPlist.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                      |  1 +
 package/Config.in                               |  1 +
 package/python-jc/Config.in                     | 12 ++++++++++++
 package/python-jc/python-jc.hash                |  5 +++++
 package/python-jc/python-jc.mk                  | 14 ++++++++++++++
 support/testing/tests/package/test_python_jc.py | 22 ++++++++++++++++++++++
 6 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bfe91f064..a6364cdd44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2092,6 +2092,7 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
+F:	package/python-jc/
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..bbcc5b5774 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1150,6 +1150,7 @@ menu "External python modules"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
 	source "package/python-jaraco-functools/Config.in"
+	source "package/python-jc/Config.in"
 	source "package/python-jedi/Config.in"
 	source "package/python-jeepney/Config.in"
 	source "package/python-jinja2/Config.in"
diff --git a/package/python-jc/Config.in b/package/python-jc/Config.in
new file mode 100644
index 0000000000..b88150e069
--- /dev/null
+++ b/package/python-jc/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_JC
+	bool "python-jc"
+	help
+	  Converts the output of popular command-line tools and file-
+	  types to JSON.
+
+	  Optionally requires python-pygments for syntax highlighting,
+	  python-ruamel-yaml for yaml parsing and output and
+	  python-xmltodict for xml parsing. PYTHON3_PYEXPAT is required
+	  for xml and plist parsers.
+
+	  https://github.com/kellyjonbrazil/jc
diff --git a/package/python-jc/python-jc.hash b/package/python-jc/python-jc.hash
new file mode 100644
index 0000000000..f54e69eaeb
--- /dev/null
+++ b/package/python-jc/python-jc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jc/json
+md5  80e4c7d46ec856255577c6b364e7f931  jc-1.25.1.tar.gz
+sha256  683352e903ece9a86eae0c3232188e40178139e710c740a466ef91ed87c4cc7e  jc-1.25.1.tar.gz
+# Locally computed sha256 checksums
+sha256  6493f2db400f4166ca0956cf192a41aa092bd1396ff463e7fdaf51f257c10497  LICENSE.md
diff --git a/package/python-jc/python-jc.mk b/package/python-jc/python-jc.mk
new file mode 100644
index 0000000000..ec8826d1c2
--- /dev/null
+++ b/package/python-jc/python-jc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-jc
+#
+################################################################################
+
+PYTHON_JC_VERSION = 1.25.1
+PYTHON_JC_SOURCE = jc-$(PYTHON_JC_VERSION).tar.gz
+PYTHON_JC_SITE = https://files.pythonhosted.org/packages/53/a6/065f0796a0a21bc040bc88c8a33410c12729a2a6f4c269d0349f685796da
+PYTHON_JC_SETUP_TYPE = setuptools
+PYTHON_JC_LICENSE = MIT, BSD-3-Clause (bundled pbPlist)
+PYTHON_JC_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/test_python_jc.py b/support/testing/tests/package/test_python_jc.py
new file mode 100644
index 0000000000..974ce0c4b0
--- /dev/null
+++ b/support/testing/tests/package/test_python_jc.py
@@ -0,0 +1,22 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Jc(TestPythonPackageBase):
+    __test__ = True
+    # We deliberately run the test without the optional dependencies,
+    # as this configuration is less tested upstream.
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_JC=y
+        """
+    timeout = 60
+
+    def test_run(self):
+        self.login()
+        cmd = "jc -h > /dev/null 2>&1"
+        self.assertRunOk(cmd, timeout=self.timeout)
+        cmd = "jc id | grep -q root"
+        self.assertRunOk(cmd, timeout=self.timeout)
+        cmd = "jc env | grep -q PATH"
+        self.assertRunOk(cmd, self.timeout)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
