Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EDAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B72F60F46
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B72F60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 258156081E;
	Mon, 27 Sep 2021 14:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNvJSF9jJKg0; Mon, 27 Sep 2021 14:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A996607EB;
	Mon, 27 Sep 2021 14:40:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05CBE1BF275
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 402F5403AA
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEsVjAClhA6D for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07CF6404C8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BD4E28D267; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a79cc5f0748541b0f0e3cf0588e76672b592938e
X-Git-Newrev: 502b8576c44e18b7721c042d9fc72dbba5e08473
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.BD4E28D267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: remove python2 tests for
 automat and attrs
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

commit: https://git.buildroot.net/buildroot/commit/?id=502b8576c44e18b7721c042d9fc72dbba5e08473
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit ef5c8be25ab373866b5a92d3d9f31bf36b7a8abf those packages
depend on python3. Hence, we can remove the python2 tests.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 support/testing/tests/package/test_python_attrs.py   | 10 ----------
 support/testing/tests/package/test_python_automat.py | 11 -----------
 2 files changed, 21 deletions(-)

diff --git a/support/testing/tests/package/test_python_attrs.py b/support/testing/tests/package/test_python_attrs.py
index 9f597034ae..38831b24ef 100644
--- a/support/testing/tests/package/test_python_attrs.py
+++ b/support/testing/tests/package/test_python_attrs.py
@@ -1,16 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Attrs(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_ATTRS=y
-        """
-    sample_scripts = ["tests/package/sample_python_attrs.py"]
-
-
 class TestPythonPy3Attrs(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_automat.py b/support/testing/tests/package/test_python_automat.py
index 00a7ed6526..6ee4ea7618 100644
--- a/support/testing/tests/package/test_python_automat.py
+++ b/support/testing/tests/package/test_python_automat.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Automat(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_AUTOMAT=y
-        """
-    sample_scripts = ["tests/package/sample_python_automat.py"]
-    timeout = 30
-
-
 class TestPythonPy3Automat(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
