Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9077C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AC7C83FA3;
	Mon,  6 Jun 2022 10:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TboHX3xglxI; Mon,  6 Jun 2022 10:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9460983E5D;
	Mon,  6 Jun 2022 10:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E90341BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E61B441753
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBwECCkvpxse for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:45:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D71E5416D5
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:45:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DAC8486CE2; Mon,  6 Jun 2022 10:33:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:44:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 28df426f04865255ea497424228f3544c81bb6ce
X-Git-Newrev: d1da3b92b81071c644c2bc60fc9cf62786391c44
X-Patchwork-Hint: ignore
Message-Id: <20220606103315.DAC8486CE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] support/testing:
 test_oci: update to _OCI_CMD option
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1da3b92b81071c644c2bc60fc9cf62786391c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 3613c3cb331930bbb82cbfb27050f8e03ea288a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
