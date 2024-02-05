Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEEEC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5753561063;
	Mon,  5 Feb 2024 13:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5753561063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYJBfZXIcYKc; Mon,  5 Feb 2024 13:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8CB860F0B;
	Mon,  5 Feb 2024 13:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8CB860F0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61EBF1BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AF1E826FF
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF1E826FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4IrL1mSNE8wW for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:29:49 +0000 (UTC)
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69CF7826EF
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69CF7826EF
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 3ACFC200ED
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:29:57 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Mon, 05 Feb 2024 14:08:32 +0100
Message-ID: <170713978507.21324.6362507954144029814-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=ROVyoGP5OX/aEnmg7vjErrJ68jnbepB+ohewNTvcHAw=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To; q=dns/txt;
 s=20240113; t=1707139797; v=1;
 b=BnHwRiztSFMgYnnM7tJs1RQIfPTl9Xl95VMljiG8rxoo0eRN9AxBYjM37MeBqdpcVLSZ3h5U
 K6SwCkfVnOcRVWHFzYQvQ/tjdlKJEnPzWq7zXZv2AunGFEpFP/t9ssFTImcTHHH1GCdMxEIoHH2
 oLVQUJUcM5ZwLDyUP0kS4YHEjGjR7WJOAc3NMW0Pq2YbJV5hFq7FgS6qSm8+tgB3YQK8zx9P3UO
 Umkmw72Rsy36Wxy+nyKcrxjPXPoCYi6ECJKcgDVn6tv/SPnaH/aPfjx8YMc5WfJc/LWfWgLXfSo
 jiEzHwPfCS2KhuNa5lBVRIGoQbzwGxH+bk02aBBsvpfUg==
Subject: [Buildroot] [PATCH buildroot] support/testing: add minimalmodbus
 runtime test
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
Reply-To: ~bubu <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <bubu@bubu1.eu>

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
---
 .../tests/package/sample_python_minimalmodbus.py      |  7 +++++++
 .../tests/package/test_python_minimalmodbus.py        | 11 +++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_minimalmodbus.py
 create mode 100644 support/testing/tests/package/test_python_minimalmodbus.py

diff --git a/support/testing/tests/package/sample_python_minimalmodbus.py b/support/testing/tests/package/sample_python_minimalmodbus.py
new file mode 100644
index 0000000000..a75145f900
--- /dev/null
+++ b/support/testing/tests/package/sample_python_minimalmodbus.py
@@ -0,0 +1,7 @@
+import minimalmodbus
+from serial.serialutil import SerialException
+
+try:
+    instrument = minimalmodbus.Instrument('/dev/ttyUSB99', 1)
+except SerialException:
+    pass
diff --git a/support/testing/tests/package/test_python_minimalmodbus.py b/support/testing/tests/package/test_python_minimalmodbus.py
new file mode 100644
index 0000000000..53813406de
--- /dev/null
+++ b/support/testing/tests/package/test_python_minimalmodbus.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Minimalmodbus(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MINIMALMODBUS=y
+        """
+    sample_scripts = ["tests/package/sample_python_minimalmodbus.py"]
-- 
2.38.5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
