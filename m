Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023CEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F91B41EBD;
	Fri, 13 Feb 2026 19:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0mLoW6nw_7J; Fri, 13 Feb 2026 19:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59E941E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011381;
	bh=Jn2zE16elxGVLWq2p7mBHAm5pEJ+xFQg1WGvoNRtAd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sDSNQ+iOs8xBFIPE4NgluvY0GZYiBXTnsuGRexyGWTaHrr87JxaZN3yHbG5ZwG/C9
	 mC1+3E3m/Q+7FfCssL9Y/DV3JnUEmg/Qzd0xuI/+1MWpLvAWTLBF2x14zynEtpoY5y
	 kDTQIuH0lxAZNLeFBVD1/bmeXxfLWakeeCweqnVNLQmw14Zn1mSspEyiuz6JGGkwGD
	 3CJkC5ZN+YrmHPGzMXwXOP8eQWvFTRRqrzh4zVaZN04xcsJHcSktS2X/AMEjdZj5Se
	 wUYg2cIYdWo/rK/iMPQWPgQeRk8oDWD9YaZ1KT8rBf0B9FByTJHO8U8JgpFUyYF1Fv
	 YLCyWWVfOeEkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E59E941E4E;
	Fri, 13 Feb 2026 19:36:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0390E69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F3E784573
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAKkHKwrxgXE for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9318284551
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9318284551
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8821D83A88; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:01:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b5095f2be634c5464948ea2ca5d2c332b748c085
X-Git-Newrev: c4f6278bb897cc2b0568f52dcc0576da71663a43
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.8821D83A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 python-requests: new runtime test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4f6278bb897cc2b0568f52dcc0576da71663a43
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Peter: Fix flake8 warning, use http.server instead of relying on
        connectivity]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 425abcd025374e6004d328b190ceb443fde568a8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS                                          |  2 ++
 .../testing/tests/package/sample_python_requests.py |  4 ++++
 .../testing/tests/package/test_python_requests.py   | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9bedd1805..30cf69a28f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2229,12 +2229,14 @@ F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
 F:	support/testing/tests/package/test_python_pydantic.py
 F:	support/testing/tests/package/test_python_pydantic_settings.py
+F:	support/testing/tests/package/test_python_requests.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
 F:	support/testing/tests/package/sample_python_pydantic.py
 F:	support/testing/tests/package/sample_python_pydantic_settings.py
+F:	support/testing/tests/package/sample_python_requests.py
 F:	support/testing/tests/package/sample_python_ruamel_yaml.py
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
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
