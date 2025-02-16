Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1F9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E13970D2B;
	Fri, 28 Feb 2025 17:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySqYBPvSCg00; Fri, 28 Feb 2025 17:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1709D70D29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1709D70D29;
	Fri, 28 Feb 2025 17:19:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 127061DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC29245F1D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In8y6U_pGjBH for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6486F45BD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6486F45BD3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B3D07F9A1; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 12:13:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 41b08a779b46082f20a1bd54b1a6af47a52a421c
X-Git-Newrev: 9bc3bbce3873667c229d8b16552f58045ee3c439
X-Patchwork-Hint: ignore
Message-Id: <20250228163041.5B3D07F9A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing:
 test_python_{gnupg, spake2}: increase timeout value
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bc3bbce3873667c229d8b16552f58045ee3c439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Previously, these tests had the potential for timing out with the
default 5 second timeout value if initializing /dev/urandom took too
long.

Now the tests use a 10 second timeout value.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_python_gnupg.py  | 1 +
 support/testing/tests/package/test_python_spake2.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_python_gnupg.py b/support/testing/tests/package/test_python_gnupg.py
index 8861115130..8b438aed15 100644
--- a/support/testing/tests/package/test_python_gnupg.py
+++ b/support/testing/tests/package/test_python_gnupg.py
@@ -9,3 +9,4 @@ class TestPythonPy3GnuPG(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_GNUPG=y
         """
     sample_scripts = ["tests/package/sample_python_gnupg.py"]
+    timeout = 10  # /dev/urandom can take a while to become initialized
diff --git a/support/testing/tests/package/test_python_spake2.py b/support/testing/tests/package/test_python_spake2.py
index fb47a0802c..0629772bc3 100644
--- a/support/testing/tests/package/test_python_spake2.py
+++ b/support/testing/tests/package/test_python_spake2.py
@@ -9,3 +9,4 @@ class TestPythonPy3Spake2(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON_SPAKE2=y
         """
     sample_scripts = ["tests/package/sample_python_spake2.py"]
+    timeout = 10  # /dev/urandom can take a while to become initialized
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
