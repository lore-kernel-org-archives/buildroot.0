Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DDEC0015E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D58ED8354D;
	Tue, 11 Jul 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58ED8354D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXj9CUh2LWPE; Tue, 11 Jul 2023 20:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E85283A75;
	Tue, 11 Jul 2023 20:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E85283A75
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76F601BF97D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E78981F2D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E78981F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_0mo351oMAY for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CA7981E9B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CA7981E9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8977E86E20; Tue, 11 Jul 2023 20:43:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 22:43:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1e2d0496b10dab4bd4c66535915af1c6ceb4691
X-Git-Newrev: 1fcc0dcb00f7beea417b29614b61cae413a20767
X-Patchwork-Hint: ignore
Message-Id: <20230711204359.8977E86E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_bzip2.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=1fcc0dcb00f7beea417b29614b61cae413a20767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_bzip2.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cf343f9bc..9b73b725b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1728,6 +1728,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
diff --git a/support/testing/tests/package/test_bzip2.py b/support/testing/tests/package/test_bzip2.py
new file mode 100644
index 0000000000..4b7ae8180f
--- /dev/null
+++ b/support/testing/tests/package/test_bzip2.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestBzip2(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BZIP2=y
+        """
+    compress_cmd = "bzip2"
+    decompress_cmd = "bunzip2"
+    compressed_file_ext = ".bz2"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
