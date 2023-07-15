Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D3EC0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 08:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 980754023F;
	Sat, 15 Jul 2023 08:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980754023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5M_9QiIsqoL6; Sat, 15 Jul 2023 08:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD93C400CB;
	Sat, 15 Jul 2023 08:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD93C400CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC31F1BF5A0
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 08:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B233C60A99
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 08:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B233C60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dg5q9PILfoOS for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 08:51:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB3B60A68
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BB3B60A68
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 08:51:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 02C5C13F8AA;
 Sat, 15 Jul 2023 10:51:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 10:50:58 +0200
Message-ID: <20230715085058.103311-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689411067;
 bh=lT9/Y/zMJPIAx2GyKXTkCyVEAU07tAF5HLK54QyuWpE=;
 h=From:To:Cc:Subject:Date:From;
 b=m0PlPUABnni4BC1oct0aBAUJ/PL4pveePbU+swEOpkAGrWX0j30tk7mK2hunooL7i
 E4s7jNtLBBgtZPZnL/XN3G/u7+wFnOP39vGfb4KyZcVrF/leIAmXcwQpjRICn9mktl
 QUH8bxzOO7fU0NZ96uLuDwyEFNsT8xkgmXNBIOhjIhEktht5gGmakfTLDmE/WoruLl
 HBeLzIy2s+IQWoI1Ea7LOC76wNETgd0k4GHKxBML+vl5JmaDOc808lrH7dMFMo3y/5
 nYihFd1MeNAyLlYBgf3eAXnwITxL0vdyQAxd5dJFTmZ7JfPug62188DcIg7fp3WhXx
 t8VhrEUe7FjZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m0PlPUAB
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_lzip.py:
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_lzip.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_lzip.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 405ccd645a..d5f0888a46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1745,6 +1745,7 @@ F:	support/testing/tests/package/test_iperf3.py
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
