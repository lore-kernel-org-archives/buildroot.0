Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD67CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23254617AA;
	Thu, 21 Aug 2025 19:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_wCuJgMJxk0; Thu, 21 Aug 2025 19:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1590F61796
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1590F61796;
	Thu, 21 Aug 2025 19:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 121A825B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DCA441921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BfZoAJJXQSI for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B4D24190F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B4D24190F
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C140878D7; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:51:54 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 317fbce131e8fc8812828fc2ad5367115611ec80
X-Git-Newrev: 0b8c777ce1cd33b3cdb9ceaeeab6e9da9c815b10
X-Patchwork-Hint: ignore
Message-Id: <20250821192008.8C140878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing:
 test_wine: fix test after bootlin toolchains update
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b8c777ce1cd33b3cdb9ceaeeab6e9da9c815b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.package.test_wine fails to build its Kernel 6.6.27 with
gcc 15.1.0.

This commit fixes the issue by updating the test Kernel version to
the latest 6.6.y version (6.6.102 at the time of this commit) which
includes the fix for gcc-15.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686766

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20100403d3b6d4568f1c9815c446f241815ec76b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_wine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
index 4e5b4a8b11..8c7b80f522 100644
--- a/support/testing/tests/package/test_wine.py
+++ b/support/testing/tests/package/test_wine.py
@@ -15,7 +15,7 @@ class TestWine(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.102"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
