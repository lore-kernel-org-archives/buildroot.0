Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B1EC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E098942130;
	Fri, 26 Jan 2024 16:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E098942130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FqprsPlFa0KD; Fri, 26 Jan 2024 16:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CCCF42083;
	Fri, 26 Jan 2024 16:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CCCF42083
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 326651BF284
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD0583DDD
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD0583DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dalhfZ0i_RyV for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:04:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FAA583DD7
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FAA583DD7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 080BF86554; Fri, 26 Jan 2024 16:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 17:02:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23534a6b41d6dd530395fa3727dd080aaca27a3d
X-Git-Newrev: 0d1f8ebe929d68167500040726cca698c8f45f07
X-Patchwork-Hint: ignore
Message-Id: <20240126160447.080BF86554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/microchip/mpfs_icicle/genimage.cfg:
 drop legacy gpt = true
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d1f8ebe929d68167500040726cca698c8f45f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Genimage complains about the config using the deprecated gpt option:

INFO: hdimage(sdcard.img): The option 'gpt' is deprecated.  Use
'partition-table-type' instead

So change to partition-table-type for consistency with the other configs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Jamie Gibbons <jamie.gibbons@microchip.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
