Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9CFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 19:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37C4841E6;
	Fri,  4 Mar 2022 19:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6wkC6gaZSJe; Fri,  4 Mar 2022 19:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E12841E1;
	Fri,  4 Mar 2022 19:32:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76DEC1BF2F8
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 19:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65DE160FC9
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 19:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QV_eheMbbdPn for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 19:32:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CF8460FC8
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 19:32:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id u1so14081167wrg.11
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 11:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTVM0xH/eE2+iu0szeeJmzd0yNze9YTufkwzWh89tYg=;
 b=KTU8zhStH9zIecjzAKoIKgil3oPn7tMX+lEeHRElNNQ485r3xaaQZgQtzsyAPCKZIn
 dgWAyI5i6rmvSm9ht1y5OjEaEUlQOnexXHknqaREa0PAGKxMcnv7w6hln/mmVAxWTVGk
 b5ifEdmN0hqrkUz3PBe9CCqkkUt09z/3IgdMDXyX3ebt/7rWXcFFYXcvg22O/yerA0w2
 DjNb9UnKxk3JzYsfQTI8GhmFJ5IwA2PsQQz6Q7i92lX+m4nZsN5VKsXPugbkM9BzvimL
 JWurko/oAG10NPSX6ntyz81NM3Y9TTRFgvoyrBESA6tymXDNSvezxllNsgvk0G1O463J
 bhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TTVM0xH/eE2+iu0szeeJmzd0yNze9YTufkwzWh89tYg=;
 b=aDTTTUJQRUqOY00rxy+lWFDszLke1U37dTwhfgk+SXY5oHXHfhHJ6RRxZDkzKF8cPJ
 +CvSBVkNs4izHs3CS/WLmBXcD97XLFt7nT92NKZK9kSRQhMQ9RmLeI2803PGgQrlUeTu
 OyrXC3A/i9AWQ+xE/WbF3JIGeNEULvOVKZg3Zd7bUTg//bGnLI7PbTGhECsUWzc5hCdx
 Uo7N0v69CSVOVoQIxXutbHJrX01+eM6j90k4m06oAyUHU52tlVHXQTWpmLpYjcpZF9h+
 UiWpvoIIQ9amMHiIvXcGZo2BoLT4pM9JLNYl8WnAxYgJg9LHmuMmucHKPf0H1gu90jEy
 gmXA==
X-Gm-Message-State: AOAM530dzjr7ooD16oeNziwnkO5zo4TLYFpPaI4ViEXLgBDoSpbxKUte
 gGuZDf44fsNU2Ne6v3MeaMUNJA+XUag=
X-Google-Smtp-Source: ABdhPJwqZJKNWz+v11FA3qg87tLeCffPLF11BWeJYJz5JmKADxzLBOc8tAlpiAeG1UcKObWg3BPEbw==
X-Received: by 2002:a5d:44c1:0:b0:1ef:78f8:127e with SMTP id
 z1-20020a5d44c1000000b001ef78f8127emr206399wrr.592.1646422369146; 
 Fri, 04 Mar 2022 11:32:49 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m10-20020adfe94a000000b001ef57f562ccsm5180119wrn.51.2022.03.04.11.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 11:32:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Mar 2022 20:32:10 +0100
Message-Id: <20220304193210.4025746-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/jpeg-turbo: bump to version
 2.1.3
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

Update hash of license file (date updated with
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/172972394a51352d0b67c30f20041e69a98d78b7)

https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/2.1.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 10 +++++-----
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index de82199659..a892fd3eaa 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.2/
-sha1  65c51c543b1fbba6db9ff5bee474ccb0b52a929f  libjpeg-turbo-2.1.2.tar.gz
-md5  e181bd78884dd5392a869209bfa41d4a  libjpeg-turbo-2.1.2.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.3/
+sha1  6dec48193bb27e1c07abae8230031ce9ecb1cfec  libjpeg-turbo-2.1.3.tar.gz
+md5  85244dedeaf06f636a9e7ddea6d236d8  libjpeg-turbo-2.1.3.tar.gz
 # Locally computed
-sha256  09b96cb8cbff9ea556a9c2d173485fd19488844d55276ed4f42240e1e2073ce5  libjpeg-turbo-2.1.2.tar.gz
-sha256  7d8683a7f048e715e08b4cada8b7f0d9a6ab8afad88ed09c1143ef764ecbc0f2  LICENSE.md
+sha256  467b310903832b033fe56cd37720d1b73a6a3bd0171dbf6ff0b620385f4f76d0  libjpeg-turbo-2.1.3.tar.gz
+sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
 sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index ddae019839..475eb5fa84 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.2
+JPEG_TURBO_VERSION = 2.1.3
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
