Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438FFC46CD3
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 14:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE9841822;
	Fri, 29 Dec 2023 14:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE9841822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlf1fvAHmTGR; Fri, 29 Dec 2023 14:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13CC141820;
	Fri, 29 Dec 2023 14:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CC141820
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFFD1BF83B
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 14:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF8341820
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 14:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF8341820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mijA5VFWZWJN for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 14:50:36 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CF4A41817
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 14:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CF4A41817
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5AB4013F88D;
 Fri, 29 Dec 2023 15:50:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 15:50:25 +0100
Message-ID: <20231229145025.237058-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703861432;
 bh=a1/JX70UcuaRFJ/CdgeuZTIS8xaG6LCsTnt3zoNsX5c=;
 h=From:To:Cc:Subject:Date:From;
 b=CWzs/n45cdwbzzCJXYVb0rId8WeUiSTRAGH287dzAjzC8t+locm3pIC99CUuskOEQ
 Z4nYyA9IotgTMCexWJvNqelzWqvF0zbvFe6zEuYzT6BWzVv3LgG+8OERH+dLHyp7Ic
 LFoSZBFkOtgzfOcHGATIjQUiXk5NlIW75hbEfvfVj9kcVCbf7M640E0I/FLPLZwFJX
 Prann2pZ8AYINMthkup/u4MQOJK2/RMN9PPwebIfNu0EOTzX45GX/fnNhxvwzZLxzE
 9n7IBGw9msxqFR3vACjFdr8O2+sLOnvMxk31TeqrHDrtXgKThBeLPQi6vCWVEDoNTs
 a3EDqJ1XdDXew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CWzs/n45
Subject: [Buildroot] [PATCH 1/1] support/testing: test_python_ml_dtypes:
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Patch tested on branch master at commit 7e0e6e3 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_python_ml_dtypes
    ...
    OK
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
