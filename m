Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E8CAC583
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F9C42C0C;
	Mon,  8 Sep 2025 10:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxesKohY0uhZ; Mon,  8 Sep 2025 10:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C719642C22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C719642C22;
	Mon,  8 Sep 2025 10:39:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E7DC186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9556941534
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ay0Q3EKurKT for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C9F141F3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C9F141F3E
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AA8083A95; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:19:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 81c94c0d93f19f5daa91bfc33ce9bdffc6d65dab
X-Git-Newrev: f54e0595fb3124adaaab77ddff735a7ddab8fbf6
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.5AA8083A95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_systemd_selinux: fix test after bootlin toolchains update
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

commit: https://git.buildroot.net/buildroot/commit/?id=f54e0595fb3124adaaab77ddff735a7ddab8fbf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.init.test_systemd_selinux fails when building its
Kernel 6.1.26 with gcc 15.1.0.

This commit fixes the issue by updating the test Kernel to the
latest 6.1.y version (6.1.148 at the time of this commit) which
includes several fixes for gcc-15 like this one [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685949
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685950

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0f82f6f1556389d6489795f03ac3f68cde99d5ad

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Romain: Add a link to one of the kernel commit related to gcc-15]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 8d6f9393ec2ad039554b32b8c7da192559c7887a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/init/test_systemd_selinux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index e9bb3405cd..398cfbaa82 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -12,7 +12,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_INIT_SYSTEMD=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.148"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
