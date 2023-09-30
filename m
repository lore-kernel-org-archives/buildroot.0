Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B2AE7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACB6428A5;
	Sat, 30 Sep 2023 16:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACB6428A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTp6Xr6UJFtH; Sat, 30 Sep 2023 16:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C67428CF;
	Sat, 30 Sep 2023 16:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C67428CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 537271BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F16582110
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F16582110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYaTUQJYj61b for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE9598210C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9598210C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC99183C19; Sat, 30 Sep 2023 16:48:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 18:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b506cb2dd031f2bdecc3c90111e31e145211d75
X-Git-Newrev: 164801997e526bf7f7ba8006cd1702e013536ca7
X-Patchwork-Hint: ignore
Message-Id: <20230930164848.DC99183C19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-mako runtime
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=164801997e526bf7f7ba8006cd1702e013536ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new runtime test allows to make sure that the python-mako package
minimally works at runtime.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                          |  2 ++
 support/testing/tests/package/sample_python_mako.py |  1 +
 support/testing/tests/package/test_python_mako.py   | 12 ++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f7ec5818f6..83d7ae868f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2609,8 +2609,10 @@ F:	package/upower/
 F:	package/waffle/
 F:	package/xenomai/
 F:	package/zziplib/
+F:	support/testing/tests/package/sample_python_mako.py
 F:	support/testing/tests/package/test_glxinfo.py
 F:	support/testing/tests/package/test_openssh.py
+F:	support/testing/tests/package/test_python_mako.py
 F:	toolchain/
 
 N:	Rufus Segar <rhs@riseup.net>
diff --git a/support/testing/tests/package/sample_python_mako.py b/support/testing/tests/package/sample_python_mako.py
new file mode 100644
index 0000000000..833ead87be
--- /dev/null
+++ b/support/testing/tests/package/sample_python_mako.py
@@ -0,0 +1 @@
+from mako import runtime # noqa
diff --git a/support/testing/tests/package/test_python_mako.py b/support/testing/tests/package/test_python_mako.py
new file mode 100644
index 0000000000..b6075bde6a
--- /dev/null
+++ b/support/testing/tests/package/test_python_mako.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Mako(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MAKO=y
+        """
+    sample_scripts = ["tests/package/sample_python_mako.py"]
+    timeout = 30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
