Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E7DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:32:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500AF60EB1
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 500AF60EB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B37B4026F;
	Mon, 25 Oct 2021 09:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WnrMgwdZOp1; Mon, 25 Oct 2021 09:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAF4B4037C;
	Mon, 25 Oct 2021 09:32:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96FA21BF38A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C914022D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guW5cnRNQWWB for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:32:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B7A40287
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:32:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65718884A3; Mon, 25 Oct 2021 09:28:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 10:35:12 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: d1773c09891ba860b9ac0e8dd8767e43a5d9aac2
X-Git-Newrev: 68a2171ffcbfa2ede44b784ccf1815484fd86c15
X-Patchwork-Hint: ignore
Message-Id: <20211025092854.65718884A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] support/testing:
 test_ubi: add image format on the qemu command line
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

commit: https://git.buildroot.net/buildroot/commit/?id=68a2171ffcbfa2ede44b784ccf1815484fd86c15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Adding the Image format on the Qemu command line avoid this warning:

"WARNING: Image format was not specified for 'output/TestUbi/images/rootfs.ubi' and probing guessed raw.
         Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions."

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1ab2dd6aa5cf5170aee0bc761d05c387b8c69040)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
