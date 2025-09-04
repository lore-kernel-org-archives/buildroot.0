Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A730CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 248C2606C6;
	Thu,  4 Sep 2025 19:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-d9q4phCi-h; Thu,  4 Sep 2025 19:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E3A6606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E3A6606C7;
	Thu,  4 Sep 2025 19:31:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E535EB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBC4440279
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGwast9HhE7W for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2552540275
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2552540275
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FDD682B35; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 20:43:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 859d41d7e5e768a64cdc31d976f5e7008d1a77f8
X-Git-Newrev: e255cfff44f25fdc91fe871b6923932c7b728a6c
X-Patchwork-Hint: ignore
Message-Id: <20250904193156.1FDD682B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/aspeed_ast2500evb:
 increase kernel partition size
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
Content-Type: multipart/mixed; boundary="===============0581506386474159825=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0581506386474159825==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e255cfff44f25fdc91fe871b6923932c7b728a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Linux images are growing larger, and the current kernel partition size
of 4352K is no longer sufficient. Increase the partition size to
accommodate the larger images.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aspeed/ast2500-evb/genimage.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/aspeed/ast2500-evb/genimage.cfg b/board/aspeed/ast2500-evb/genimage.cfg
index 498a71e4d7..54f20ef6e7 100644
--- a/board/aspeed/ast2500-evb/genimage.cfg
+++ b/board/aspeed/ast2500-evb/genimage.cfg
@@ -30,11 +30,11 @@ image flash.img {
 	partition fitimage {
 		image = "image.itb"
 		offset = 512K
-		size = 4352K
+		size = 6000K
 	}
 
 	partition spare {
-		offset = 4864K
-		size = 27904K
+		offset = 6512K
+		size =  26256K
 	}
 }

--===============0581506386474159825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0581506386474159825==--
