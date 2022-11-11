Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C361AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 21:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A27240189;
	Fri, 11 Nov 2022 21:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A27240189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjqlcQep7Qxo; Fri, 11 Nov 2022 21:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E355840162;
	Fri, 11 Nov 2022 21:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E355840162
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7071BF267
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 21:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22A9041847
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 21:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A9041847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8p9d3ZWqz1Kp for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 21:59:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 028ED4086C
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 21:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028ED4086C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE05A82D9A; Fri, 11 Nov 2022 21:59:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 22:58:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 223516b51e1a45fa86dc1ac959aed93c7434afa4
X-Git-Newrev: dfbdb72103dff293fc7688872de91aaa9469d559
X-Patchwork-Hint: ignore
Message-Id: <20221111215940.DE05A82D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop entry related to
 inexisting directory
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
