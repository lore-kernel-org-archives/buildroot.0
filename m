Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C701A4298B;
	Thu,  6 Jan 2022 21:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2Vh268-j7eJ; Thu,  6 Jan 2022 21:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3209842991;
	Thu,  6 Jan 2022 21:06:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B696F1BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4FA060D75
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:06:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNoXz9eMhisg for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:06:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3B1460A8B
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:06:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4FD627FE84; Thu,  6 Jan 2022 20:59:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 22:05:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d341ec035067120b456f669a826e26eb594c0237
X-Git-Newrev: 9d7abbfed89683a7f1bef089c9fb5ab32b967cb0
X-Patchwork-Hint: ignore
Message-Id: <20220106205958.4FD627FE84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add runtime test for
 python-iptables
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d7abbfed89683a7f1bef089c9fb5ab32b967cb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/sample_python_iptables.py |  1 +
 support/testing/tests/package/test_python_iptables.py   | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/support/testing/tests/package/sample_python_iptables.py b/support/testing/tests/package/sample_python_iptables.py
new file mode 100644
index 0000000000..a3091cab31
--- /dev/null
+++ b/support/testing/tests/package/sample_python_iptables.py
@@ -0,0 +1 @@
+import iptc
diff --git a/support/testing/tests/package/test_python_iptables.py b/support/testing/tests/package/test_python_iptables.py
new file mode 100644
index 0000000000..a2ba365fa7
--- /dev/null
+++ b/support/testing/tests/package/test_python_iptables.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Iptables(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_IPTABLES=y
+        """
+    sample_scripts = ["tests/package/sample_python_iptables.py"]
+    timeout = 30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
