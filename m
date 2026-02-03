Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734FE87835
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF0D60656;
	Tue,  3 Feb 2026 14:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2TnIaX9LTIr; Tue,  3 Feb 2026 14:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970C460812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128189;
	bh=jWvYX8m7yJdk2WveovM4tCfPU/yS1xYRdKzQp3JnbLw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MeI4c1D1ND7nCeKk4llIQiwxzHouFmqjaZGXDU2ubILh3Qhnie5fafJ1u3/8ImG1l
	 yDI+yHUhHm2JdSOnME4044vpgicUjMOvuahqxw84N7nHQzLnVJvtt/p7ixh/XWPCRk
	 RP5IuRVfb8PFh/mlqbpdGmcEvsG2phgNUNpmoiwgmH5w0yWfeFE86FwQzgnGUUQRQ3
	 P3i1nCALDFmRx60rS7wBWqdv555wUqGbb1DsbL1ZFoK4Xt5AoN5NQuoyYPJY9/p9iX
	 kJafH/6gwpAyPqfYErMTowISEpTMOpsiTEQ+MoyMKOqZmYkUdh1flDDDRcasvS4R/t
	 FiwTN5fI2CrCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970C460812;
	Tue,  3 Feb 2026 14:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DDBA613D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C021440754
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B50_5OwChhup for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB07E406F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB07E406F9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:16:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C96F88395B; Tue,  3 Feb 2026 14:16:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 15:15:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef5293307478bd9487c890facbb8de85240d4156
X-Git-Newrev: 425abcd025374e6004d328b190ceb443fde568a8
X-Patchwork-Hint: ignore
Message-Id: <20260203141627.C96F88395B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: python-requests: new
 runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=425abcd025374e6004d328b190ceb443fde568a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Peter: Fix flake8 warning, use http.server instead of relying on
        connectivity]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                          |  2 ++
 .../testing/tests/package/sample_python_requests.py |  4 ++++
 .../testing/tests/package/test_python_requests.py   | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 280d00d13e..13bf5244fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2290,6 +2290,7 @@ F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
+F:	support/testing/tests/package/test_python_requests.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_sdbus_systemd.py
@@ -2305,6 +2306,7 @@ F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
+F:	support/testing/tests/package/sample_python_requests.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 F:	support/testing/tests/package/sample_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/sample_python_sdbus_systemd.py
diff --git a/support/testing/tests/package/sample_python_requests.py b/support/testing/tests/package/sample_python_requests.py
new file mode 100644
index 0000000000..55a05d3910
--- /dev/null
+++ b/support/testing/tests/package/sample_python_requests.py
@@ -0,0 +1,4 @@
+import requests
+
+r = requests.get("http://localhost")
+assert r.status_code == 200
diff --git a/support/testing/tests/package/test_python_requests.py b/support/testing/tests/package/test_python_requests.py
new file mode 100644
index 0000000000..fd55aa5476
--- /dev/null
+++ b/support/testing/tests/package/test_python_requests.py
@@ -0,0 +1,21 @@
+import os
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Requests(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_REQUESTS=y
+        """
+    sample_scripts = ["tests/package/sample_python_requests.py"]
+    timeout = 15
+
+    def login(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+        self.assertRunOk("python3 -m http.server 80 &")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
