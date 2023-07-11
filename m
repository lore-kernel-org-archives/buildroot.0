Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B2EC0015E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C2AB83A42;
	Tue, 11 Jul 2023 20:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C2AB83A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7I9PddOZlx1; Tue, 11 Jul 2023 20:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8576F8354D;
	Tue, 11 Jul 2023 20:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8576F8354D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 725FB1BF97C
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 593B641525
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593B641525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fclxg2JuMpb for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 933ED41524
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 933ED41524
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E9B386E1F; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 22:43:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf132a137bb2a6b2ec5af38ff901795f16653cb8
X-Git-Newrev: a1e2d0496b10dab4bd4c66535915af1c6ceb4691
X-Patchwork-Hint: ignore
Message-Id: <20230711204359.7E9B386E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_gzip.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1e2d0496b10dab4bd4c66535915af1c6ceb4691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_gzip.py | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 57c25c4cfd..2cf343f9bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1733,6 +1733,7 @@ F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_gnupg2.py
+F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
diff --git a/support/testing/tests/package/test_gzip.py b/support/testing/tests/package/test_gzip.py
new file mode 100644
index 0000000000..1d5f374853
--- /dev/null
+++ b/support/testing/tests/package/test_gzip.py
@@ -0,0 +1,13 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestGzip(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_GZIP=y
+        """
+    compress_cmd = "gzip"
+    decompress_cmd = "gunzip"
+    compressed_file_ext = ".gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
