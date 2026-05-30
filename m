Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269A8CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C33859C0;
	Tue,  9 Jun 2026 13:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxzYFhrvNttb; Tue,  9 Jun 2026 13:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC99585BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010299;
	bh=Dt0bMtZNwN4GwssYQdyKh00ld0tSNuzP+QjTr0AqrqE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sHtMiE0TR2FHMP1VKOq7BvRUX3X/1ouWk63mI6zR90NpriYtwaaFX+IGmwcS0sp8c
	 NxSLe8yDDXLpcWp/WZGqyIuRXJDLj60rCghJbtUoarUJfHkL38hnBlJuH5JlMkvtN+
	 Lc5AX1DWCf8cUmQfEC6izRU6fdPdhxuP+pcM7md+nln1aiuC1FM0Hwn4swcKhwhyHy
	 bkJR5lKaE4ujYl3G9+JHizUk2z4MS/UAGQiJPhtUbsM36GX0fIPM4Y0qCtgxOoxtq8
	 j8EoatFCuQNbQFuAgkhs7TIdBzTHEbZsC7EuLdOl5cOlZYz9/GyCzW9ux6GV+5W/Dy
	 Ri1jDYm1PRtnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC99585BFA;
	Tue,  9 Jun 2026 13:04:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C78A5190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A20BE46457
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yccJoodqQ7Xx for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA53C45FEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA53C45FEA
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5E8087E75; Tue,  9 Jun 2026 13:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:15:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a295c5bb0cc8c6f18c005bcc9dfc42c731b4a92a
X-Git-Newrev: 2d7cf86aaafed925bd2a24f0d58a4dcd0bfd518a
X-Patchwork-Hint: ignore
Message-Id: <20260609130123.E5E8087E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sysv-ipc: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d7cf86aaafed925bd2a24f0d58a4dcd0bfd518a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

python-sysv-ipc provides Python bindings for System V IPC primitives
(semaphores, shared memory and message queues).

https://github.com/osvenskan/sysv_ipc

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-sysv-ipc/Config.in                  |  7 ++++
 package/python-sysv-ipc/python-sysv-ipc.hash       |  4 +++
 package/python-sysv-ipc/python-sysv-ipc.mk         | 16 ++++++++++
 .../tests/package/sample_python_sysv_ipc.py        | 26 +++++++++++++++
 .../testing/tests/package/test_python_sysv_ipc.py  | 37 ++++++++++++++++++++++
 .../tests/package/test_python_sysv_ipc/ping.py     | 17 ++++++++++
 .../tests/package/test_python_sysv_ipc/pong.py     | 17 ++++++++++
 9 files changed, 126 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 76d4df4a29..b474c96324 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3369,6 +3369,7 @@ F:	package/libecoli/
 F:	package/libnss-ato/
 F:	package/libyang-cpp/
 F:	package/python-libyang/
+F:	package/python-sysv-ipc/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index c70a64e968..ed003562da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1444,6 +1444,7 @@ menu "External python modules"
 	source "package/python-starlette/Config.in"
 	source "package/python-sympy/Config.in"
 	source "package/python-systemd/Config.in"
+	source "package/python-sysv-ipc/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
 	source "package/python-telnetlib3/Config.in"
