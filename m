Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D462C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1483E81D16;
	Mon,  6 Dec 2021 18:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1cjaKwb8nFSO; Mon,  6 Dec 2021 18:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977C081AF5;
	Mon,  6 Dec 2021 18:19:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E96921BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DFD60D6F
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3geke8Oza5gC for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1863E60D69
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A8B2581506; Mon,  6 Dec 2021 18:07:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:31:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 11db258cd6e018227b6899632442b1753a2c3318
X-Git-Newrev: e89a95ca4a103a169007793a060d08acfd50901a
X-Patchwork-Hint: ignore
Message-Id: <20211206180738.A8B2581506@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 board/friendlyarm/nanopi-neo2/genimage.cfg: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=e89a95ca4a103a169007793a060d08acfd50901a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency comment '# 1MB - 40K' must be '# 1MB - 40KB'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/friendlyarm/nanopi-neo2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
index 45d081e197..3163a06592 100644
--- a/board/friendlyarm/nanopi-neo2/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1M # 1MB - 40KB
 	}
 
 	partition boot {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
