Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA4BEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 20:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1279583A7F;
	Tue, 11 Jul 2023 20:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1279583A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6e94DkGw20ca; Tue, 11 Jul 2023 20:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC1583A84;
	Tue, 11 Jul 2023 20:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC1583A84
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF4791BF97D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95B45417C8
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B45417C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z647oJmA2XIa for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72F9417C0
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72F9417C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94E9886E21; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 22:43:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fcc0dcb00f7beea417b29614b61cae413a20767
X-Git-Newrev: 665303586a1eddd08f44bfce2239a68e0c593810
X-Patchwork-Hint: ignore
Message-Id: <20230711204359.94E9886E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_xz.py:
 new runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=665303586a1eddd08f44bfce2239a68e0c593810
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_xz.py | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b73b725b6..0918e9f721 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1759,6 +1759,7 @@ F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_stress_ng.py
+F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
 
diff --git a/support/testing/tests/package/test_xz.py b/support/testing/tests/package/test_xz.py
new file mode 100644
index 0000000000..7776c1608f
--- /dev/null
+++ b/support/testing/tests/package/test_xz.py
@@ -0,0 +1,10 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestXz(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_XZ=y
+        """
+    compress_cmd = "xz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
