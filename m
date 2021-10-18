Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC464C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:20:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5023560C4C
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5023560C4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C942402A2;
	Mon, 18 Oct 2021 19:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-nvZNB2WcCy; Mon, 18 Oct 2021 19:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30BBB4021F;
	Mon, 18 Oct 2021 19:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 340281BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 304C3608E9
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPlTgDpobnbX for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:16:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C70607C4
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:16:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 43B1587431; Mon, 18 Oct 2021 19:13:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:15:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d92f86849a75813e88f2a98a5294738d6806be9f
X-Git-Newrev: 513508de0b15853cb484c16412ffac9926c4cc8c
X-Patchwork-Hint: ignore
Message-Id: <20211018191305.43B1587431@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove qemu_cksy
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

commit: https://git.buildroot.net/buildroot/commit/?id=513508de0b15853cb484c16412ffac9926c4cc8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b36c4e594c658d49d19bf388b7fd4a912b6fde42 forgot to remove
board/qemu/csky abd configs/qemu_csky* from DEVELOPERS file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19f6d95270..871df1e7bb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1105,9 +1105,7 @@ F:	package/reaver/
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
 F:	board/csky/
-F:	board/qemu/csky
 F:	configs/csky_*
-F:	configs/qemu_csky*
 
 N:	Gustavo Heinz <gustavo@gsthnz.com>
 F:	package/python-m2crypto/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
