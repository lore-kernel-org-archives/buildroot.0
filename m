Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7C5C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002136067D;
	Sat,  8 Aug 2026 14:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71WsvhYALQuS; Sat,  8 Aug 2026 14:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB696068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786198611;
	bh=6z1Nt1evqCcAIpdmbZWV4fvly3mRZ3Z2/76cYPrMGk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oGBpkzbbvP+L0hvH+2MW6JZz7CeZQg5y8bKZWzAdkGwZRvjygf+DKIYi+EzOzUZzV
	 qSR4i0f8T/xU2BKe2TOyW8e2JS2sYL9+lcFQZfsplK6zFSpxQ1GCWzAapHDnPkDakn
	 ThdZ2dwFN64TqqzUHoq766Tz4C0vS2jgqhEV6idKEn9MSEZs6Z6r/vqre4sshNC5Xr
	 P42HV3RjMa5nj1Oh3YvhZ1jdcw6EMp/qv13DuIUe7Paprrab0M1zyVHS+reI1nzRpI
	 7Qt6LZkkBMQO6cOF29m5d9n3u9QDzGDgKAJ5Pm1I3Y1JzyZy63jpYCLBLcP5C7ptsg
	 odZyq6OQgt38Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB696068F;
	Sat,  8 Aug 2026 14:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BAEC3A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DD266068F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ve6xOjDLkype for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6405C6067D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6405C6067D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:16:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F6908CA09; Sat,  8 Aug 2026 14:16:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 16:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ceb2a8b06abadea8fbc162f9aff77dd9f11e22e
X-Git-Newrev: 9fa59eb7dbc4016086ff14cb3c9a3ebead507d08
X-Patchwork-Hint: ignore
Message-Id: <20260808141601.4F6908CA09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add pyudev test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9fa59eb7dbc4016086ff14cb3c9a3ebead507d08
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In order to verify that pyudev works fine, including with just
libudev-zero, add a basic test for this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                            |  2 ++
 support/testing/tests/package/sample_python_pyudev.py |  4 ++++
 support/testing/tests/package/test_python_pyudev.py   | 12 ++++++++++++
 3 files changed, 18 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56dd9f3943..353f4a2ccf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
+F:	support/testing/tests/package/sample_python_pyudev.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_nodejs.py
 F:	support/testing/tests/package/test_python_augeas.py
@@ -3294,6 +3295,7 @@ F:	support/testing/tests/package/test_python_flask_expects_json.py
 F:	support/testing/tests/package/test_python_fs.py
 F:	support/testing/tests/package/test_python_git.py
 F:	support/testing/tests/package/test_python_pyfatfs.py
+F:	support/testing/tests/package/test_python_pyudev.py
 F:	support/testing/tests/package/test_python_pyusb.py
 F:	support/testing/tests/package/test_python_serial.py
 F:	support/testing/tests/package/test_snagboot.py
diff --git a/support/testing/tests/package/sample_python_pyudev.py b/support/testing/tests/package/sample_python_pyudev.py
new file mode 100644
index 0000000000..8e4ae32511
--- /dev/null
+++ b/support/testing/tests/package/sample_python_pyudev.py
@@ -0,0 +1,4 @@
+import pyudev
+
+context = pyudev.Context()
+assert('/dev/ttyAMA0' in [ d.device_node for d in context.list_devices() ])
diff --git a/support/testing/tests/package/test_python_pyudev.py b/support/testing/tests/package/test_python_pyudev.py
new file mode 100644
index 0000000000..ec8985b31f
--- /dev/null
+++ b/support/testing/tests/package/test_python_pyudev.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3PyUdev(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_LIBUDEV_ZERO=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_PYUDEV=y
+        """
+    sample_scripts = ["tests/package/sample_python_pyudev.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
