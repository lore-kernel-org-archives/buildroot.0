Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0DBC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B055E60184
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B055E60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CD640674;
	Tue,  3 Aug 2021 22:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbjcDGLvdbrA; Tue,  3 Aug 2021 22:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C50AE4066B;
	Tue,  3 Aug 2021 22:13:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D111D1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C2B160673
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSZYc-9YG1Of for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DC16085C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DF6FB87B09; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 22:17:07 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: abe32cfdf0dda17af10d290fe1cb33c0fc60a076
X-Git-Newrev: f37e811cd1b25d2be6aecc3a3bf185a0bb3cdb1c
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.DF6FB87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/fs/test_ext: add missing "format" option for Qemu
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f37e811cd1b25d2be6aecc3a3bf185a0bb3cdb1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Will avoid the following warning:

   WARNING: Image format was not specified for
   '/home/thomas/projets/outputs/TestExt3/images/rootfs.ext3' and
   probing guessed raw. Automatically detecting the format is
   dangerous for raw images, write operations on block 0 will be
   restricted. Specify the 'raw' format explicitly to remove the
   restrictions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_ext.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
index 0fe8af7e6d..2a6e0c4274 100644
--- a/support/testing/tests/fs/test_ext.py
+++ b/support/testing/tests/fs/test_ext.py
@@ -31,7 +31,7 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
                   kernel="builtin",
                   kernel_cmdline=["root=/dev/mmcblk0",
                                   "rootfstype={}".format(fs_type)],
-                  options=["-drive", "file={},if=sd".format(img)])
+                  options=["-drive", "file={},if=sd,format=raw".format(img)])
     emulator.login()
     _, exit_code = emulator.run(CHECK_FS_TYPE_CMD.format(fs_type))
     return exit_code
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
