Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12C4C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 20:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683B281B7B;
	Fri, 29 Dec 2023 20:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 683B281B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONjhLoo9UNXH; Fri, 29 Dec 2023 20:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3CD481AA7;
	Fri, 29 Dec 2023 20:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CD481AA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 843D21BF317
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D1A941E2E
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D1A941E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP1bZxizQAmd for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 20:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8859941E2D
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 20:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8859941E2D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 743838377B; Fri, 29 Dec 2023 20:49:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 21:49:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1
X-Git-Newrev: 5cd74d6a4e347ff3807d49b6b6b8817009b26a17
X-Patchwork-Hint: ignore
Message-Id: <20231229204951.743838377B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_python_ml_dtypes:
 remove BR2_PACKAGE_PYTHON3_ZLIB
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cd74d6a4e347ff3807d49b6b6b8817009b26a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test_python_ml_dtypes.py enabled BR2_PACKAGE_PYTHON3_ZLIB=y in its
configuration to workaround the fact that the toolchain used to
testing was tainted with zlib.

The commit 7e0e6e3
"toolchain/toolchain-external/toolchain-external-bootlin: update to
2023.11-1" updated the toolchains which are no longer tainted with
zlib.

The workaround is no longer needed and this commit removes this
config, for consistency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_python_ml_dtypes.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_ml_dtypes.py b/support/testing/tests/package/test_python_ml_dtypes.py
index 8d2369576b..8367107247 100644
--- a/support/testing/tests/package/test_python_ml_dtypes.py
+++ b/support/testing/tests/package/test_python_ml_dtypes.py
@@ -4,16 +4,9 @@ from tests.package.test_python import TestPythonPackageBase
 class TestPythonPy3MlDtypes(TestPythonPackageBase):
     __test__ = True
 
-    # Note: BR2_PACKAGE_PYTHON3_ZLIB=y is needed as a runtime
-    # dependency because the Bootlin toolchain used for this test is
-    # tainted with zlib (and gets detected by python3/numpy).
-    # See commit 8ce33fed "package/gdb: gdbserver does not need zlib".
-    # This config entry can be removed as soon as the toolchain is
-    # updated without zlib in its sysroot.
     config = TestPythonPackageBase.config + \
         """
         BR2_PACKAGE_PYTHON3=y
-        BR2_PACKAGE_PYTHON3_ZLIB=y
         BR2_PACKAGE_PYTHON_ML_DTYPES=y
         """
     sample_scripts = ["tests/package/sample_python_ml_dtypes.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
