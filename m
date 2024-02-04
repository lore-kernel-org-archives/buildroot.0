Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769FEC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 09:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5EF140193;
	Sun,  4 Feb 2024 09:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5EF140193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XDRNVrM-1Uf; Sun,  4 Feb 2024 09:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A33B2405E3;
	Sun,  4 Feb 2024 09:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A33B2405E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7092C1BF860
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 09:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 562F785380
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 09:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 562F785380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrM9OI5zRxvu for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 09:32:02 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 151568537F
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 09:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151568537F
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6C85113F89A;
 Sun,  4 Feb 2024 10:31:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 10:31:48 +0100
Message-ID: <20240204093148.11282-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707039118;
 bh=RPrK+Rt5QKh+IqFXgVroY8dJb+skgwRVafvPAlV6QM4=;
 h=From:To:Cc:Subject:Date:From;
 b=jUeladGgtUgvQ7Nh1kqIV/kS5uaLlzAId50FD2DUTf0L6JzsSIOzzWnlb/W+1byOa
 ul0VJ7rdSxaE4HpvPQkD7om1T0j1e1p0U3uuun5LqoWnil4bepoXyY/cqUQXDkkmNR
 JE/Jt2QyRZhragWe4NwSKpkYfS0DlhdA8dPXLCuqRYcmOnd5w9HZBWlymbx6Je38Fb
 BDW6JSlt/0JXbsJkCHquqyluUii+eOBL0NdeeSggRC/k4wPiZutrFFnfl5VAaepE/h
 DIU7fcQnYl/RiFhGKBW04Ay2S3LbpZ5zK9mtazx3osxPwu4Sg/ixLRJnjYCW3TpG4v
 VryFSff+Wgxgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jUeladGg
Subject: [Buildroot] [PATCH 1/1] support/testing: micropython: add
 micropython-lib test
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

Commit 8f403f0 "package/micropython-lib: merge with, and install
as part of micropython" brought micropython library within the
package.

This commit improves the micropython runtime test by enabling the
micropython-lib and by also adding a runtime test using one of its
module.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_micropython.py | 13 ++++++++++++-
 .../test_micropython/rootfs-overlay/root/zcat.py  | 15 +++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100755 support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py

diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
index 0ecd4790bd..371deb2978 100644
--- a/support/testing/tests/package/test_micropython.py
+++ b/support/testing/tests/package/test_micropython.py
@@ -7,6 +7,7 @@ class TestMicroPython(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         f"""
         BR2_PACKAGE_MICROPYTHON=y
+        BR2_PACKAGE_MICROPYTHON_LIB=y
         BR2_ROOTFS_OVERLAY="{infra.filepath("tests/package/test_micropython/rootfs-overlay")}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -64,5 +65,15 @@ class TestMicroPython(infra.basetest.BRTest):
         output = self.run_upy_code(py_code)
         self.assertEqual(output[0], expected_output)
 
-        # Finally, Check a small script can execute.
+        # Check a small script can execute.
         self.assertRunOk("/root/mandel.py", timeout=10)
+
+        # Check we can use a micropython-lib module.
+        msg = "Hello Buildroot!"
+        filename = "file.txt"
+        gz_filename = f"{filename}.gz"
+        self.assertRunOk(f"echo '{msg}' > {filename}")
+        self.assertRunOk(f"gzip {filename}")
+        out, ret = self.emulator.run(f"/root/zcat.py {gz_filename}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
diff --git a/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py b/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
new file mode 100755
index 0000000000..3b8c60bdd1
--- /dev/null
+++ b/support/testing/tests/package/test_micropython/rootfs-overlay/root/zcat.py
@@ -0,0 +1,15 @@
+#! /usr/bin/env micropython
+
+import gzip
+import sys
+
+
+def main(fname):
+    with open(fname, "rb") as f:
+        with gzip.GzipFile(fileobj=f) as g:
+            s = g.read()
+            print(s.decode("UTF-8"), end="")
+
+
+if __name__ == "__main__":
+    main(sys.argv[1])
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
