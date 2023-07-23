Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D7C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E54C400CC;
	Sun, 23 Jul 2023 10:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E54C400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6V_Vaql10-A; Sun, 23 Jul 2023 10:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27A43400D5;
	Sun, 23 Jul 2023 10:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A43400D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83AA91BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D3FD4031C
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D3FD4031C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDBNvljCwXGq for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:49:31 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 382B5400B9
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 382B5400B9
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0DB2513F87C;
 Sun, 23 Jul 2023 12:49:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 12:49:20 +0200
Message-ID: <20230723104920.346025-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690109368;
 bh=nSFh6j3zyy5BZ0EMaNkPEJDS1o5eNt3alpmsIgHYYU0=;
 h=From:To:Cc:Subject:Date:From;
 b=QeZm9fbjbWcTlOLbfYBc+htbupYVGA1BCH9poBdbR2IDDJtFxtL73WlgZKbTlKTiG
 bl7OiQvx3q+oke3htygOQT8kEyL9ruQFk7daRnORY7CEkTUd14+l6wE3fTdoc3AXMg
 UL2L56xO4rsGzfXLEX36EQ/SS4CTr0jO9WVMg86hkicjpOPDCIFXONu6WSHt1ng+w5
 spPIZdiaRiMZZsZtQHNOLXgbaiKgL/O1DqnuVCNMJlX1O1vY0Hrco5WtNtOJCWFRN7
 sx3HYkeg+rnBzH/eJOkQOJ2T3uMevHCpGjHpAlNAU/WhhWNWQ0NgLiMLZXp40NiA2W
 uSG5rjTjia0hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QeZm9fbj
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_lrzip.py: new runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_lrzip.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_lrzip.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a6644819bd..1b474c541f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1751,6 +1751,7 @@ F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
diff --git a/support/testing/tests/package/test_lrzip.py b/support/testing/tests/package/test_lrzip.py
new file mode 100644
index 0000000000..31559d4e87
--- /dev/null
+++ b/support/testing/tests/package/test_lrzip.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestLrzip(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_LRZIP=y
+        """
+    compress_cmd = "lrzip"
+    decompress_cmd = "lrunzip"
+    compressed_file_ext = ".lrz"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
