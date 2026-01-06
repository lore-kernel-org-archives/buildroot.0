Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED37D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5165A40B92;
	Wed,  7 Jan 2026 17:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XqtnMB8l_u3; Wed,  7 Jan 2026 17:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5903B40B7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808091;
	bh=rfhVRV5HzffU6xRNFTi4oGeS33S6JdCr/0KnkjxyGc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ii3aVxpmsqm5mCNfBm/IFFzdf5KLYwDsLcpkpE99goy4cWHSkAhYmJs0OnstcB/2Y
	 k8NxkzdE3UAgMngS3ssL6zPdbNlqkfB6S0LWvLuQfwOLTw2B+KsmXv5fF0JwValS9w
	 d6P3OAun9C7fuGN3b1GZkOoYhwAuiZjHSV3TddxyyDaBQ+BO+t56H60+HSwFC3CO+R
	 OoJo9wvK5to2qEkWh8c+SeRjH4QHVuk/GV+H11x7eyEKdDvH4B4Of3UAjk6swoXUzK
	 oPJVHcGZl5p9cdMA36xVRN+WbtKyUDGEzGK+Hhi9HsY02Km7LE93td+ryUW62NZB8b
	 YmiCdE0BfGMpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5903B40B7F;
	Wed,  7 Jan 2026 17:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1093B9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 828B380BD8
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io4-__GcQVWa for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33BE880BA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BE880BA4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32D8188367; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6974ee98f508bcfa96fbb936894ee826c55f0a4d
X-Git-Newrev: 16d841d71134da68383c2e807680ab8b2e4d34a4
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.32D8188367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 ddrescue: use dmsetup from lvm2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16d841d71134da68383c2e807680ab8b2e4d34a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The ddresue runtime test is using the `dmsetup` command provided by the
dmraid package. This package is outdated and will be removed. This
command is also provided by the lvm2 package, which is still maintained.

This commit replaces the dmraid package by lvm2 in the test config.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4fc6e8637bd771478f132e1e5e23c6d0c483331e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_ddrescue.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 989abc8f01..042431eb7b 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -9,7 +9,7 @@ class TestDdrescue(infra.basetest.BRTest):
     # - A kernel config fragment enables loop blk dev and device
     #   mapper dm-dust, which are used to simulate a failing storage
     #   block device.
-    # - dmraid user space package is needed to configure dm-dust
+    # - lvm2 user space package is needed to configure dm-dust with dmsetup
     config = \
         """
         BR2_aarch64=y
@@ -23,7 +23,7 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_DDRESCUE=y
-        BR2_PACKAGE_DMRAID=y
+        BR2_PACKAGE_LVM2=y
         BR2_TARGET_ROOTFS_CPIO=y
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
