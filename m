Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBD3EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB1D61424;
	Fri, 14 Jul 2023 10:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB1D61424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rEvHTH248wU; Fri, 14 Jul 2023 10:14:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9611361425;
	Fri, 14 Jul 2023 10:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9611361425
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0E531BF983
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A2256141A
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2256141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhaGVzgTAP-S for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC98660A9F
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC98660A9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3FFA8706D; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 11:59:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c46df9de21e718a9ed6a2df2bb945c386695d3bf
X-Git-Newrev: d3142f032a527d2118818890b5afb94c7decc4d7
X-Patchwork-Hint: ignore
Message-Id: <20230714101440.A3FFA8706D@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_brotli.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3142f032a527d2118818890b5afb94c7decc4d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_brotli.py | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index abea0bbb86..202a8ba501 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1730,6 +1730,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
+F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
diff --git a/support/testing/tests/package/test_brotli.py b/support/testing/tests/package/test_brotli.py
new file mode 100644
index 0000000000..779b956cb3
--- /dev/null
+++ b/support/testing/tests/package/test_brotli.py
@@ -0,0 +1,13 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestBrotli(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_BROTLI=y
+        """
+    compress_cmd = "brotli"
+    decompress_cmd = "brotli -d"
+    compressed_file_ext = ".br"
+    timeout = 60
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
