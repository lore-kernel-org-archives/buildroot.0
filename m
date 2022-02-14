Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEF7C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EBC260BA0;
	Mon, 14 Feb 2022 21:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vr5TjXvJKSsU; Mon, 14 Feb 2022 21:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DF2360B78;
	Mon, 14 Feb 2022 21:22:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B75211BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E1641499
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MazFliXGGYct for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:22:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BE254148B
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:22:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p9so8384129wra.12
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7IcVeO4CmFI6i6oRkH17gq5IOp9wYbRnkXP/VYN3ZY=;
 b=FnkF3V1Iq1Nv7Kd7vVfUSUp8znY5UGEiM9XkXOoAB8at6T2t+KE8IHI8fFxqaCULZe
 BvbB0Y+yendaDO4mRbP6VJ6gcFHC4NF1zObZIdQAuCNAUv9lgrRePMZUsqO7iDaIQTKl
 KtD08k86JDzy+Yn//R5pm+tCi7OXdIWBhchMCrYk7YSC1n30gcYcG29JEj8tqzLBRzj2
 IiEQnZW329b7+zK9Jy0uYlCZNZetJVYr4AgeM5B8dKzEUUcZ2vVQrvSMaRsTMAr7Vpsw
 mWkiLQFjVbfEVpZZ9tW9fQ0X8Yv3N0ItDwMhRFTjQqMN4ddegvO5h3xQMjHEBtJZfKbQ
 gjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7IcVeO4CmFI6i6oRkH17gq5IOp9wYbRnkXP/VYN3ZY=;
 b=CeCrT0NZv1nUf0UZVjy2Wfcoyv9xsejNw5mu+KjGBYVmMQ/OprRaPJkYnTA1kFj5Ul
 JSP6fF58xIknRp2mKmC6e+mt1dk+wN9eNxUitQzZmJc/vsYQRO4I/XGMF5oCwkyD/e1u
 cTSK6uRvNctFLA33hgLDvT3PD+F82/Jyuxgzsnt2ZjJBewoIEmeI9iHQr3K5y5vqVhCk
 8Pz1O1dQHPMOi7D8oxxJQlqbQoCDKJ5U8i78P04MEVCAA3oHGTl1is0NAjpW+4LKjQdL
 D+wUDP4ICJPuJu1kL/aSun3I+BequutO/knAI8IcDIUHChaq5SUT0sjzNYNsbFPntF9Z
 NNIA==
X-Gm-Message-State: AOAM532/1YRknIWlFCM1y+2mId4Ik1He1hgZvM9xwZrOK0W7Uk2vQVFa
 gWkhtvjD1eAUYjMd+USguokS8xRH0cE=
X-Google-Smtp-Source: ABdhPJzCT7D4XSrXu8CAALyvzg4tjgiAWfC9lFlWvmcQM4eIDFJtTzeUV7bBzXIZE0Q9kTovduYCqg==
X-Received: by 2002:a05:6000:2a5:: with SMTP id
 l5mr691096wry.279.1644873769658; 
 Mon, 14 Feb 2022 13:22:49 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t16sm3772596wmq.43.2022.02.14.13.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:23:01 +0100
Message-Id: <20220214212301.4142823-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/ghostscript: disable tesseract
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

ghostscript embeds a local copy of tesseract-ocr which is enabled by
default since version 9.53.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7322ef87546c55b29056c1d96d8bdbb7f3ba53ef

Since version 9.55.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5459f7aca1ded3b7cf96c339a2419f418aa406c7,
ghostscript expects that tesseract is disabled if threads are not
available resulting in the following build failure since commit
7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22:

configure: error: Threading disabled or not available. Tesseract OCR relies on threading. Rerun configure with "--without-tesseract" to exclude OCR from the build

So disable tesseract as there is no way to tell ghostscript to use a
system provided tesseract-ocr package

Fixes:
 - http://autobuild.buildroot.org/results/fd35a47b2a77cf57c243ec1c88802b53ddca8f52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Unconditionally disable tesseract

 package/ghostscript/ghostscript.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 24a0c489a8..b2e5fe16bb 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -44,6 +44,7 @@ GHOSTSCRIPT_CONF_OPTS = \
 	--disable-gtk \
 	--without-libpaper \
 	--without-pdf \
+	--without-tesseract \
 	--with-system-libtiff
 
 ifeq ($(BR2_PACKAGE_JBIG2DEC),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
