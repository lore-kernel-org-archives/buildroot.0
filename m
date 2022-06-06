Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA05C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B178661075;
	Mon,  6 Jun 2022 21:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dz_gPDxBqaKD; Mon,  6 Jun 2022 21:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9CEF61055;
	Mon,  6 Jun 2022 21:40:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 759901BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C3FB4156D
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Utr8VH96WG5N for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:40:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 133AB408DC
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:40:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d14so12525942wra.10
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAHpNeCzj7HDhZ8JB4yd2aarA9vqK05T0Cv798Ovky8=;
 b=YEgOrTFamln7cZ2LjD9HzHytvdSeNz6EYI19gDxZ/tJqUtyUFYcecd7/MFeNegxVy3
 gM2ySqx2LUk8qNYAdPL+9IHxWsMyepNtAR57RXqdZH1VbzD/3nZ+fnL67gAnrW5W3Wn5
 7eFZiCgLAx1sSxkKHDnPiX95H1OKhjijCneghyuDdgKzGo2VXHqzA5rKeZYK0Y1Aa3h4
 sjQHDZ/42vFhXL1WNhaTxmOR6xgK4es3E+mlWEn5LxH55NyY3PDesHd/JLYVIXxDNJ1n
 YiPQCp7z83I/J536sTIj9t2vtmSEWgjjw+Rd//9As3mx+532I0UPpcc35RVLlDVfoR02
 pWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAHpNeCzj7HDhZ8JB4yd2aarA9vqK05T0Cv798Ovky8=;
 b=IWu95jNwtFoIhgfvieFzpK87Ma2JytURAXBof3RJXX6SaRQ6qmMMjZBDpbXD07IWuS
 alq0mQmwRN0x/FhRNbbeQ8+tA/BVhVDRGYmwU8b0glcmJYgOXv6ik5LGlky5DJblpoeI
 t14Ho0izNh0Xj8yBSstIciFXX4Y1EKmhddC/tT2EFJCsu70FdmToXnoieJVUYIGGlTdO
 xn+vHksHCTol9Kt+nMoD+JOx8+nWiv686ZR5fhOj81niHb6fEInH/GJ0VsLzuosIFiWH
 9PZHZ7IRkmfzXPPzYk2xAKPOJuywrp8QmbssSFeWdkIeJ9Igi4qUn+XcWZbwyyJLX7Fx
 fIbQ==
X-Gm-Message-State: AOAM530KwpO5pX1Jb/JcW15BjKWVTY1STazwfE5Dfzaa9UROlbSIj7fY
 Rqokm2pNPSyhQSiJjVjw8G9P44cbvzE=
X-Google-Smtp-Source: ABdhPJxRzjJ5r/HAWJQRuQkmnE965m5jpXAMUytQz/Q/tvoSLP/SRdLuyEZW2e0tYPAp57J7rH5pCg==
X-Received: by 2002:a05:6000:1f86:b0:210:20ed:e2c4 with SMTP id
 bw6-20020a0560001f8600b0021020ede2c4mr24330734wrb.200.1654551605125; 
 Mon, 06 Jun 2022 14:40:05 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a056000000100b0020c5253d8casm16233984wrx.22.2022.06.06.14.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:40:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:37:34 +0200
Message-Id: <20220606213734.20571-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/expat: bump to version 2.4.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libexpat/libexpat/blob/R_2_4_8/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix sha256's tarball

 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 26f1098b7a..b8e7aa27f1 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.7/
-md5  75a1f475e30281a00cb6f083ea481159  expat-2.4.7.tar.xz
-sha1  032ceaa11cd791d4bc622bbf0d835b8766207796  expat-2.4.7.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.8/
+md5  0584a7318a4c007f7ec94778799d72fe  expat-2.4.8.tar.xz
+sha1  e30345a20d0cc29a0c307eb3703e7a9bb62afa90  expat-2.4.8.tar.xz
 
 # Locally calculated
-sha256  9875621085300591f1e64c18fd3da3a0eeca4a74f884b9abac2758ad1bd07a7d  expat-2.4.7.tar.xz
+sha256  f79b8f904b749e3e0d20afeadecf8249c55b2e32d4ebb089ae378df479dcaf25  expat-2.4.8.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a42c77e0fb..e89de81da7 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.7
+EXPAT_VERSION = 2.4.8
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
