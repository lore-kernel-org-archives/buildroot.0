Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6384CC001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0511E81E44;
	Sun, 23 Jul 2023 14:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0511E81E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7uFbExfJwmh; Sun, 23 Jul 2023 14:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37DBE81B9D;
	Sun, 23 Jul 2023 14:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37DBE81B9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A72C1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C34E409F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C34E409F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TutzVOhGx7LC for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:49:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0077409EF
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0077409EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6BC28275E; Sun, 23 Jul 2023 14:49:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 16:42:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5e078a15ca67dafa252f844bb9f132ea66b0222
X-Git-Newrev: a42b52163d40b9010b5be9c0c6a5032e12d02436
X-Patchwork-Hint: ignore
Message-Id: <20230723144940.D6BC28275E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for python-pysmb
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

commit: https://git.buildroot.net/buildroot/commit/?id=a42b52163d40b9010b5be9c0c6a5032e12d02436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998@free.fr: ignore flake8 warnings in test sample]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_pysmb.py |  2 ++
 support/testing/tests/package/test_python_pysmb.py   | 12 ++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b474c541f..bcbacc5665 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3147,11 +3147,13 @@ F:	package/zlog/
 F:	support/testing/tests/package/sample_python_dicttoxml2.py
 F:	support/testing/tests/package/sample_python_dtschema.py
 F:	support/testing/tests/package/sample_python_munch.py
+F:	support/testing/tests/package/sample_python_pysmb.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
 F:	support/testing/tests/package/test_python_dicttoxml2.py
 F:	support/testing/tests/package/test_python_dtschema.py
 F:	support/testing/tests/package/test_python_munch.py
+F:	support/testing/tests/package/test_python_pysmb.py
 F:	utils/scanpypi
 
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
diff --git a/support/testing/tests/package/sample_python_pysmb.py b/support/testing/tests/package/sample_python_pysmb.py
new file mode 100644
index 0000000000..6b37530a84
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pysmb.py
@@ -0,0 +1,2 @@
+from nmb.NetBIOS import NetBIOS  # noqa
+from smb.SMBHandler import SMBHandler  # noqa
diff --git a/support/testing/tests/package/test_python_pysmb.py b/support/testing/tests/package/test_python_pysmb.py
new file mode 100644
index 0000000000..cc4c7fb1e5
--- /dev/null
+++ b/support/testing/tests/package/test_python_pysmb.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Pysmb(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYSMB=y
+        """
+    sample_scripts = ["tests/package/sample_python_pysmb.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
