Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5431C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6288581AF4;
	Mon,  7 Nov 2022 22:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6288581AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDSCYNs37hLZ; Mon,  7 Nov 2022 22:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5318081AD1;
	Mon,  7 Nov 2022 22:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5318081AD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0BC1BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A7F81403
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A7F81403
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uBb_-qNTdjnS for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:17:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E402181991
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E402181991
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEE6680FFA; Mon,  7 Nov 2022 22:17:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:16:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cbf420706397408b493282b3827397191d7a733e
X-Git-Newrev: db7089edd4cc9e0e12d149c55a719abcdf7d144f
X-Patchwork-Hint: ignore
Message-Id: <20221107221713.CEE6680FFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flit-core: bump
 to version 3.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=db7089edd4cc9e0e12d149c55a719abcdf7d144f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-version-parser-for-multiple-assignments.patch | 80 ----------------------
 package/python-flit-core/python-flit-core.hash     |  4 +-
 package/python-flit-core/python-flit-core.mk       |  4 +-
 3 files changed, 4 insertions(+), 84 deletions(-)

diff --git a/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch b/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
deleted file mode 100644
index 5a94e1dcab..0000000000
--- a/package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 2cd8b5708be88b90ea2fa0fb35407a5ec2038c8e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 27 Nov 2021 02:36:15 -0700
-Subject: [PATCH] Fix ast version parser for multiple assignments
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/takluyver/flit/pull/474]
----
- flit_core/common.py                 | 21 +++++++++++--------
- .../tests/samples/moduleunimportabledouble.py |  8 +++++++
- flit_core/tests/test_common.py      |  5 +++++
- 3 files changed, 25 insertions(+), 9 deletions(-)
- create mode 100644 flit_core/tests/samples/moduleunimportabledouble.py
-
-diff --git a/flit_core/common.py b/flit_core/common.py
-index f1f378f..86bcf4b 100644
---- a/flit_core/common.py
-+++ b/flit_core/common.py
-@@ -132,15 +132,18 @@ def get_docstring_and_version_via_ast(target):
-     for child in node.body:
-         # Only use the version from the given module if it's a simple
-         # string assignment to __version__
--        is_version_str = (
--                isinstance(child, ast.Assign)
--                and len(child.targets) == 1
--                and isinstance(child.targets[0], ast.Name)
--                and child.targets[0].id == "__version__"
--                and isinstance(child.value, ast.Str)
--        )
--        if is_version_str:
--            version = child.value.s
-+        if isinstance(child, ast.Assign):
-+            for target in child.targets:
-+                is_version_str = (
-+                    isinstance(target, ast.Name)
-+                    and target.id == "__version__"
-+                    and isinstance(child.value, ast.Str)
-+                )
-+                if is_version_str:
-+                    version = child.value.s
-+                    break
-+            else:
-+                continue
-             break
-     else:
-         version = None
-diff --git a/flit_core/tests/samples/moduleunimportabledouble.py b/flit_core/tests/samples/moduleunimportabledouble.py
-new file mode 100644
-index 0000000..42d51f3
---- /dev/null
-+++ b/flit_core/tests/samples/moduleunimportabledouble.py
-@@ -0,0 +1,8 @@
-+
-+"""
-+A sample unimportable module with double assignment
-+"""
-+
-+raise ImportError()
-+
-+VERSION = __version__ = "0.1"
-diff --git a/flit_core/tests/test_common.py b/flit_core/tests/test_common.py
-index 02cfab7..42e230b 100644
---- a/flit_core/tests/test_common.py
-+++ b/flit_core/tests/test_common.py
-@@ -70,6 +70,11 @@ class ModuleTests(TestCase):
-                                 'version': '0.1'}
-                          )
- 
-+        info = get_info_from_module(Module('moduleunimportabledouble', samples_dir))
-+        self.assertEqual(info, {'summary': 'A sample unimportable module with double assignment',
-+                                'version': '0.1'}
-+                         )
-+
-         info = get_info_from_module(Module('module1', samples_dir / 'constructed_version'))
-         self.assertEqual(info, {'summary': 'This module has a __version__ that requires runtime interpretation',
-                                 'version': '1.2.3'}
--- 
-2.33.1
-
diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 135be93660..9281635f1a 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  4a4791e97f3a8c9a1645064a35636ee6  flit_core-3.7.1.tar.gz
-sha256  14955af340c43035dbfa96b5ee47407e377ee337f69e70f73064940d27d0a44f  flit_core-3.7.1.tar.gz
+md5  7c41da13273f7787709a24f74e0f5a99  flit_core-3.8.0.tar.gz
+sha256  b305b30c99526df5e63d6022dd2310a0a941a187bd3884f4c8ef0418df6c39f3  flit_core-3.8.0.tar.gz
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 2dc67bd517..4d7bee81da 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.7.1
+PYTHON_FLIT_CORE_VERSION = 3.8.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/15/d1/d8798b83e953fd6f86ca9b50f93eec464a9305b0661469c8234e61095481
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/10/e5/be08751d07b30889af130cec20955c987a74380a10058e6e8856e4010afc
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
