Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736F7C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1C141591;
	Sun, 23 Jul 2023 10:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1C141591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ta61uSTqH5M2; Sun, 23 Jul 2023 10:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C463841521;
	Sun, 23 Jul 2023 10:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C463841521
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBB7E1BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B581940A4D
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B581940A4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rcd-pMXNRs3a for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8437540A7B
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8437540A7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73ADC8269F; Sun, 23 Jul 2023 10:30:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 12:28:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 260d7331bccf7f7b598d0b9e18e51a58faba0c9d
X-Git-Newrev: 3c0d12221e17e53659f3ca161865bd4feb57ad5b
X-Patchwork-Hint: ignore
Message-Id: <20230723103002.73ADC8269F@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_lzip.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c0d12221e17e53659f3ca161865bd4feb57ad5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_lzip.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5ac3dd734..a6644819bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1751,6 +1751,7 @@ F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
diff --git a/support/testing/tests/package/test_lzip.py b/support/testing/tests/package/test_lzip.py
new file mode 100644
index 0000000000..374e9e79e0
--- /dev/null
+++ b/support/testing/tests/package/test_lzip.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestLzip(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_LZIP=y
+        """
+    compress_cmd = "lzip"
+    decompress_cmd = "lzip -d"
+    compressed_file_ext = ".lz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
