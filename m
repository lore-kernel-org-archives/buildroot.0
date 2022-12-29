Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A30C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BC483FAB;
	Mon, 20 Feb 2023 23:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0BC483FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Rs5KZY9kKZj; Mon, 20 Feb 2023 23:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942B183FA8;
	Mon, 20 Feb 2023 23:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 942B183FA8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73AC21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E20D617B8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E20D617B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKaB_wNC2Thd for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF43610A8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF43610A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13889828C8; Mon, 20 Feb 2023 20:52:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:38:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 72576a661faf8e9d8021a8b110ce9318a9bc8f38
X-Git-Newrev: 2f0a2a43bbfcb2aef1569b48277933264ec25feb
X-Patchwork-Hint: ignore
Message-Id: <20230220205219.13889828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: add test for
 python-munch
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f0a2a43bbfcb2aef1569b48277933264ec25feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  2 ++
 support/testing/tests/package/sample_python_munch.py | 20 ++++++++++++++++++++
 support/testing/tests/package/test_python_munch.py   | 12 ++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0eea9c33d9..3217823b6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3133,10 +3133,12 @@ F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
 F:	support/testing/tests/package/sample_python_dicttoxml2.py
 F:	support/testing/tests/package/sample_python_dtschema.py
+F:	support/testing/tests/package/sample_python_munch.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
 F:	support/testing/tests/package/test_python_dicttoxml2.py
 F:	support/testing/tests/package/test_python_dtschema.py
+F:	support/testing/tests/package/test_python_munch.py
 F:	utils/scanpypi
 
 N:	Yunhao Tian <t123yh.xyz@gmail.com>
diff --git a/support/testing/tests/package/sample_python_munch.py b/support/testing/tests/package/sample_python_munch.py
new file mode 100644
index 0000000000..b45bec7b7e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_munch.py
@@ -0,0 +1,20 @@
+from munch import Munch
+
+b = Munch()
+b.hello = 'world'
+assert b.hello == 'world'
+b['hello'] += "!"
+assert b.hello == 'world!'
+b.foo = Munch(lol=True)
+assert b.foo.lol is True
+assert b.foo is b['foo']
+
+assert sorted(b.keys()) == ['foo', 'hello']
+
+b.update({'ponies': 'are pretty!'}, hello=42)
+assert b == Munch({'ponies': 'are pretty!', 'foo': Munch({'lol': True}), 'hello': 42})
+
+assert sorted([(k, b[k]) for k in b]) == [('foo', Munch({'lol': True})), ('hello', 42), ('ponies', 'are pretty!')]
+
+format_munch = Munch(knights='lolcats', ni='can haz')
+assert "The {knights} who say {ni}!".format(**format_munch) == 'The lolcats who say can haz!'
diff --git a/support/testing/tests/package/test_python_munch.py b/support/testing/tests/package/test_python_munch.py
new file mode 100644
index 0000000000..6853bbaac7
--- /dev/null
+++ b/support/testing/tests/package/test_python_munch.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Munch(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MUNCH=y
+        """
+    sample_scripts = ["tests/package/sample_python_munch.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
