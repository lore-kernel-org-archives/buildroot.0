Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D951BC54736
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 20:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8676840672;
	Tue, 27 Aug 2024 20:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id letDzvYLoW5E; Tue, 27 Aug 2024 20:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 389CF4067D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389CF4067D;
	Tue, 27 Aug 2024 20:05:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 442F31BF28B
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 20:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E01880BD8
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 20:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBZ5jdV9VRaV for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 20:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F5080BB7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70F5080BB7
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 20:04:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C8FC86598; Tue, 27 Aug 2024 20:04:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:00:40 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4795d2b97d6abc2c5f0c407dd6bb083fa9178cf5
X-Git-Newrev: 210df8fc4a6c70f020131545987158535ad21b48
X-Patchwork-Hint: ignore
Message-Id: <20240827200459.5C8FC86598@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=210df8fc4a6c70f020131545987158535ad21b48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
index 297dcd06ec..923d026962 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2152,6 +2152,8 @@ F:	package/libselinux/
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
