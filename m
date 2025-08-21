Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8E0CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D0961798;
	Thu, 21 Aug 2025 18:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oGxwCey4i8C; Thu, 21 Aug 2025 18:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 900616176A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 900616176A;
	Thu, 21 Aug 2025 18:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51CE325B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3416A845EE
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdhBi_aU2y57 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72CDE842DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72CDE842DA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FC83813AF; Thu, 21 Aug 2025 18:57:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:40:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c2d9939a67fb09c1366a23d786e9ed69abc06054
X-Git-Newrev: b8d56c185e14db86a3636d0521f13b653daa636e
X-Patchwork-Hint: ignore
Message-Id: <20250821185700.6FC83813AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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
Content-Type: multipart/mixed; boundary="===============9007357800771116310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9007357800771116310==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b8d56c185e14db86a3636d0521f13b653daa636e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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

--===============9007357800771116310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9007357800771116310==--
