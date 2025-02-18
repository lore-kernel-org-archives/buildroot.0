Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1DFC021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 12:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1A0610CA;
	Tue, 18 Feb 2025 12:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hk6X_k7RBI7N; Tue, 18 Feb 2025 12:09:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4723C610D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4723C610D4;
	Tue, 18 Feb 2025 12:09:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96848C8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 841884129C
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybPsenMaJbxv for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 12:09:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C2C5412A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C2C5412A7
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:09:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BB17877E4; Tue, 18 Feb 2025 12:09:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 10:50:27 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: ab5f8362bdc3a7cb60a08eb36c0725be0faa7fc7
X-Git-Newrev: be469ec0cc06cae4cdd76e7c5813f15604b6502a
X-Patchwork-Hint: ignore
Message-Id: <20250218120916.1BB17877E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] support/testing:
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

commit: https://git.buildroot.net/buildroot/commit/?id=be469ec0cc06cae4cdd76e7c5813f15604b6502a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Previously, these tests had the potential for timing out with the
default 5 second timeout value if initializing /dev/urandom took too
long.

Now the tests use a 10 second timeout value.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9bc3bbce3873667c229d8b16552f58045ee3c439)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
