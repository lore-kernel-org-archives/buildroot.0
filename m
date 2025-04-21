Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02C7C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 16:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E0CD40759;
	Mon, 21 Apr 2025 16:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFaq92pBQ8zg; Mon, 21 Apr 2025 16:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92217403FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92217403FB;
	Mon, 21 Apr 2025 16:08:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2AC1C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 236BD40509
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evuFUU7E71eq for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74A94403FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74A94403FB
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C0EF85FE0; Mon, 21 Apr 2025 16:08:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 17:38:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9021b261c6085bd4e1258aa23c8424198dd6d59f
X-Git-Newrev: 3e931caf8431bd558a4fc71570d19a000c698d66
X-Patchwork-Hint: ignore
Message-Id: <20250421160802.5C0EF85FE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add new test for
 python-urllib3
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7800480926493486849=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7800480926493486849==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3e931caf8431bd558a4fc71570d19a000c698d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Importing urllib3 already allows us to check that for example zlib can
be loaded at runtime.

For good measure, also create the PoolManager object mentioned in the
user guide ([1]), and check that we can normalize a URL like it is
done in urllib3's 'test/test_util.py'.

[1]: https://urllib3.readthedocs.io/en/stable/user-guide.html

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                             |  2 ++
 support/testing/tests/package/sample_python_urllib3.py |  9 +++++++++
 support/testing/tests/package/test_python_urllib3.py   | 12 ++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6608b30f16..9cfdbcc662 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2825,12 +2825,14 @@ F:	support/testing/tests/package/sample_python_rsa.py
 F:	support/testing/tests/package/sample_python_s3transfer.py
 F:	support/testing/tests/package/sample_python_sdbus.py
 F:	support/testing/tests/package/sample_python_sdbus_networkmanager.py
+F:	support/testing/tests/package/sample_python_urllib3.py
 F:	support/testing/tests/package/test_python_jmespath.py
 F:	support/testing/tests/package/test_python_pymupdf.py
 F:	support/testing/tests/package/test_python_rsa.py
 F:	support/testing/tests/package/test_python_s3transfer.py
 F:	support/testing/tests/package/test_python_sdbus.py
 F:	support/testing/tests/package/test_python_sdbus_networkmanager.py
+F:	support/testing/tests/package/test_python_urllib3.py
 
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/nvidia-persistenced/
diff --git a/support/testing/tests/package/sample_python_urllib3.py b/support/testing/tests/package/sample_python_urllib3.py
new file mode 100644
index 0000000000..9e0cf8c17a
--- /dev/null
+++ b/support/testing/tests/package/sample_python_urllib3.py
@@ -0,0 +1,9 @@
+# Check that we can import urllib3 even if we don't use all of it:
+import urllib3
+
+# Just check that we can create a PoolManager:
+http = urllib3.PoolManager()
+
+# Check if we can normalize URLs:
+assert urllib3.util.url.parse_url("HTTPS://Example.Com/?Key=Value").url \
+    == "https://example.com/?Key=Value"
diff --git a/support/testing/tests/package/test_python_urllib3.py b/support/testing/tests/package/test_python_urllib3.py
new file mode 100644
index 0000000000..54a94d5e65
--- /dev/null
+++ b/support/testing/tests/package/test_python_urllib3.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Urllib3(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_URLLIB3=y
+        """
+    sample_scripts = ["tests/package/sample_python_urllib3.py"]
+    timeout = 20

--===============7800480926493486849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7800480926493486849==--
