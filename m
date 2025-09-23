Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9E9CAC5B0
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 19:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D208041007;
	Tue, 23 Sep 2025 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vfi0C8JRjFW; Tue, 23 Sep 2025 19:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D55940FBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D55940FBF;
	Tue, 23 Sep 2025 19:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60C04129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5242D40FA4
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzEXpH4nlmL2 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68E7340F9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68E7340F9A
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57FD886323; Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 21:09:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e5e6f98fd73baeb7baa402d6bd27ed2a5d7900f
X-Git-Newrev: 64fc708cdc8db3bd1e25ebd744e30756be3e53c1
X-Patchwork-Hint: ignore
Message-Id: <20250923193857.57FD886323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2500evb: increase kernel
 partition size
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8156520280006174417=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8156520280006174417==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=64fc708cdc8db3bd1e25ebd744e30756be3e53c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Increase again the partition size to accommodate latest kernel.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aspeed/ast2500-evb/genimage.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/aspeed/ast2500-evb/genimage.cfg b/board/aspeed/ast2500-evb/genimage.cfg
index 54f20ef6e7..952a7b7820 100644
--- a/board/aspeed/ast2500-evb/genimage.cfg
+++ b/board/aspeed/ast2500-evb/genimage.cfg
@@ -30,11 +30,11 @@ image flash.img {
 	partition fitimage {
 		image = "image.itb"
 		offset = 512K
-		size = 6000K
+		size = 7000K
 	}
 
 	partition spare {
-		offset = 6512K
-		size =  26256K
+		offset = 7512K
+		size =  25256K
 	}
 }

--===============8156520280006174417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8156520280006174417==--
