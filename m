Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D86C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0648C6134F
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0648C6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF2F14016D;
	Mon,  8 Nov 2021 22:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4D1GD08Jv4Ir; Mon,  8 Nov 2021 22:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A83C40170;
	Mon,  8 Nov 2021 22:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03CA51BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A56340320
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_Fr0LaMVtaM for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE57A40338
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 88F778B719; Mon,  8 Nov 2021 22:08:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e512d9418c8f61e483b108a76e69d6b031ec853a
X-Git-Newrev: bb8c35fcd53945c8aacb8a6d02d2ad72ec71805e
X-Patchwork-Hint: ignore
Message-Id: <20211108220803.88F778B719@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/terasic/de10nano_cyclone5/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb8c35fcd53945c8aacb8a6d02d2ad72ec71805e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/terasic/de10nano_cyclone5/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/terasic/de10nano_cyclone5/genimage.cfg b/board/terasic/de10nano_cyclone5/genimage.cfg
index 76b1d03649..815e4a1bf3 100644
--- a/board/terasic/de10nano_cyclone5/genimage.cfg
+++ b/board/terasic/de10nano_cyclone5/genimage.cfg
@@ -16,6 +16,7 @@ image boot.vfat {
 			image = "barebox-env"
 		}
 	}
+
 	size = 8M
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
