Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085A7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F79A84337;
	Sun, 29 May 2022 20:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2P7NE_Pn_b9l; Sun, 29 May 2022 20:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A821A84330;
	Sun, 29 May 2022 20:35:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C489A1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD8B884330
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Tbp_ZdAWrEb for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:35:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 977218432D
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:35:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F0C10866F5; Sun, 29 May 2022 20:23:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 22:29:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fba63210876e33f81a2854558511edb03619b8fb
X-Git-Newrev: 3613c3cb331930bbb82cbfb27050f8e03ea288a5
X-Patchwork-Hint: ignore
Message-Id: <20220529202340.F0C10866F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_oci: update to
 _OCI_CMD option
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

commit: https://git.buildroot.net/buildroot/commit/?id=3613c3cb331930bbb82cbfb27050f8e03ea288a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS option has been
replaced by BR2_TARGET_ROOTFS_OCI_CMD in commit [1].

Since BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS contains
only one item, we can safely replace by
BR2_TARGET_ROOTFS_OCI_CMD in the defconfig fragment
used by the test_oci test case.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2491321058

[1] 08d65d81d88418b0cd7edd3bd2227faa58d022f0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin@orange.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_oci.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 347332f30d..0ecf58f626 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -20,7 +20,7 @@ class TestOci(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
         BR2_TARGET_ROOTFS_OCI=y
         BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="df"
-        BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="-h"
+        BR2_TARGET_ROOTFS_OCI_CMD="-h"
         BR2_TARGET_ROOTFS_OCI_ARCHIVE=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
