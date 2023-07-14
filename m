Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15733C0015E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D2A40327;
	Fri, 14 Jul 2023 21:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D2A40327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id njYdnCkAIZyX; Fri, 14 Jul 2023 21:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BCD640A97;
	Fri, 14 Jul 2023 21:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BCD640A97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61F101BF983
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 491268226E
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491268226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbXSh8MqFeQV for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69F328224A
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F328224A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5702F870B8; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:25:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 305e74b2d89b982f7a73464f042f3e949a920930
X-Git-Newrev: 78c7f45946aed16ae40a0246aff2d14b905ce332
X-Patchwork-Hint: ignore
Message-Id: <20230714212619.5702F870B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_pigz.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=78c7f45946aed16ae40a0246aff2d14b905ce332
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_pigz.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0f306b61f1..3c8a6197da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1755,6 +1755,7 @@ F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
 F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_perftest.py
+F:	support/testing/tests/package/test_pigz.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_pigz.py b/support/testing/tests/package/test_pigz.py
new file mode 100644
index 0000000000..92a4170265
--- /dev/null
+++ b/support/testing/tests/package/test_pigz.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestPigz(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_PIGZ=y
+        """
+    compress_cmd = "pigz -p3"
+    decompress_cmd = "pigz -d -p3"
+    compressed_file_ext = ".gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
