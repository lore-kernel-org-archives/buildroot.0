Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BB5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9692D611AF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9692D611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C37180DF7;
	Tue,  9 Nov 2021 08:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NEVlVSqHEfc; Tue,  9 Nov 2021 08:20:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E7680DE9;
	Tue,  9 Nov 2021 08:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F00021BF9A4
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF97580DE6
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kooU7Y1J-aS for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:20:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B79C80DAC
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D783D8B75C; Tue,  9 Nov 2021 08:16:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 08:58:59 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8c549af8a81c05c191e2d5dd266178412556f897
X-Git-Newrev: 08b0f2473a535b28d5713afa3af78a07f4ca95c6
X-Patchwork-Hint: ignore
Message-Id: <20211109081629.D783D8B75C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] support/testing:
 test_jffs2.py: update logical eraseblock size for qemu >= 2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=08b0f2473a535b28d5713afa3af78a07f4ca95c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

The test_jffs2 test fail for the same reason as test_ubi test with qemu >= 2.9
due to a qemu 2.8 bug. See commit d8447c38f53f98e1df4a209e9f70e54f8b60f36e.

Divide the erase block size by two.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590514

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d2f92512f699cb34f6373c43e8da7f5907e2abd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/fs/test_jffs2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
index f595e408d5..1806bd7e3c 100644
--- a/support/testing/tests/fs/test_jffs2.py
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -16,7 +16,7 @@ class TestJffs2(infra.basetest.BRTest):
         """
         BR2_TARGET_ROOTFS_JFFS2=y
         BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
-        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x80000
+        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x40000
         BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
         BR2_TARGET_ROOTFS_JFFS2_PAD=y
         BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
