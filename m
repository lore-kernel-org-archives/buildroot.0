Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40516CDB466
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 08:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0160605D9;
	Thu, 25 Jun 2026 08:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CsydRx0EHIPO; Thu, 25 Jun 2026 08:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF00C605DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782376681;
	bh=5ANsBfqIqgYfzLUJOIw3Mtv18VGncikRettBnnJloM8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K0As8THKkWdi3vj2AptCaPkx+pIS1JABBOisDrZLRhv0qVJTqural60LRuHJ7k/DC
	 hSZA7vAVuFnTHiY+pHYokSsQQNzE3wSlbhw81sqDyC+lNVenYathQHvOtew7BRD2Kb
	 bmZdfoJYMDbgEyCt1VaA8R9TQe2wiKeBtLKSRW+cqLaN9warg9eoqJLWHXlbFvVdGy
	 BzlOX3QSfAk5FejDFTLJkF5NWtCEBK+azpa1XB4R8tXxiAdUSc/eAclIDIZdFwNFaf
	 Ldy4N5E6wfaT5vTP289JCWaxAoSeT6Ogg7tC3nxWJISOsUaAiD1PweMDmv5poNT/K5
	 qP9n6x+8Smf8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF00C605DA;
	Thu, 25 Jun 2026 08:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D77C2C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F4D94106A
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yl7q9xzcYnjI for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 08:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466BA4070D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 466BA4070D
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D092085169; Thu, 25 Jun 2026 08:37:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 10:35:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b2f65bbe942ae3f662294bad5cbb839475db92e
X-Git-Newrev: 92214c922de4f789dd8f1211e85e2cc77f62e189
X-Patchwork-Hint: ignore
Message-Id: <20260625083732.D092085169@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestIptables: bump kernel
 to 6.18 LTS
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92214c922de4f789dd8f1211e85e2cc77f62e189
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/testing/tests/package/test_iptables.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index eeb4ccb5dd..918fa4fb29 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -15,7 +15,7 @@ class TestIptables(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.36"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
