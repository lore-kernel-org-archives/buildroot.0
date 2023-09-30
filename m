Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD23CE7737A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AB5C4288B;
	Sat, 30 Sep 2023 16:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB5C4288B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5lBCgmDsR9i; Sat, 30 Sep 2023 16:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C884249D;
	Sat, 30 Sep 2023 16:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C884249D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 958291BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 717B34017A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 717B34017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oa7L8sRA24-Z for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 291ED402BC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 291ED402BC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1495583C19; Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:48:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 411a3deb1a4850f4eeff3faebdb87b8ef544d650
X-Git-Newrev: f9f6da877a7c8b24a79d2c784b31876c270c9cb4
X-Patchwork-Hint: ignore
Message-Id: <20230930164849.1495583C19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3MakoExt: new
 test for mako external plugins
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9f6da877a7c8b24a79d2c784b31876c270c9cb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mako provide some external plugins that requires additionnal and
optional runtime dependencies, make sure we test these situations.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                              |  1 +
 support/testing/tests/package/sample_python_mako_ext.py |  3 +++
 support/testing/tests/package/test_python_mako.py       | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 83d7ae868f..c297deedbe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2610,6 +2610,7 @@ F:	package/waffle/
 F:	package/xenomai/
 F:	package/zziplib/
 F:	support/testing/tests/package/sample_python_mako.py
+F:	support/testing/tests/package/sample_python_mako_ext.py
 F:	support/testing/tests/package/test_glxinfo.py
 F:	support/testing/tests/package/test_openssh.py
 F:	support/testing/tests/package/test_python_mako.py
diff --git a/support/testing/tests/package/sample_python_mako_ext.py b/support/testing/tests/package/sample_python_mako_ext.py
new file mode 100644
index 0000000000..855d64ebf5
--- /dev/null
+++ b/support/testing/tests/package/sample_python_mako_ext.py
@@ -0,0 +1,3 @@
+from mako import runtime # noqa
+import mako.ext.pygmentplugin # noqa
+import mako.ext.babelplugin # noqa
diff --git a/support/testing/tests/package/test_python_mako.py b/support/testing/tests/package/test_python_mako.py
index b6075bde6a..ea8fe57a5b 100644
--- a/support/testing/tests/package/test_python_mako.py
+++ b/support/testing/tests/package/test_python_mako.py
@@ -10,3 +10,16 @@ class TestPythonPy3Mako(TestPythonPackageBase):
         """
     sample_scripts = ["tests/package/sample_python_mako.py"]
     timeout = 30
+
+
+class TestPythonPy3MakoExt(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MAKO=y
+        BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN=y
+        BR2_PACKAGE_PYTHON_MAKO_EXT_BABELPLUGIN=y
+        """
+    sample_scripts = ["tests/package/sample_python_mako_ext.py"]
+    timeout = 30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
