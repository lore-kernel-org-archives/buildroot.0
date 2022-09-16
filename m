Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43892C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D71A841CC3;
	Fri, 16 Sep 2022 11:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D71A841CC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RHWy1rOHZZZ; Fri, 16 Sep 2022 11:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A043841C8F;
	Fri, 16 Sep 2022 11:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A043841C8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1D01BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E060A6121C
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E060A6121C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEFpHl0Y8xuq for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB55361226
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB55361226
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D8ED283CC2; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:29:49 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4769b669d770ee1ceec400aa62892cee0773cc32
X-Git-Newrev: 686725883a2daf6d55c545a0f358366bc8be61de
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.D8ED283CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/directfb: drop
 bogus BR2_PACKAGE_DIRECTFB_CYBER5K
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

commit: https://git.buildroot.net/buildroot/commit/?id=686725883a2daf6d55c545a0f358366bc8be61de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The inexistent symbol is reference since 2008, see commit '8a12bab608
widen options to configure directfb, patch by Micha Nelissen
<micha@neli.hopto.org>'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b24ba50ab1e9b080900b0f24a329e222904ce370)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/directfb.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 56a396ab99..094e87e7e7 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -67,7 +67,6 @@ endif
 
 DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
-	$(if $(BR2_PACKAGE_DIRECTFB_CYBER5K),cyber5k) \
 	$(if $(BR2_PACKAGE_DIRECTFB_MATROX),matrox) \
 	$(if $(BR2_PACKAGE_DIRECTFB_PXA3XX),pxa3xx) \
 	$(if $(BR2_PACKAGE_DIRECTFB_I830),i830) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
