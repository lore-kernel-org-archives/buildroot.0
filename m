Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16C1EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A53A7416E6;
	Wed, 12 Jul 2023 21:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53A7416E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhzlc3olrwI5; Wed, 12 Jul 2023 21:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E10416C2;
	Wed, 12 Jul 2023 21:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8E10416C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12AD01BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D93541C61
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D93541C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lUp6zuxD_Tyz for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EA2C41B6F
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA2C41B6F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E324286F3A; Wed, 12 Jul 2023 21:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2ba654925585f1579c1bd65185c04eef4e4cc74
X-Git-Newrev: dd4ba068b33f6631c523898faff7d7819cc7312f
X-Patchwork-Hint: ignore
Message-Id: <20230712212318.E324286F3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3Botocore:
 increase ext2 size to 250M
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd4ba068b33f6631c523898faff7d7819cc7312f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are going to update the toolchain used by the Buildroot testsuite
and this update will increase the size of the rootfs over 120M.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_botocore.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_botocore.py b/support/testing/tests/package/test_python_botocore.py
index f123993c08..0f3dc93a37 100644
--- a/support/testing/tests/package/test_python_botocore.py
+++ b/support/testing/tests/package/test_python_botocore.py
@@ -9,7 +9,7 @@ class TestPythonPy3Botocore(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_BOTOCORE=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_botocore.py"]
     timeout = 30
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
