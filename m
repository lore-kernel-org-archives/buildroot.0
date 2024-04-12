Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1B1C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F27A41C6A;
	Fri, 12 Apr 2024 15:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zk185o1uKFr; Fri, 12 Apr 2024 15:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D6AC41C68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6AC41C68;
	Fri, 12 Apr 2024 15:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33C161BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43FC0405DD
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sWP172k5Er9 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC9C40645
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DC9C40645
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48E668609B; Fri, 12 Apr 2024 15:50:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 17:47:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b2967e15800421efbdfe3a7a6061cf6bd84134d
X-Git-Newrev: 7fa769dae39ea23a14c02606a23db8978a496e19
X-Patchwork-Hint: ignore
Message-Id: <20240412155010.48E668609B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pathspec: enable target
 variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fa769dae39ea23a14c02606a23db8978a496e19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also a runtime testcase is added.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr:
  - fix check-package
  - small codign style in test sample
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/python-pathspec/Config.in                  |  7 +++++
 package/python-pathspec/python-pathspec.mk         |  1 +
 .../tests/package/sample_python_pathspec.py        | 36 ++++++++++++++++++++++
 .../testing/tests/package/test_python_pathspec.py  | 11 +++++++
 5 files changed, 56 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..d9bbf64c95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1223,6 +1223,7 @@ menu "External python modules"
 	source "package/python-parso/Config.in"
 	source "package/python-passlib/Config.in"
 	source "package/python-pathpy/Config.in"
+	source "package/python-pathspec/Config.in"
 	source "package/python-pathtools/Config.in"
 	source "package/python-pathvalidate/Config.in"
 	source "package/python-periphery/Config.in"
diff --git a/package/python-pathspec/Config.in b/package/python-pathspec/Config.in
new file mode 100644
index 0000000000..0453e70419
--- /dev/null
+++ b/package/python-pathspec/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PATHSPEC
+	bool "python-pathspec"
+	help
+	  pathspec is a utility library for pattern matching of file
+	  paths.
+
+	  https://github.com/cpburnz/python-pathspec
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index c4cb34b4c3..b46dbef7ea 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -11,4 +11,5 @@ PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = flit
 
+$(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/support/testing/tests/package/sample_python_pathspec.py b/support/testing/tests/package/sample_python_pathspec.py
new file mode 100644
index 0000000000..1b5bf62ba2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pathspec.py
@@ -0,0 +1,36 @@
+# example from https://pypi.org/project/pathspec/
+
+import pathspec
+
+# The gitignore-style patterns for files to select, but we're including
+# instead of ignoring.
+spec_text = """
+
+# This is a comment because the line begins with a hash: "#"
+
+# Include several project directories (and all descendants) relative to
+# the current directory. To reference a directory you must end with a
+# slash: "/"
+/project-a/
+/project-b/
+/project-c/
+
+# Patterns can be negated by prefixing with exclamation mark: "!"
+
+# Ignore temporary files beginning or ending with "~" and ending with
+# ".swp".
+!~*
+!*~
+!*.swp
+
+# These are python projects so ignore compiled python files from
+# testing.
+!*.pyc
+
+# Ignore the build directories but only directly under the project
+# directories.
+!/*/build/
+
+"""
+
+spec = pathspec.PathSpec.from_lines('gitwildmatch', spec_text.splitlines())
diff --git a/support/testing/tests/package/test_python_pathspec.py b/support/testing/tests/package/test_python_pathspec.py
new file mode 100644
index 0000000000..4e4a992bb3
--- /dev/null
+++ b/support/testing/tests/package/test_python_pathspec.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPathSpec(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PATHSPEC=y
+        """
+    sample_scripts = ["tests/package/sample_python_pathspec.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
