Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDA3D6B6DF
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 114CD40838;
	Thu, 31 Oct 2024 12:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4Osvf6K_p86; Thu, 31 Oct 2024 12:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C20A4088F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C20A4088F;
	Thu, 31 Oct 2024 12:48:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B355C5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0FE2401F1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsYZNGMY5S6Z for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 803BE400BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 803BE400BB
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:48:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C54584ED8; Thu, 31 Oct 2024 12:48:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 13:47:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12649662b9d7359fe7c98480c9d9ec6c5369b3d4
X-Git-Newrev: 334062f4f1bb8073b41b7ca0bb4732cb6ff4a440
X-Patchwork-Hint: ignore
Message-Id: <20241031124801.6C54584ED8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3SciPy: needs
 a toolchain with Fortran support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=334062f4f1bb8073b41b7ca0bb4732cb6ff4a440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the Bootlin bleeding-edge toolchain since stable toolchain no
longer provide Fortran support since 2024.05-1 release [1].

The Fortran support is now optional in toolchain-builder tool and
only enabled for bleeding-edge toolchains [2].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d3ad58dce9cafccb22d782e56677e060d5eb5a52#428f572a75eed97c0a70da290028c0efb4224a79_545_536
[2] https://gitlab.com/buildroot.org/toolchains-builder/-/commit/a178b246259d92e23679b777fa3d6c166cc424d5

Fixes: (partially)
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992675

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_scipy.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index fb51f25d79..608a3f6e87 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -5,8 +5,15 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3SciPy(TestPythonPackageBase):
     __test__ = True
-    config = TestPythonPackageBase.config + \
+    # Need to use a different toolchain than the default due to
+    # missing Fortran support (required by python-scipy) in Bootlin
+    # stable toolchains 2024.05
+    config = \
         """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_BLEEDING_EDGE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
