Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F371C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C5860F93;
	Mon, 15 Aug 2022 09:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9C5860F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YAPaqLWnjPQv; Mon, 15 Aug 2022 09:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0D2E60F90;
	Mon, 15 Aug 2022 09:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0D2E60F90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1508C1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCB7840AF5
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB7840AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9D8cZjXPEv9W for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4798B40AA8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4798B40AA8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5D561875A3; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1830d009cabc62ed2a34369704ad3db254eed148
X-Git-Newrev: 47e09eaee7dd582270e3f41865aef4f7db025ad4
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.5D561875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tesseract-ocr: fix typo on
 BR2_PACKAGE_TESSERACT_OCR_LANG_GER
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

commit: https://git.buildroot.net/buildroot/commit/?id=47e09eaee7dd582270e3f41865aef4f7db025ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The typo was added in 2017 by commit
'd1103eeab3 tesseract-ocr: new package'

Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tesseract-ocr/tesseract-ocr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index a7498931fb..5e9da0c648 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_FRA),y)
 TESSERACT_OCR_DATA_FILES += fra.traineddata
 endif
 
-ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_DEU),y)
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_GER),y)
 TESSERACT_OCR_DATA_FILES += deu.traineddata
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
