Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6EDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 05:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D66E403D0;
	Tue,  3 May 2022 05:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5EKPoCp3ljC; Tue,  3 May 2022 05:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8994E4094C;
	Tue,  3 May 2022 05:15:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27F101BF31D
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 05:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16BFD82F13
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 05:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gmraqy6LsTHc for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 05:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1860D81DA3
 for <buildroot@busybox.net>; Tue,  3 May 2022 05:15:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e24so21842715wrc.9
 for <buildroot@busybox.net>; Mon, 02 May 2022 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bE5qIvLJnWZ7AcvwuLMZyNQ4sOleoWddLEwxGMw0720=;
 b=O0OQkxVCoOvNeszWhKHEVuRoIuiUhMoWLAVAyAgmk/qh7LrNSV1LHV7YdMrz45XmUX
 bB9/VbBgUFuWqHWjktrpJHiyZgSllgNpGF6U8/9KwOCncE1bnjBgOlZinfZv+VlV8FFJ
 1PqCNkLs3iGaHOr01J6ceaIRwLvjVGw0kcprSGtduqCN1UJPrWMyWKRrDy4lt6VGh/Bi
 SXGuEpmh5O0K2s6ni/5qIqSusRWMp1M3sjGNMZEUf5EG92LI7h/0amKDgX9+5gjuPhjU
 vNrI7fY0tjObYUf3CKx4EQNwbiEvUUbSq+279rfGz1zfFkRxYl7jtftQxJ6BPb3d3XXC
 5szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bE5qIvLJnWZ7AcvwuLMZyNQ4sOleoWddLEwxGMw0720=;
 b=gZhWh1bAI9zhicSv2TAHAfMlFTQbNnryNHlRLFHp5/Ou416Q8LiEWS7amDw0YuFUW6
 9zDSSABOVmjCi48sDITWpbNxiwbx31kcz/gqV7pwYGrb8jyZEfn8To80g0Dm5OorrsXQ
 9HOBCa3A9KALg71QfGcriJwK8BSr3fX9O7V/QuNxWgKmO3KsjJxWNN/vpfrukZvv56ep
 zxYlHX2IQBnaa1J5VpaH49kRB3oU/mK1EeNQRWtnJfIQ5sBcGKgoSWqKVA6fPXUnE5dG
 HjbE5CX+B6Oom4KE6VBNAgPczXD4WyjE0ohyDfuddNCVvkfnGtLl2+DOkrqRCgPouLhp
 yHDA==
X-Gm-Message-State: AOAM5329LXJ8woW5f8xvc4R9IOJF/1K00SGTKeff01wEaOXOZDUOkTuI
 wtjKGT4HbUWGTSIlH3KYhpyRkKyH93A=
X-Google-Smtp-Source: ABdhPJz4cqZGoipN7dh9q2Y+SQ/2T0S/pxgFqbJiDc3lP+F9gHq30MtHYnEre5IxuOueeOHKWGh8ig==
X-Received: by 2002:a05:6000:1b8a:b0:20a:eb17:545 with SMTP id
 r10-20020a0560001b8a00b0020aeb170545mr11345149wru.373.1651554947063; 
 Mon, 02 May 2022 22:15:47 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 v26-20020adf8b5a000000b0020c5253d901sm8609096wra.77.2022.05.02.22.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 22:15:46 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  3 May 2022 07:15:36 +0200
Message-Id: <20220503051536.103523-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/freetype: bump to version 2.12.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 78d0ba20d..a558a3e84 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.0/
-sha1  fd1eb1a27f178808e1d8ccd82c71abfa5d0ebe13  freetype-2.12.0.tar.xz
-sha256  ef5c336aacc1a079ff9262d6308d6c2a066dd4d2a905301c4adda9b354399033  freetype-2.12.0.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.12.1/
+sha1  5133eed28a7624ffabbf6d00aa3f68b841d62d80  freetype-2.12.1.tar.xz
+sha256  4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f  freetype-2.12.1.tar.xz
 
 # Locally calculated
 sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5c6b8c73b..36ef3cb52 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.12.0
+FREETYPE_VERSION = 2.12.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
