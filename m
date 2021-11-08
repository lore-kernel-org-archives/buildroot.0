Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3E3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:43:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493E36134F
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 493E36134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BA2E4033F;
	Mon,  8 Nov 2021 22:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6zhmIpTfMru; Mon,  8 Nov 2021 22:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 088CD402F1;
	Mon,  8 Nov 2021 22:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7B91BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DF9780EDC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kx5kpUNgAMwT for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1351780EAD
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:11:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C0BEB8A47B; Mon,  8 Nov 2021 22:08:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 22:59:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 542ad8226c951c4b517a3079e804fbd3ad282efc
X-Git-Newrev: 9d953e20b0ca79ba3a650cf14c544cb0a73e3878
X-Patchwork-Hint: ignore
Message-Id: <20211108220802.C0BEB8A47B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/radxa/rockpi-n8/genimage.cfg: beautify file
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d953e20b0ca79ba3a650cf14c544cb0a73e3878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/radxa/rockpi-n8/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
index 88b55de376..3329576b76 100644
--- a/board/radxa/rockpi-n8/genimage.cfg
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 16M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
