Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C69C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 20:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68FE40993;
	Sat,  9 Dec 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C68FE40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUgcxqsJy3Nh; Sat,  9 Dec 2023 20:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250F440985;
	Sat,  9 Dec 2023 20:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250F440985
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19CED1BF681
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6A3960B3C
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6A3960B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFHZzCTJkFe3 for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 20:57:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C9EF60AEE
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 20:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C9EF60AEE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1829687A7F; Sat,  9 Dec 2023 20:57:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Dec 2023 21:35:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6254689f8d6ccc601ee0d7567d76c712ae6764f
X-Git-Newrev: 0c0cd720c5d71c5a8508795761eb168a7b3832cc
X-Patchwork-Hint: ignore
Message-Id: <20231209205708.1829687A7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestDtbocfg: bump kernel
 to 5.10.202
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c0cd720c5d71c5a8508795761eb168a7b3832cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The prebuilt kernel has been updated to 5.10.202, sync the kernel
built by TestDtbocfg.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_dtbocfg.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dtbocfg.py b/support/testing/tests/package/test_dtbocfg.py
index d25b1692b4..56a1ed4820 100644
--- a/support/testing/tests/package/test_dtbocfg.py
+++ b/support/testing/tests/package/test_dtbocfg.py
@@ -8,7 +8,7 @@ class TestDtbocfg(infra.basetest.BRTest):
         """
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_PACKAGE_DTBOCFG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
