Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066C2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B63F261078
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B63F261078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EB7B6067F;
	Tue, 26 Oct 2021 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iWYo6AsVFki; Tue, 26 Oct 2021 19:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1B160A3B;
	Tue, 26 Oct 2021 19:39:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0350F1BF9AC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D50481771
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIwVO8c9SJZO for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 486B3817C3
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:38:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5CA3A88F04; Tue, 26 Oct 2021 19:34:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:34:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 169995a9206146d233515917934c076fc68ab7cd
X-Git-Newrev: 9060f1a6b8638786364ca8d48b2a96b0ad1be1fa
X-Patchwork-Hint: ignore
Message-Id: <20211026193445.5CA3A88F04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-botocore
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
Content-Type: multipart/mixed; boundary="===============2873981131747085452=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2873981131747085452==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9060f1a6b8638786364ca8d48b2a96b0ad1be1fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a rudimentary test inspired from the "Using botocore" section in
the package README ([1]).

Note that it doesn't try to use the instantiated client, as this would
require a network connection when the test runs.

[1]: https://github.com/boto/botocore

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/sample_python_botocore.py |  3 +++
 support/testing/tests/package/test_python_botocore.py   | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/support/testing/tests/package/sample_python_botocore.py b/support/testing/tests/package/sample_python_botocore.py
new file mode 100644
index 0000000000..cc4055989f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_botocore.py
@@ -0,0 +1,3 @@
+import botocore.session
+session = botocore.session.get_session()
+client = session.create_client('ec2', region_name="us-east-1")
diff --git a/support/testing/tests/package/test_python_botocore.py b/support/testing/tests/package/test_python_botocore.py
new file mode 100644
index 0000000000..6336c5658f
--- /dev/null
+++ b/support/testing/tests/package/test_python_botocore.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Botocore(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_BOTOCORE=y
+        """
+    sample_scripts = ["tests/package/sample_python_botocore.py"]
+    timeout = 10

--===============2873981131747085452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2873981131747085452==--
