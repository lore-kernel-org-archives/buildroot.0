Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C02CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:40:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E70C60F6F
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E70C60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E599481836;
	Tue, 26 Oct 2021 19:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U44mhEVDYIe0; Tue, 26 Oct 2021 19:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 445C180BE3;
	Tue, 26 Oct 2021 19:40:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06F761BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0201404CF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ceZ07tx6obAp for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55D324055A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 78C1388F04; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fc54e2b10459587836d1d89f092fba38e7f9677
X-Git-Newrev: 5562eb58e8bad82bf8d691f90e6411344e280847
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.78C1388F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-boto3
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
Content-Type: multipart/mixed; boundary="===============5637039754793282268=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5637039754793282268==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5562eb58e8bad82bf8d691f90e6411344e280847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a rudimentary test inspired from the "Using boto3" section in
the package README ([1]).

Note that it doesn't try to do anything with the instanciated
resource, as this would require a network connection when the test
runs.

[1]: https://github.com/boto/boto3

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/sample_python_boto3.py |  2 ++
 support/testing/tests/package/test_python_boto3.py   | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/support/testing/tests/package/sample_python_boto3.py b/support/testing/tests/package/sample_python_boto3.py
new file mode 100644
index 0000000000..e69efc7860
--- /dev/null
+++ b/support/testing/tests/package/sample_python_boto3.py
@@ -0,0 +1,2 @@
+import boto3
+s3 = boto3.resource('s3')
diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
new file mode 100644
index 0000000000..756495fec9
--- /dev/null
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Boto3(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_BOTO3=y
+        """
+    sample_scripts = ["tests/package/sample_python_boto3.py"]
+    timeout = 10

--===============5637039754793282268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5637039754793282268==--
