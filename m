Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13274C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 10:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80B6140C48;
	Thu, 19 May 2022 10:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3mE-9geWL8h; Thu, 19 May 2022 10:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22DF540C4E;
	Thu, 19 May 2022 10:36:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31A5B1BF408
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 10:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E949842DB
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 10:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khL8RugX9iDk for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 10:36:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23B6D842B0
 for <buildroot@busybox.net>; Thu, 19 May 2022 10:36:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t6so6538515wra.4
 for <buildroot@busybox.net>; Thu, 19 May 2022 03:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nws0a2fsPHPScJNOx3bVUzcWNvjDgavo0AVnRk/B36M=;
 b=EOfKyWOjFWYibmE9JkMxE64Q9EWDcB9saUGU3j4ZyeBrqrD4zJ9LcdtEgf7QvX+NYv
 fBSjb7tl2GllfkjgcRhOl0lrCS0l3UwqMffTaSd5Un+DhQVnYOBCxz03me5n1SBvjHKm
 ZRPb/AyTO6k0Jy9XCGLb4vqtpwmBVuLpYWojMN2qCfzWgP6M/lw1NGQZIvP1gK2gdDxj
 yi6epZEkGTgGU4ErTok8jfqb9sFGquoLJ3Z6qwzq43/SkDLALjNkUHnAjz95osh861tT
 CjrcNiVNpsub3dZ+cNKZ4CxlGR/LjGj3qz/mIjv0v7fWRxDml9CossjtbVmyAtxcZ2U5
 JN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nws0a2fsPHPScJNOx3bVUzcWNvjDgavo0AVnRk/B36M=;
 b=rgaMNWgUyVO+VjPVbDsjew5jazBWWqOLUHao4wTmDatSd7Aw/moq3Aysy3FJS8+8pF
 c3vnMiQvCuOKT5M7AohBFqyFpazoITDTJai0/F7MIZ6Rpi+eEBPhInqNx06rStHU5Vl5
 JIat5GLi5xnzGpGuAJYZv+/88dzOJRGs0LeIf9J20zp/b9FThHN2+gRznr34LjjlAU5s
 ELP1AebXV57lcVHEpOjT16B80N9eMEEbEeYdXYhkY85hPR5FOUUT7mIPyhAUE8pTXuyA
 jcqrPdSbrhlzLfvszbMy/pJdIPtwC9+lhm68M6j669mKCrQYILZVm5suqFtmC/owDWIc
 dlsg==
X-Gm-Message-State: AOAM53368IR/ROncXRwKVz9xuZ0bcOXUH4TwAvcZnTG9e06w1CkcTb5B
 3M0Sj+2dRH1YCy5o5MpGTk14b7kQE+8=
X-Google-Smtp-Source: ABdhPJxIpoHi6x4pKg03QNicDNBqTb84DRrDq5MMQqlbP4J/kTncMHwPaMWkmqx4V09ZtxIvhtxEyA==
X-Received: by 2002:a5d:5541:0:b0:20d:a89:ae21 with SMTP id
 g1-20020a5d5541000000b0020d0a89ae21mr3468450wrw.176.1652956562980; 
 Thu, 19 May 2022 03:36:02 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b0039444973258sm8415611wms.0.2022.05.19.03.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 03:36:02 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 19 May 2022 12:35:35 +0200
Message-Id: <20220519103535.1806705-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.5.3
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
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index c3590798d..7a7638b2d 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  56feab8e21c3fa6549f8b7d7511658b8e98518162838a795314732654adf3e5f  libressl-3.5.2.tar.gz
+sha256  3ab5e5eaef69ce20c6b170ee64d785b42235f48f2e62b095fca5d7b6672b8b28  libressl-3.5.3.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index a52a15c67..85d1fe5e3 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.5.2
+LIBRESSL_VERSION = 3.5.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
