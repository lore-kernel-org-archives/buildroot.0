Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78EEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955FE60232
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 955FE60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67E7B402D5;
	Mon,  8 Nov 2021 22:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHIhMBL99ptb; Mon,  8 Nov 2021 22:26:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73389402ED;
	Mon,  8 Nov 2021 22:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1171BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A9E36085B
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hIsN4gbar5Gv for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:07:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1AD4607F5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:07:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7D5998B717; Mon,  8 Nov 2021 22:03:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 23:03:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d828e5245ad08cd7c9072c397a2e575cc720eded
X-Git-Newrev: e9c3541bad9b8b9b3b3215592205b4bba5900cf5
X-Patchwork-Hint: ignore
Message-Id: <20211108220327.7D5998B717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: add genimage.cfg file coding
 style standard
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
