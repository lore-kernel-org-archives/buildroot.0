Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD5C3DA4A
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B1AA40B09;
	Tue, 20 Aug 2024 20:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkXZafx5rp8O; Tue, 20 Aug 2024 20:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876D740BC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 876D740BC2;
	Tue, 20 Aug 2024 20:07:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42FA51BF97A
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D95D40585
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2u0mtnCdBTw for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D3F9403A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D3F9403A6
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 270EF86194; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 21:45:36 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 2432073c2367aade005a097230bac1b013d43397
X-Git-Newrev: 663b0c49f3564cead9a31caf2eef9740f258c6d8
X-Patchwork-Hint: ignore
Message-Id: <20240820200712.270EF86194@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] support/testing: add
 python-msgpack runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=663b0c49f3564cead9a31caf2eef9740f258c6d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit d429d5d399acc9921a9a86f4ae3d589d599605e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/sample_python_msgpack.py |  5 +++++
 support/testing/tests/package/test_python_msgpack.py   | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/support/testing/tests/package/sample_python_msgpack.py b/support/testing/tests/package/sample_python_msgpack.py
new file mode 100644
index 0000000000..1940f70821
--- /dev/null
+++ b/support/testing/tests/package/sample_python_msgpack.py
@@ -0,0 +1,5 @@
+import msgpack
+
+packaed = msgpack.packb([1, 2, 3], use_bin_type=True)
+
+assert msgpack.unpackb(packaed, raw=False) == [1, 2, 3]
diff --git a/support/testing/tests/package/test_python_msgpack.py b/support/testing/tests/package/test_python_msgpack.py
new file mode 100644
index 0000000000..e5876e400d
--- /dev/null
+++ b/support/testing/tests/package/test_python_msgpack.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3MsgPack(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_MSGPACK=y
+        """
+    sample_scripts = ["tests/package/sample_python_msgpack.py"]
+    timeout = 40
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
