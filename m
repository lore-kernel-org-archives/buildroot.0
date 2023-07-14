Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7868AEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06CC6141A;
	Fri, 14 Jul 2023 10:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06CC6141A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zL9C5E_QFypY; Fri, 14 Jul 2023 10:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1891E60A9F;
	Fri, 14 Jul 2023 10:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1891E60A9F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2571BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8385D417C4
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8385D417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIMc_dRjk-p5 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C63DA4173B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C63DA4173B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B22A98706E; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 11:59:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3142f032a527d2118818890b5afb94c7decc4d7
X-Git-Newrev: 0a6af1116362790639494746cc3da336ff018144
X-Patchwork-Hint: ignore
Message-Id: <20230714101440.B22A98706E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_lz4.py:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a6af1116362790639494746cc3da336ff018144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_lz4.py | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 202a8ba501..f7e7c02590 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1745,6 +1745,7 @@ F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lsof.py
+F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_lz4.py b/support/testing/tests/package/test_lz4.py
new file mode 100644
index 0000000000..988200250a
--- /dev/null
+++ b/support/testing/tests/package/test_lz4.py
@@ -0,0 +1,11 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestLz4(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_LZ4=y
+        BR2_PACKAGE_LZ4_PROGS=y
+        """
+    compress_cmd = "lz4"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
