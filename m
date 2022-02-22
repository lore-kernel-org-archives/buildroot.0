Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 11:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6FF14089A;
	Tue, 22 Feb 2022 11:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id US7gJz6YMqb7; Tue, 22 Feb 2022 11:33:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE4554099E;
	Tue, 22 Feb 2022 11:33:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B58CD1BF865
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B28DE60A9C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 11:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQ1TzvKNLDqv for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 11:33:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A836B6006A
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 11:33:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a8so42040874ejc.8
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 03:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AseLixs+Yfp9R9xqe11KT7hHwhkRG1nCbMJA+Dn66AM=;
 b=B+O8nz6Znvfhoe1+EM0FWuWRi5I7tPoZQKy9A/Pm9rnaWiyPVDRXbdU81p+u5wnNYd
 GSAGoEkf3WtpG8WdKESFtxbDvXIXB0/7ucSeXQEJ4CXzsl7eUWs+XTZu878I+vcrk8R1
 ooBskRIoyRhC9c2mNj2aGc7RwY6v1uTidhaqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AseLixs+Yfp9R9xqe11KT7hHwhkRG1nCbMJA+Dn66AM=;
 b=VFS7uF0s3I0w6J7o9Cx/mf24z+Q8ZDXHUM5Dm7OnIimihaS2V+lDpN8uSI0F622Qpc
 8zbaxiSzZeAmza35w/nVuNAoxfEZ5New3wd17qpSuayWSEh8bKxRn91ZYguXSWHHFVcr
 N+J1OVn7XkM0GITXapkyn5zr1jMyeNzw+C9exySBToL5+BWA2H679EoyxVfQsEYh7U6A
 1L8PcVJR0oYv3tZo6YTqrReKpbLtVlg+NO6AEj1AJ+hVZpQCB9OPO/hdC/2J8VsVa+W/
 Uxd3Wtup4TMZzh5BW8R4uCngsFXCf2pqj2rYe7CAsThT02CBig6OBO5mWABFjbcWl1/i
 xXjQ==
X-Gm-Message-State: AOAM533D2SnJcDRZC3B6THjZseGgYRFg9oP8nHfOdSoXB6Z/hE1Ws4mY
 rapakweB+zJGYVUBPxXJ6vcyCOkwPfKglQ==
X-Google-Smtp-Source: ABdhPJxaZhIe9RxihruHd8RWxj39ZjY7aACj3Od9oO9t3c6dJ59FBbrvqXzxOFwy277DD4BNuMuajA==
X-Received: by 2002:a17:907:2358:b0:6ce:98a4:5ee5 with SMTP id
 we24-20020a170907235800b006ce98a45ee5mr19384070ejb.464.1645529618876; 
 Tue, 22 Feb 2022 03:33:38 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id e1sm6177920ejy.103.2022.02.22.03.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:33:38 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 12:33:36 +0100
Message-Id: <20220222113336.2608916-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 9.0.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index f3ca8e6014..88a5d7cada 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  c5af6e413d2fe9247cf16ce25c816b14  Pillow-9.0.0.tar.gz
-sha256  ee6e2963e92762923956fe5d3479b1fdc3b76c83f290aad131a2f98c3df0593e  Pillow-9.0.0.tar.gz
+md5  8deffccb4f402df154fd2fd504d8487c  Pillow-9.0.1.tar.gz
+sha256  6c8bc8238a7dfdaf7a75f5ec5a663f4173f8c367e5a39f87e720495e1eed75fa  Pillow-9.0.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2f2e817882..901876e0ee 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.0.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/b0/43/3e286c93b9fa20e233d53532cc419b5aad8a468d91065dbef4c846058834
+PYTHON_PILLOW_VERSION = 9.0.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/03/a3/f61a9a7ff7969cdef2a6e0383a346eb327495d20d25a2de5a088dbb543a6
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
