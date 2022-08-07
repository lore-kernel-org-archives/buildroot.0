Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5999DC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF59340486;
	Sun,  7 Aug 2022 12:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF59340486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvq0St3DBw_W; Sun,  7 Aug 2022 12:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ECD340461;
	Sun,  7 Aug 2022 12:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ECD340461
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE92E1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 985424162D
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985424162D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDM9x1hqHewW for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:55:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A749B4162C
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A749B4162C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6795C86F19; Sun,  7 Aug 2022 12:40:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:54:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08be3dfa15e97134c150a46c42fa2059be90b1c6
X-Git-Newrev: b25c3f1d43a44c9edd87d2497874c3536a9b300d
X-Patchwork-Hint: ignore
Message-Id: <20220807124058.6795C86F19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for
 python-dtschema
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

commit: https://git.buildroot.net/buildroot/commit/?id=b25c3f1d43a44c9edd87d2497874c3536a9b300d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                              |  2 ++
 support/testing/tests/package/sample_python_dtschema.py |  1 +
 support/testing/tests/package/test_python_dtschema.py   | 12 ++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 18f4d1f0e6..edc02bf1c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3135,8 +3135,10 @@ F:	package/wpa_supplicant/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
+F:	support/testing/tests/package/sample_python_dtschema.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
+F:	support/testing/tests/package/test_python_dtschema.py
 F:	utils/scanpypi
 
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
diff --git a/support/testing/tests/package/sample_python_dtschema.py b/support/testing/tests/package/sample_python_dtschema.py
new file mode 100644
index 0000000000..786c3d5a71
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dtschema.py
@@ -0,0 +1 @@
+import dtschema
diff --git a/support/testing/tests/package/test_python_dtschema.py b/support/testing/tests/package/test_python_dtschema.py
new file mode 100644
index 0000000000..e3a4a309c1
--- /dev/null
+++ b/support/testing/tests/package/test_python_dtschema.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Dtschema(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DTSCHEMA=y
+        """
+    sample_scripts = ["tests/package/sample_python_dtschema.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
