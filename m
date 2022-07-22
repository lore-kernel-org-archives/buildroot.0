Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966B1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05B8240AA2;
	Fri, 22 Jul 2022 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05B8240AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdYJlGpQd5Nc; Fri, 22 Jul 2022 20:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 071E940184;
	Fri, 22 Jul 2022 20:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 071E940184
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 191051BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01F8940184
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01F8940184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI_O-7g05nuG for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C6D40135
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31C6D40135
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C7B3084194; Fri, 22 Jul 2022 20:38:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 22:52:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf1c9174aca83becc9f44828a8832f04c138fd23
X-Git-Newrev: c15734e3d25c7b7ee97a7a48d45457b926daf159
X-Patchwork-Hint: ignore
Message-Id: <20220722203852.C7B3084194@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-s3transfer
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
Content-Type: multipart/mixed; boundary="===============7452121096527697780=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7452121096527697780==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c15734e3d25c7b7ee97a7a48d45457b926daf159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many actual tests require network usage, so just import the module to
check that at least that part works.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/sample_python_s3transfer.py |  1 +
 support/testing/tests/package/test_python_s3transfer.py   | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/support/testing/tests/package/sample_python_s3transfer.py b/support/testing/tests/package/sample_python_s3transfer.py
new file mode 100644
index 0000000000..ff53077c9e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_s3transfer.py
@@ -0,0 +1 @@
+import s3transfer
diff --git a/support/testing/tests/package/test_python_s3transfer.py b/support/testing/tests/package/test_python_s3transfer.py
new file mode 100644
index 0000000000..dc669444ce
--- /dev/null
+++ b/support/testing/tests/package/test_python_s3transfer.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3S3transfer(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_S3TRANSFER=y
+        """
+    sample_scripts = ["tests/package/sample_python_s3transfer.py"]
+    timeout = 10

--===============7452121096527697780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7452121096527697780==--
