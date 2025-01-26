Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C68C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 15:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40E9605DE;
	Sun, 26 Jan 2025 15:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Izc30OmtJkfi; Sun, 26 Jan 2025 15:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BC6605E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BC6605E0;
	Sun, 26 Jan 2025 15:39:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87643F10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 749F9400FE
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4VHVul9Qixe for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 15:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C2364004A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C2364004A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 15:39:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3EA084495; Sun, 26 Jan 2025 15:39:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 16:09:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a528ac581fac9dd47e99fcabfbd0a3beed2a9367
X-Git-Newrev: a0eefe1ce635edd2482e1706afa3fa8646bdfbf0
X-Patchwork-Hint: ignore
Message-Id: <20250126153927.C3EA084495@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-5-plus: fix
 genimage.cfg
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a0eefe1ce635edd2482e1706afa3fa8646bdfbf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the moment, Buildroot provides genimage v18. However that version
does not yet include the GUID shortcut for 'u-boot-env' partition type.
This convenient change is relatively new (see [1]) and can be expected
in v19. For now, use the GUID value directly.

[1] https://github.com/pengutronix/genimage/commit/3e0a2aea8d10431f8c8f652129f73544cfa16af2

Fixes: 057012eb2c2c ("configs/orangepi_5_plus: new board")

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/orangepi/orangepi-5-plus/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-5-plus/genimage.cfg b/board/orangepi/orangepi-5-plus/genimage.cfg
index 5da0b4a2cf..1f3ff3ec25 100644
--- a/board/orangepi/orangepi-5-plus/genimage.cfg
+++ b/board/orangepi/orangepi-5-plus/genimage.cfg
@@ -10,7 +10,7 @@ image sdcard.img {
 	}
 
 	partition uboot-env {
-		partition-type-uuid = u-boot-env
+		partition-type-uuid = 3de21764-95bd-54bd-a5c3-4abe786f38a8
 		offset = 16M
 		size = 64K
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
