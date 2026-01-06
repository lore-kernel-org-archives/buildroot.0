Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F40D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CEFF41443;
	Wed,  7 Jan 2026 18:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26Aoy_TN_D2M; Wed,  7 Jan 2026 18:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB724142E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808948;
	bh=ArLVIvxexQKFQgYgyK7+pNJclpHIxdDfsMapGHd43Q0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qsFhYRb7dLnNNYPkqiOQSERUXlytWgIBuEVwuUZYPsrbRz3fld9uagFsDgIlCAtuB
	 yk0D/4qTze+vkYAWsAUzzAHVjce6vyv7kzTsWOCVClq9/mYLHZ71z+72CdgSFmRiow
	 et6H1p5N1JMJ+CbLbZdI9c4QrL+owWajWLGug0lIpQ6QOND3mM24QzVk18Bvb272iC
	 mUrNYTc8K8aTn+iquo0J3dsGZi80phqggIlr0rmXFnVZyYsTBqARIiLYoD+hTMWZwd
	 YL/tOXD5uT/g1gQdNr4z2poCfCgqC9XZq+OrUJvriVWbp6Kzab+67e/aFyoQ5cnIjY
	 +iJhn/m85XguA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB724142E;
	Wed,  7 Jan 2026 18:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 023309ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0B0D8107F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tmnf1-yHroOc for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB9680E98
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BB9680E98
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3914883B69; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:55:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b0bf5cb73a24def1a9fef8c0e7e2561eaaf9c8cb
X-Git-Newrev: 0a258ddc56791e633a05aaecd9d85c12f320e8c5
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.3914883B69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] support/testing:
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a258ddc56791e633a05aaecd9d85c12f320e8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
