Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372D4C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA83C80B0D;
	Sun, 11 Dec 2022 20:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA83C80B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id os18xk56extS; Sun, 11 Dec 2022 20:19:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335D780AFA;
	Sun, 11 Dec 2022 20:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 335D780AFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BBF81BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07BD080AFA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07BD080AFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgeX-0Qy_z79 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21BEA80AEE
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21BEA80AEE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F1C98658B; Sun, 11 Dec 2022 20:19:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:18:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b119f21867b46184ac6d12ebbcd6f77e5ad84a43
X-Git-Newrev: b54e0dde3009cb859ff93a704a068d4fd162a035
X-Patchwork-Hint: ignore
Message-Id: <20221211201927.0F1C98658B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for
 python-dicttoxml2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b54e0dde3009cb859ff93a704a068d4fd162a035
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                |  2 ++
 support/testing/tests/package/sample_python_dicttoxml2.py | 11 +++++++++++
 support/testing/tests/package/test_python_dicttoxml2.py   | 12 ++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8e9a743c70..7f6908d0b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3117,9 +3117,11 @@ F:	package/wpa_supplicant/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
+F:	support/testing/tests/package/sample_python_dicttoxml2.py
 F:	support/testing/tests/package/sample_python_dtschema.py
 F:	support/testing/tests/package/test_libftdi1.py
 F:	support/testing/tests/package/test_python_can.py
+F:	support/testing/tests/package/test_python_dicttoxml2.py
 F:	support/testing/tests/package/test_python_dtschema.py
 F:	utils/scanpypi
 
diff --git a/support/testing/tests/package/sample_python_dicttoxml2.py b/support/testing/tests/package/sample_python_dicttoxml2.py
new file mode 100644
index 0000000000..788c5e2cd7
--- /dev/null
+++ b/support/testing/tests/package/sample_python_dicttoxml2.py
@@ -0,0 +1,11 @@
+from dicttoxml2 import dicttoxml
+
+payload: dict = {'mylist': ['foo', 'bar', 'baz'], 'mydict': {'foo': 'bar', 'baz': 1}, 'ok': True}
+
+expected: bytes = b'<?xml version="1.0" encoding="UTF-8" ?><root><mylist type="list"><item type="str">' \
+                  b'<![CDATA[foo]]></item><item type="str"><![CDATA[bar]]></item><item type="str"><![CDATA[baz]]>' \
+                  b'</item></mylist><mydict type="dict"><foo type="str"><![CDATA[bar]]></foo><baz type="int">' \
+                  b'<![CDATA[1]]></baz></mydict><ok type="bool"><![CDATA[True]]>' \
+                  b'</ok></root>'
+
+assert dicttoxml(payload, cdata=True) == expected
diff --git a/support/testing/tests/package/test_python_dicttoxml2.py b/support/testing/tests/package/test_python_dicttoxml2.py
new file mode 100644
index 0000000000..437518db7f
--- /dev/null
+++ b/support/testing/tests/package/test_python_dicttoxml2.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Dicttoxml2(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_DICTTOXML2=y
+        """
+    sample_scripts = ["tests/package/sample_python_dicttoxml2.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
