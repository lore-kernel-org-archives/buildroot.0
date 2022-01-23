Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F2DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6C481CBA;
	Sun, 23 Jan 2022 09:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Geb8c1pp-jdz; Sun, 23 Jan 2022 09:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADB281BB0;
	Sun, 23 Jan 2022 09:50:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1F41BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65CFC4067F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_Dk_mUlj7Wk for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89F684067C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:50:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so25570861wms.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 01:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCQpwHdrvTES+Uss6S15rfsoaBqdCbHUfXVLBVZ13Eo=;
 b=omdaG7MNhMKr3MyLIWKH0naE4iqw0zdGD+Y/254stA3ZbGpU9V3WPTlkEuqxjqnTH2
 bcaoBsOdjempJ+lc6izk6RXV7OaCAM4920ioaWybOBZpm4Hnmg35onN3ui8dOQkvTbeQ
 TINhxcch+Cje9W6Sh3uEkdAfBmkfV2mWFWN7YKVvJdFaUI4cddfmsr7blpfY9S97wZNI
 CYad3695kecJ33Y9MkzBaN+8aoQuIU53LV9pk2AHYotVmJPCh/1bgiEEBnKmPxZ7I+3b
 gpG5wWx8K4ux6HZCDN7aIS1eGgmB4OT62UL1SIhShK8OHqlN9uweRqP+9Gp4FX0Dib4l
 izRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HCQpwHdrvTES+Uss6S15rfsoaBqdCbHUfXVLBVZ13Eo=;
 b=wokcZmhxbBxdTqMM/9mRJLltHUqF6Fq/T6yWos+RtZRGfzdavcZXqTwGwndtUORUpr
 HosdmH1zopT5D1kaXYkNLG9ZR1RMeqOcoVeFTEuA5Ed7tdZwCV5fNGgCKE4gyBKVU5GE
 AEAj0vi8NtsycGFJgsHIac/rgYb2gbPDHV+P7VbF7hxPYLBsocUmFIGl8vQTA1lmYZB4
 4CvheTLjPW/ad2yFsqhPfzUUJdQkAZSSHA1a4ns7lfqwL8SR8/xVgQKbhlZLtcF5sEHp
 arYUvi3PFTZKiWzT5+QPe6vtfFX/JiQMn/uSUuTtuDSWyqNuhLs0Tkv4SY3wSiAm5FOP
 fTjg==
X-Gm-Message-State: AOAM530leUSbUM2JRqiH17p+cZHTqLtcumtpQreJtv2xwnLnIOWN56ES
 ZXIKkbVZYkYxpvQSPficGS4FMLNnw94=
X-Google-Smtp-Source: ABdhPJyBem03QMkhPkvuE6QWQR03NJBv+Y8IRPz3dqE2YjPM0wnGHU+iqUz+pwaRI2c5EKVZZfRjiQ==
X-Received: by 2002:a05:600c:5028:: with SMTP id
 n40mr7153568wmr.10.1642931431566; 
 Sun, 23 Jan 2022 01:50:31 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l24sm9773505wme.17.2022.01.23.01.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:50:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:48:45 +0100
Message-Id: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/6] package/lighttpd: reorder alphabetically
 options
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 32 ++++++++++++++++----------------
 package/lighttpd/lighttpd.mk | 36 ++++++++++++++++++------------------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 99a09e9766..59c1e0b2a6 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,18 @@ config BR2_PACKAGE_LIGHTTPD
 
 if BR2_PACKAGE_LIGHTTPD
 
+config BR2_PACKAGE_LIGHTTPD_BZIP2
+	bool "bzip2 support"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 support for lighttpd mod_deflate.
+
+config BR2_PACKAGE_LIGHTTPD_LUA
+	bool "lua support"
+	depends on BR2_PACKAGE_LUA
+	help
+	  Enable Lua support. Needed to support mod_magnet
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
@@ -34,18 +46,6 @@ config BR2_PACKAGE_LIGHTTPD_PAM
 	help
 	  Enable PAM authentication support for lighttpd.
 
-config BR2_PACKAGE_LIGHTTPD_ZLIB
-	bool "zlib support"
-	select BR2_PACKAGE_ZLIB
-	help
-	  Enable zlib support for lighttpd mod_deflate.
-
-config BR2_PACKAGE_LIGHTTPD_BZIP2
-	bool "bzip2 support"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Enable bzip2 support for lighttpd mod_deflate.
-
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
 	select BR2_PACKAGE_PCRE2
@@ -59,10 +59,10 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
-config BR2_PACKAGE_LIGHTTPD_LUA
-	bool "lua support"
-	depends on BR2_PACKAGE_LUA
+config BR2_PACKAGE_LIGHTTPD_ZLIB
+	bool "zlib support"
+	select BR2_PACKAGE_ZLIB
 	help
-	  Enable Lua support. Needed to support mod_magnet
+	  Enable zlib support for lighttpd mod_deflate.
 
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 2a05071209..bdbf75191c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -37,6 +37,20 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
+LIGHTTPD_DEPENDENCIES += bzip2
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
+LIGHTTPD_DEPENDENCIES += lua
+LIGHTTPD_CONF_OPTS += -Dwith_lua=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_lua=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
@@ -51,20 +65,6 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_pam=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
-LIGHTTPD_DEPENDENCIES += zlib
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
-else
-LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
-endif
-
-ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
-LIGHTTPD_DEPENDENCIES += bzip2
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
-else
-LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
-endif
-
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
 LIGHTTPD_DEPENDENCIES += pcre2
 LIGHTTPD_CONF_OPTS += -Dwith_pcre2=true
@@ -85,11 +85,11 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=false -Dwith_webdav_locks=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
-LIGHTTPD_DEPENDENCIES += lua
-LIGHTTPD_CONF_OPTS += -Dwith_lua=true
+ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
+LIGHTTPD_DEPENDENCIES += zlib
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=true
 else
-LIGHTTPD_CONF_OPTS += -Dwith_lua=false
+LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
 endif
 
 define LIGHTTPD_INSTALL_CONFIG
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
