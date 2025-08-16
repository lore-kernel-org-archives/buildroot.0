Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C569CA0EEB
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9575B614D7;
	Sat, 16 Aug 2025 19:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jJIyWWafTGt; Sat, 16 Aug 2025 19:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26C9614DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26C9614DB;
	Sat, 16 Aug 2025 19:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D166C196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C215940E48
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqg4B-32Be4l for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 19:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2591D41067
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2591D41067
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 19:47:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04736875EF; Sat, 16 Aug 2025 19:47:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 21:46:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37bc7f99fdb477818a84d64672ecd95e39a1cc64
X-Git-Newrev: 93e37c58b0a0c66c6faf81925ce5777b1e863779
X-Patchwork-Hint: ignore
Message-Id: <20250816194709.04736875EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_dmidecode: fix test
 after bootlin toolchains update
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93e37c58b0a0c66c6faf81925ce5777b1e863779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.package.test_dmidecode fails when building its Kernel 6.6.39
with gcc 15.1.0.

This commit fixes the issue by updating the test Kernel to the
latest 6.6.y version (6.6.102 at the time of this commit) which
includes the fix for gcc-15.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984686001

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_dmidecode.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dmidecode.py b/support/testing/tests/package/test_dmidecode.py
index 33c19f0d96..087075a7bb 100644
--- a/support/testing/tests/package/test_dmidecode.py
+++ b/support/testing/tests/package/test_dmidecode.py
@@ -14,7 +14,7 @@ class TestDmidecode(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.102"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
