Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7175C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629D460B43;
	Sun,  9 Jan 2022 22:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGiXWN-MlYbj; Sun,  9 Jan 2022 22:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C492E60B12;
	Sun,  9 Jan 2022 22:17:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5468F1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4279260B12
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uOEUAH0_kQ3K for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:17:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90F6B60ACB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:17:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r9so21564119wrg.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl/yL9UFhfYkbfeOQj7xJ4M6NGW4Gqc2ulKg27HnOiA=;
 b=k1bVIOBT9m+jP87zUX6O/ftRi1d0J9r/SdcjktZVFCU+3/xLpyQKG6FzUV2zAubBFC
 qGfL4TdlHcA38+c9HSwa3sman26WQbjoL8FY+u93F0ht//AKoDSyKXJ2FvcXq/JtWAWj
 3E2V3wD2phpjRyp+52mM8jtba6YJlMam2R54Yg59LZTe4QSoBc7duZXXRLz2I3rUJiy7
 MtfDL/KGicb0AtEQDT4d4P1KhwoFeat6v0zM4zUvxjV9ZABNzTa3xiyWoGn9WMgnSHR+
 3dg5KGIOTaDQIsB3mE4FJgXpT8zDNJJCHB0uw1i1JgqbHoOO8/KGhRzMPNGXFpleLtJa
 koGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gl/yL9UFhfYkbfeOQj7xJ4M6NGW4Gqc2ulKg27HnOiA=;
 b=Duw9MDPbQZhxwJ876xoxG7Qlf4vbD1wP8F/CKz9PurJrQMTb7REThjuYIwmx8mNfyP
 Lvm9Pp6Du9kQYAzLvrOFsa7qDAZetzPfP3mhYsKTjcAsd4TCx07jtFc09n3HwCnM5AjR
 tnUgxXwkqRBIBhyoqSSscBMsQF1RfiCvgli33JF5qVkJCjn42DmSZthFQd9zYfnGN6ym
 6/AggyrW3M4sAJlSElBdqlizTzij4t/GpLKObGLnwkhG2O6iY8z1+tKOUdJqpvxBw8Nm
 OaI1VboyaBDQOr3aQH0M1NFpPkRe8617uHOY3FKFLyfD07hvif+kP6CcZa0j7lWWXhiZ
 9ztg==
X-Gm-Message-State: AOAM531AYF7fKPPoHe89Wrpz1co8ko38PbwdHAn8TaZnKyRoCJDWoUDI
 LrHVsOZI/ZC+yG6d7Kz8zn27g39lbRI=
X-Google-Smtp-Source: ABdhPJyum/hAnfv5+7xJLl5Boj9Nvk2IIuIu7iKD9KffkI4tqKvZGV0G1uHG18J1ga0/0QGXyweKyQ==
X-Received: by 2002:a05:6000:1569:: with SMTP id
 9mr63832487wrz.490.1641766670638; 
 Sun, 09 Jan 2022 14:17:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id ay39sm4965950wmb.29.2022.01.09.14.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:17:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:16:32 +0100
Message-Id: <20220109221633.1307381-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/hiawatha: mbedtls is mandatory,
 not optional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

hiawatha is unconditionally using mbedtls since bump to version 11.1 in
commit 24e4c888c3d36e3943206ea55894b84344cc8b2e (e.g. wigwam.c includes
"mbedtls/md5.h")

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 017592de1e..ed9f8aba54 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -11,7 +11,10 @@ HIAWATHA_LICENSE = GPL-2.0
 HIAWATHA_LICENSE_FILES = LICENSE
 HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
 
+# Disable system mbedtls as hiawatha needs mbedtls 3.x
 HIAWATHA_CONF_OPTS = \
+	-DINSTALL_MBEDTLS_HEADERS=OFF \
+	-DUSE_SYSTEM_MBEDTLS=OFF \
 	-DENABLE_TOOLKIT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
@@ -20,11 +23,7 @@ HIAWATHA_CONF_OPTS = \
 	-DWORK_DIR=/var/lib/hiawatha
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-# Disable system mbedtls as hiawatha needs mbedtls 3.x
-HIAWATHA_CONF_OPTS += \
-	-DENABLE_TLS=ON \
-	-DINSTALL_MBEDTLS_HEADERS=OFF \
-	-DUSE_SYSTEM_MBEDTLS=OFF
+HIAWATHA_CONF_OPTS += -DENABLE_TLS=ON
 else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
