Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFD2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:52:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22D2610C7
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E22D2610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCFC86078E;
	Sun, 17 Oct 2021 19:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNFvouM65LZ0; Sun, 17 Oct 2021 19:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2752E6075F;
	Sun, 17 Oct 2021 19:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0731BF976
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87ED581551
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaeLYqmlRFeG for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1A51814A1
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D4E4795DA7; Sun, 17 Oct 2021 19:49:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 21:46:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f9e83f5f74da4c8f9a210fb586542eba08c4080
X-Git-Newrev: 1ab2dd6aa5cf5170aee0bc761d05c387b8c69040
X-Patchwork-Hint: ignore
Message-Id: <20211017194926.D4E4795DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_ubi: add image
 format on the qemu command line
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

commit: https://git.buildroot.net/buildroot/commit/?id=1ab2dd6aa5cf5170aee0bc761d05c387b8c69040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding the Image format on the Qemu command line avoid this warning:

"WARNING: Image format was not specified for 'output/TestUbi/images/rootfs.ubi' and probing guessed raw.
         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions."

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_ubi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
index 8148e5f336..eeb55b1d59 100644
--- a/support/testing/tests/fs/test_ubi.py
+++ b/support/testing/tests/fs/test_ubi.py
@@ -32,7 +32,7 @@ class TestUbi(infra.basetest.BRTest):
                            kernel_cmdline=["root=ubi0:rootfs",
                                            "ubi.mtd=0",
                                            "rootfstype=ubifs"],
-                           options=["-drive", "file={},if=pflash".format(img)])
+                           options=["-drive", "file={},if=pflash,format=raw".format(img)])
         self.emulator.login()
         cmd = "mount | grep 'ubi0:rootfs on / type ubifs'"
         _, exit_code = self.emulator.run(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
