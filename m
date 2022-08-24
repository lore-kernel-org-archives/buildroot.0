Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52BDC00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 07:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B69F60E13;
	Wed, 24 Aug 2022 07:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B69F60E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NH9Di-A3aeq; Wed, 24 Aug 2022 07:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2771460BAC;
	Wed, 24 Aug 2022 07:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2771460BAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C94D91BF844
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D0660BAC
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4D0660BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lxum3SUnHUvR for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 07:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F83260AF4
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F83260AF4
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 07:55:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n7so13769891ejh.2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 00:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ZUzHXKvWqef61MzLdlh+9q7Ux7/NEV6TQ+isNyqxX1Q=;
 b=FUWXrdioja+ZvTagPC/GuLsVOqOjhnAFoZBTIZB3FLEAn2C65CrevSZd1yMV3l/EYo
 EnTH7q9Vhk6yhC7x4t82DaUiq/5DE7PQ/KErc/VMlOjsuJ+xh21hcHOxTp0rgbhY0RCp
 MR1jITuVCoeHCzNoeoOv3i5kdBfa5I7A7hkBFKA+iCYzNymitsqszG5PeK9vYm7xXn/T
 IhkbYnLzENT7BQnCaoLq/pLgA8s2BJqyf1ApQxnn1Z/K1BscJTJTACt51Mxq5KiNkpB/
 GMUQrK+HDoK+e77eyznRvqJcYyYRiSzHLNjycs4/kBP67IHdBPensTeeFh9u2I9rqkPR
 G0Ww==
X-Gm-Message-State: ACgBeo2DcHvTVHWT6IfmRR8pQTHy3fX2Ca7XGwk71PAUNsKxh6WVAikA
 LEOhNU7s2Wkinu3640K+ShPolzKYkH8=
X-Google-Smtp-Source: AA6agR7Nsp8Uxv6rMAQ8Ru7ftps/0aAZGgOSG8d4uNMbNxBMdrP4V4V4VPxiCzhi0RKLL6oQzjKwdA==
X-Received: by 2002:a17:907:3e1d:b0:73d:a9c9:819d with SMTP id
 hp29-20020a1709073e1d00b0073da9c9819dmr2136836ejc.170.1661327745733; 
 Wed, 24 Aug 2022 00:55:45 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 ws19-20020a170907705300b007308fab3eb7sm768875ejb.195.2022.08.24.00.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 00:55:45 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 09:55:42 +0200
Message-Id: <20220824075542.3637678-1-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ZUzHXKvWqef61MzLdlh+9q7Ux7/NEV6TQ+isNyqxX1Q=;
 b=PPYRRCS46R2V35N8gyhSbIJzOyZ/SlAYG0qiZ2S+QMzlLjjSetEPB4+jGyQH6wgJjg
 vpRkA2TDqb3bLnz1vPmnMLwGdP5z2XgENtfZDr28rmTNCSqAjylngrN82iUuRLbhtR5B
 +oSP4Pz2RLAyul64KwgkDsuUtyVx/JuJHKLtqBo7nTEC0zAxqlz11Grw6pwnpbMry3Ri
 VrrhDZUZhaVogz+s0BI4dvBp3uX9dcsm1G3mpDvRG3MpCCN15It2Jee2vgcQkvGICrsJ
 ZystkrHc01Av6U3SGk8Kd3iqj79Yn0WMYFfJj5saIU555YT1p1gere2ZHicUU0azTOXg
 agvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PPYRRCS4
Subject: [Buildroot] [PATCH 1/1] package/jquery-ui: bump to version 1.13.1
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/jquery-ui/jquery-ui.hash |  4 ++--
 package/jquery-ui/jquery-ui.mk   | 17 ++++++-----------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/jquery-ui/jquery-ui.hash b/package/jquery-ui/jquery-ui.hash
index 453ecd5521..92bb5312da 100644
--- a/package/jquery-ui/jquery-ui.hash
+++ b/package/jquery-ui/jquery-ui.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c76f349930245360f4d1dea672b9a587f8938b536a378e20eeff919f7263f99f  jquery-ui-1.10.4.zip
-sha256  ef1fdd608b20fbea7ef269ed03bd24e637717cc193971798a394bf2fa983cd53  MIT-LICENSE.txt
+sha256  5f063f91df85431e3fea84f5d5709726d6dcd15ee4bf86b0e9a4b134912a5efd  jquery-ui-1.13.1.zip
+sha256  de33fb695880d0b07615d4b86f78cd43796906959ade5fdfef70968827a0db78  LICENSE.txt
diff --git a/package/jquery-ui/jquery-ui.mk b/package/jquery-ui/jquery-ui.mk
index 9284e683f1..98d150bbf3 100644
--- a/package/jquery-ui/jquery-ui.mk
+++ b/package/jquery-ui/jquery-ui.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-JQUERY_UI_VERSION = 1.10.4
-# Use buildroot mirror since upstream switched the zipfile and directory
-# structure without bumping/renaming.
-# Remember to switch back to jqueryui.com when bumping!
-JQUERY_UI_SITE = http://sources.buildroot.net
+JQUERY_UI_VERSION = 1.13.1
+JQUERY_UI_SITE = https://jqueryui.com/resources/download
 JQUERY_UI_SOURCE = jquery-ui-$(JQUERY_UI_VERSION).zip
 JQUERY_UI_LICENSE = MIT
-JQUERY_UI_LICENSE_FILES = MIT-LICENSE.txt
+JQUERY_UI_LICENSE_FILES = LICENSE.txt
 
 define JQUERY_UI_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(JQUERY_UI_DL_DIR)/$(JQUERY_UI_SOURCE)
@@ -20,15 +17,13 @@ define JQUERY_UI_EXTRACT_CMDS
 endef
 
 define JQUERY_UI_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/ui/minified/jquery-ui.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/jquery-ui.min.js \
 		$(TARGET_DIR)/var/www/jquery-ui.js
-	$(INSTALL) -m 0644 -D $(@D)/ui/minified/i18n/jquery-ui-i18n.min.js \
-		$(TARGET_DIR)/var/www/jquery-ui-i18n.js
-	$(INSTALL) -m 0644 -D $(@D)/themes/base/minified/jquery-ui.min.css \
+	$(INSTALL) -m 0644 -D $(@D)/jquery-ui.min.css \
 		$(TARGET_DIR)/var/www/jquery-ui.css
 	$(INSTALL) -d $(TARGET_DIR)/var/www/images
 	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/images \
-		$(@D)/themes/base/minified/images/*.png
+		$(@D)/images/*.png
 endef
 
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
