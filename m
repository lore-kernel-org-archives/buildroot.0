Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F7C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A4170093;
	Tue, 21 Feb 2023 01:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A4170093
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGUf_i3YfbY9; Tue, 21 Feb 2023 01:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4205D701B6;
	Tue, 21 Feb 2023 01:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4205D701B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E377A1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C84CC70015
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C84CC70015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCVCTFVQwjZt for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3BE170017
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BE170017
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0067828C8; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:31:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0fdf20249574b64285979f109bef74eb9cdbf0db
X-Git-Newrev: 2d87d6281869d4023e0ff888b99cdd5bdf2a0326
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.E0067828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/asus/tinker: add a note
 to readme.txt for power supply
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d87d6281869d4023e0ff888b99cdd5bdf2a0326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/asus/tinker/readme.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/board/asus/tinker/readme.txt b/board/asus/tinker/readme.txt
index 7372d29520..110e2168c9 100644
--- a/board/asus/tinker/readme.txt
+++ b/board/asus/tinker/readme.txt
@@ -35,3 +35,9 @@ You can write this image directly to an SD card device (i.e. /dev/xxx):
   $ sudo sync
 
 Finally, you can insert the SD card to the Tinker RK3288 board and boot it.
+
+NOTE:
+USB power supply requires more than the standard 500mA USB current, so
+this board must be supplied from a capable port or from an external
+AC/DC adapter. Otherwise it will hang forever while loading the kernel
+image.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
