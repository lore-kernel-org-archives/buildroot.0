Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C8FC001E0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 21:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2A441591;
	Thu, 13 Jul 2023 21:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2A441591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vo5H86QaYh1V; Thu, 13 Jul 2023 21:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C45040499;
	Thu, 13 Jul 2023 21:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C45040499
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C57D1BF383
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6636483D13
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 21:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6636483D13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vJO6AeQ5JvN6 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 21:33:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7617783EAC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7617783EAC
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 21:33:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9445413F87C;
 Thu, 13 Jul 2023 23:33:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 23:32:56 +0200
Message-ID: <20230713213256.105060-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689283986;
 bh=A79HkVWX700WGjjhVxMSzMkDzh9id3k9bLj2SDE28e0=;
 h=From:To:Cc:Subject:Date:From;
 b=MnqQoHUVRWXRZpoIrxhw+QgTlmZEn8lpmmmrMckUUvfTFKXGW/lXE0s6y3RnOeiXT
 xLbuVnzN+6Pv3RCkiSF0aBV/au2ys+8CmoSvjyCqNzt3zxnOYoyLuHRDK0r7rO2+ET
 q+ApdzAaD6fbkpkwUU4HE9CBgOMuUvhj1vX5/o5O+fBnd/M1sMjuj3i/NMV41Ohps+
 osszh+K31BE2bi8BaUPr6+wqumhkoSlbjQkZ6Y+VyZOx9rBfx008H9ohaJNQ8j4ALM
 Q1CjOBsmV56aBegIg7wcRCyPfrAR5yD1UnnQ+vrnvPAbzx66fuPri8eZeOfHCSCbNm
 YRqWutHi43OWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MnqQoHUV
Subject: [Buildroot] [PATCH 1/1]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_brotli.py | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 support/testing/tests/package/test_brotli.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..e8078e3e3c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1728,6 +1728,7 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
