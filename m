Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0931C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 21:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E368429D;
	Fri,  1 Apr 2022 21:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhcIB8wThR5C; Fri,  1 Apr 2022 21:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA41D84285;
	Fri,  1 Apr 2022 21:11:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3BE1BF325
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E52260F28
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZX1LoRTS4pdL for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 21:11:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ED0C60E89
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 21:11:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w4so5883206wrg.12
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQQ6LLKf6wLDBswgot0Z5h/mbIO3WOEnS1/xa84lHWQ=;
 b=kA8b1Wf4PPrslGR2P38KYyaNSDwQ2yH0CcmB7w3WfSpRAmyfsaMB6jWAgUhA2C+6lF
 9nMPYuV69tmvC6DiIsIdcWg+R0mVh51Ool8B59z4zo/Ea3NXc9gfVCu74To87N2Bi/or
 lkYIhSGCbnnBsNjuj2IMyBXVSVE52Ij2ZbTTG4YyPyg2Xz3oEXaLTar6oceyOUVpx2XE
 EXQx0E51ged0qH6x2yFXUOF89YY6PdTMlsg2Llq5vNdVP34MxGCxlCS2qStx8dUN2bKf
 HYYHA27q9uZvr3cylTie9B/yJAMEyXaGwVRG6cngCWAOy3rSgJlE0M3kljyjjLpYmPMZ
 4AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQQ6LLKf6wLDBswgot0Z5h/mbIO3WOEnS1/xa84lHWQ=;
 b=LejFrpVOk5LmET8qZ4UytAzTuTENVXhut6raEXTn++oW6baU9VB1pocdatW1Hx+QNA
 T339U3kmQYd54WeW3Y9vHqYtZvydRx0djWk8Qzh9EcGnXKijJ8q1pHRcIwH1OAI2j+An
 upBdwoN5V2880u/8gTz1dwOouQLGDZlcCMsj5n7s39kW6SoD80On/2iEA5JHDR9eXH3s
 M7BkjRa8Vk5hqUINQn909B2dKyhej/IgfFRo5y8oKW2eM1YzHAeU/mnT3L3M/Uw4glOE
 MFOcYQlVHvkgqpGsRG5had0wAGdxz7646tFRm9w8ye3OpAThLaVZ7afpvKO90Kkau4nG
 JibA==
X-Gm-Message-State: AOAM530GwpYfUpEGS6qJt6lQzpv6vDD1+mCSIedCt4Y1TeRVm1327VEI
 5m8FLxKn2dIDBgIdXKb2P+Y8YLiQBmc=
X-Google-Smtp-Source: ABdhPJwdwdENAQi0wItERSnfk8Hd+Z4F593vhtn+x0vJNkY+1N6mID0bTG3Gi+Cg2SB1BxauKLUAxQ==
X-Received: by 2002:a5d:4ec7:0:b0:203:de83:6f44 with SMTP id
 s7-20020a5d4ec7000000b00203de836f44mr9033280wrv.56.1648847498497; 
 Fri, 01 Apr 2022 14:11:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm10594112wmn.46.2022.04.01.14.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 14:11:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 23:10:05 +0200
Message-Id: <20220401211005.1052795-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgeotiff: bump to version 1.7.1
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license, "X style license" means MIT:
https://github.com/OSGeo/libgeotiff/commit/5d6619c1168845c5bd77686f01e197a82854cbf1)

https://github.com/OSGeo/libgeotiff/releases/tag/1.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeotiff/libgeotiff.hash | 4 ++--
 package/libgeotiff/libgeotiff.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index ec9fccb492..883199501d 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc304d8839ca5947cfbeb63adb9d1aa47acef38fc6d6689e622926e672a99a7e  libgeotiff-1.7.0.tar.gz
-sha256  6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375  LICENSE
+sha256  05ab1347aaa471fc97347d8d4269ff0c00f30fa666d956baba37948ec87e55d6  libgeotiff-1.7.1.tar.gz
+sha256  a822a731a7ac4ba7d8f18fa0dc29db2e68a5dcfc315b46e4a4c8956720d55d93  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index c49528565d..6ab60c93fc 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.7.0
+LIBGEOTIFF_VERSION = 1.7.1
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
-LIBGEOTIFF_LICENSE = X11-style, public domain
+LIBGEOTIFF_LICENSE = MIT, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
