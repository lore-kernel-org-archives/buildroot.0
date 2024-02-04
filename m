Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487B6C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6ECC402F2;
	Sun,  4 Feb 2024 21:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6ECC402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVcsXV_DhIow; Sun,  4 Feb 2024 21:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2B02405F6;
	Sun,  4 Feb 2024 21:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2B02405F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7E301BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C141760B51
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C141760B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bws_5LFvuNmO for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:19:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C00F860AD8
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00F860AD8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEE6186924; Sun,  4 Feb 2024 21:19:09 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:16:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17dac57e3ebfe8e2371100a632cca4fb11ed9bac
X-Git-Newrev: 393f5494187072533a1c69b82a26cf1f6d203a26
X-Patchwork-Hint: ignore
Message-Id: <20240204211909.AEE6186924@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestPythonPy3SciPy:
 increase rootfs size to 250M
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

commit: https://git.buildroot.net/buildroot/commit/?id=393f5494187072533a1c69b82a26cf1f6d203a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rootfs generated TestPythonPy3SciPy by doesn't fit anymore in 120M.

Increase the rootfs size to 250M and checking the amount of space
available on the file system.

  Filesystem                Size      Used Available Use% Mounted on
  /dev/root               232.3M    134.5M     85.3M  61% /

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5880448601

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_python_scipy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_scipy.py b/support/testing/tests/package/test_python_scipy.py
index 06297763c3..fb51f25d79 100644
--- a/support/testing/tests/package/test_python_scipy.py
+++ b/support/testing/tests/package/test_python_scipy.py
@@ -10,7 +10,7 @@ class TestPythonPy3SciPy(TestPythonPackageBase):
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SCIPY=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     sample_scripts = ["tests/package/sample_python_scipy.py"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
