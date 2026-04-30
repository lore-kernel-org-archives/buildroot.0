Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B149FF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 13:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DD9E84CD3;
	Thu, 30 Apr 2026 13:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OBiRzTKyZd7; Thu, 30 Apr 2026 13:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43BC084C4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777556190;
	bh=0+pyeKQXovX7lEO8ZsTLDkKsSUw6LscN23trXrdu4Gw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uv7hSw0K9tGCFxiPXMjEq35949Z2TE+mJSLGNqxpAv0xcNDqfWMKeud2hnEzh1pS6
	 D2RphgCsCXCnSdm4Mc0b6GxAPXl41KncTULkWJZwmHhNi4MRLbPS1t8+WpGN3ukoG9
	 SlK1NuoaoSsA9/YjkxeIE04utqws+ksjSvibJ7uio9ClRhJ65cLsFUeAqeK4bPQ2Wt
	 QMSB0eVrcdYyFQTs7hLb3TT5Qlxvk0PPlAPdtt+uAx3JVA9K1uqSIyCVDEmH/nX3qj
	 n530BVgJC7ObT8g4ISVxTwD9mloJIPGmwNkZH0rG9vHI0uwU6ZtIjvDpcvc6VOVnyl
	 vybzccRbhsnOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43BC084C4F;
	Thu, 30 Apr 2026 13:36:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 906C2204
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71C3160D69
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8hHY9Urjtnka for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C78560D68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C78560D68
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 471F483C91; Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:59:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe9974e3eb4aa8c29e1e9cdcfb468b901108e6dc
X-Git-Newrev: d7a7a35f58c48652fa8fc0d62812e1d9a1e81ad5
X-Patchwork-Hint: ignore
Message-Id: <20260430133626.471F483C91@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_kmod.py: use current 6.6.x kernel
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7a7a35f58c48652fa8fc0d62812e1d9a1e81ad5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 support/testing/tests/package/test_kmod.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_kmod.py b/support/testing/tests/package/test_kmod.py
index 1d9ea535fc..e11d3b702c 100644
--- a/support/testing/tests/package/test_kmod.py
+++ b/support/testing/tests/package/test_kmod.py
@@ -15,7 +15,7 @@ class TestKmod(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.35"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.135"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
