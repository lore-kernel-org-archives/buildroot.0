Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83B1C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:31:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2216109F
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 21:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B2216109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F0F407AC;
	Fri,  5 Nov 2021 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJXHWN3ydr0M; Fri,  5 Nov 2021 21:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91BF0407A7;
	Fri,  5 Nov 2021 21:31:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 956181BF5B5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 914CC826E7
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 21:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEqLTIxAGz4l for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 21:31:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E8D826F5
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 21:31:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 863D98B36B; Fri,  5 Nov 2021 21:27:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 22:30:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f1bce7b73204a7abb85aa629e8704e08cbd0ce9
X-Git-Newrev: d2f92512f699cb34f6373c43e8da7f5907e2abd0
X-Patchwork-Hint: ignore
Message-Id: <20211105212743.863D98B36B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_jffs2.py: update
 logical eraseblock size for qemu >= 2.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2f92512f699cb34f6373c43e8da7f5907e2abd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test_jffs2 test fail for the same reason as test_ubi test with qemu >= 2.9
due to a qemu 2.8 bug. See commit d8447c38f53f98e1df4a209e9f70e54f8b60f36e.

Divide the erase block size by two.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1687590514

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
