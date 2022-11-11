Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3255AC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5ABB42B3F;
	Mon, 20 Feb 2023 21:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5ABB42B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPfXzV-wryKC; Mon, 20 Feb 2023 21:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7213E42B49;
	Mon, 20 Feb 2023 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7213E42B49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22C8E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D741C6100B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D741C6100B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcbla_ZhepDQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4481610A3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4481610A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C11CD828C8; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 22:58:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 223516b51e1a45fa86dc1ac959aed93c7434afa4
X-Git-Newrev: dfbdb72103dff293fc7688872de91aaa9469d559
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.C11CD828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop entry related
 to inexisting directory
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dfbdb72103dff293fc7688872de91aaa9469d559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit
4e7dfe20bb8cf0cccfbd177321eff73e82c8d940 ("configs/friendlyarm_nanopi_m4:
remove defconfig") forgot to fully reflect the removal of the
defconfig in the DEVELOPERS file, causing a get-developers warning:

WARNING: 'board/friendlyarm/nanopi-m4' doesn't match any file

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bd76ddca28..826e04d805 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2728,7 +2728,6 @@ F:	package/hwloc/
 F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
-F:	board/friendlyarm/nanopi-m4
 F:	board/pine64/rockpro64
 F:	board/radxa/rockpi-n8
 F:	configs/rock_pi_n8_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
