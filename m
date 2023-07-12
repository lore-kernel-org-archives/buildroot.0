Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98659EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30486416BF;
	Wed, 12 Jul 2023 21:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30486416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hbZpqFikGU-o; Wed, 12 Jul 2023 21:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89C43416C6;
	Wed, 12 Jul 2023 21:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89C43416C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D63EB1BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B03A0416C2
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B03A0416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIoyQ0skxj-v for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED65840AF5
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED65840AF5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBFBF86F39; Wed, 12 Jul 2023 21:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a00d82f9e7a3d94bf54aadda7fc81d2599be226c
X-Git-Newrev: c2ba654925585f1579c1bd65185c04eef4e4cc74
X-Patchwork-Hint: ignore
Message-Id: <20230712212318.DBFBF86F39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3Boto3:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2ba654925585f1579c1bd65185c04eef4e4cc74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are going to update the toolchain used by the Buildroot testsuite
and this update will increase the size of the rootfs over 120M.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_boto3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
index 126ddae63a..02a1f69d40 100644
--- a/support/testing/tests/package/test_python_boto3.py
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -9,7 +9,7 @@ class TestPythonPy3Boto3(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_BOTO3=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_boto3.py"]
     timeout = 10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
