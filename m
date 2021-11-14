Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39426C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:43:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF8F460ED7
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF8F460ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8AC5606D4;
	Sun, 14 Nov 2021 14:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7jneOme9asm; Sun, 14 Nov 2021 14:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2EC606B3;
	Sun, 14 Nov 2021 14:43:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4FC01BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B66E80D3C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 774GLoijMYHm for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F17A80D4F
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4172D8D2B1; Sun, 14 Nov 2021 14:37:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:41:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ba9f42d5ebab83d8302b5da9e8c28b2fb7121940
X-Git-Newrev: 425a1e9f2013fee5a39531268326ba8b861d5af4
X-Patchwork-Hint: ignore
Message-Id: <20211114143758.4172D8D2B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/manual: add allowed
 notations section for genimage.cfg files
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

commit: https://git.buildroot.net/buildroot/commit/?id=425a1e9f2013fee5a39531268326ba8b861d5af4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add allowed notations section for genimage.cfg files by specifying the
accepted suffix or prefix. Note that "K" has been decided to specify
KiloBytes as 1024 bytes. This has been done because in Buildroot the 90%
of the cases were using "K" and not "k".

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/writing-rules.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 28cb0fe4f1..3eec095d0e 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -192,6 +192,12 @@ image sdimage.img {
 * Filename must at least begin with genimage prefix and have the .cfg
   extension to be easy to recognize.
 
+* Allowed notations for +offset+ and +size+ options are: +G+, +M+, +K+
+  (not +k+).  If it's not possible to express a precise byte count
+  with notations above then use hexadecimal +0x+ prefix or, as last
+  chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
+  (not +kb+) in place of +G+, +M+, +K+.
+
 The +genimage.cfg+ files are the input for the genimage tool used in
 Buildroot to generate the final image file(i.e. sdcard.img). For further
 details about the _genimage_ language, refer to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
