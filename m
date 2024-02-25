Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214ABC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 09:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE48F4052A;
	Sun, 25 Feb 2024 09:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrOjIVX0qK5Y; Sun, 25 Feb 2024 09:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF2540532
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF2540532;
	Sun, 25 Feb 2024 09:24:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BECD1BF28D
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 09:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 754764013B
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 09:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9M-jj9qFfdd for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 09:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 87F4640112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87F4640112
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87F4640112
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 09:24:30 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-412a390347dso1230605e9.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 01:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708853067; x=1709457867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7CEKxewXQp+U0oa6u9QQgIsHPZ2CjKwbXoVnQ+5u21o=;
 b=a8eV3LzWxSC8Cwd6eiVxeJbBLNRbNCyg43vmuv1cYvuWwvyMEpp98i/2CJpDM6F7AP
 +gEXzYDhCR1kgx9LzQeeJ+kHP1WExNB6c3Tsi2ItZAAK9u4G1BoxMwrwO1y4/hhCp9km
 BycrumIPGZfiV8l/bWLNM8tXzxGBH2H5ZWOB1AO7Vgtd1J1jw5IHrO0XJ8DQITZYqy+i
 B7eWcjNMVMOLUicRspyDuQyTBTaSyQkLQZFMWenRsbvpt7KjGkaIt0OfDLoPJdE2gveZ
 VtMKw8e1gMfgdi35t09F9Y12KopfkEGQ7WP2oramD/XKxwJfRapYhCoueykO7IZT1HeU
 O1Ow==
X-Gm-Message-State: AOJu0YyPPJ0f8KtXAbDxRT63WAR9ErlGZyrm5p4AYShkbCCNLGw57bkZ
 oIOGVu7bREW4o8y8bhQn47w+s2xrsrMxsNDPPdx2Zmxe/W+VQwFZtDWZ/WLP
X-Google-Smtp-Source: AGHT+IEpVHTWfmMCA4k9iKkqvzin1SOGoH1rWA4BJQ4LKKWLm/blSqOsN59Dtj9KpvoJuzTmIVIIqg==
X-Received: by 2002:a5d:6707:0:b0:33d:ca56:a61f with SMTP id
 o7-20020a5d6707000000b0033dca56a61fmr771187wru.49.1708853067426; 
 Sun, 25 Feb 2024 01:24:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bq8-20020a5d5a08000000b0033b684d6d5csm4613594wrb.20.2024.02.25.01.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 01:24:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 10:24:25 +0100
Message-ID: <20240225092425.783094-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708853067; x=1709457867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7CEKxewXQp+U0oa6u9QQgIsHPZ2CjKwbXoVnQ+5u21o=;
 b=EqoCJmt5W8fkHZCUfr0cNffjlS+JAOq14vo3vWoMgceBcqQ3L9/RTyZxHm0QN/MJue
 beFz+4zgibKWY4pVTyQ5+RLldtrFRUhLHOY4PSCMQq+IzXMD3qFkEUC9kzUjJK9JOl5u
 12OUEGvytCV4XbYuuJCrcVzu+qRJvNE2uVn7izV6a6mjEpccSUP39wVPFYOIz/MmyMLa
 y3jCVzPNwzwN0msjPgtpmzaR0tNMH1xRrBfdxUlxwrGjwjoXFp9EctOg44KqmtKGyqOK
 InRD94re8RDIl6lF7CH0fTKp4VL417mFHRBPyAXxF2cClw9YiKNHVdLZ6ku2wzeTOh8k
 taKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EqoCJmt5
Subject: [Buildroot] [PATCH 1/1] package/gdal: add openssl optional
 dependency
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 247e13663c..77ffb514c2 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -46,7 +46,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_BLOSC=OFF \
 	-DGDAL_USE_BRUNSLI=OFF \
 	-DGDAL_USE_CFITSIO=OFF \
-	-DGDAL_USE_OPENSSL=OFF \
 	-DGDAL_USE_CRYPTOPP=OFF \
 	-DGDAL_USE_CRNLIB=OFF \
 	-DGDAL_USE_ECW=OFF \
@@ -130,6 +129,13 @@ else
 GDAL_CONF_OPTS += -DENABLE_DEFLATE64=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+GDAL_DEPENDENCIES += openssl
+GDAL_CONF_OPTS += -DGDAL_USE_OPENSSL=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_OPENSSL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 GDAL_DEPENDENCIES += postgresql
 GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
