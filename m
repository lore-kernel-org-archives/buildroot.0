Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54692C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 10:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1885421BC;
	Fri, 26 Jan 2024 10:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1885421BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4I33oe2hina8; Fri, 26 Jan 2024 10:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B0B1421B6;
	Fri, 26 Jan 2024 10:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B0B1421B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8702A1BF28F
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 10:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60746614FA
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 10:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60746614FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tm1ndeSEwAbn for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 10:09:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F87E614F5
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 10:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F87E614F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2189060004;
 Fri, 26 Jan 2024 10:09:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rTJ8z-008yWS-1M;
 Fri, 26 Jan 2024 11:09:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 11:09:02 +0100
Message-Id: <20240126100903.2139253-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] board/microchip/mpfs_icicle/genimage.cfg: drop
 legacy gpt = true
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Genimage complains about the config using the deprecated gpt option:

INFO: hdimage(sdcard.img): The option 'gpt' is deprecated.  Use
'partition-table-type' instead

So change to partition-table-type for consistency with the other configs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/microchip/mpfs_icicle/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/microchip/mpfs_icicle/genimage.cfg b/board/microchip/mpfs_icicle/genimage.cfg
index 6955d3365a..9282c9ce5f 100644
--- a/board/microchip/mpfs_icicle/genimage.cfg
+++ b/board/microchip/mpfs_icicle/genimage.cfg
@@ -15,7 +15,7 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
-		gpt = true
+		partition-table-type = "gpt"
 	}
 
 	partition uboot {
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
