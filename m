Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47788C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 13:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B2C61019;
	Sun, 20 Jul 2025 13:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YuJHGKUGbkw; Sun, 20 Jul 2025 13:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CEC460FF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CEC460FF5;
	Sun, 20 Jul 2025 13:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A821117
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4E7E83EC0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZ032cYB7ewt for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 13:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F414883EDE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F414883EDE
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 13:15:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4D7E83D2E; Sun, 20 Jul 2025 13:15:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 15:08:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26900bc6c935ef10108915a7f924d46fd422aea7
X-Git-Newrev: 6bcc6aba298a669190d47d26d357d47ccd92cd28
X-Patchwork-Hint: ignore
Message-Id: <20250720131530.E4D7E83D2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apscheduler: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=6bcc6aba298a669190d47d26d357d47ccd92cd28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                                |  2 ++
 .../testing/tests/package/sample_python_apscheduler.py    | 15 +++++++++++++++
 support/testing/tests/package/test_python_apscheduler.py  | 12 ++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8764035b2..32ed4acdc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2302,6 +2302,7 @@ F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
 F:	package/python-waitress/
+F:	support/testing/tests/package/test_python_apscheduler.py
 F:	support/testing/tests/package/test_python_crc.py
 F:	support/testing/tests/package/test_python_django.py
 F:	support/testing/tests/package/test_python_fastapi.py
@@ -2311,6 +2312,7 @@ F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
 F:	support/testing/tests/package/test_python_waitress.py
+F:	support/testing/tests/package/sample_python_apscheduler.py
 F:	support/testing/tests/package/sample_python_crc.py
 F:	support/testing/tests/package/sample_python_django.py
 F:	support/testing/tests/package/sample_python_fastapi.py
diff --git a/support/testing/tests/package/sample_python_apscheduler.py b/support/testing/tests/package/sample_python_apscheduler.py
new file mode 100644
index 0000000000..befe424c28
--- /dev/null
+++ b/support/testing/tests/package/sample_python_apscheduler.py
@@ -0,0 +1,15 @@
+from queue import Queue
+from apscheduler.schedulers.background import BackgroundScheduler
+
+queue = Queue()
+
+
+def work():
+    queue.put("Ping!")
+
+
+scheduler = BackgroundScheduler()
+scheduler.add_job(work, "interval", seconds=1)
+scheduler.start()
+result = queue.get(timeout=3)
+assert result == "Ping!"
diff --git a/support/testing/tests/package/test_python_apscheduler.py b/support/testing/tests/package/test_python_apscheduler.py
new file mode 100644
index 0000000000..19eb8c9b41
--- /dev/null
+++ b/support/testing/tests/package/test_python_apscheduler.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Apscheduler(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_APSCHEDULER=y
+        """
+    sample_scripts = ["tests/package/sample_python_apscheduler.py"]
+    timeout = 15
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
