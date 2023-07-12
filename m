Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C6DEB64DD
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16C841EAF;
	Wed, 12 Jul 2023 19:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16C841EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yA-AIKWkW-cG; Wed, 12 Jul 2023 19:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B480940542;
	Wed, 12 Jul 2023 19:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B480940542
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB1901BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A468D401B2
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A468D401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0pBj42-gqSy for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:30:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D675E4012B
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D675E4012B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2E4C86EE3; Wed, 12 Jul 2023 19:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:29:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 170c218e4403944eae58bb80cc5cf1d198883a7c
X-Git-Newrev: 1b52f1e0b0cdd7b54acb63354e12c0e61d1b122f
X-Patchwork-Hint: ignore
Message-Id: <20230712193041.C2E4C86EE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_perftest: update
 test kernel to 6.1.33
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b52f1e0b0cdd7b54acb63354e12c0e61d1b122f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_perftest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_perftest.py b/support/testing/tests/package/test_perftest.py
index 680b70d784..08089456c2 100644
--- a/support/testing/tests/package/test_perftest.py
+++ b/support/testing/tests/package/test_perftest.py
@@ -12,7 +12,7 @@ class TestPerftest(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.91"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.33"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
