Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F0EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 16:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECE1861486;
	Fri, 14 Jul 2023 16:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE1861486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrrZQ7_g9v3l; Fri, 14 Jul 2023 16:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17BB16148E;
	Fri, 14 Jul 2023 16:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17BB16148E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF991BF369
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278FB41863
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 16:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 278FB41863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nGXpRT2ppq8y for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 16:42:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10CE741858
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10CE741858
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 16:42:13 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D811B13F854;
 Fri, 14 Jul 2023 18:42:09 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 18:42:03 +0200
Message-ID: <20230714164203.9881-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689352931;
 bh=ftnvgEBluKw1HtmL0MylsnwTuuNbK5OWBOiLoZg/b2Y=;
 h=From:To:Cc:Subject:Date:From;
 b=Qo4sk3sdjxx7cP5IxspE7BtGXCvhN9xnH7tD+EiWX+tNQqAfZ3uMLS7BFqaYvmcJD
 9AtHHI8fWm/Z1QfKqQoC7QdxWq5L0hIgDa0wJUW1hjnTFMDokf1Izn/4K1A1NkpcrE
 CDmTBN4dSE771Fwl6JD37C3GW2udplgGvI9rzY4OSUgZIr+R0hfBgBj8+FYSUxAmPT
 g30dlyJSYhZPjtT2P+oQXC/yPwuDjqBgo7xp829O2v3NqBgVaamDtzCVPwfGL8ykZ/
 9JaOAltIIuFAPoX7z1zQ5aj2S7ryXNrnZp/rQwd8rxAcdPYFXiEG4wZEk7mAEg53UZ
 K/Mf+J2+2FSWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qo4sk3sd
Subject: [Buildroot] [PATCH 1/1] support/testing/tests/package/test_lzop.py:
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
 support/testing/tests/package/test_lzop.py | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 support/testing/tests/package/test_lzop.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1021e5c6ba..f8e01f2ae7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1747,6 +1747,7 @@ F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
+F:	support/testing/tests/package/test_lzop.py
 F:	support/testing/tests/package/test_mtools.py
 F:	support/testing/tests/package/test_ncdu.py
 F:	support/testing/tests/package/test_octave.py
diff --git a/support/testing/tests/package/test_lzop.py b/support/testing/tests/package/test_lzop.py
new file mode 100644
index 0000000000..8d20ece3d6
--- /dev/null
+++ b/support/testing/tests/package/test_lzop.py
@@ -0,0 +1,12 @@
+from tests.package.test_compressor_base import TestCompressorBase
+
+
+class TestLzop(TestCompressorBase):
+    __test__ = True
+    config = TestCompressorBase.config + \
+        """
+        BR2_PACKAGE_LZOP=y
+        """
+    compress_cmd = "lzop"
+    decompress_cmd = "lzop -d"
+    compressed_file_ext = ".lzo"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
