Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B51C7EE24
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 19:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3679941A49;
	Sat,  3 Jun 2023 19:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3679941A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQFwLLXEcALY; Sat,  3 Jun 2023 19:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D1941919;
	Sat,  3 Jun 2023 19:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D1941919
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0161BF487
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5336341919
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 19:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5336341919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BC1DplQdussS for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 19:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE120418E1
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 19:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE120418E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DABB1866D0; Sat,  3 Jun 2023 19:18:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 21:17:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 465f670e6cd550660e8b0b935f03a2be275b0c53
X-Git-Newrev: 1c54f2170b32da05dbec8b410de3a5cba916c9e9
X-Patchwork-Hint: ignore
Message-Id: <20230603191827.DABB1866D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_clang: update to the
 next LTS kernel (4.19.x)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c54f2170b32da05dbec8b410de3a5cba916c9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel 4.16.7 curently used by the test doesn't build with host
bison (GNU Bison 3.7.5) probably due a missing fix [1] in 4.16.x branch.

Since kernel 4.16 is EOL, bump to the next LTS kernel (4.19.x) in order
to ease backport to previous Buildroot releases.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4114986744

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d59fbbd09d5d6bdf4ea1f0b4090d175e081ff421

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
