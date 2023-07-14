Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C370EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1FA408AC;
	Fri, 14 Jul 2023 21:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1FA408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jATPZwFSMBJ; Fri, 14 Jul 2023 21:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B7A740B9D;
	Fri, 14 Jul 2023 21:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B7A740B9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87EF71BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FF25418FE
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FF25418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZRyREcRNBtn for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78CE7418FC
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78CE7418FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 633BC870E7; Fri, 14 Jul 2023 21:26:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:25:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78c7f45946aed16ae40a0246aff2d14b905ce332
X-Git-Newrev: 2fd06a0e57278891cd29f3497a5d23692716e253
X-Patchwork-Hint: ignore
Message-Id: <20230714212619.633BC870E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_zchunk.py: new runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fd06a0e57278891cd29f3497a5d23692716e253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_zchunk.py | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c8a6197da..405ccd645a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1769,6 +1769,7 @@ F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
+F:	support/testing/tests/package/test_zchunk.py
 F:	support/testing/tests/package/test_zstd.py
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/support/testing/tests/package/test_zchunk.py b/support/testing/tests/package/test_zchunk.py
new file mode 100644
index 0000000000..c250b748ef
--- /dev/null
+++ b/support/testing/tests/package/test_zchunk.py
@@ -0,0 +1,16 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestZchunk(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_ZCHUNK=y
+        BR2_PACKAGE_ZSTD=y
+        """
+    compress_cmd = "zck"
+
+    def check_integrity_test(self):
+        # Do nothing for the integrity test, because "zck" does not
+        # implement this feature.
+        pass
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
