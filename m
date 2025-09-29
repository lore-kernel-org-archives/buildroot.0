Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CFBCAC5B9
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 18:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A5380A91;
	Mon, 29 Sep 2025 18:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wki9Yd_8d0th; Mon, 29 Sep 2025 18:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EC7E80AA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC7E80AA4;
	Mon, 29 Sep 2025 18:50:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ADB0CCF
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 18:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C87B60BC7
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 18:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_bUw81-Ynid for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 18:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BDED60B39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BDED60B39
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 18:50:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 865D2863E8; Mon, 29 Sep 2025 18:50:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Sep 2025 20:47:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74dcda25449b4d40a5f48820f0e53bf97315972d
X-Git-Newrev: 4e7f03314d8b777c7616e6bf5edf69c8aa015782
X-Patchwork-Hint: ignore
Message-Id: <20250929185006.865D2863E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynq: correct zed board links
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e7f03314d8b777c7616e6bf5edf69c8aa015782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The web link www.zedboard.org is no longer valid as it routes to a generic
avnet.com boards link. Fix this issue by providing direct links to the Avnet
ZedBoard and Tria MicroZed boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/zynq/readme.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index ed7509f2b5..225af4b9dc 100644
--- a/board/zynq/readme.txt
+++ b/board/zynq/readme.txt
@@ -43,7 +43,9 @@ References:
    https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc706-g.html
 
  - Zedboard/Microzed information including schematics, reference designs, and
-   manuals are available from http://www.zedboard.org .
+   manuals are available from
+   https://www.avnet.com/americas/products/avnet-boards/avnet-board-families/zedboard/
+   https://www.tria-technologies.com/product/microzed/
 
 Support for other boards:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
