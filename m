Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E912C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C81B60586;
	Sat, 23 Dec 2023 14:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C81B60586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xi-f3NiLnpA0; Sat, 23 Dec 2023 14:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95F8060E5F;
	Sat, 23 Dec 2023 14:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95F8060E5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE0F1BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E2840490
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E2840490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeoWMvxvgO-6 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:13:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AA0240399
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA0240399
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9B7987D0C; Sat, 23 Dec 2023 14:13:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 15:05:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cec73bb5f85c9eb41b2cf44dc792765e684fa7a9
X-Git-Newrev: 4d025f88e62db50ce28730b6e732b2946fe7d5bc
X-Patchwork-Hint: ignore
Message-Id: <20231223141308.E9B7987D0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add python-tftpy runtime
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d025f88e62db50ce28730b6e732b2946fe7d5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This runtime test verifies the existence of the tftpy module when
selected.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_tftpy.py |  1 +
 support/testing/tests/package/test_python_tftpy.py   | 11 +++++++++++
 3 files changed, 14 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 874e7bd3d2..bad07d51aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -678,6 +678,8 @@ F:	configs/beelink_gs1_defconfig
 N:	Colin Foster <colin.foster@in-advantage.com>
 F:	package/python-tftpy/
 F:	package/rauc-hawkbit-updater/
+F:	support/testing/tests/package/sample_python_tftpy.py
+F:	support/testing/tests/package/test_python_tftpy.py
 
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
 F:	package/libloki/
diff --git a/support/testing/tests/package/sample_python_tftpy.py b/support/testing/tests/package/sample_python_tftpy.py
new file mode 100644
index 0000000000..ea4d20c9a2
--- /dev/null
+++ b/support/testing/tests/package/sample_python_tftpy.py
@@ -0,0 +1 @@
+import tftpy
diff --git a/support/testing/tests/package/test_python_tftpy.py b/support/testing/tests/package/test_python_tftpy.py
new file mode 100644
index 0000000000..d64f2c29d7
--- /dev/null
+++ b/support/testing/tests/package/test_python_tftpy.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonTftpy(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_TFTPY=y
+        """
+    sample_scripts = ["tests/package/sample_python_tftpy.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
