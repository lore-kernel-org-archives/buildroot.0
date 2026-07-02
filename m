Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2126C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F3B825B9;
	Fri,  3 Jul 2026 14:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb4z36mPTE-W; Fri,  3 Jul 2026 14:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4A7F825FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088921;
	bh=jrrU7D/2H9aYhFXfGK0g2e+5uk7N5Ab0g466+ruFb+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMaB5UYjamT1jALEaDRkj3UcLm7AhYjr92IwKhkv+2Kfb8baOW9njDUGNbONYuzQa
	 dkcVb+yLZLLq8HuGda8elqVjYt3T4Dbb+cTL6IEcjC3aj6lzlab0+1Q9cOvoNgpwEY
	 UaVyz5onMZ02dFeae66DInbxnvbkpvE4p2gRUQ/AGksMI5w7Vmx7GXASFkD95djVZD
	 evkSenqxBzkV/mSuk8FscS0eZkfScWzHVzk+/p4oE4UNbwA+LFDzr/Gl7j+qdrGqt+
	 nJlt32FFetWGYOHy9S5S9qQZqTzbrMp2g1XSheedwYDUwS5+VXW1/IkdeFWXPBilTI
	 aW8RresAzQU1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4A7F825FE;
	Fri,  3 Jul 2026 14:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89CA947E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C3A140FC6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8BdTnoJ0a941 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 651B641157
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 651B641157
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06B42883A2; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:31:40 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 7d8f9f6c0f7139c2cefc7579fe593f59870e092a
X-Git-Newrev: 0c67544f047b2cb0812c77011e8c3314ad301376
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.06B42883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 TestIptables: bump kernel to 6.18 LTS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c67544f047b2cb0812c77011e8c3314ad301376
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 92214c922de4f789dd8f1211e85e2cc77f62e189)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
