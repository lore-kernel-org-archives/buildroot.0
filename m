Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D93C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:47:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C5C610A0
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67C5C610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD6D402F1;
	Mon,  8 Nov 2021 22:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id deT10fknqq1y; Mon,  8 Nov 2021 22:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4766C40333;
	Mon,  8 Nov 2021 22:47:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77A0F1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4F8D80EBA
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K23UeaMcB-am for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3A4380ED5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BAE4C8A47B; Mon,  8 Nov 2021 22:08:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 23:03:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d828e5245ad08cd7c9072c397a2e575cc720eded
X-Git-Newrev: e9c3541bad9b8b9b3b3215592205b4bba5900cf5
X-Patchwork-Hint: ignore
Message-Id: <20211108220803.BAE4C8A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/manual: add genimage.cfg
 file coding style standard
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9c3541bad9b8b9b3b3215592205b4bba5900cf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds the explanation for the genimage.cfg files coding standard.
A real standard is not defined upstream by the genimage utility
developers[1], but I try to give one here in Buildroot for consistency.

[1]: https://github.com/pengutronix/genimage

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/writing-rules.txt | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 3b809d5c48..28cb0fe4f1 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -136,6 +136,68 @@ LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
 ---------------------
 
+[[writing-genimage-cfg]]
+
+=== The +genimage.cfg+ file
+
++genimage.cfg+ files contain the output image layout that genimage utility
+uses to create final .img file.
+
+An example follows:
+
+---------------------
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 32M
+}
+
+image sdimage.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		image = "efi-part.vfat"
+		offset = 8K
+	}
+
+	partition root {
+		image = "rootfs.ext2"
+		size = 512M
+	}
+}
+---------------------
+
+* Every +section+(i.e. hdimage, vfat etc.), +partition+ must be indented
+  with one tab.
+
+* Every +file+ or other +subnode+ must be indented with two tabs.
+
+* Every node(+section+, +partition+, +file+, +subnode+) must have an open
+  curly bracket on the same line of the node's name, while the closing one
+  must be on a newline and after it a newline must be added except for the
+  last one node. Same goes for its option, for example option +size = +.
+
+* Every +option+(i.e. +image+, +offset+, +size+) must have the +=+
+  assignment one space from it and one space from the value specified.
+
+* Filename must at least begin with genimage prefix and have the .cfg
+  extension to be easy to recognize.
+
+The +genimage.cfg+ files are the input for the genimage tool used in
+Buildroot to generate the final image file(i.e. sdcard.img). For further
+details about the _genimage_ language, refer to
+https://github.com/pengutronix/genimage/blob/master/README.rst[].
+
+
 === The documentation
 
 The documentation uses the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
