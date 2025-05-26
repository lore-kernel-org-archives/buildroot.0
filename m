Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A285C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5220583DD6;
	Sat, 31 May 2025 17:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QZxAYs31ReR; Sat, 31 May 2025 17:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF18D83C03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF18D83C03;
	Sat, 31 May 2025 17:06:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8C5F127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E7C460729
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVLs6urQjjRw for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5102260760
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5102260760
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4188E87805; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:50:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9b7d8eb75e499d81fca36a835eff99988d496c80
X-Git-Newrev: 02c57fbf3fe0235c04bec6f2d7e583d8c16b1483
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.4188E87805@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/bsh/imx8mn-bsh-smm-s2: erase the entire NAND chip
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02c57fbf3fe0235c04bec6f2d7e583d8c16b1483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

If an attempt is made to create a UBI volume and it already exists, the
operation fails. Therefore, before requesting the creation of a UBI
volume, we erase the entire NAND to ensure that no errors occur.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 97ac89eb115dbcd28efd1cf95d9a308f71b33041)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/bsh/imx8mn-bsh-smm-s2/nand-full.lst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
index c01d2d6c1d..f5b94c24d8 100644
--- a/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
+++ b/board/bsh/imx8mn-bsh-smm-s2/nand-full.lst
@@ -10,6 +10,8 @@ SDPS: boot -f _flash.bin
 
 FB: ucmd setenv fastboot_buffer ${loadaddr}
 FB: download -f _image
+FB[-t 10000]: ucmd nand erase.chip
+
 # Burn image to nandfit partition if needed
 FB: ucmd if env exists nandfit_part; then nand erase.part nandfit; nand write ${fastboot_buffer} nandfit ${filesize}; else true; fi;
 FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
