Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01CBC25B08
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1C281370;
	Mon, 15 Aug 2022 09:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F1C281370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjCYlq9Yq2zN; Mon, 15 Aug 2022 09:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 762A881348;
	Mon, 15 Aug 2022 09:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762A881348
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A035E1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A073540A96
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A073540A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mll_Qe68IxKJ for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36B940ADD
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36B940ADD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DAB4E875A7; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 086968e8690aac239d4f7f14d6d1c62dcf065a5d
X-Git-Newrev: b24ba50ab1e9b080900b0f24a329e222904ce370
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.DAB4E875A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/directfb: drop bogus
 BR2_PACKAGE_DIRECTFB_CYBER5K
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

commit: https://git.buildroot.net/buildroot/commit/?id=b24ba50ab1e9b080900b0f24a329e222904ce370
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The inexistent symbol is reference since 2008, see commit '8a12bab608
widen options to configure directfb, patch by Micha Nelissen
<micha@neli.hopto.org>'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
