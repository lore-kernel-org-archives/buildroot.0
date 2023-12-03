Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D87C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 16:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236E7415B5;
	Sun,  3 Dec 2023 16:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 236E7415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtQfFg_jcxmx; Sun,  3 Dec 2023 16:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7768B41584;
	Sun,  3 Dec 2023 16:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7768B41584
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DAA151BF471
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2AE940467
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 16:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AE940467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zOt0bN4OSHrD for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 16:45:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4C634013D
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 16:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C634013D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93691877AC; Sun,  3 Dec 2023 16:45:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:45:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51cf6a8aa6132385f81c34bbd088924b653b93b8
X-Git-Newrev: a7898055d34950a872b7cb0fe2fff2895b1a9289
X-Patchwork-Hint: ignore
Message-Id: <20231203164541.93691877AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx: append /imx6ulz to
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7898055d34950a872b7cb0fe2fff2895b1a9289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx6ulz supports freescale-imx too so let's add it to the bool name for
completeness.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index fe3f265941..1c26b3cc6f 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	bool "imx6sl/imx6sx"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
-	bool "imx6ul/imx6ull"
+	bool "imx6ul/imx6ull/imx6ulz"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	bool "imx7d/imx7ulp"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
