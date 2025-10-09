Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67077CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B13CE611F5;
	Thu,  9 Oct 2025 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqboUp1A25Bo; Thu,  9 Oct 2025 09:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACCCD611DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACCCD611DD;
	Thu,  9 Oct 2025 09:55:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D076A9DA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C23DB611D8
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1KXWFgG9asE for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C0FE605AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C0FE605AA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8902386C34; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:26:56 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 6fa717f7f1352aaff39b9371a04dff648b78ba04
X-Git-Newrev: 14c0238fac5db4c35f6d4392ea1befbc86d973fd
X-Patchwork-Hint: ignore
Message-Id: <20251009095539.8902386C34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] board/zynq: correct zed
 board links
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

commit: https://git.buildroot.net/buildroot/commit/?id=14c0238fac5db4c35f6d4392ea1befbc86d973fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The web link www.zedboard.org is no longer valid as it routes to a generic
avnet.com boards link. Fix this issue by providing direct links to the Avnet
ZedBoard and Tria MicroZed boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4e7f03314d8b777c7616e6bf5edf69c8aa015782)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/zynq/readme.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
index f0b4fe9ded..ec1d7ea2c9 100644
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
