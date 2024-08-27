Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C688C54731
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F7940672;
	Tue, 27 Aug 2024 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmhyhjouvGKl; Tue, 27 Aug 2024 20:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF6E4067D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF6E4067D;
	Tue, 27 Aug 2024 20:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5421BF2FD
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 065A84067D
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 20:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiZhAWSWURNt for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 20:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758C140672
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758C140672
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 20:03:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BEE9814A4; Tue, 27 Aug 2024 20:03:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:10:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d0bd15493fa18dfedaed80a0e7cb69701c207916
X-Git-Newrev: d592786c37fe99162e65ce4c3b8322a281e68cbf
X-Patchwork-Hint: ignore
Message-Id: <20240827200351.6BEE9814A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 python-asn1crypto runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=d592786c37fe99162e65ce4c3b8322a281e68cbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2fe638af2632424b826843675311f9a258a57b71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                |  2 ++
 support/testing/tests/package/sample_python_asn1crypto.py | 11 +++++++++++
 support/testing/tests/package/test_python_asn1crypto.py   | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a05e72cd5..4325a712a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2111,6 +2111,8 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/selinux-python/
+F:	support/testing/tests/package/sample_python_asn1crypto.py
+F:	support/testing/tests/package/test_python_asn1crypto.py
 F:	utils/config
 F:	utils/diffconfig
 
diff --git a/support/testing/tests/package/sample_python_asn1crypto.py b/support/testing/tests/package/sample_python_asn1crypto.py
new file mode 100644
index 0000000000..0b10487572
--- /dev/null
+++ b/support/testing/tests/package/sample_python_asn1crypto.py
@@ -0,0 +1,11 @@
+from asn1crypto import pem, x509
+
+
+with open('/etc/ssl/certs/ISRG_Root_X2.pem', 'rb') as f:
+    der_bytes = f.read()
+    if pem.detect(der_bytes):
+        type_name, headers, der_bytes = pem.unarmor(der_bytes)
+
+cert = x509.Certificate.load(der_bytes)
+
+assert cert.subject.native["common_name"] == "ISRG Root X2"
diff --git a/support/testing/tests/package/test_python_asn1crypto.py b/support/testing/tests/package/test_python_asn1crypto.py
new file mode 100644
index 0000000000..97df3d3ac8
--- /dev/null
+++ b/support/testing/tests/package/test_python_asn1crypto.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Asn1Crypto(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_ASN1CRYPTO=y
+        """
+    sample_scripts = ["tests/package/sample_python_asn1crypto.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
