Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BADCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA6D6176B;
	Thu, 21 Aug 2025 19:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JuUKCMZyTvR; Thu, 21 Aug 2025 19:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894536176F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 894536176F;
	Thu, 21 Aug 2025 19:20:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5051C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1173615B9
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q48nxDLk9WW for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7B26148C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB7B26148C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D91C58780C; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:52:50 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 6829787dab49ddbb5dfd87df801bd402a5a6c7bc
X-Git-Newrev: e2f4105998d4ab3e73f5e916c3872369492ea238
X-Patchwork-Hint: ignore
Message-Id: <20250821192008.D91C58780C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing:
 test_msr_tools: fix test after bootlin toolchains update
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
Content-Type: multipart/mixed; boundary="===============4272124605868917390=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4272124605868917390==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e2f4105998d4ab3e73f5e916c3872369492ea238
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.package.test_msr_tools fails when building its Kernel 5.15.55
with gcc 15.1.0.

This commit fixes the issue by updating the test Kernel to the latest
LTS version (6.12.42 at the time of this commit) which includes the
fix for gcc-15. Note: the 5.15.y series does not include this fix for
the x86_64 architecture, which is why this commit switches to 6.12.y.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686294

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1

Cc: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 37bc7f99fdb477818a84d64672ecd95e39a1cc64)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_msr_tools.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_msr_tools.py b/support/testing/tests/package/test_msr_tools.py
index 4d62742a5f..d098b29aa2 100644
--- a/support/testing/tests/package/test_msr_tools.py
+++ b/support/testing/tests/package/test_msr_tools.py
@@ -11,7 +11,7 @@ class TestMsrTools(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.55"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.42"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"

--===============4272124605868917390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4272124605868917390==--
