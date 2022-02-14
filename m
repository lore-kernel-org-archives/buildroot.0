Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37401C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6C540283;
	Mon, 14 Feb 2022 20:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLHRWADfZcC8; Mon, 14 Feb 2022 20:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8044026B;
	Mon, 14 Feb 2022 20:53:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3E661BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EA734016F
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D35nxKcC6ufn for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:53:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 411BB40131
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:53:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so187184wme.3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvpXVMyIIxKWA/RwKqWYb7YQBY3CUDyjhezU9v7IAGg=;
 b=FZyKn0MlNbZS3R9quRnQnTtzZUVCrbuZvKPfmPpdhOZdjiVm9urcdlLcswSkxAI9yl
 YupwDuqlWdX9QKHtG1sKTbJaypLwPiXOxkhjGk4tTId2MJJSFp1WRH3in2Bs+NDoPdWe
 OwjrCggZWv2oRcewdIXKKoDsDfvEERwEJSnrnygURHtMoQa+NqgdhuA2he7eaSe1Ba7/
 7n3lqvMZ4c/FIS3YZPYJUVquwQo4xCRb2uOOUnTugKTCyH0SuuAI3685XKHEJeP1X6dn
 5WRmw7ofUom+/htJJot90tAupuXERgENGaKetS4yWS+F2VzJI25w8RBuRY6HKVsn/pQx
 ZxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nvpXVMyIIxKWA/RwKqWYb7YQBY3CUDyjhezU9v7IAGg=;
 b=xuAroo0RDPDMAaJ+jZTx2tSE1vVKfxHMvTCx/ghgOr2VGwj/SsjDe+E0Rfb+kWMx1y
 4o7rMHr0bRgfpyIsRcsfhKa0xSYZHMyshE2+kZnb4Cbs2ano9Yf9u/aFn80y/p5wjiHh
 haAfliyYCPEPJ/DgG3gD9ZaXemrwO0ZtjKbRhfDuAODSxwzn6XxDG5dznK51rC6BWAX/
 ln19VhR/s/qaxqOMWwCtttnLoBrCSqoyBNCYasI590NIRRtBovXQTapINYCkU9OtetpG
 oeutaDli0G+JhfHwibcjzbBaJvK2zZx70GvtfOSj5XpOur7WOVbPniTB8A+XT6LLztMN
 dc9A==
X-Gm-Message-State: AOAM533w22wN40HlgEALPEOuu8jKa9sHQ14Jxy0WWyd4u5faPkFFniBL
 dmxPwaFdV2s8IFUy3ar3QP+C82Gv/1k=
X-Google-Smtp-Source: ABdhPJzRzaPUQf/XrVK1WAOsl0STA8CyrfX1xyMIokoDDOBEjLlJylTcyGuwd4Mlaq3t5F/47b5OKg==
X-Received: by 2002:a05:600c:3795:: with SMTP id
 o21mr466455wmr.86.1644872002240; 
 Mon, 14 Feb 2022 12:53:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g22sm12971489wmh.7.2022.02.14.12.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 12:53:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:53:38 +0100
Message-Id: <20220214205338.4142074-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: add tesseract-ocr
 optional dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tesseract-ocr is an optional dependency which is enabled by default
since version 9.53.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7322ef87546c55b29056c1d96d8bdbb7f3ba53ef

Since version 9.55.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5459f7aca1ded3b7cf96c339a2419f418aa406c7,
ghostscript expects that tesseract-ocr is disabled if threads are not
available resulting in the following build failure since commit
7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22:

configure: error: Threading disabled or not available. Tesseract OCR relies on threading. Rerun configure with "--without-tesseract" to exclude OCR from the build

Fixes:
 - http://autobuild.buildroot.org/results/fd35a47b2a77cf57c243ec1c88802b53ddca8f52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ghostscript/ghostscript.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 24a0c489a8..e869e804ce 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -76,6 +76,13 @@ else
 GHOSTSCRIPT_CONF_OPTS += --disable-cups
 endif
 
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR),y)
+GHOSTSCRIPT_DEPENDENCIES += tesseract-ocr
+GHOSTSCRIPT_CONF_OPTS += --with-tesseract
+else
+GHOSTSCRIPT_CONF_OPTS += --without-tesseract
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
 GHOSTSCRIPT_CONF_OPTS += --with-x
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
