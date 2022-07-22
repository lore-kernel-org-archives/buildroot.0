Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C72C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAAEC8493E;
	Fri, 22 Jul 2022 21:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAAEC8493E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxBa6cvwh3pi; Fri, 22 Jul 2022 21:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C0E584889;
	Fri, 22 Jul 2022 21:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C0E584889
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 195CE1C11A9
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E852584887
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E852584887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8gfez2uQUqz for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:21:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 180B08480F
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180B08480F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A9DB3841FA; Fri, 22 Jul 2022 21:08:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 23:18:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a38da5e3cae6b786bb193d317a0e5e89466d9f6e
X-Git-Newrev: dfa0c8e3a876af16a0b57e49683c5f420c23678d
X-Patchwork-Hint: ignore
Message-Id: <20220722210803.A9DB3841FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-jmespath
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
Content-Type: multipart/mixed; boundary="===============0147040956983818548=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0147040956983818548==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dfa0c8e3a876af16a0b57e49683c5f420c23678d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new rudimentary test inspired by the examples from jmespath's
README file ([1]).

[1]: https://github.com/jmespath/jmespath.py/blob/develop/README.rst

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[Thomas: add entry in DEVELOPERS file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                              |  2 ++
 support/testing/tests/package/sample_python_jmespath.py |  4 ++++
 support/testing/tests/package/test_python_jmespath.py   | 12 ++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 55406892c7..54eb08c1d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2435,8 +2435,10 @@ F:	package/python-jmespath/
 F:	package/python-pymupdf/
 F:	package/python-rsa/
 F:	package/python-s3transfer/
+F:	support/testing/tests/package/sample_python_jmespath.py
 F:	support/testing/tests/package/sample_python_rsa.py
 F:	support/testing/tests/package/sample_python_s3transfer.py
+F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 
diff --git a/support/testing/tests/package/sample_python_jmespath.py b/support/testing/tests/package/sample_python_jmespath.py
new file mode 100644
index 0000000000..aefccd4fd8
--- /dev/null
+++ b/support/testing/tests/package/sample_python_jmespath.py
@@ -0,0 +1,4 @@
+import jmespath
+expression = jmespath.compile('foo.bar')
+res = expression.search({'foo': {'bar': 'baz'}})
+assert res == "baz", "expression.search failed"
diff --git a/support/testing/tests/package/test_python_jmespath.py b/support/testing/tests/package/test_python_jmespath.py
new file mode 100644
index 0000000000..80fd09fdde
--- /dev/null
+++ b/support/testing/tests/package/test_python_jmespath.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Jmespath(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_JMESPATH=y
+        """
+    sample_scripts = ["tests/package/sample_python_jmespath.py"]
+    timeout = 10

--===============0147040956983818548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0147040956983818548==--
