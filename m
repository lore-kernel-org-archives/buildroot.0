Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCE7D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5D440A04;
	Wed,  7 Jan 2026 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZbYy-ghKVsQ8; Wed,  7 Jan 2026 17:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257E140A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808033;
	bh=NO47LAJzKtzT+ybn13XvcgYiElkpbITFk7ypf+CtyAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=epzpuuNhw1YbScp976AFQmwlTbu3vrE5fDKUl2VwDtGlHWLxiRORGpZ8HlAhVcK8z
	 J1eARzBrRMX7J0bawQcvZOQe0q4jp/SnJ+EyOio/LAGEP0yeKdEo80jIbRBx1KJ7Va
	 9RmEZyuBmU2kjpkT+mbs34qxslxvObQz5X2eXdrcAb9/oY+mOZ1kuWO7EofXg4j3ii
	 BbkOu5yRFb4ZJKwijR8huLZQq8feJJUYlKC4uGi/h2X5Wm4LeNlnJRQlHN0rn7Rl7z
	 moduFECie4rUWTM8rcporBNh67dLbebDDwg2BdvJe1DvhxDGe2UePeou7mTa1NDmQu
	 m3RNS8xPlr4iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257E140A06;
	Wed,  7 Jan 2026 17:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A2C9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3BA540871
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCZX_nnSDh8J for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC3AA40240
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC3AA40240
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB1D7883AA; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:47 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2060800874dd945d5d88f2c194a9ec7e7d676c1e
X-Git-Newrev: e285f646b14160e06f728501c29776924a5a2e17
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.DB1D7883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing: add
 libiio python bindings runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=e285f646b14160e06f728501c29776924a5a2e17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 61966c213322b192a62cc19200902934f9f432d7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../testing/tests/package/sample_libiio_bindings_python.py  |  3 +++
 .../testing/tests/package/test_libiio_bindings_python.py    | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/support/testing/tests/package/sample_libiio_bindings_python.py b/support/testing/tests/package/sample_libiio_bindings_python.py
new file mode 100644
index 0000000000..74452192c2
--- /dev/null
+++ b/support/testing/tests/package/sample_libiio_bindings_python.py
@@ -0,0 +1,3 @@
+import iio
+
+assert len(iio.scan_contexts()) == 1
diff --git a/support/testing/tests/package/test_libiio_bindings_python.py b/support/testing/tests/package/test_libiio_bindings_python.py
new file mode 100644
index 0000000000..e8cf5c3d13
--- /dev/null
+++ b/support/testing/tests/package/test_libiio_bindings_python.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestLibiioBindingsPython(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_LIBIIO=y
+        BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON=y
+        """
+    sample_scripts = ["tests/package/sample_libiio_bindings_python.py"]
+    timeout = 10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
