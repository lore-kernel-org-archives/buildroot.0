Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405DEEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFBED41C4E;
	Wed, 14 Jun 2023 11:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFBED41C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruT3mUBMhaR7; Wed, 14 Jun 2023 11:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79BE041D79;
	Wed, 14 Jun 2023 11:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79BE041D79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52FF31BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E92266124C
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92266124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sv67uiCW-_I2 for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4567B6124A
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4567B6124A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4386D83628; Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 13:50:51 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 74d8b44ee05c8c1d87edd47deb3a054c01aad54a
X-Git-Newrev: 20b899f38a9e8bdda11aa865167188d3d78ce89c
X-Patchwork-Hint: ignore
Message-Id: <20230614115310.4386D83628@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/testing:
 test_clang: update to the next LTS kernel (4.19.x)
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

commit: https://git.buildroot.net/buildroot/commit/?id=20b899f38a9e8bdda11aa865167188d3d78ce89c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The kernel 4.16.7 curently used by the test doesn't build with host
bison (GNU Bison 3.7.5) probably due a missing fix [1] in 4.16.x branch.

Since kernel 4.16 is EOL, bump to the next LTS kernel (4.19.x) in order
to ease backport to previous Buildroot releases.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4114986744

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d59fbbd09d5d6bdf4ea1f0b4090d175e081ff421

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 1c54f2170b32da05dbec8b410de3a5cba916c9e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_clang.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index df3990c6be..f36faa059a 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -14,7 +14,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