diff --git a/package/python-sysv-ipc/Config.in b/package/python-sysv-ipc/Config.in
new file mode 100644
index 0000000000..487935b680
--- /dev/null
+++ b/package/python-sysv-ipc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SYSV_IPC
+	bool "python-sysv-ipc"
+	help
+	  System V IPC primitives (semaphores, shared memory and
+	  message queues) for Python.
+
+	  https://github.com/osvenskan/sysv_ipc
diff --git a/package/python-sysv-ipc/python-sysv-ipc.hash b/package/python-sysv-ipc/python-sysv-ipc.hash
new file mode 100644
index 0000000000..ecdd154035
--- /dev/null
+++ b/package/python-sysv-ipc/python-sysv-ipc.hash
@@ -0,0 +1,4 @@
+# From https://pypi.org/pypi/sysv-ipc/1.2.0/json
+sha256  ef96ab33bb62e4d14142f0be0524dcc0c3c70c96442df2fc773c67b7c7514199  sysv_ipc-1.2.0.tar.gz
+# Locally computed
+sha256  ca1c736814f4b73052ba877eaa9e09b40c7e22f1b5d025236246227cc1d87fdc  LICENSE
diff --git a/package/python-sysv-ipc/python-sysv-ipc.mk b/package/python-sysv-ipc/python-sysv-ipc.mk
new file mode 100644
index 0000000000..d656011175
--- /dev/null
+++ b/package/python-sysv-ipc/python-sysv-ipc.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-sysv-ipc
+#
+################################################################################
+
+PYTHON_SYSV_IPC_VERSION = 1.2.0
+PYTHON_SYSV_IPC_SOURCE = sysv_ipc-$(PYTHON_SYSV_IPC_VERSION).tar.gz
+PYTHON_SYSV_IPC_SITE = https://files.pythonhosted.org/packages/f2/5e/59208c6dd05ebc6f46ce2023c4fc01ffe814a1967d21b35d312c7e6ffeae
+
+PYTHON_SYSV_IPC_LICENSE = BSD-3-Clause
+PYTHON_SYSV_IPC_LICENSE_FILES = LICENSE
+
+PYTHON_SYSV_IPC_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_sysv_ipc.py b/support/testing/tests/package/sample_python_sysv_ipc.py
new file mode 100644
index 0000000000..1b5941329c
--- /dev/null
+++ b/support/testing/tests/package/sample_python_sysv_ipc.py
@@ -0,0 +1,26 @@
+import subprocess
+import sys
+import sysv_ipc
+
+key = [303, 808]
+iterations = 6
+
+queue = [
+    sysv_ipc.MessageQueue(key[0], sysv_ipc.IPC_CREX),
+    sysv_ipc.MessageQueue(key[1], sysv_ipc.IPC_CREX)
+]
+
+procs = [None] * 2
+
+procs[0] = subprocess.Popen([sys.executable, "/root/ping.py", str(key[0]), str(key[1]), str(iterations)])
+procs[1] = subprocess.Popen([sys.executable, "/root/pong.py", str(key[1]), str(key[0]), str(iterations)])
+
+for p in procs:
+    try:
+        errs = p.wait(timeout=15)
+    except subprocess.TimeoutExpired:
+        p.kill()
+        errs = p.wait()
+
+for q in queue:
+    q.remove()
diff --git a/support/testing/tests/package/test_python_sysv_ipc.py b/support/testing/tests/package/test_python_sysv_ipc.py
new file mode 100644
index 0000000000..f19e33fe11
--- /dev/null
+++ b/support/testing/tests/package/test_python_sysv_ipc.py
@@ -0,0 +1,37 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonSysVIPC(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_SYSV_IPC=y
+        """
+    sample_scripts = ["tests/package/sample_python_sysv_ipc.py",
+                      "tests/package/test_python_sysv_ipc/ping.py",
+                      "tests/package/test_python_sysv_ipc/pong.py"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+
+        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
+        output, ret = self.emulator.run(cmd, timeout=self.timeout)
+
+        self.assertEqual(ret, 0)
+        self.assertEqual(output, [
+            'ping 0',
+            'pong 0',
+            'ping 1',
+            'pong 1',
+            'ping 2',
+            'pong 2',
+            'ping 3',
+            'pong 3',
+            'ping 4',
+            'pong 4',
+            'ping 5',
+            'pong 5',
+        ])
diff --git a/support/testing/tests/package/test_python_sysv_ipc/ping.py b/support/testing/tests/package/test_python_sysv_ipc/ping.py
new file mode 100644
index 0000000000..d5c1df3879
--- /dev/null
+++ b/support/testing/tests/package/test_python_sysv_ipc/ping.py
@@ -0,0 +1,17 @@
+import argparse
+import sysv_ipc
+
+parser = argparse.ArgumentParser()
+parser.add_argument("input", help="input message queue key", type=int)
+parser.add_argument("output", help="output message queue key", type=int)
+parser.add_argument("count", help="iterations count", type=int)
+args = parser.parse_args()
+
+incoming = sysv_ipc.MessageQueue(args.input)
+outgoing = sysv_ipc.MessageQueue(args.output)
+
+for i in range(0, args.count):
+    outgoing.send(f"ping {i}")
+
+    s, _ = incoming.receive()
+    print(s.decode())
diff --git a/support/testing/tests/package/test_python_sysv_ipc/pong.py b/support/testing/tests/package/test_python_sysv_ipc/pong.py
new file mode 100644
index 0000000000..b5d9ddb873
--- /dev/null
+++ b/support/testing/tests/package/test_python_sysv_ipc/pong.py
@@ -0,0 +1,17 @@
+import argparse
+import sysv_ipc
+
+parser = argparse.ArgumentParser()
+parser.add_argument("input", help="input message queue key", type=int)
+parser.add_argument("output", help="output message queue key", type=int)
+parser.add_argument("count", help="iterations count", type=int)
+args = parser.parse_args()
+
+incoming = sysv_ipc.MessageQueue(args.input)
+outgoing = sysv_ipc.MessageQueue(args.output)
+
+for i in range(0, args.count):
+    s, _ = incoming.receive()
+    print(s.decode())
+
+    outgoing.send(f"pong {i}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
