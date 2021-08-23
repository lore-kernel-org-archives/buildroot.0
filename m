Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26823C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:34:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB99B60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB99B60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EF12407F1;
	Thu, 26 Aug 2021 22:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGytEsJSPpnO; Thu, 26 Aug 2021 22:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFF15407DD;
	Thu, 26 Aug 2021 22:33:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A67861BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CA0E407BE
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rb6Fv6UdJ2Vr for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBFCB407D2
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4D37D8DC50; Thu, 26 Aug 2021 22:01:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 00:26:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2a48a6ee9d6b81c804182ff0ad6e0f7c850f6839
X-Git-Newrev: 26f6110740e936e83ddc4ce76cb58f8c5ba2eefe
X-Patchwork-Hint: ignore
Message-Id: <20210826220133.4D37D8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: remove
 TestPythonPy2{Cryptography, ServiceIdentity, Treq, Twisted, Txtorcon}
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=26f6110740e936e83ddc4ce76cb58f8c5ba2eefe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The python2 support has been removed since the python-idna bump to version 3.2 [1]

[1] 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_python_cryptography.py     | 11 -----------
 support/testing/tests/package/test_python_service_identity.py | 11 -----------
 support/testing/tests/package/test_python_treq.py             |  9 ---------
 support/testing/tests/package/test_python_twisted.py          |  9 ---------
 support/testing/tests/package/test_python_txtorcon.py         | 11 -----------
 5 files changed, 51 deletions(-)

diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
index 14515fcd2d..62f0ca0def 100644
--- a/support/testing/tests/package/test_python_cryptography.py
+++ b/support/testing/tests/package/test_python_cryptography.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Cryptography(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
-        """
-    sample_scripts = ["tests/package/sample_python_cryptography.py"]
-    timeout = 40
-
-
 class TestPythonPy3Cryptography(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index 6aeb77de8c..09cfbe0a26 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2ServiceIdentity(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
-        """
-    sample_scripts = ["tests/package/sample_python_service_identity.py"]
-    timeout = 30
-
-
 class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
index e24ae845be..d7a23829ea 100644
--- a/support/testing/tests/package/test_python_treq.py
+++ b/support/testing/tests/package/test_python_treq.py
@@ -12,15 +12,6 @@ class TestPythonTreq(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Treq(TestPythonTreq):
-    __test__ = True
-    config = TestPythonTreq.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TREQ=y
-        """
-
-
 class TestPythonPy3Treq(TestPythonTreq):
     __test__ = True
     config = TestPythonTreq.config + \
diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
index a458ee45dd..e87312db13 100644
--- a/support/testing/tests/package/test_python_twisted.py
+++ b/support/testing/tests/package/test_python_twisted.py
@@ -21,15 +21,6 @@ class TestPythonTwisted(TestPythonPackageBase):
         self.assertEqual(exit_code, 0)
 
 
-class TestPythonPy2Twisted(TestPythonTwisted):
-    __test__ = True
-    config = TestPythonTwisted.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TWISTED=y
-        """
-
-
 class TestPythonPy3Twisted(TestPythonTwisted):
     __test__ = True
     config = TestPythonTwisted.config + \
diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 1ac2f6919a..8e74190ee1 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -1,17 +1,6 @@
 from tests.package.test_python import TestPythonPackageBase
 
 
-class TestPythonPy2Txtorcon(TestPythonPackageBase):
-    __test__ = True
-    config = TestPythonPackageBase.config + \
-        """
-        BR2_PACKAGE_PYTHON=y
-        BR2_PACKAGE_PYTHON_TXTORCON=y
-        """
-    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
-    timeout = 30
-
-
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
     __test__ = True
     config = TestPythonPackageBase.config + \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
