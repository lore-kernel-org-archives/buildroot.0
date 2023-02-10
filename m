Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CA9C636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB3460C12;
	Fri, 10 Feb 2023 22:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB3460C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6y7vDdrORUiQ; Fri, 10 Feb 2023 22:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECDC61058;
	Fri, 10 Feb 2023 22:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECDC61058
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AACF51BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7EF1415AE
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7EF1415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6tmIVVFdsg6 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:31:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 004FF415AC
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 004FF415AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E363B851A2; Fri, 10 Feb 2023 22:31:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:31:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fdf20249574b64285979f109bef74eb9cdbf0db
X-Git-Newrev: 2d87d6281869d4023e0ff888b99cdd5bdf2a0326
X-Patchwork-Hint: ignore
Message-Id: <20230210223129.E363B851A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/asus/tinker: add a note to
 readme.txt for power supply
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
