Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E156BC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8023040A81;
	Tue,  6 Dec 2022 22:21:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8023040A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPMmiLquxeG2; Tue,  6 Dec 2022 22:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C79C740904;
	Tue,  6 Dec 2022 22:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C79C740904
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C96DE1BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4FA5817FF
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FA5817FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8Y3HXhrNxCo for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:21:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEF3D8194A
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEF3D8194A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEC3585D2D; Tue,  6 Dec 2022 22:21:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Dec 2022 23:19:47 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b422af7890f7fec9b6a5bfbad8f51eff58139d04
X-Git-Newrev: 64aeaf3261262de952dc3b95b78095fa782fef7c
X-Patchwork-Hint: ignore
Message-Id: <20221206222147.BEC3585D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 board/freescale/imx6ul(l)evk: fix repetition of "to" string
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

commit: https://git.buildroot.net/buildroot/commit/?id=64aeaf3261262de952dc3b95b78095fa782fef7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit fb894b2e98e944e517cb74278df555fa4147d3b3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/freescale/imx6ulevk/readme.txt  | 2 +-
 board/freescale/imx6ullevk/readme.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 90355f354f..5bc03771f2 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -12,7 +12,7 @@ Build
 
 First, configure Buildroot for your i.MX6UL EVK board:
 
-In order to to do so there are two supported options:
+In order to do so there are two supported options:
 
   make freescale_imx6ulevk_defconfig
 
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
index 77acec2615..dc7c5f3678 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -9,7 +9,7 @@ Build
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
-In order to to do so there are two supported options:
+In order to do so there are two supported options:
 
   make freescale_imx6ullevk_defconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
