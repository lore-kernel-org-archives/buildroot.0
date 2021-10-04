Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C4EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:11:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9066061401
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 20:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9066061401
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C9A040524;
	Mon,  4 Oct 2021 20:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uheKjVgDjES7; Mon,  4 Oct 2021 20:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CB9406AE;
	Mon,  4 Oct 2021 20:11:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E13D1BF2BA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A144833CD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 20:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qs5xFFkUBSkc for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 20:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD93833C6
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 20:10:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 814748ED89; Mon,  4 Oct 2021 20:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 17:36:18 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: f7388ee8b1a534fb22b16e10f129e43c29eb34d8
X-Git-Newrev: ad233dcd00ba740d0acb125c9c7c06e2c47c07fb
X-Patchwork-Hint: ignore
Message-Id: <20211004200739.814748ED89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] support/testing:
 test_f2fs: bump to kernel 4.19.204
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad233dcd00ba740d0acb125c9c7c06e2c47c07fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The kernel 4.16.7 curently used by the test doesn't build with host
gcc >= 10 due the gcc default -fno-common. See GCC 10 porting guide [1].

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump to the next LTS release.

[1] https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e0a64dfc0e4d2c79840037ddd193c7eafe4418d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 950d4cf25b..efbcb191b0 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
